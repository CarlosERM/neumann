//config inicial
require('dotenv').config()
const express = require("express")
const mongoose = require("mongoose")
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")

const app = express()
//Forma de ler JSON
app.use(
      express.urlencoded({
            extended: true
      })
)
app.use(express.json())

//Models
const Person = require("./models/Person")


//Rotas abertas da API
const personRoutes = require("./routes/personRoutes")

app.use('/person', personRoutes)

const pubRoutes = require("./routes/pubRoutes")
const exp = require('constants')

app.use('/pub', pubRoutes)
//rota inicial / endpoint
app.get('/', (req, res) => {
      res.json({message: 'Rota inicial!'})
})

//Rotas privadas
app.get("/pperson/:id",checkToken, async (req, res) => {

      const id = req.params.id

      //checa se o úsuario existe
      const user = await Person.findById(id, '-senha')

      if(!user){
            return res.status(404).json({msg: "Usuario não encontrado!"})
      }
      res.status(200).json({user})
})

function checkToken(req, res, next){

      const authHeader = req.headers['authorization']
      const token = authHeader && authHeader.split(" ")[1]

      if(!token){
            return res.status(401).json({msg: "Acesso negado!"})
      }

      try {
            const secret = process.env.SECRET

            jwt.verify(token, secret)

            next()
      } catch (error) {
            res.status(400).json({msg: "Token invalido"})
      }
}

//cadatro de usuario
app.post('/auth/register', async(req, res) => {
      const {nome, email, senha} = req.body

      //validações
      if(!nome){
            return res.status(422).json({ message: "Nome de usuario é obrigatorio!!"})
      }
      if(!email){
            return res.status(422).json({ message: "Email é obrigatorio!!"})
      }
      if(!senha){
            return res.status(422).json({ message: "Senha é obrigatoria!!"})
      }

      //checar se o usuario existe
      const userExists = await Person.findOne({ email: email })

      if(userExists) {
            return res.status(422).json({ message: "Email já cadastrado!!"})
      }

      //create password
      const salt = await bcrypt.genSalt(12)
      const senhaHash = await bcrypt.hash(senha, salt)

      //create user
      const person = new Person({
            nome, 
            email,
            senha: senhaHash,
      })

      try {
            await person.save()
            res.status(201).json({message: "Usuario criado com sucesso!"})

      } catch (error) {
            res.status(500).json(error)
      }

})

//login usuario
app.post("/auth/login", async (req, res) => {

      const {email, senha} = req.body
      if(!email){
            return res.status(422).json({ message: "Email é obrigatorio!!"})
      }
      if(!senha){
            return res.status(422).json({ message: "Senha é obrigatoria!!"})
      }
      //checar se o usuario existe
      const user = await Person.findOne({ email: email })

      if(!user) {
            return res.status(404).json({ message: "Usuario não encontrado!!"})
      }

      //checar senha
      const checkSenha = await bcrypt.compare(senha, user.senha)

      if(!checkSenha){
            return res.status(422).json({ message: "Usuario ou Senha invalida!"})
      }

      try {
            const secret = process.env.SECRET

            const token = jwt.sign({
                  id: user._id,
            },
                  secret,
            )

            res.status(200).json({msg: "Autenticação realizada com sucesso!", token})
      } catch (error) {
            console.log(error)

            res.status(500).json({
                  message: "Aconteceu um erro inesperado."
            })
      }
})
const DATABASE = process.env.DATABASE
const PORT = process.env.PORT
mongoose
.connect(`${DATABASE}:${PORT}`)
.then(() => {
      console.log("Servidor iniciado!")
      app.listen(3000)
})
.catch((err) => console.log(err))