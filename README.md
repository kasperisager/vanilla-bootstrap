![](screenshot.png)

[![GitHub version](https://badge.fury.io/gh/kasperisager%2Fvanilla-bootstrap.png)](http://badge.fury.io/gh/kasperisager%2Fvanilla-bootstrap) [![Dependency Status](https://gemnasium.com/kasperisager/vanilla-bootstrap.png)](https://gemnasium.com/kasperisager/vanilla-bootstrap)

Bootstrap for Vanilla has been rewritten from scratch on top of [Bootstrap 3.1](http://getbootstrap.com) in this second installation of the most popular theme for Vanilla Forums. Kickstart your Vanilla-powered community forums with a fresh and solid theme that is ready to be customized to your heart's desires.

## Getting started

To get started using Bootstrap for Vanilla, either:

* [__Download the latest release__](https://github.com/kasperisager/vanilla-bootstrap/releases)
* Clone the repository directly into your Vanilla `themes` directory:

```sh
$ git clone kasperisager/vanilla-bootstrap bootstrap
```

## Included themes

![Default](design/screenshot_default.png) | ![Bootstrap](design/screenshot_bootstrap.png) | ![Cerulean](design/screenshot_cerulean.png) | ![Cosmo](design/screenshot_cosmo.png)
|
![Cyborg](design/screenshot_cyborg.png) | ![Flatly](design/screenshot_flatly.png) | ![Journal](design/screenshot_journal.png) | ![Lumen](design/screenshot_lumen.png)
![Readable](design/screenshot_readable.png) | ![Simplex](design/screenshot_simplex.png) | ![Slate](design/screenshot_slate.png) | ![Spacelab](design/screenshot_spacelab.png)
![Superhero](design/screenshot_superhero.png) | ![United](design/screenshot_united.png) | ![Yeti](design/screenshot_yeti.png)

## Compiling assets

Bootstrap for Vanilla was scaffolded using [Ninja](https://github.com/kasperisager/vanilla-ninja). For instructions on how to install the development dependencies and front-end components, please refer to the [Ninja documentation](https://github.com/kasperisager/vanilla-ninja#getting-started). Once you've got everything set up, use the following tasks to re-compile the theme assets:

#### Build - `gulp`
Runs the default Gulp task which will compile all theme assets. LESS stylesheets will be compiled to [`design/style.css`](design/style.css) and Javascripts will be concatenated and output to [`js/custom.js`](js/custom.js).

#### Watch - `gulp watch`
Starts an instance of [tiny-lr](https://github.com/mklabs/tiny-lr) (a tiny LiveReload server) that watches the compiled assets for changes and pushes these to your Vanilla installation automatically whenever they change.

## Customizations

Bootstrap for Vanilla supports tools such as [Bootstrap Magic](http://pikock.github.io/bootstrap-magic/app) out-of-the-box. All custom variables go in [`less/variables.less`](less/variables.less) and will override all those set by both Bootstrap itself as well as any extensions made by Bootstrap for Vanilla. For more in-depth customizations, [`less/custom.less`](less/custom.less) has been made available.

### Bootswatches

While it is possible to use Bootswatches with Bootstrap for Vanilla, they require a bit more integration to properly work. For more information on Bootswathes, check out issue [#9](https://github.com/kasperisager/vanilla-bootstrap/issues/9).

## [Issue tracking](https://github.com/kasperisager/vanilla-bootstrap/issues)

If you come across any bugs or if you have a feature request, please file an issue using the GitHub Issue tracker. Bootstrap for Vanilla won't be supported through http://vanillaforums.org so please stick to using GitHub for inquiries about bugs and feature requests. Thanks!

[__File a new issue or feature request__](https://github.com/kasperisager/vanilla-bootstrap/issues/new)

---

Copyright 2014 © [Kasper Kronborg Isager](http://kasperisager.github.io). Licensed under the terms of the [MIT License](LICENSE.md)
