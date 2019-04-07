'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    const res = await this.app.mysql.query('select * from users;');
    console.log('res', res);
    ctx.body = 'hi, egg';
  }

  async test() {
    this.ctx.body = 'test';
  }
}

module.exports = HomeController;
