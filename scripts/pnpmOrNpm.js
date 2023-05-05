const shell = require("shelljs")
const fs = require("fs")

const params = process.argv[2];

const isPnpm = fs.existsSync('./pnpm-lock.yaml');
const isNnpm = fs.existsSync('./package-lock.json');

if (isPnpm) {
    shell.exec(`pnpm ${params}`)
} else if (isNnpm) {
    shell.exec(`npm ${params}`)
} else {
    console.log('😴 npm ? pnpm ?');
}
