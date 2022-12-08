//! Default buildscript for freyground monorepo.

const gulp = require('gulp');
var jest = require('gulp-jest').default;
var exec = require('child_process').exec;

function defaultTask(cb) {
  smiBuildRust(cb);
  acceptanceTests(cb);
  cb();
}

function acceptanceTests(cb) {
  return gulp.src("./tests/").pipe(jest({
    "preprocessorIgnorePatterns": [
      "<rootDir>/dist/", "<rootDir>/node_modules/"
    ],
    "automock": false
  })
  );
}

function smiBuildRust(cb) {
  return gulp.src("projects/fg-smi").pipe(
    exec("wit-bindgen guest rust projects/fg-smi/smi.wit --out-dir build/gen/",
      (err, stdout, stderr) => {
        if (err === null) {
          console.log(stdout);
          console.warn(stderr)
        } else {
          console.error(err);
          process.exit(-1);
        }
      }
    ))
}


exports.default = defaultTask;