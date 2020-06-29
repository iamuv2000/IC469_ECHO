const CreateStoryChecker = (req, res, next) => {
  const allGood = req.body.story
  if (allGood) {
    req.story = {
      body: req.body.story,
      isAnonymous: req.body.isAnonymous === false ? req.body.isAnonymous : true
    }
    return next()
  }
  res.status(400).send({
    statusCode: 400,
    serverMessage: 'Bad request',
    payload: {},
    error: null
  })
}

module.exports = CreateStoryChecker
