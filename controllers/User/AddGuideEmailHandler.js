/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')
const User = require('../../models/User.js')

const AddGuideEmailHandler = (uid, email) => {
  return new Promise((resolve, reject) => {
    User.findOne({ uid })
      .then((userInstance) => {
        userInstance.guideEmail = email
        return userInstance.save()
      })
      .then(() => {
        resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            isGuideEmailAdded: true
          },
          error: null
        })
      })
      .catch((err) => {
        console.log(err.message)
        reject({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: {
            isGuideEmailAdded: false
          },
          error: 'Server Side Error'
        })
      })
  })
}

module.exports = AddGuideEmailHandler
