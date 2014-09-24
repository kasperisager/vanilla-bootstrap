<!DOCTYPE html>
<html lang="en" class="sticky-footer-html">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    {asset name="Head"}
    <!-- Based on vanilla-bootstrap by https://github.com/kasperisager/ -->
  </head>
  <body id="{$BodyID}" class="{$BodyClass}">

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
            <li>
              <a href="http://www.piratpartiet.se" target="_blank">Hemsidan</a>
            </li>
            <!-- Soon, my friend
            <li>
              <a href="#">Medlemssidan</a>
            </li>
            -->
            <li>
              <a href="{link path="/kontakt"}">Kontakt</a>
            </li>
          </ul>
          {if $User.SignedIn}
            <ul class="nav navbar-nav navbar-right hidden-xs">
              {module name="MeModule"}
            </ul>
            <ul class="nav navbar-nav navbar-right visible-xs">
              {profile_link}
              {inbox_link}
              {bookmarks_link}
              {dashboard_link}
              {signinout_link}
            </ul>
          {else}
            <ul class="nav navbar-nav navbar-right">
              <li>
                <a href="{link path="/entry/PirateWeb"}" rel="nofollow" class="PopupWindow"
                   popupHref="{link path="/entry/PirateWeb"}?Target=%2F&display=popup"
                   popupHeight="600" popupWidth="800">Logga in</a>
              </li>
            </ul>
          {/if}
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <section class="container">
      <div class="row">

        <main class="page-content" role="main">
          {breadcrumbs}
          {if $User.SignedIn}
            <div class="well search-form MobileSearch">{searchbox}</div>
          {/if}
          {if !$User.SignedIn}
              <h2>Hej!</h2>
              <p>
                  För att läsa i Piratpartiets medelemsforum krävs ett medlemskap i partiet.
                  Om du har det, logga in med PirateWeb här till höger.
              </p>
              <p>
                  Om du inte är medlem men intresserad av att bli det kan du gå med utan kostnad på
                  <a href="http://blipirat.nu">blipirat.nu</a>.
              </p>
              <p>
                  För att läsa om vår politik, se vår
                  <a href="http://www.piratpartiet.se/politik/">hemsida</a>.
              </p>
          {/if}
          {asset name="Content"}
        </main>

        <aside class="page-sidebar {if !$User.SignedIn}SignedOut{/if}" role="complementary">
          {if $User.SignedIn}
            <div class="well search-form DesktopSearch">{searchbox}</div>
          {/if}
          {asset name="Panel"}
        </aside>

      </div>
    </section>

    <footer class="page-footer">
      <div class="container">
        <aside id="nav_menu-12" class="widget widget_nav_menu">
          <h3 class="widget-title">Navigera</h3>
          <div class="menu-sidfot-allman-navigering-container">
            <ul id="menu-sidfot-allman-navigering" class="menu">
              <li id="menu-item-278" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-30 current_page_item menu-item-278"><a href="http://www.piratpartiet.se/">Hem</a></li>
              <li id="menu-item-279" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-279"><a href="http://www.piratpartiet.se/nyheter/">Nyheter</a></li>
              <li id="menu-item-280" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-280"><a href="http://www.piratpartiet.se/politik/">Politik</a>
                <ul class="sub-menu">
                  <li id="menu-item-717" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-717"><a href="http://www.piratpartiet.se/politik/piratpartiet-i-korthet/">Piratpartiet i korthet</a></li>
                  <li id="menu-item-281" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-281"><a href="http://www.piratpartiet.se/politik/politik-fran-a-till-o/">Politik från A till Ö</a></li>
                  <li id="menu-item-282" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-282"><a href="http://www.piratpartiet.se/politik/valmanifest-2014/">Valmanifest 2014</a></li>
                  <li id="menu-item-337733" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-337733"><a href="http://www.piratpartiet.se/politik/val-2014/">Valaffischer 2014</a></li>
                  <li id="menu-item-283" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-283"><a href="http://www.piratpartiet.se/politik/faq/">FAQ</a></li>
                  <li id="menu-item-284" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-284"><a href="http://www.piratpartiet.se/politik/partiprogram/">Partiprogram</a></li>
                  <li id="menu-item-718" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-718"><a href="http://www.piratpartiet.se/politik/sakpolitiska-beslut/">Sakpolitiska beslut</a></li>
                </ul>
              </li>
              <li id="menu-item-285" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-285"><a href="http://www.piratpartiet.se/aktivism/">Aktivism</a></li>
              <li id="menu-item-286" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-286"><a href="http://www.piratpartiet.se/lokalt/">Lokalt</a>
                <ul class="sub-menu">
                  <li id="menu-item-287" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-287"><a href="http://www.piratpartiet.se/lokalt/bli-kontaktperson/">Bli kontaktperson</a></li>
                  <li id="menu-item-288" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-288"><a href="http://www.piratpartiet.se/lokalt/starta-en-forening/">Starta en förening</a></li>
                  <li id="menu-item-289" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-289"><a href="http://www.piratpartiet.se/lokalt/lokala-hemsidor/">Lokala hemsidor</a></li>
                </ul>
              </li>
              <li id="menu-item-290" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-290"><a href="http://www.piratpartiet.se/om-oss/">Om Piratpartiet</a>
                <ul class="sub-menu">
                  <li id="menu-item-337794" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-337794"><a href="http://www.piratpartiet.se/om-oss/piratpartiets-stadgar/">Stadgar</a></li>
                  <li id="menu-item-337680" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-337680"><a href="http://www.piratpartiet.se/om-oss/medlemsstatistik/">Medlemsstatistik</a></li>
                  <li id="menu-item-337701" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-337701"><a href="http://www.piratpartiet.se/donera/">Donera / Bli Guldpirat</a></li>
                  <li id="menu-item-337679" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-337679"><a href="http://www.piratpartiet.se/om-oss/donationsstatistik/">Donationsstatistik</a></li>
                </ul>
              </li>
              <li id="menu-item-291" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-291"><a href="http://www.piratpartiet.se/press/">Press</a>
                <ul class="sub-menu">
                  <li id="menu-item-336613" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-336613"><a href="http://www.piratpartiet.se/press/piratpartiet-i-media/">Piratpartiet i media</a></li>
                </ul>
              </li>
              <li id="menu-item-292" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-292"><a href="http://www.piratpartiet.se/kontakta-oss/">Kontakta oss</a></li>
            </ul>
          </div>
        </aside>
        <aside id="nav_menu-13" class="widget widget_nav_menu">
          <h3 class="widget-title">Medlemsinfo</h3>
            <div class="menu-medlemsinfo-2-container">
              <ul id="menu-medlemsinfo-2" class="menu">
                <li id="menu-item-335989" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-335989"><a href="http://www.piratpartiet.se/medlem/">För medlemmar</a>
                  <ul class="sub-menu">
                    <li id="menu-item-336012" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-336012"><a href="http://www.piratpartiet.se/om-oss/partiledning/ledningsbloggen/">Ledningsbloggen</a></li>
                    <li id="menu-item-336013" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-336013"><a href="http://www.piratpartiet.se/om-oss/styrelse/styrelsebloggen/">Styrelsebloggen</a></li>
                    <li id="menu-item-336428" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-336428"><a href="http://www.piratpartiet.se/medlem/nyhetsarkiv/">Nyhetsarkiv</a></li>
                    <li id="menu-item-336616" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-336616"><a href="http://www.piratpartiet.se/press/piratpartiet-i-media/">Piratpartiet i media</a></li>
                  </ul>
                </li>
                <li id="menu-item-306" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-306"><a href="http://www.piratpartiet.se/aktivism/">Aktivism</a>
                  <ul class="sub-menu">
                    <li id="menu-item-307" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-307"><a href="http://www.piratpartiet.se/aktivism/forkovra-dig/">Förkovra dig</a></li>
                  </ul>
                </li>
                <li id="menu-item-308" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-308"><a href="http://www.piratpartiet.se/lokalt/">Lokalt</a>
                  <ul class="sub-menu">
                    <li id="menu-item-309" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-309"><a href="http://www.piratpartiet.se/lokalt/bli-kontaktperson/">Bli kontaktperson</a></li>
                    <li id="menu-item-310" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-310"><a href="http://www.piratpartiet.se/lokalt/starta-en-forening/">Starta en förening</a></li>
                    <li id="menu-item-311" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-311"><a href="http://www.piratpartiet.se/lokalt/lokala-hemsidor/">Lokala hemsidor</a></li>
                  </ul>
                </li>
                <li id="menu-item-304" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-304"><a target="_blank" href="http://ppforum.piratpartiet.se/">Diskussionsforum</a></li>
                <li id="menu-item-636" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-636"><a target="_blank" href="http://breddning.piratpartiet.se/">Intern politisk diskussion: breddningsbloggen</a></li>
                <li id="menu-item-305" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-305"><a target="_blank" href="http://butik.piratpartiet.se/">Piratshoppen</a></li>
              </ul>
            </div>
        </aside>
        <aside id="search-3" class="widget widget_search">
          <form method="get" id="searchform" action="http://www.piratpartiet.se/" role="search">
            <label for="s" class="assistive-text">Sök</label>
            <input type="text" class="field" name="s" value="" id="s" placeholder="Sök" />
            <input type="submit" class="submit" name="submit" id="searchsubmit" value="Sök" />
          </form>
        </aside>
      </div>
      {asset name="Foot"}
    </footer>

    {event name="AfterBody"}

  </body>
</html>
