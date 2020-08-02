const Nodemailer = require('./Nodemailer.js')

const ActivityEmail = (name, email, guideEmail, activities) => {
  return new Promise((resolve, reject) => {
    if ([undefined, null, ''].includes(guideEmail)) {
      return resolve()
    }
    var html = `<h1>Echo-CBT: Activity Review Details</h1><h4>Patient Name: ${name}</h4><h4>Patient Email: ${email}</h4><br/><table style='border: 1px solid black;'><tr><th>Activity</th><th>Ratio</th></tr>`
    activities.forEach((value, key, map) => {
      html = html + `<tr><td>${key}</td><td>${value}</td></tr>`
    })
    html = html + '</table>'
    try {
      Nodemailer(
        [guideEmail],
        html,
        'teamecho.alpha@gmail.com',
        "Your Patient's Activity Report",
        'Echo-CBT User Activity Report'
      )
      resolve()
    } catch (err) {
      console.log(err.message)
    }
  })
}

module.exports = ActivityEmail
