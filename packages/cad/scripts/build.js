/**
 * Freyground CAD archive build script
 * 
 * Builds the cad files in `agrv[2]` dir and outputs to
 * `argv[3]` making the directory if it doesn't exist.
 */

const fs = require("fs");
const { exec } = require("child_process");

const targetdir = process.argv[2];
const outdir = process.argv[3];

function makeOutDir(dir) {
  fs.mkdirSync(dir,{
    recursive: true
  });
}

async function buildScad(maybefile) {
  if (maybefile.isFile() && maybefile.name.endsWith(".scad")) {
    console.info("Building file: ", maybefile.name);
    var command = `openscad ${targetdir}/${maybefile.name} -o ${outdir}/${maybefile.name.replace(
      ".scad",
      ".3mf"
    )}`;
    console.info(command);
    exec(command, function (error, stdout, stderr) {
      if (error) {
        console.error(stderr);
        return error;
      }

      console.info(stdout);
    });
  }
}

async function buildScads() {
  const dir = await fs.promises.opendir(targetdir);
  for await (const maybefile of dir) {
    buildScad(maybefile).catch(console.error);
  }
}


function main() {
  console.log("");
  makeOutDir(outdir);
  buildScads(targetdir, outdir).catch(console.error);
}

if (require.main === module) {
  main();
}
