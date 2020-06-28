const GlobalUserIdentifier = (req, res, next) => {
  if (req.query.uid) {
    if (req.query.uid.length > 0) {
      req.uid = req.query.uid
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
