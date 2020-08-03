const route = require('express')()
const CommentChecker = require('../middleware/Story/CommentChecker.js')
const AddCommentHandler = require('../controllers/Story/AddCommentHandler.js')

route.post('/user/story/comment', CommentChecker, (req, res) => {
  AddCommentHandler(req.comment)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
