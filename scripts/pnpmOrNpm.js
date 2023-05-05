const shell = require("shelljs")
const fs = require("fs")

const [node, script, ...params] = process.argv;

const isPnpm = fs.existsSync('./pnpm-lock.yaml');
const isNnpm = fs.existsSync('./package-lock.json');

if (isNnpm) {
    shell.exec(`npm ${params.join(' ')}`)
} else {
    shell.exec(`pnpm ${params.join(' ')}`)
}
