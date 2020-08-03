const nodeMailer = require('nodemailer')
const fs = require('fs')

const Nodemailer = (emails, html, sender, subject, nameOfEmail, attachment = null) => {
  return new Promise((resolve, reject) => {
    try {
      const transporter = nodeMailer.createTransport({
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
          user: process.env.USER_NAME,
          pass: process.env.USER_PASSWORD
        }
      })
      const mailOptions = {
        from: {
          name: nameOfEmail,
          address: sender
        },
        to: emails,
        subject: subject,
        html: html,
        attachments: attachment !== null ? [{ filename: attachment.fileName, content: fs.createReadStream(attachment.filePath) }] : null,
        dsn: {
          id: 'some random message specific id',
          return: 'headers',
          notify: ['failure', 'delay'],
          recipient: sender
        }
      }
      transporter.sendMail(mailOptions, (err, info) => {
        if (err) {
          reject(err)
        }
        // const sentTo = info.accepted
        // const notSentTo = info.rejected
        // console.log('Message ' + info.messageId + ' sent: ' + info.response)
        // resolve({
        //   sentTo,
        //   notSentTo
        // })
        resolve()
      })
    } catch (err) {
      console.log(err)
    }
  })
}

module.exports = Nodemailer
