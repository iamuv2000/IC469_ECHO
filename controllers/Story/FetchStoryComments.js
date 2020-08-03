/* eslint-disable prefer-promise-reject-errors */
const mongoose = require('mongoose')
const responses = require('../../configs/responses.js')
const Story = require('../../models/Story.js')

const FetchStoryComments = (storyId) => {
  return new Promise((resolve, reject) => {
    Story.findOne({ _id: mongoose.Types.ObjectId(storyId) })
      .then((storyInstance) => storyInstance.toObject())
      .then((story) => {
        resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            comments: story.comments
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
          },
          error: 'Server side error'
        })
      })
  })
}

module.exports = FetchStoryComments
