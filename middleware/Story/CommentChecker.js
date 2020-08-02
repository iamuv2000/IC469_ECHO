const responses = require('../../configs/responses.js')

const CommentChecker = (req, res, next) => {
  const allGood = req.body.comment && req.body.name && req.body.uid && req.body.storyId
  if (allGood) {
    req.comment = {
      comment: req.body.comment,
      name: req.body.name,
      uid: req.body.uid,
      storyId: req.body.storyId
    }
    return next()
  }

  return res.status(400).send({
    statusCode: 400,
    serverMessage: responses['400'],
    payload: {
      isCommented: false
    },
    error: 'Bad Request - poorly formatted request'
  })
}

module.exports = CommentChecker
