const Activity = require('../../models/Activity.js')
const responses = require('../../configs/responses')

const CheckSubmitActivity = async (req, res, next) => {
  const submittedActivities = req.body.activities
  if (submittedActivities) {
    const [activity, submittedActivitiesKeys] = await Promise.all([Activity.findOne({ uid: req.uid }), Object.keys(submittedActivities)])
    const userActivities = activity.toObject().userActivities
    var check = submittedActivitiesKeys.every((el) => {
      return userActivities.indexOf(el) !== -1
    })
    if (check) {
      req.activity = activity
      req.submittedActivities = submittedActivities
      return next()
    }
  }
  return res.status(400).send({
    statusCode: 400,
    serverMessage: responses['400'],
    payload: {},
    error: null
  })
}

module.exports = CheckSubmitActivity
