const route = require('express')()
const CreateStoryChecker = require('../../middleware/user/CreateStoryChecker.js')
const CreateStoryHandler = require('../../controllers/User/CreateStoryHandler.js')

route.post('/user/create_story', CreateStoryChecker, (req, res) => {
  CreateStoryHandler(req.uid, req.story)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
