const responses = require('../../configs/responses.js')
const Diary = require('../../models/Diary.js')

const AddDiaryEntry = (uid, entry) => {
  return new Promise((resolve, reject) => {
    Diary.findOne({ uid })
      .then((diaryInstance) => {
        diaryInstance.diaryRecords = [...diaryInstance.diaryRecords, { date: Date.now(), entry: entry }]
        return diaryInstance.save()
      })
      .then(() => {
        resolve({
          statusCode: 200,
          serverMessage: responses['200'],
          payload: {
            isDiaryAdded: true
          },
          error: null
        })
      })
      .catch((err) => {
        console.log(err.message)
        resolve({
          statusCode: 500,
          serverMessage: responses['500'],
          payload: {
            isDiaryAdded: false
          },
          error: null
        })
      })
  })
}

module.exports = AddDiaryEntry
