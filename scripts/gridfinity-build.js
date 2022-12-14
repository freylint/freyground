#! /usr/bin/node

const fs = require("fs");
const { exec } = require("child_process");

async function buildScad(scaddir, outdir) {
  const dir = await fs.promises.opendir(scaddir);
  for await (const maybefile of dir) {
    if (maybefile.isFile() && maybefile.name.endsWith(".scad")) {
      console.info("Building file: ", maybefile.name);
      var command = `openscad ${scaddir}/${maybefile.name} -o ${outdir}/${maybefile.name.replace(
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
}

buildScad("projects/gridfinity", "build/gf").catch(console.error);

// Thursday @ 10 am.
