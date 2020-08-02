const mongoose = require('mongoose')

const ChatSchema = mongoose.Schema({
  date: {
    type: Date,
    required: true
  },
  entry: {
    type: String,
    required: true,
    trim: true
  }
})

module.exports = ChatSchema
