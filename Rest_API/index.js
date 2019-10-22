//Initialisation express.js
const express = require('express');
const app = express();
app.use(express.json());
var bodyParser = require("body-parser");
var jsonParser = bodyParser.json()
app.use(bodyParser.text({ type: 'text/html' }))
var urlencodedParser = bodyParser.urlencoded({ extended: false })


const cors = require('cors');
app.use(cors());

//Initialisation BDD MySQL
var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'localhost',
  port: '3306',
  user: 'root',
  password: '',
  database: 'agriparc_db'
});

//Ouvre la connection à la BDD
connection.connect(); 
  

//Affiche la liste du materiel: id, nom, status, Gaec Associée
//GET /listeMateriel
<<<<<<< HEAD

  //console.log(rows);
  app.get('/listeMateriel', function (req, res) {
    connection.query('SELECT materiel.id, materiel.nom, materiel.statut, gaec.nom_gaec AS Gaec FROM materiel, gaec WHERE materiel.gaec_id = gaec.id', function (err, rows, fields) {
    if (err) throw err;
=======
connection.query('SELECT materiel.id, materiel.nom, materiel.statut, materiel.position_gps, gaec.nom_gaec AS Gaec FROM materiel, gaec WHERE materiel.gaec_id = gaec.id', function (err, rows, fields) {
  if (err) throw err;
  //console.log(rows);
  app.get('/materiel', function (req, res) {
>>>>>>> 8f6527e320badb048acf97c0faa3f90c37085c17
    res.send(rows);
  });
});


//Affiche materiel par id : id, nom, status, Gaec Associée
//GET /listeMateriel/:id
app.get('/materiel/:id', function (req, res) {
  var idMateriel = req.params.id;
  console.log(idMateriel);
  connection.query('SELECT materiel.id, materiel.nom, materiel.statut, gaec.nom_gaec AS Gaec FROM materiel, gaec WHERE materiel.gaec_id = gaec.id AND materiel.id = ?', [idMateriel], function (err, rows, fields) {
    if (err) throw err;
    res.send(rows);
  });
});

//Affiche materiel par nom : id, nom, status, Gaec Associée
//GET /materiel/:nom
app.get('/materiel/:nom', function (req, res) {
  var nomMateriel = req.params.nom; 
  console.log(nomMateriel);

  connection.query("SELECT materiel.id, materiel.nom, materiel.statut, gaec.nom_gaec AS Gaec FROM materiel, gaec WHERE materiel.gaec_id = gaec.id AND materiel.nom LIKE ? ", [nomMateriel], function (err, rows, fields) {
    if (err) throw err;
    //console.log(nomMateriel);
    res.send(rows);
  });
  
});

//Affiche la liste des agriculteurs: id, nom, prenom, num tel, Gaec Associée
//GET /listeAgriculteurs
connection.query('SELECT agriculteur.id, agriculteur.nom, agriculteur.prenom, agriculteur.telephone, gaec.nom_gaec AS Gaec FROM agriculteur, gaec WHERE agriculteur.gaec_id = gaec.id', function (err, rows, fields) {
  if (err) throw err;
  //console.log(rows);
  app.get('/agriculteur', function (req, res) {
    res.send(rows);
  });
});

//Affiche agriculteur par id : id, nom, status, Gaec Associée
//GET /listeMateriel/:id
app.get('/agriculteur/:id', function (req, res) {
  var idAgriculteur = req.params.id;
  connection.query('SELECT agriculteur.id, agriculteur.nom, agriculteur.prenom, agriculteur.telephone, gaec.nom_gaec AS Gaec FROM agriculteur, gaec WHERE agriculteur.gaec_id = gaec.id AND agriculteur.id = ?', [idAgriculteur], function (err, rows, fields) {
    if (err) throw err;
    res.send(rows);
  });
});

//faire une fonction qui va ajouter un agriculteur
app.post('/agriculteur', function (req, res){
  res.setHeader('Access-Control-Allow-Origin', '*');
 // console.log('INSERT INTO agriculteur (nom, prenom, adresse, telephone, gaec_id, pret_id) VALUES("'+ req.body.nom +'","'+ req.body.prenom + '","' + req.body.adresse +'","'+ req.body.telephone +'",'+ req.body.gaec_id+','+req.body.pret_id+')');
  connection.query('INSERT INTO agriculteur (nom, prenom, adresse, telephone, gaec_id, pret_id) VALUES("'+ req.body.nom +'","'+ req.body.prenom + '","' + req.body.adresse +'","'+ req.body.telephone +'",'+ req.body.gaec_id+','+req.body.pret_id+')', function (error, results, fields){
req.body.id = results.insertId;
res.send(req.body);

  });

 
  // var bodyAgriculteur = req.body
  // connection.query('insert into agriculteur (nom, prenom, adresse, telephone, gaec_id, pret_id) values ?, ?' , [bodyAgriculteur.nom], [bodyAgriculteur.prenom] function (err, rows, fields){
  //   if (err) throw err;
  //   console.log("ok");
  // });

    


  //connexion.query(insert into )
});






//Fermeture de la connection à la BDD
//connection.end();

app.listen(3000, function () {
  console.log('Back-end app working on port 3000!');
})