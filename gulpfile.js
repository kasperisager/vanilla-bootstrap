var gulp = require('gulp')
  , gutil = require('gulp-util')
  , less = require('gulp-less')
  , concat = require('gulp-concat')
  , uglify = require('gulp-uglify')
  , server = require('tiny-lr')()
  , livereload = require('gulp-livereload');

gulp.task('less', function () {
  gulp.src('less/core/style.less')
    .pipe(less({ paths: 'bower_components'})
      .on('error', gutil.log))
    .pipe(gulp.dest('design'))
    .pipe(livereload(server));
});

gulp.task('default', ['less', 'scripts']);
gulp.task('watch', function () {
  server.listen(35729, function (err) {
    if (err) return gutil.log(err);

    gulp.watch('less/**/*', function () {
      gulp.run('less');
    });
  });
});

gulp.task('scripts', function () {
  gulp.src([
    'bower_components/bootstrap/js/transition.js',
    // 'bower_components/bootstrap/js/alert.js',
    // 'bower_components/bootstrap/js/button.js',
    // 'bower_components/bootstrap/js/carousel.js',
    'bower_components/bootstrap/js/collapse.js',
    'bower_components/bootstrap/js/dropdown.js',
    // 'bower_components/bootstrap/js/modal.js',
    // 'bower_components/bootstrap/js/tooltip.js',
    // 'bower_components/bootstrap/js/popover.js',
    // 'bower_components/bootstrap/js/scrollspy.js',
    // 'bower_components/bootstrap/js/tab.js',
    // 'bower_components/bootstrap/js/affix.js'
  ])
    .pipe(uglify())
    .pipe(concat('custom.js'))
    .pipe(gulp.dest('js'));
});
