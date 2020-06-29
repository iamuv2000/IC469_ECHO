const app = require('express')()
const bodyParser = require('body-parser')
const logger = require('./controllers/logger.js')
require('./configs/mongobd/mongodb-config')

// importing global middleware
const GlobalUserIdentifier = require('./middleware/GlobalUserIdentifier.js')

// importing routes
const CreateRoute = require('./routes/CreateRoute.js')
const CreateStory = require('./routes/User/CreateStory.js')

// Using imported middleware and routes
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(CreateRoute)
app.use(GlobalUserIdentifier)
app.use(CreateStory)

app.listen(8080, () => {
  logger.server('Server listening: 8080')
})
