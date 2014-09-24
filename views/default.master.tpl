<!DOCTYPE html>
<html lang="en" class="sticky-footer-html">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    {asset name="Head"}
    <!-- Based on vanilla-bootstrap by https://github.com/kasperisager/ -->
  </head>
  <body id="{$BodyID}" class="{$BodyClass} sticky-footer-body">

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
                  För att läsa i Piratpartiets medlemsforum krävs ett medlemskap i partiet.
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

    <footer class="page-footer sticky-footer">
      <div class="container">
        <aside class="widget widget_nav_menu">
          <h3 class="widget-title">Forumlänkar</h3>
          <div>
            <ul class="menu">
              <li class="menu-item"><a href="{link path="/discussion/21/nagra-forumtips"}">Forumtips</a></li>
              <li class="menu-item"><a href="{link path="/discussion/13/regler-och-forumteamet"}">Regler</a></li>
            </ul>
          </div>
        </aside>
      </div>
      {asset name="Foot"}
    </footer>

    {event name="AfterBody"}

  </body>
</html>
