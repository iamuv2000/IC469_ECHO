/* eslint-disable prefer-promise-reject-errors */
const fetch = require('node-fetch')
const responses = require('../../configs/responses.js')
const Activity = require('../../models/Activity.js')

const FetchDailyActivity = (uid) => {
  return new Promise((resolve, reject) => {
    Activity.findOne({ uid })
      .then((activityInstance) => activityInstance.toObject())
      .then((activity) => {
        const lengthOfRecords = activity.activityRecords.length
        if (lengthOfRecords < 5) {
          return resolve({
            statusCode: 200,
            serverMessage: responses['200'],
            payload: {
              activities: ['socialize', 'meditate', 'exercise'],
              hasEnoughRecords: false
            },
            error: null
          })
        } else {
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
          const body = JSON.stringify({
            indexKeys: activity.userActivities,
            record: alteredArray
          })
          fetch('https://echo-cbt-micro.herokuapp.com/activity-suggestions', {
            method: 'POST',
            headers: {
              Accept: 'application/json',
              'Content-Type': 'application/json'
            },
            body
          })
            .then((r) => r.json())
            .then((response) => {
              const respKeys = Object.keys(response)
              respKeys.sort((a, b) => {
                return response[b] - response[a]
              })
              resolve({
                statusCode: 200,
                serverMessage: responses['200'],
                payload: {
                  activities: respKeys.slice(0, 5),
                  hasEnoughRecords: true
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
                error: 'Server Side Error'
              })
            })
        }
      })
      .catch((err) => {
        console.log(err.message)
        reject({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: {},
          error: 'Server Side Error'
        })
      })
  })
}

module.exports = FetchDailyActivity
