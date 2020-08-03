const mongoose = require('mongoose')
const logger = require('../controllers/logger.js')
const DiaryRecordSchema = require('./DiaryRecordSchema.js')

const DiarySchema = mongoose.Schema({
  uid: {
    type: String,
    required: true,
    unique: true
  },
  diaryRecords: {
    type: [DiaryRecordSchema]
  }
})

const DiaryModel = mongoose.model('Diary', DiarySchema)

DiaryModel.events.on('error', err => logger.error(err.message))

module.exports = DiaryModel
