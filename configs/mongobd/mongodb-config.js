const mongoose = require('mongoose')
const logger = require('../../controllers/logger.js')

const { MONGO_USER, MONGO_PASS, MONGO_DB } = process.env

mongoose.connect(`mongodb+srv://${MONGO_USER}:${MONGO_PASS}@cluster0-jo8kv.mongodb.net/${MONGO_DB}?retryWrites=true&w=majority`,
  {
    useNewUrlParser: true,
    useUnifiedTopology: true
  })
  .then(() => logger.success('Mongo Database Connected'))
  .catch((err) => logger.error(err.message))

module.export = mongoose
