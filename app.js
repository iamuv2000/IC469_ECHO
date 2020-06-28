const app = require('express')()
const logger = require('./controllers/logger.js')
require('./configs/mongobd/mongodb-config')

app.listen(8080, () => {
  logger.server('Server listening: 8080')
})
