const chalk = require('chalk')
const responses = require('../configs/responses')

class logger {
  constructor () {
    this.responses = responses
  }

  static server (message) {
    return console.log(chalk.bgBlue(message))
  }

  static success (message) {
    return console.log(chalk.bgGreen.black('Success') + ' : ' + chalk.green(message))
  }

  static error (message) {
    return console.error(chalk.bgRed.black('Error') + ' : ' + chalk.red(message))
  }

  static request (message) {
    return console.log(chalk.bgYellow.black('Client') + ' : ' + chalk.yellow(message))
  }
}

module.exports = logger
