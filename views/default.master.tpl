<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {asset name="Head"}

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body id="{$BodyID}" class="{$BodyClass}">

    <div class="page-wrap">

      <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">

          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">{t c="Toggle navigation"}</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{link path="home"}">{logo}</a>
          </div>

          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              {home_link}
              {categories_link}
              {discussions_link}
              {activity_link}
            </ul>
            <ul class="nav navbar-nav navbar-right">
              {if $User.SignedIn}
                {module name="MeModule" CssClass="hidden-xs"}
              {else}
                <li>{link path="register" text="Register" target="current"}</li>
                <li>{link path="signin" text="Sign In" target="current"}</li>
              {/if}
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </nav>

      <section class="container">
        <div class="row">

          <main class="page-content" role="main">
            {breadcrumbs}
            {if InSection(array("CategoryList", "CategoryDiscussionList", "DiscussionList"))}
              <div class="SearchForm">{searchbox}</div>
            {/if}
            {asset name="Content"}
          </main>

          <aside class="page-sidebar" role="complementary">
            {asset name="Panel"}
          </aside>

        </div>
      </section>

      <div class="push"></div>

    </div>

    <footer class="page-footer">
      <div class="container">
        <p class="pull-left">{t c="Copyright"} {$smarty.now|date_format:"%Y"} &copy; <a href="{link path="home"}">{logo}</a></p>
        <p class="pull-right hidden-xs">{t c="Built with"} <i class="glyphicon glyphicon-heart"></i> {t c="and"} <a href="http://getbootstrap.com">Bootstrap</a>
          <!-- A lot of time was put into this project - a "Follow" and a "Star" would be most appreciated! -->
          <iframe src="http://ghbtns.com/github-btn.html?user=kasperisager&type=follow"
  allowtransparency="true" frameborder="0" scrolling="0" width="145" height="20" style="vertical-align:top;margin-left:20px;"></iframe>
          <iframe src="http://ghbtns.com/github-btn.html?user=kasperisager&repo=vanilla-bootstrap&type=watch&count=true"
  allowtransparency="true" frameborder="0" scrolling="0" width="80" height="20" style="vertical-align:top;"></iframe>
        </p>
        {asset name="Foot"}
      </div>
    </footer>

    {event name="AfterBody"}

  </body>
</html>
