//! Default buildscript for freyground monorepo.

const gulp = require('gulp');
var jest = require('gulp-jest').default;
var exec = require('child_process').exec;


/// Acceptance testing gulp task
function acceptanceTests(cb) {
  return gulp.src("./tests/*.steps.js").pipe(jest({
    "preprocessorIgnorePatterns": [
      "<rootDir>/dist/", "<rootDir>/node_modules/"
    ],
    "automock": false
  })
  );
}

/// Standard Messaging Interface Rust bindings generation task
function smiGenRust(cb) {
  return gulp.src("projects/fg-smi/*.wit").pipe(
    exec("wit-bindgen guest rust projects/fg-smi/smi.wit --out-dir build/gen/",
      handleShErr
    ))
}

/// Standard Messaging Interfact Rust bindings build task
function smiBuildRust(cb) {
  return gulp.src("build/gen/smi.rs").pipe(
    exec("rustc --out-dir build/int/ build/gen/smi.rs \
          --crate-type cdylib --target wasm32-unknown-unknown",
      handleShErr
    )
  )
}

exports.default = gulp.series(smiGenRust, smiBuildRust, acceptanceTests);

/// Standard error handling fn for raw `exec()` tasks.
function handleShErr(err, stdout, stderr) {
  if (err === null) {
    console.log(stdout);
    console.warn(stderr)
  } else {
    console.error(err);
    process.exit(-1);
  }
}