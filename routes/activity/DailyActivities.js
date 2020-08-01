const route = require("express")();
const FetchDailyActivity = require('../../controllers/Activity/FetchDailyActivity.js')

route.get('/user/activity/daily', (req, res) => {
    FetchDailyActivity(req.uid)
        .then((resp) => res.status(resp.statusCode).send(resp))
        .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route;