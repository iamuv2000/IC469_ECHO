const route = require('express')()
const logger = require('../../controllers/logger.js')
const CreateUserChecker = require('../../middleware/User/CreateUserChecker.js')
const CreateUserHandler = require('../../controllers/User/CreateUserHandler.js')

route.post('/create_user', CreateUserChecker, (req, res) => {
  logger.request(req.user)
  CreateUserHandler(req.user)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
