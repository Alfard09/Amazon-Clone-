console.log('Hello World');

const express = require('express'); //importing line 
const PORT = 3000;

const app = express();

//Creating an API
//GET, PUT, POST, DELETE, UPDATE--> CRUD
// app.get('/hello-world', (req, res) => {
//     res.json({ hi: "hello world" });

// })//callback function ()=>{}

app.get('/', (req, res) => {
    res.json({ API: "This is testing hehe" })
})

app.listen(PORT, () => {
    console.log(`Connected at port ${PORT}`);
})


