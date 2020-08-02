/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')
const User = require('../../models/User.js')
const Activity = require('../../models/Activity.js')
const Diary = require('../../models/Diary.js')

const CreateUserHandler = (user) => {
  return new Promise((resolve, reject) => {
    const UserDoc = new User(user)
    const ActivityDoc = new Activity({ uid: user.uid })
    const DiaryDoc = new Diary({ uid: user.uid })
    Promise.all([UserDoc.save(), ActivityDoc.save(), DiaryDoc.save()])
      .then(() => {
        resolve({
          statusCode: 201,
          serverMessage: responses['201'],
          payload: {
            isUserCreated: true
          },
          error: null
        })
      })
      .catch((err) => {
        if (err.code === 11000) {
          return reject({
            statusCode: 400,
            serverMessage: responses['400'],
            payload: {},
            error: 'User already registered, try signing in!'
          })
        }
        reject({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: {},
          error: err.message
        })
      })
  })
}

module.exports = CreateUserHandler
