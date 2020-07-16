const responses = require('../../configs/responses.js')

const CheckMessage = (req, res, next) => {
  const userMessage = req.body.message
  if ([undefined, null, ''].includes(userMessage)) {
    return res.status(200).send({
      statusCode: 200,
      serverMessage: responses['200'],
      payload: {},
      error: null
    })
  }
  req.message = userMessage
  next()
}

module.exports = CheckMessage
