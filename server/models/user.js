const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        requied: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re =
                    /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);

            },
            message: 'Please enter a valid email address',
        },

    },
    password: {
        requied: true,
        type: String,
        validate: (value) => {
            return value.length > 6;
        },
        message: 'Please enter a long password',

    },
    address: {
        type: String,
        default: " ",

    },
    type: {
        type: String,
        default: 'user',
    }

});

//create a model
const User = mongoose.model("User", userSchema);
module.exports = User;