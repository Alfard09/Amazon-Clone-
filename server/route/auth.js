const express = require("express");
const User = require("../models/user.js");

const bcryptjs = require("bcryptjs")
const jwt = require('jsonwebtoken')

const authRouter = express.Router();

//signup route
authRouter.post('/api/signup', async (req, res) => {
    try {
        //get the data from the client 
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: 'User with same email already exists!' });
        }
        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        })
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }

    //validation


    //post the data to db

    //return the data to user
})
authRouter.get('/api/signup', async (req, res) => {
    //get the data from the client 
    const { name, email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
        return res.status(400).json({ msg: 'User with same email already exists!' });
    }

    let user = new User({
        email,
        password,
        name,
    })
    user = await user.save();
    res.json(user);
    //validation


    //post the data to db

    //return the data to user
})

//signIN route
authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: "User with this email doesnot exist" });
        }
        //comparing the hased password
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect Password!!" });
        }
        const token = jwt.sign({ id: user._id }, "passwordkey");
        res.json({ token, ...user._doc })
    } catch (e) {
        res.status(500).json({ error: e.message })
    }
})
//exprt thr file
module.exports = authRouter
