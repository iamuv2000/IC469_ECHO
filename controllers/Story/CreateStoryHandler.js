/* eslint-disable prefer-promise-reject-errors */
const Story = require('../../models/Story.js')
const responses = require('../../configs/responses.js')

const CreateStoryHandler = (uid, s) => {
  return new Promise((resolve, reject) => {
    const story = new Story({ uid, story: s.body, isAnonymous: s.isAnonymous, date: Date.now() })
    story.save()
      .then(() => resolve({
        statusCode: 201,
        serverMessage: responses['201'],
        payload: {
          isStoryCreated: true
        },
        error: null
      }))
      .catch((err) => reject({
        statusCode: 500,
        serverMessage: responses['500'],
        payload: {},
        error: err.message
      }))
  })
}

module.exports = CreateStoryHandler
