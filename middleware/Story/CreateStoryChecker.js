const responses = require('../../configs/responses.js')

const CreateStoryChecker = (req, res, next) => {
  const allGood = req.body.story && req.body.isAnonymous
  if (allGood) {
    req.story = {
      body: req.body.story,
      isAnonymous: req.body.isAnonymous
    }
    console.log(req.story)
    return next()
  }
  res.status(400).send({
    statusCode: 400,
    serverMessage: responses['400'],
    payload: {},
    error: null
  })
}

module.exports = CreateStoryChecker
