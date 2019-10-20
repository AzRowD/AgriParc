//Initialisation express.js
const express = require('express');
const app = express();

var cors = require('cors');
app.use(cors());

//Initialisation BDD MySQL
var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'localhost',
  port: '8889',
  user: 'root3',
  password: '123456',
  database: 'agriparc_db'
});

//Ouvre la connection à la BDD
connection.connect(); 
  

//Affiche la liste du materiel: id, nom, status, Gaec Associée
//GET /listeMateriel
connection.query('SELECT materiel.id, materiel.nom, materiel.statut, gaec.nom_gaec AS Gaec FROM materiel, gaec WHERE materiel.gaec_id = gaec.id', function (err, rows, fields) {
  if (err) throw err;
  //console.log(rows);
  app.get('/listeMateriel', function (req, res) {
    res.send(rows);
  })
});


//Affiche materiel par id : id, nom, status, Gaec Associée
//GET /listeMateriel/:id
app.get('/materiel/:id', function (req, res) {
  var idMateriel = req.params.id;
  connection.query('SELECT materiel.id, materiel.nom, materiel.statut, gaec.nom_gaec AS Gaec FROM materiel, gaec WHERE materiel.gaec_id = gaec.id AND  materiel.id = ?', [idMateriel], function (err, rows, fields) {
    if (err) throw err;
    res.send(rows);
  });
});

//Affiche materiel par nom : id, nom, status, Gaec Associée
//GET /materiel/:nom
app.get('/materiel/:nom', function (req, res) {
  var nomMateriel = "%" + req.params.nom + "%";
  connection.query("SELECT materiel.id, materiel.nom, materiel.statut, gaec.nom_gaec AS Gaec FROM materiel, gaec WHERE materiel.gaec_id = gaec.id AND materiel.nom LIKE ? ", [nomMateriel], function (err, rows, fields) {
    if (err) throw err;
    res.send(rows);
  });
});

//Affiche la liste des agriculteurs: id, nom, prenom, num tel, Gaec Associée
//GET /listeAgriculteurs
connection.query('SELECT agriculteur.id, agriculteur.nom, agriculteur.prenom, agriculteur.telephone, gaec.nom_gaec AS Gaec FROM agriculteur, gaec WHERE agriculteur.gaec_id = gaec.id', function (err, rows, fields) {
  if (err) throw err;
  //console.log(rows);
  app.get('/listeAgriculteurs', function (req, res) {
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





//Fermeture de la connection à la BDD
//connection.end();

app.listen(3000, function () {
  console.log('Back-end app working on port 3000!');
})