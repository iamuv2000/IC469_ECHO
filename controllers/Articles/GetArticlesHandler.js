const responses = require('../../configs/responses.js')

const GetArticlesHandler = (activities) => {
  console.log(activities)
  return new Promise((resolve, reject) => {
    resolve({
      statusCode: 200,
      serverMessage: responses['200'],
      payload: {
        articles: []
      },
      error: null
    })
  })
}

module.exports = GetArticlesHandler
