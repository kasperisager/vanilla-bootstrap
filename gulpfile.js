/* laxcomma: true */
'use strict';

var gulp = require('gulp')
  , $    = require('gulp-load-plugins')()

gulp.task('styles', function () {
  var main   = $.filter('style.css')
    , themes = $.filter('!style.css');

  return gulp.src([
    'less/style.less'
  , 'less/themes/*.less'
  ])
    .pipe($.plumber())
    .pipe($.less({
      paths: ['less', 'bower_components']
    }))
    .pipe($.autoprefixer())

    .pipe(main)
    .pipe($.csslint('design/.csslintrc'))
    .pipe($.csslint.reporter('default'))
    .pipe(main.restore())

    .pipe(themes)
    .pipe($.rename(function (path) {
      path.basename = 'custom_' + path.basename;
    }))
    .pipe(themes.restore())

    .pipe(gulp.dest('design'))
    .pipe($.size({showFiles: true}));
});

gulp.task('scripts', function () {
  return gulp.src('js/src/main.js')
    .pipe($.plumber())
    .pipe($.jshint('js/.jshintrc'))
    .pipe($.jshint.reporter('default'))
    .pipe($.include())
    .pipe($.concat('custom.js'))
    .pipe($.uglify())
    .pipe(gulp.dest('js'))
    .pipe($.size({showFiles: true}));
});

gulp.task('default', ['styles', 'scripts']);

gulp.task('watch',  function () {
  var server = $.livereload();

  gulp.watch([
    'design/*.css'
  , 'js/*.js'
  , 'views/**/*.tpl'
  ], function (file) {
    return server.changed(file.path);
  });

  gulp.watch('less/**/*.less', ['styles']);
  gulp.watch('js/src/**/*.js', ['scripts']);
});
