const Nodemailer = require('./Nodemailer.js')

Nodemailer(
  ['limphned@gmail.com'],
  '<h1>Echo CBT test</h1>',
  'teamecho.alpha@gmail.com',
  'This is Subject',
  'Echo-CBT User Activity Report'
)
