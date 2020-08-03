const Nodemailer = require('./Nodemailer.js')

const DiaryEmail = (name, email, guideEmail, entry) => {
  // attachment should have filename  and path
  return new Promise((resolve, reject) => {
    if ([undefined, null, ''].includes(guideEmail)) {
      return resolve()
    }
    var html = `<h1>Echo-CBT: Activity Review Details</h1><h4>Patient Name: ${name}</h4><h4>Patient Email: ${email}</h4><br/><h4>Diary Entry: ${entry}</hr>`
    try {
      Nodemailer(
        [guideEmail],
        html,
        'teamecho.alpha@gmail.com',
        "Your Patient's Diary Report",
        'Echo-CBT User Diary Report'
      )
      resolve()
    } catch (err) {
      console.log(err.message)
    }
  })
}

module.exports = DiaryEmail
