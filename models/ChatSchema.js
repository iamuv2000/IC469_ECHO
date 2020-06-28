const mongoose = require('mongoose')

const ChatSchema = mongoose.Schema({
  uid: {
    type: String,
    required: true
  },
  message: {
    type: String,
    required: true,
    trim: true
  }
})

module.exports = ChatSchema
