const express = require('express');
const controller = require('../controllers/itemsController');
const views = require('../controllers/viewController');

const itemsRouter = express.Router();

itemsRouter.get('/:id/edit', controller.getOne, views.showEditForm, views.show404);

itemsRouter.get('/new', views.showAddForm);

itemsRouter.route('/:id')
  .get(controller.getOne, views.showOne, views.show404)
  .put(controller.update, views.handleUpdate, views.show406)
  .delete(controller.destroy, views.handleDelete, views.show404);


itemsRouter.route('/')
  .get(controller.index, views.showItems, views.show404)
  .post(controller.create, views.handleCreate, views.show406);

module.exports = itemsRouter;
