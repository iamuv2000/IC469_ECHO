const responses = require('../../configs/responses.js')
const Activity = require('../../models/Activity.js')

const FetchDailyActivity = (uid) => {
    return new Promise((resolve, reject) => {
        Activity.findOne({ uid })
            .then((activityInstance) => activityInstance.toObject())
            .then((activity) => {
                console.log(activity)
                if (activity.activityRecords.length < 4) {
                    return resolve({
                        statusCode: 200,
                        serverMessage: responses['200'],
                        payload: {
                            activities: [],
                            hasEnoughRecords: false,
                        },
                        error: null
                    })
                }
                resolve({
                    statusCode: 200,
                    serverMessage: responses['200'],
                    payload: {
                        activities: ["jogging", "meditate", "code", "netflix", "paint"],
                        hasEnoughRecords: true,
                    },
                    error: null
                })
            })
    })
}

module.exports = FetchDailyActivity