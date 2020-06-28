const mongoose = require('mongoose')
const logger = require('../controllers/logger.js')
const ChatSchema = require('./ChatSchema.js')

const BotSchema = mongoose.Schema({
  botHealth: {
    type: String,
    required: true,
    default: 'good',
    lowercase: true,
    enum: ['good', 'moderate', 'bad']
  },
  uid: {
    type: String,
    required: true,
    unique: true
  },
  status: {
    type: String,
    required: true,
    lowercase: true,
    default: 'no_problems',
    enum: ['no_problems', 'doing-okay', 'moderate_problem', 'suffering', 'in_danger']
  },
  chatBackup: {
    type: [ChatSchema]
  }
})

const BotModel = mongoose.model('Bot', BotSchema)

BotModel.events.on('error', err => logger.error(err.message))

module.exports = BotModel
