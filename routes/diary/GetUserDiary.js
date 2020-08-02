const route = require('express')()
const FetchUserDiary = require('../../controllers/Diary/FetchUserDiary.js')

route.get('/user/getDiary', (req, res) => {
  FetchUserDiary(req.uid)
    .then((resp) => res.status(resp.statusCode).send(resp))
    .catch((err) => res.status(err.statusCode).send(err))
})

module.exports = route
