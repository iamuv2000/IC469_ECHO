/* eslint-disable prefer-promise-reject-errors */
const User = require('../../models/User.js')
const Bot = require('../../models/Bot.js')

const CreateUserHandler = (user) => {
  return new Promise((resolve, reject) => {
    const UserDoc = new User(user)
    const BotDoc = new Bot({ uid: user.uid })
    Promise.all([UserDoc.save(), BotDoc.save()])
      .then(() => {
        resolve({
          statusCode: 200,
          serverMessage: 'User Created',
          payload: {
            isUserCreated: true
          },
          error: null
        })
      })
      .catch((err) => {
        reject({
          statusCode: 400,
          serverMessage: 'User not created',
          payload: {},
          error: err.message
        })
      })
  })
}

module.exports = CreateUserHandler
