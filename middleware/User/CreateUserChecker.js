const responses = require('../../configs/responses.js')

const CreateUserChecker = (req, res, next) => {
  const allGood = req.body.displayName &&
  req.body.email &&
  req.body.uid &&
  req.body.mobile
  if (allGood) {
    req.user = {
      uid: req.body.uid,
      name: req.body.displayName,
      email: req.body.email,
      mobile: req.body.mobile
    }
    return next()
  }
  res.status(400).send({
    statusCode: 400,
    serverMessage: responses['400'],
    payload: {},
    error: null
  })
}

module.exports = CreateUserChecker
