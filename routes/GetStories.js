const route = require('express')()
const GetStoriesHandler = require('../controllers/Story/GetStoriesHandler.js')

route.get('/user/stories', (req, res) => {
  GetStoriesHandler()
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
