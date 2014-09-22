<?php if (!defined('APPLICATION')) exit();

if (!function_exists('GetOptions'))
   include $this->FetchViewLocation('helper_functions', 'categories');

if ($Description = $this->Description()) {
   echo Wrap($Description, 'div', array('class' => 'P PageDescription'));
}

$CatList = '';
$DoHeadings = C('Vanilla.Categories.DoHeadings');
$MaxDisplayDepth = C('Vanilla.Categories.MaxDisplayDepth');
$ChildCategories = '';
$this->EventArguments['NumRows'] = count($this->Data('Categories'));

//if (C('Vanilla.Categories.ShowTabs')) {
////   $ViewLocation = Gdn::Controller()->FetchViewLocation('helper_functions', 'Discussions', 'vanilla');
////   include_once $ViewLocation;
////   WriteFilterTabs($this);
//   echo Gdn_Theme::Module('DiscussionFilterModule');
//}

echo '<ul class="DataList CategoryList'.($DoHeadings ? ' CategoryListWithHeadings' : '').'">';
   $Alt = FALSE;

   // A way to make "Latest post" include posts from child categories.
   // No, this solution is not pretty. Sorry.
   $lastPosts = array();
   foreach ($this->Data('Categories') as $CategoryRow) {
      $Category = (object)$CategoryRow;
      if(!empty($Category->LastTitle)) {
         $lastPosts[$Category->CategoryID]['LastTitle'] = $Category->LastTitle;
         $lastPosts[$Category->CategoryID]['LastDateInserted'] = $Category->LastDateInserted;
         $lastPosts[$Category->CategoryID]['LastUrl'] = $Category->LastUrl;
         $lastPosts[$Category->CategoryID]['LastUserID'] = $Category->LastUserID;
         $lastPosts[$Category->CategoryID]['LastName'] = $Category->LastName;
      }
   }

   foreach ($this->Data('Categories') as $CategoryRow) {
      $Category = (object)$CategoryRow;

      $this->EventArguments['CatList'] = &$CatList;
      $this->EventArguments['ChildCategories'] = &$ChildCategories;
      $this->EventArguments['Category'] = &$Category;
      $this->FireEvent('BeforeCategoryItem');
      $CssClass = CssClass($CategoryRow);

      $CategoryID = GetValue('CategoryID', $Category);

      if ($Category->CategoryID > 0) {
         // If we are below the max depth, and there are some child categories
         // in the $ChildCategories variable, do the replacement.
         if ($Category->Depth < $MaxDisplayDepth && $ChildCategories != '') {
            $CatList = str_replace('{ChildCategories}', '<span class="ChildCategories">'.Wrap(T('Child Categories:'), 'b').' '.$ChildCategories.'</span>', $CatList);
            $ChildCategories = '';
         }

         if ($Category->Depth >= $MaxDisplayDepth && $MaxDisplayDepth > 0) {
            if ($ChildCategories != '')
               $ChildCategories .= ', ';
            $ChildCategories .= Anchor(Gdn_Format::Text($Category->Name), CategoryUrl($Category));
         } else if ($DoHeadings && $Category->Depth == 1) {
            $CatList .= '<li id="Category_'.$CategoryID.'" class="CategoryHeading '.$CssClass.'">
               <div class="ItemContent Category">'.GetOptions($Category, $this).Gdn_Format::Text($Category->Name).'</div>
            </li>';
            $Alt = FALSE;
         } else {
            $LastComment = UserBuilder($Category, 'Last');
            $AltCss = $Alt ? ' Alt' : '';
            $Alt = !$Alt;
  
            $CatList .= '<li id="Category_'.$CategoryID.'" class="'.$CssClass.'">
               <div class="row ItemContent Category">
                 <div class="col-md-6">'
                  .GetOptions($Category, $this)
                  .CategoryPhoto($Category)
                  .'<div class="TitleWrap">'
                     .Anchor(Gdn_Format::Text($Category->Name), CategoryUrl($Category), 'Title')
                  .'</div>
                  <div class="CategoryDescription">'
                  .$Category->Description
                  .'</div>';

                  // If this category is one level above the max display depth, and it
                  // has children, add a replacement string for them.
                  if ($MaxDisplayDepth > 0 && $Category->Depth == $MaxDisplayDepth - 1 && $Category->TreeRight - $Category->TreeLeft > 1)
                     $CatList .= '{ChildCategories}';
                  $CatList .= '
                 </div>
                 <div class="col-md-6 text-right">
                   <div class="Meta">';
                     $lastPostsInner = array();

                     if ($Category->LastTitle != '')
                        $lastPostsInner[] = $lastPosts[$Category->CategoryID];

                     if (count($Category->ChildIDs) > 0) {
                        foreach ($Category->ChildIDs as $SubcatRow) {
                           if (isset($lastPosts[$SubcatRow]))
                              $lastPostsInner[] = $lastPosts[$SubcatRow];
                        }
                        foreach ($lastPostsInner as $key => $row) {
                           $postDates[$key] = $row['LastDateInserted'];
                        }
                     }

                     if (count($lastPostsInner) > 1)
                        array_multisort($postDates, SORT_DESC, $lastPostsInner);

                     if (count($lastPostsInner) > 0) {
                        $CatList .= '<div class="MItem LastDiscussionTitle">'.Anchor(Gdn_Format::Text(SliceString($lastPostsInner[0]['LastTitle'], 40)), $lastPostsInner[0]['LastUrl']).'</div>'
                           .'<div class="MItem LastCommentDate">'
                              .Anchor($lastPostsInner[0]['LastName'], 'profile/'.$lastPostsInner[0]['LastUserID'].'/'.$lastPostsInner[0]['LastName'])
                              .' • '
                              .Gdn_Format::Date($lastPostsInner[0]['LastDateInserted']).'</div>';

                     }
                  $CatList .= '</div>
                 </div>
               </div>

            </li>';
         }
      }
   }
   // If there are any remaining child categories that have been collected, do
   // the replacement one last time.
   if ($ChildCategories != '')
      $CatList = str_replace('{ChildCategories}', '<span class="ChildCategories">'.Wrap(T('Child Categories:'), 'b').' '.$ChildCategories.'</span>', $CatList);

   echo $CatList;
?>
</ul>
