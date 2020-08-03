const route = require('express')()
const CheckSubmitActivity = require('../../middleware/Activity/CheckSubmitActivity.js')
const SubmitActivityHandler = require('../../controllers/Activity/SubmitActivityHandler.js')

route.post('/user/activity/submit', CheckSubmitActivity, (req, res) => {
  SubmitActivityHandler(req.uid, req.activity, req.submittedActivities)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
