const gulp = require('gulp');
const $ = require('gulp-load-plugins')();
const del = require('del');
const c = require('./config.json');

const src = gulp.src;
const dest = gulp.dest;

const harness = () => $.plumber({
  errorHandler: $.notify.onError('<%= error.message %>')
});

const size = title => $.size({title, showFiles: true});

gulp.task('design', ['design:lint', 'design:clean'], () => src('design/src/*.scss')
  .pipe(harness())
  .pipe($.cached('design'))
  .pipe($.sourcemaps.init(c.sourcemaps))
    .pipe($.sass(c.sass))
    .pipe($.autoprefixer(c.autoprefixer))
    .pipe($.cssnano(c.cssnano))
    .pipe($.concat('style.css'))
  .pipe($.sourcemaps.write('.'))
  .pipe(dest('design'))
  .pipe($.if('*.css', $.livereload()))
  .pipe(size('design'))
);

gulp.task('design:lint', () => src('design/src/**/*.scss')
  .pipe(harness())
  .pipe($.cached('design:lint'))
  .pipe($.scssLint())
);

gulp.task('design:clean', () => del(['design/*.css*']));

gulp.task('js', ['js:lint', 'js:clean'], () => src('js/src/*.js')
  .pipe(harness())
  .pipe($.cached('js'))
  .pipe($.rollup(c.rollup))
  .pipe($.sourcemaps.init(c.sourcemaps))
    .pipe($.babel(c.babel))
    .pipe($.uglify(c.uglify))
    .pipe($.concat('custom.js'))
  .pipe($.sourcemaps.write('.'))
  .pipe(dest('js'))
  .pipe($.if('*.js', $.livereload()))
  .pipe(size('js'))
);

gulp.task('js:lint', () => src('js/src/**/*.js')
  .pipe(harness())
  .pipe($.cached('js:lint'))
  .pipe($.xo())
);

gulp.task('js:clean', () => del(['js/*.js*']));

gulp.task('build', [
  'design',
  'js'
]);

gulp.task('watch', ['build'], () => {
  $.livereload.listen();

  gulp.watch('design/src/**/*.scss', ['design']);
  gulp.watch('js/src/**/*.js', ['js']);
});

gulp.task('default', ['build']);
