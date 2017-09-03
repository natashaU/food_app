const pgp = require('pg-promise')({
  query(e) {
    console.log(e.query);
  },
});
const dbConfig = require('../config/dbConfig');

const db = pgp(dbConfig);

module.exports = {

  /*findAll() {
    return db.any(`
      SELECT * FROM food
    `)
  }, */

  findAll() {
    return db.many(`
      SELECT food.id, food.name, food.img_url, food.review, diet.diet_name
        FROM food INNER JOIN diet
        ON food.diet_id = diet.id
    ORDER BY id
    `);
  },

    findDiet(filter) {
    return db.many(`
      SELECT food.id, food.name, food.img_url, food.review, diet.diet_name
        FROM food INNER JOIN diet
        ON food.diet_id = diet.id
        WHERE diet.diet_name = $/diet_name/
    ORDER BY id
    `, filter);
  },

  findById(id) {
    return db.one(`
      SELECT food.id, date_created, food.name, review, img_url, diet.diet_name
        FROM food INNER JOIN diet
        ON food.diet_id = diet.id
      WHERE food.id = $1;
    `, id);
  },

  save(item) {
    console.log(item);
    item.diet_id = Number.parseInt(item.diet_id, 10);
    return db.one(`
      INSERT INTO food
      (name, img_url, review, diet_id)

      VALUES
      ($/name/, $/img_url/, $/review/, $/diet_id/)
      RETURNING *
    `, item);
  },


/*update(item) {
    item.diet_id = Number.parseInt(item.diet_id, 10);
    item.id = Number.parseInt(item.id, 10);
    return db.one(`
      INSERT INTO food
      (name, img_url, review, diet_id)
      VALUES
      ($/name/, $/img_url/, $/review/, $/diet_id/)
      WHERE food.id = $/id/
      RETURNING *
    `, item);
  }, */

  update(item) {
    return db.one(`
      UPDATE food
      SET
      name = $/name/,
      img_url = $/img_url/,
      review = $/review/,
      diet_id = $/diet_id/
      WHERE id = $/id/
      RETURNING *
    `, item);
  },

  destroy(id) {
    return db.none(`
      DELETE
        FROM food
       WHERE id = $1
    `, id);
  },
};


