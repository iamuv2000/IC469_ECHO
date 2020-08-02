const route = require('express')()
const FetchUserStories = require('../../controllers/User/FetchUserStories.js')
route.get('/user/getUserStories', (req, res) => {
  FetchUserStories(req.uid)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
