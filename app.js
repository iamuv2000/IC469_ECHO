const app = require('express')()
const bodyParser = require('body-parser')
const logger = require('./controllers/logger.js')
require('./configs/mongobd/mongodb-config')

// importing global middleware
const GlobalUserIdentifier = require('./middleware/GlobalUserIdentifier.js')

// importing routes
const CreateRoute = require('./routes/CreateRoute.js')
const CreateStory = require('./routes/CreateStory.js')
const GetStories = require('./routes/GetStories.js')

// Using imported middleware and routes
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use((req, res, next) => {
  logger.request('New Request')
  next()
})
app.use(CreateRoute)
app.use(GlobalUserIdentifier)
app.use(CreateStory)
app.use(GetStories)

const PORT = process.env.PORT

app.listen(PORT, () => {
  logger.server('Server listening: 8080')
})
