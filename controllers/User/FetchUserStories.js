/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')
const Story = require('../../models/Story.js')

const FetchUserStories = (uid) => {
  return new Promise((resolve, reject) => {
    Story.find({ uid })
      .then((userStories) => {
        resolve({
          statusCode: 200,
          serverResponse: responses['200'],
          payload: {
            userStories
          },
          error: null
        })
      })
      .catch((err) => {
        console.log(err)
        reject({
          statusCode: 500,
          serverResponse: responses['500'],
          payload: {
            userStories: []
          },
          error: 'Encountered an error while retrieving your stories!'
        })
      })
  })
}

module.exports = FetchUserStories
