import nodemailer from "nodemailer";


const transporter = nodemailer.createTransport({
  host: "smtp.gmail.com",
  port: 587,
  secure: false,
  auth: {
    user: "miriamespejortega@gmail.com",
    pass: "ulpmynrvlgmudkqc"
  }
})

function sendMail(email, tokenconfirm){
  let mensaje = `
    <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>
  <body>
    <div style='background-color: yellow';>
      <h1>Bienvenid@ a nuestra aplicación</h1>
      <h2>que tal estas?</h2>
      <p>Confirma tu email en este enlace: </p>
      <a href="http://localhost:5173/accountConfirm/?token=${tokenconfirm}">Verifica aqui</a>  
    </div>
  </body>
  </html> 
  `

  transporter.sendMail({
    from: "Miriam <miriamespejortega@gmail.com>",
    to: email,
    subject: "bienvenid@",
    text: "hola", /* si hay un fallo al mandar el html se manda este texto */
    html: mensaje
  })

  





}

export default sendMail;