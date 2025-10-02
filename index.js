const express = require('express');
const mongoose = require('mongoose');

var app = express();
mongoose.connect('mongodb://david:david123@davidmongo:27017/miapp?authSource=admin');

const kittySchema = new mongoose.Schema({
    name: String
});
const Kitten = mongoose.model('Kitten', kittySchema);
const silence = new Kitten({ name: 'Silence' });
silence.save();

app.get('/', (req, res) => { 
    Kitten.find().then(result => { 
        res.send(result); 
    }).catch(error=>{
        let data = errorMsg(error); 
        res.send(data); 
    }); 
});
app.listen(3000);