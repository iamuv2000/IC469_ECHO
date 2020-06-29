const GlobalUserIdentifier = (req, res, next) => {
  const allGood = req.headers.authorization
  if (allGood) {
    if (req.headers.authorization.length > 0) {
      req.uid = req.headers.authorization.replace('Bearer ', '')
      return next()
    }
  }
  res.status(400).send({
    statusCode: 400,
    serverMessage: 'Unauthorized',
    payload: {},
    error: null
  })
}

module.exports = GlobalUserIdentifier
