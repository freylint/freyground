const gulp = require('gulp');

export default function defaultTask(cb) {
    // place code for your default task here
    cb();
}

gulp.task("build_model", (cb) => {
    exec("cargo b --manifest-path=./model/ -r")
})