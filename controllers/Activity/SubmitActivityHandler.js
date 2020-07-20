/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')

const SubmitActivityHandler = (activity, submittedActivities) => {
  return new Promise((resolve, reject) => {
    Promise.all([
      activity.toObject().userActivities,
      activity.toObject().activityRecords.length,
      Object.keys(submittedActivities)
    ])
      .then(([userActivities, recordLength, submittedActivitiesKeys]) => {
        activity.activityRecords = [...activity.activityRecords, new Map()]
        userActivities.forEach((a) => {
          if (submittedActivitiesKeys.includes(a)) {
            activity.activityRecords[recordLength].set(a, submittedActivities[a])
          } else {
            activity.activityRecords[recordLength].set(a, 0)
          }
        })
        activity.save()
        resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            areActivitiesRecorded: true
          },
          error: null
        })
      })
      .catch((err) => {
        console.log(err.message)
        reject({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: {},
          error: err.message
        })
      })
  })
}

module.exports = SubmitActivityHandler
