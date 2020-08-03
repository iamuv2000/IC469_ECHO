/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')
const Diary = require('../../models/Diary.js')
const User = require('../../models/User.js')
const DiaryEmail = require('../../controllers/EmailAPI/DiaryEmail.js')

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
        return User.findOne({ uid })
      })
      .then((userInstance) => userInstance.toObject())
      .then((user) => {
        DiaryEmail(user.name, user.email, user.guideEmail, entry)
      })
      .catch((err) => {
        console.log(err.message)
        reject({
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
