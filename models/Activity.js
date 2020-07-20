const mongoose = require('mongoose')
const logger = require('../controllers/logger.js')

const ActivitySchema = mongoose.Schema({
  uid: {
    type: String,
    required: true,
    unique: true
  },
  activityRecords: {
    type: [Map],
    of: Number,
    default: []
  },
  userActivities: {
    type: [String],
    default: ['feeling', 'jogging', 'exercise', 'meditate', 'paint', 'read', 'code', 'games', 'socialize', 'socialMedia', 'goodSleep', 'badSleep', 'moderateSleep', 'netflix', 'smoke', 'junkFood']
  }
})

const Activity = mongoose.model('Activity', ActivitySchema)

Activity.events.on('error', (err) => logger.error(err.message))

module.exports = Activity
