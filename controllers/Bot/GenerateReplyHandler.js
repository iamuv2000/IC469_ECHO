/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')
const logger = require('../../controllers/logger.js')
const Bot = require('../../models/Bot.js')

const GenerateReplyHandler = (uid, message) => {
  return new Promise((resolve, reject) => {
    Bot.findOne({ uid: uid })
      .then((bot) => {
        /*
          Code that will generate bot reply
        */
        const botReply = 'Reply from Bot'
        bot.chatBackup = [...bot.chatBackup, { uid: uid, message: message }, { uid: 'bot', message: botReply }]
        bot.save()
        return resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            bot: bot.toObject(),
            botMessage: botReply
          },
          error: null
        })
      })
      .catch((err) => {
        logger.error(err.message)
        return reject({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: null,
          error: 'Server not able to generate bot reply'
        })
      })
  })
}

module.exports = GenerateReplyHandler
