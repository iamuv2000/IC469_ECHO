/* eslint-disable prefer-promise-reject-errors */
const logger = require('../logger.js')
const responses = require('../../configs/responses.js')
const Story = require('../../models/Story.js')

const GetStoriesHandler = () => {
  return new Promise((resolve, reject) => {
    Story.find({}).limit(25).sort('date')
      .then((stories) => resolve({
        statusCode: 200,
        serverMessage: responses['200'],
        payload: {
          hasStories: true,
          stories: stories.reverse()
        },
        error: null
      }))
      .catch((err) => {
        logger.error(err.message)
        reject({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: {
            hasStories: false,
            stories: null
          },
          error: err.message
        })
      })
  })
}

module.exports = GetStoriesHandler
