const route = require('express')()
const responses = require('../../configs/responses.js')
const AddDiaryEntry = require('../../controllers/Diary/AddDiaryEntry.js')

route.post('/user/addDiary', (req, res) => {
  if ([null, undefined, ''].includes(req.body.entry)) {
    return res.status(400).send({
      statusCode: 400,
      serverMessage: responses['400'],
      payload: {
        isDiaryAdded: false
      },
      error: 'Bad request - diary entry is either empty or not found in request'
    })
  }
  AddDiaryEntry(req.uid, req.body.entry)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
