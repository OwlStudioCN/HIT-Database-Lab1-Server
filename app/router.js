'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.post('/api', controller.home.api);
  router.post('/employee', controller.home.insertEmployee);
  router.patch('/employee', controller.home.alterEmployee);
  router.delete('/employee', controller.home.deleteEmployee);
  router.get('/employee', controller.home.getEmployee);

  router.post('/queryNest', controller.home.queryNest);
  router.post('/queryJoin', controller.home.queryJoin);
  router.post('/queryGroup', controller.home.queryGroup);
  router.get('/queryView', controller.home.queryView);

};
