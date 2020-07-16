const route = require('express')()
const CheckMessage = require('../../middleware/Bot/CheckMessage.js')
const GenerateReplyHandler = require('../../controllers/Bot/GenerateReplyHandler.js')

route.post('/user/bot/reply', CheckMessage, (req, res) => {
  GenerateReplyHandler(req.uid, req.message)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
