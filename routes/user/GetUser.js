const route = require('express')()
const logger = require('../../controllers/logger.js')
const User = require('../../models/User.js')
const responses = require('../../configs/responses.js')

route.get('/user/get', (req, res) => {
  logger.request(req.uid)
  User.findOne({ uid: req.uid })
    .then((user) => {
      if (user === null) {
        return res.status(400).send({
          status: 400,
          serverMessage: responses['401'],
          payload: {},
          error: 'User not found, Please register first'
        })
      }
      return res.status(200).send({
        status: 200,
        serverMessage: 'User data received',
        payload: user,
        error: null
      })
    })
    .catch((err) => {
      logger.error(err.message)
      return res.status(500).send({
        status: 500,
        serverMessage: responses['500'],
        payload: {},
        error: err.message
      })
    })
})

module.exports = route
