const route = require('express')()
const responses = require('../../configs/responses.js')
const AddGuideEmailHandler = require('../../controllers/User/AddGuideEmailHandler.js')

route.post('/user/guide/email', (req, res) => {
  if ([undefined, null, ''].includes(req.body.email)) {
    return res.status(400).send({
      statusCode: 400,
      serverMessage: responses['400'],
      payload: {
        isGuideEmailAdded: false
      },
      error: 'Bad Request - guide email not provided or poorly formatted request'
    })
  }
  AddGuideEmailHandler(req.uid, req.body.email)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
