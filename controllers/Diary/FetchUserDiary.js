/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')
const Diary = require('../../models/Diary.js')

const FetchUserDiary = (uid) => {
  return new Promise((resolve, reject) => {
    Diary.findOne({ uid })
      .then((diaryInstance) => diaryInstance.toObject())
      .then((diary) => {
        resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            diary: diary.diaryRecords
          },
          error: null
        })
      })
      .catch((err) => {
        console.log(err)
        reject({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: {},
          error: 'Server Side Error'
        })
      })
  })
}

module.exports = FetchUserDiary
