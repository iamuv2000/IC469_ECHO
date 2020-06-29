/* eslint-disable prefer-promise-reject-errors */
const Story = require('../../models/Story.js')

const CreateStoryHandler = (uid, s) => {
  return new Promise((resolve, reject) => {
    const story = new Story({ uid, story: s.body, isAnonymous: s.isAnonymous, date: Date.now() })
    story.save()
      .then(() => resolve({
        statusCode: 200,
        serverMessage: 'Story created',
        payload: {
          isStoryCreated: true
        },
        error: null
      }))
      .catch((err) => reject({
        statusCode: 400,
        serverMessage: 'Story creation failed',
        payload: {},
        error: err.message
      }))
  })
}

module.exports = CreateStoryHandler
