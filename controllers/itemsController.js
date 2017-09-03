const itemDB = require('../models/itemDB');

module.exports = {

    index(req, res, next) {
    itemDB.findAll()
      .then((items) => {
        console.log(items)
        res.locals.items = items;
        next();
      })
      .catch(err => {
        console.log(err)
        next(err)
      });
  },

    getOne(req, res, next) {
    itemDB.findById(req.params.id)
      .then((item) => {
        console.log(item);
        res.locals.item = item;
        next();
      })
      .catch(err => next(err));
  },

    create(req, res, next) {
    itemDB.save(req.body)
      .then((item) => {
        res.locals.item = item;
        next();
      })
      .catch(err => next(err));
  },

    update(req, res, next) {
    console.log(req.body, 'update controller');
    itemDB.update(req.body)
      .then((item) => {
        res.locals.item = item;
        next();
      })
      .catch(err => next(err));
  },

    destroy(req, res, next) {
    itemDB.destroy(req.params.id)
      .then(() => next())
      .catch(err => next(err));
  },

    showItemForm: (req, res) => {
    res.json({
      message: 'I’m the HTML form for new food items. I post to /items',
    });
  },

};

