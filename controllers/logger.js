const chalk = require('chalk');

module.exports = {
    server: (message) => {
        return console.log(chalk.bgBlue(message));
    },
    success: (message) => {
        return console.log(chalk.bgGreen.black("Success") + " : " + chalk.green(message));
    },
    error: (message) => {
        return console.error(chalk.bgRed.black("Error") + " : " + chalk.red(message));
    },
    request: (message) => {
        return console.client(chalk.bgYellow.black("Client" + " : " + chalk.yellow(message)));
    },
};
