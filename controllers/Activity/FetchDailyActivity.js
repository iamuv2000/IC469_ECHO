const responses = require('../../configs/responses.js')

const FetchDailyActivity = () => {
    return new Promise((resolve, reject) => {
        resolve({
            statusCode: 200,
            serverMessage: responses['200'],
            payload: {
                activities: ["jogging", "meditate", "code", "netflix", "paint"]
            },
            error: null
        })
    })
}

module.exports = FetchDailyActivity