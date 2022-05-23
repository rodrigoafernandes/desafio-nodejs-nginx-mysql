const db = require('./db');
const config = require('../config');

async function getAll() {
  const rows = await db.query('SELECT name FROM people')

  if (!rows) {
      return [];
  }
  return rows;
}

async function insert() {
  var names = Array('Pedro', 'Rodrigo', 'Wesley', 'Thiago', 'Luiz', 'Vinicius')
  const randomName = names[Math.floor(Math.random()*names.length)];
  const result = await db.query(`INSERT INTO people(name) VALUES ('${randomName}')`)

  if (result.affectedRows) {
    console.log(`Usuário ${randomName} registrado na visita ao app`);
  }
}

module.exports = {
  getAll,
  insert
}