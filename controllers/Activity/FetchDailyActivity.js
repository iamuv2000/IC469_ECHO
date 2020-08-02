const responses = require('../../configs/responses.js')
const Activity = require('../../models/Activity.js')

const FetchDailyActivity = (uid) => {
  return new Promise((resolve, reject) => {
    Activity.findOne({ uid })
      .then((activityInstance) => activityInstance.toObject())
      .then((activity) => {
        // console.log(activity)
        const lengthOfRecords = activity.activityRecords.length
        if (lengthOfRecords < 4) {
          return resolve({
            statusCode: 200,
            serverMessage: responses['200'],
            payload: {
              activities: [],
              hasEnoughRecords: false
            },
            error: null
          })
        }
        var alteredArray = []
        const startIndex = lengthOfRecords > 15 ? lengthOfRecords - 16 : 0
        const endIndex = lengthOfRecords
        activity.activityRecords.slice(startIndex, endIndex).forEach(async (record) => {
          var vals = []
          record.forEach((value, key, map) => {
            vals.push(value)
          })
          return alteredArray.push(vals)
        })
        // console.log(JSON.stringify({
        //   indexKeys: activity.userActivities,
        //   record: alteredArray
        // }))
        resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            activities: ['jogging', 'meditate', 'code', 'netflix', 'paint'],
            hasEnoughRecords: true
          },
          error: null
        })
      })
  })
}

module.exports = FetchDailyActivity
