const mongoose = require('mongoose')

const CommentSchema = mongoose.Schema({
  uid: {
    type: String,
    required: true
  },
  comment: {
    type: String
  },
  name: {
    type: String
  }
})

module.exports = CommentSchema
