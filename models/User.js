const mongoose = require('mongoose')
const logger = require('../controllers/logger.js')

const UserSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
    minlength: [3, 'Name should have at least 3 characters!'],
    maxlength: [40, 'Name can have maximum 40 characters!']
  },
  uid: {
    type: String,
    required: true,
    unique: true
  },
  mobile: {
    type: Number,
    required: true,
    min: [1111111111, 'Mobile number not correct!'],
    max: [9999999999, 'Mobile number not correct!']
  },
  email: {
    type: String,
    required: true,
    unique: true
  },
  guideEmail: {
    type: String,
    required: false
  }
})

const User = mongoose.model('User', UserSchema)

User.events.on('error', (err) => logger.error(err.message))

module.exports = User
