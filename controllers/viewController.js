module.exports = {

  show404(err, req, res, next) {
    res.sendStatus(404);
  },



  show406(err, req, res, next) {
    res.sendStatus(406);
  },


  showItems(req, res) {
    res.render('items/item-index', {
      data: res.locals.items,
    });
  },


  showOne(req, res) {
    res.render('items/item-single', {
      data: res.locals.item,
    });
  },

  showAddForm(req, res) {
    res.render('items/item-add');
  },

  showEditForm(req, res) {
    res.render('items/item-edit', {
      data: res.locals.item,
    });
  },

  /*handleCreate(req, res) {
    res.redirect('/items');
  }, */

handleCreate(req, res) {
    res.redirect('/');
  },

  handleUpdate(req, res) {
    res.redirect(`/items/${req.params.id}`);
  },

  /*handleDelete(req, res) {
    res.redirect('/items');
  }, */

  handleDelete(req, res) {
    res.redirect('/');
  },


}

