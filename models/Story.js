const mongoose = require('mongoose')
const CommentSchema = require('./CommentSchema.js')
const logger = require('../controllers/logger.js')

const StorySchema = mongoose.Schema({
  uid: {
    type: String,
    required: true
  },
  name: {
    type: String,
    required: false
  },
  date: {
    type: Date,
    required: true
  },
  isAnonymous: {
    type: Boolean,
    required: true
  },
  story: {
    type: String,
    required: true,
    trim: true,
    maxlength: [500, 'Your story can have maximum of 500 characters!']
  },
  comments: {
    type: [CommentSchema]
  }
})

const Story = mongoose.model('Story', StorySchema)

Story.events.on('error', (err) => logger.error(err.message))

module.exports = Story
