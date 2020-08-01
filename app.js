const app = require('express')()
const bodyParser = require('body-parser')
const logger = require('./controllers/logger.js')
require('./configs/mongobd/mongodb-config')

// importing global middleware
const GlobalUserIdentifier = require('./middleware/GlobalUserIdentifier.js')

// importing routes
const CreateRoute = require('./routes/user/CreateRoute.js')
const GetUser = require('./routes/user/GetUser.js')
const CreateStory = require('./routes/CreateStory.js')
const GetStories = require('./routes/GetStories.js')
const GetReply = require('./routes/bot/GetReply.js')
const SubmitActivity = require('./routes/activity/SubmitActivity.js')
const DailyActivity = require("./routes/activity/DailyActivities.js")

// Using imported middleware and routes
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use((req, res, next) => {
  logger.request('New Request')
  next()
})
app.use(CreateRoute)
app.use(GlobalUserIdentifier)
app.use(GetUser)
app.use(CreateStory)
app.use(GetStories)
app.use(GetReply)
app.use(SubmitActivity)
app.use(DailyActivity)

const PORT = process.env.PORT

app.listen(PORT, () => {
  logger.server('Server listening: 8080')
})
