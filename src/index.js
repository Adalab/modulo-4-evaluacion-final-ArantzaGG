const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
require('dotenv').config();

const server = express();
server.use(cors());
server.use(express.json());

const serverPort = 1212;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

// conexion con la BD
async function getConnection() {
  const connection = await mysql.createConnection({
    host: process.env.HOST,
    user: process.env.DBUSER,
    password: process.env.PASS,
    database: process.env.DATABASE,
  });
  await connection.connect();
  console.log(
    `Conexión establecida con la base de datos (identificador=${connection.threadId})`
  );

  return connection;
}

//endpoint para mostrar todos los elementos
server.get('/characters', async (req, res) => {
  const connection = await getConnection();
  const query = 'SELECT * FROM characters';
  const [results, fields] = await connection.query(query);
  console.log(results.length);
  const numOfElements = results.length;
  connection.end();
  res.json({ info: { count: numOfElements }, results: results });
});
//endpoint para mostrar un único elemento con un id específico
server.get('/characters/:id', async (req, res) => {
  const connection = await getConnection();
  const recetaID = req.params.id;
  console.log(req.params);
  const query = 'SELECT * FROM characters WHERE idcharacters = ?';
  const [results] = await connection.query(query, [recetaID]);
  connection.end();
  res.json(results);
});

//endpoint para agregar un elemento nuevo con valores específicos
server.post('/characters', async (req, res) => {
  try {
    const connection = await getConnection();
    const query =
      'INSERT INTO characters (race, class, char_name, spec, kingdom, faction) VALUES (?,?,?,?,?,?);';

    const [results] = await connection.query(query, [
      req.body.race,
      req.body.class,
      req.body.char_name,
      req.body.spec,
      req.body.kingdom,
      req.body.faction,
    ]);
    console.log(results);
    console.log(results.insertId);
    connection.end();
    res.json({
      success: true,
      id: results.insertId,
    });
  } catch (error) {
    res.json({
      success: false,
      message:
        'Compruba que ningún campo este vacío o inténtalo de nuevo más tarde',
    });
  }
});

//endpoint para hacer cambios en un elemento específico
server.put('/characters/:id', async (req, res) => {
  try {
    const connection = await getConnection();
    const charID = req.params.id;
    console.log(req.params);
    const query =
      'UPDATE characters SET race = ?, class = ?, char_name = ?, spec = ?, kingdom = ?, faction = ? WHERE idcharacters = ?;';
    const [results] = await connection.query(query, [
      req.body.race,
      req.body.class,
      req.body.char_name,
      req.body.spec,
      req.body.kingdom,
      req.body.faction,
      charID,
    ]);
    connection.end();
    res.json({
      success: true,
    });
  } catch (error) {
    res.json({
      success: false,
      message:
        'Compruba que ningún campo este vacío o inténtalo de nuevo más tarde',
    });
  }
});

//endpoint para eliminar un elemento específico
server.delete('/characters/:id', async (req, res) => {
  try {
    const connection = await getConnection();
    const recetaID = req.params.id;

    const query = 'DELETE FROM characters WHERE idcharacters = ?';
    const [results] = await connection.query(query, [recetaID]);
    connection.end();
    console.log(results);
    res.json({
      success: true,
    });
  } catch (error) {
    res.json({
      success: false,
      message: 'No es posible eliminar tu personaje',
    });
  }
});

//endpoint para mostrar todos los usuarios

server.get('/users', async (req, res) => {
  const connection = await getConnection();
  const query = 'SELECT * FROM users';
  const [results, fields] = await connection.query(query);
  console.log(results.length);
  const numOfElements = results.length;
  connection.end();
  res.json({ info: { count: numOfElements }, results: results });
});

//endpoint para registrar un nuevo usuario

server.post('/users', async (req, res) => {
  try {
    const connection = await getConnection();
    const query =
      'INSERT INTO users (user_name, email, password) VALUES (?,?,?);';

    const [results] = await connection.query(query, [
      req.body.user_name,
      req.body.email,
      req.body.password,
      
    ]);
    console.log(results);
    console.log(results.insertId);
    connection.end();
    res.json({
      success: true,
      id: results.insertId,
    });
  } catch (error) {
    res.json({
      success: false,
      message:
        'Compruba que ningún campo este vacío o inténtalo de nuevo más tarde',
    });
  }
});