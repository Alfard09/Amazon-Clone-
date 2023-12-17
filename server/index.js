
//IMPRRTD FROM PACKAGES
const express = require('express'); //importing line 
const mangoose = require('mongoose');

//INITIALIZATION
const PORT = 3000;

const app = express();

const DB = "mongodb+srv://alfardkoshy:alfardkoshy@cluster0.dikfxfg.mongodb.net/?retryWrites=true&w=majority";

// IMPORT FROM ITHER FILES 
const authRouter = require('./route/auth');
const { default: mongoose } = require('mongoose');

//MIDDLEWARE -- used to specifiy the format of data between client and serber 
// CLIENT -> SERVER -> CLIENT
app.use(express.json());
app.use(authRouter);



//connections
mongoose.connect(DB).then(() => {
    console.log('connection success')
}).catch((e) => {
    console.log(e);
})
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected at port ${PORT}`);
})



//Creating an API
//GET, PUT, POST, DELETE, UPDATE--> CRUD
// app.get('/hello-world', (req, res) => {
//     res.json({ hi: "hello world" });

// })//callback function ()=>{}



