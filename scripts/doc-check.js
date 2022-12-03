var fs = require('fs');
var crypto = require('crypto');
const { commands } = require('npm');

function readToHash(file) {
    var fd = fs.createReadStream('/some/file/name.txt');
    var oldhash = crypto.createHash('sha1');
    hash.setEncoding('hex');

    fd.on('end', function() {
        hash.end();
        console.log(hash.read()); // the desired sha1sum
    });

    fd.pipe(hash);

    return hash;
}

// Store current hash
var oldHash = readToHash("README.md");

// Generate docs using `npm run docs-build`
npm.commands.run("build", (err) => {
    console.error(err);
    return -2;
});

// Store new hash
var newHash = readToHash("README.md");

if (oldhash !== newHash) {
    console.error("README.md needs regenerating!");
    return -1;
}