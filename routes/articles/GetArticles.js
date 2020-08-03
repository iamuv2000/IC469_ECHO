const route = require('express')()
const responses = require('../../configs/responses.js')
const GetArticlesHandler = require('../../controllers/Articles/GetArticlesHandler.js')

route.post('/user/suggestion/articles', (req, res) => {
  if ([undefined, null, []].includes(req.body.activities)) {
    return res.status(400).send({
      statusCode: 400,
      serverMessage: responses['400'],
      payload: {},
      error: 'Bad Request - activities not provided'
    })
  }
  GetArticlesHandler(req.body.activities)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
