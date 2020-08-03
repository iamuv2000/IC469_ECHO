const app = require('express')()
const bodyParser = require('body-parser')
const logger = require('./controllers/logger.js')
require('./configs/mongobd/mongodb-config')

// importing global middleware
const GlobalUserIdentifier = require('./middleware/GlobalUserIdentifier.js')

// importing routes
const CreateRoute = require('./routes/user/CreateRoute.js')
const GetUser = require('./routes/user/GetUser.js')
const GetUserStories = require('./routes/user/GetUserStories.js')
const CreateStory = require('./routes/CreateStory.js')
const GetStories = require('./routes/GetStories.js')
const SubmitActivity = require('./routes/activity/SubmitActivity.js')
const DailyActivity = require('./routes/activity/DailyActivities.js')
const AddDiary = require('./routes/diary/AddDiary.js')
const GetUserDiary = require('./routes/diary/GetUserDiary.js')
const AddComment = require('./routes/AddComment.js')
const GetStoryComments = require('./routes/GetStoryComments.js')
const AddGuideEmail = require('./routes/user/AddGuideEmail.js')
const GetArticles = require('./routes/articles/GetArticles.js')

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
app.use(GetUserStories)
app.use(CreateStory)
app.use(GetStories)
app.use(SubmitActivity)
app.use(DailyActivity)
app.use(AddDiary)
app.use(GetUserDiary)
app.use(AddComment)
app.use(GetStoryComments)
app.use(AddGuideEmail)
app.use(GetArticles)

// require('./controllers/EmailAPI/test-email-setup.js')

const PORT = process.env.PORT

app.listen(PORT, () => {
  logger.server('Server listening: 8080')
})
