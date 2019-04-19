'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    console.log('params:', ctx.request.body);
    console.log('params:', ctx.query);
    const { projectName = 'Linux Project' } = ctx.query;
    console.log('pname', projectName);
    // const res = await this.app.mysql.query('select * from employee;');
    try {
      const res = await this.app.mysql.query(
        `SELECT DISTINCT ENAME FROM employee WHERE ESSN IN (SELECT DISTINCT ESSN FROM works_on NATURAL JOIN project WHERE PNAME = "${projectName}");`
      );
      const res2 = await this.app.mysql.query('insert into employee (ENAME, ESSN, ADDRESS, SALARY) values (\'test\',\'00050\',\'earth\',\'100\' );');
      console.log('error test', res2);
      ctx.body = res.map(x => x.ENAME);
    } catch (e) {
      ctx.body = e.sqlMessage;
    }
  }


  async test() {
    this.ctx.body = 'test';
  }
}

module.exports = HomeController;
