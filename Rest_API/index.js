var express = require('express');
var app = express();
app.use(express.json());
const cors = require('cors');
app.use(cors());

var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'dbuser',
  password: 's3kreee7',
  database: 'my_db'
})


app.listen(3000);