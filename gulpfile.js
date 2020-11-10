
require('es6-promise').polyfill();

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    gulpFilter = require('gulp-filter'),
    flatten = require('gulp-flatten'),
    livereload = require('gulp-livereload'),
    concat = require('gulp-concat'),
    minify = require('gulp-minify'),
    sourcemaps = require('gulp-sourcemaps'),
    autoprefixer = require('gulp-autoprefixer'),
    sequence = require('run-sequence'), // used to run tasks synchronously
    del = require('del'),
    rename = require('gulp-rename'),

settings = {
    bootstrap: {
        input: [
            'css/scss/bootstrap.scss'
        ],
        output: {
            path: 'css',
            file: 'bootstrap.dist.less'
        }
    },
    scss: {
        input: [
            'css/scss/lib/*/*.css',
            'css/scss/lib/*.scss',
            'css/scss/styles.scss'
        ],
        output: {
            path: 'css',
            file: 'styles.dist.less'
        }
    },
    scripts: {
        input: [
            'js/lib/*.js',
            'js/scripts.js'
        ],
        output: {
            path: 'js',
            file: 'scripts.dist.js'
        }
    }
};

function continueOnError(error) {
    console.log(error.toString());
    this.emit('end');
}

// Sass compilation
gulp.task('bootstrap', function () {
    return gulp.src(settings.bootstrap.input)
        .pipe(sourcemaps.init())
        .pipe(sass({
            outputStyle: 'compressed'
        }).on('error', continueOnError))
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(concat(settings.bootstrap.output.file,{newLine: ''}))
        .pipe(sourcemaps.write('maps'))
        .pipe(gulp.dest(settings.bootstrap.output.path))
        .pipe(gulpFilter('**/*.css','**/*.css.map'))
        .pipe(livereload());
});

gulp.task('scss', function () {
    return gulp.src(settings.scss.input)
        .pipe(sourcemaps.init())
        .pipe(sass({
            outputStyle: 'compressed'
        }).on('error', continueOnError))
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(concat(settings.scss.output.file,{newLine: ''}))
        .pipe(gulp.dest(settings.scss.output.path))
        .pipe(gulpFilter('**/*.css','**/*.css.map'))
        .pipe(livereload());
});

// Compiling + concating scripts
/*
gulp.task('js', function () {
    return gulp.src(settings.scripts.input)
        .pipe(sourcemaps.init())
        .pipe(concat(settings.scripts.output.file))
        .pipe(minify({
            compress: {
                unused: false
            },
            ext:{
                min:'.js'
            },
            noSource: true
        }).on('error', continueOnError))
        .pipe(sourcemaps.write('maps'))
        .pipe(gulp.dest(settings.scripts.output.path))
        .pipe(livereload());
});
*/
// Watch for changes both in components and addons
gulp.task('watch', function() {
    livereload.listen();
    //gulp.watch(['js/**/*.js', '!js/' + settings.scripts.output.file], ['js']);
    gulp.watch('css/scss/**/*', ['scss', 'bootstrap']);
    gulp.watch(['**/*.tpl','**/*.js'], livereload.reload);
});

// Default task
gulp.task('default', function(cb){
    return sequence(['bootstrap', 'scss'], 'watch',cb); // synchronous task order, generating bower components > compiling > watch
});