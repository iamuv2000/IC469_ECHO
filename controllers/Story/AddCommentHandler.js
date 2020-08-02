/* eslint-disable prefer-promise-reject-errors */
const mongoose = require('mongoose')
const responses = require('../../configs/responses.js')
const Story = require('../../models/Story.js')

const AddCommentHandler = (commentObject) => {
  return new Promise((resolve, reject) => {
    Story.findOne({ _id: mongoose.Types.ObjectId(commentObject.storyId) })
      .then((storyInstance) => {
        storyInstance.comments = [...storyInstance.comments, {
          uid: commentObject.uid,
          comment: commentObject.comment,
          name: commentObject.name
        }]
        return storyInstance.save()
      })
      .then(() => {
        resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            isCommented: true
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
            isCommented: false
          },
          error: null
        })
      })
  })
}

module.exports = AddCommentHandler
