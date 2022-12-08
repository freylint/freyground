//! Default buildscript for freyground monorepo.

const gulp = require('gulp');

var jest = require('gulp-jest').default;

function defaultTask(cb) {
    acceptanceTests(cb);
    cb();
}

function acceptanceTests(cb) {
    process.env.NODE_ENV = 'test';
    return gulp.src("./tests/").pipe(jest({
        "preprocessorIgnorePatterns": [
            "<rootDir>/dist/", "<rootDir>/node_modules/"
        ],
        "automock": false
    })
    );
}



exports.default = defaultTask;