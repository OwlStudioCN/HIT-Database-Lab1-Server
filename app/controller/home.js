'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async api() {
    const { ctx } = this;
    console.log('params:', ctx.request.body);
    console.log('params:', ctx.query);
    const { projectName } = ctx.request.body;
    console.log('pname', projectName);
    // const res = await this.app.mysql.query('select * from employee;');
    try {
      const res = await this.app.mysql.query(
        `SELECT DISTINCT ENAME FROM employee WHERE ESSN IN (SELECT DISTINCT ESSN FROM works_on NATURAL JOIN project WHERE PNAME = "${projectName}");`
      );
      // const res2 = await this.app.mysql.query('insert into employee (ENAME, ESSN, ADDRESS, SALARY) values (\'test\',\'00050\',\'earth\',\'100\' );');
      console.log('res', res);
      ctx.body = { result: res.map(x => x.ENAME), success: true };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }
  }

  async getEmployee() {
    const { ctx } = this;
    try {
      const res = await this.app.mysql.query(
        'select * from employee;'
      );
      ctx.body = {
        result: res.map(x => {
          const { ESSN, ENAME, ADDRESS, SALARY } = x;
          return { ESSN, ENAME, ADDRESS, SALARY };
        }), success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }
  }

  async alterEmployee() {
    const { ctx } = this;
    console.log('params:', ctx.request.body);
    const { essn, salary } = ctx.request.body;
    try {
      const sql = `update employee set SALARY=${salary} where ESSN='${essn}';`;
      await this.app.mysql.query(sql);
      const res = await this.app.mysql.query('select * from employee;');
      console.log('res', res);
      ctx.body = {
        result: res.map(x => {
          const { ESSN, ENAME, ADDRESS, SALARY } = x;
          return { ESSN, ENAME, ADDRESS, SALARY };
        }),
        success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }
  }

  async deleteEmployee() {
    const { ctx } = this;
    console.log('params:', ctx.query);
    try {
      const sql = `delete from employee where ESSN='${ctx.query.essn}'`;
      await this.app.mysql.query(sql);
      const res = await this.app.mysql.query('select * from employee;');
      console.log('res');
      ctx.body = {
        result: res.map(x => {
          const { ESSN, ENAME, ADDRESS, SALARY } = x;
          return { ESSN, ENAME, ADDRESS, SALARY };
        }),
        success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }
  }

  async insertEmployee() {
    const { ctx } = this;
    console.log('params:', ctx.request.body);
    const { essn, ename, address, salary } = ctx.request.body;
    // insert employee

    try {
      const sql = `insert into employee (ENAME, ESSN, ADDRESS, SALARY) values ('${ename}', '${essn}', '${address}', '${salary}');`;
      console.log('sql', sql);
      await this.app.mysql.query(sql);
      // const res2 = await this.app.mysql.query('insert into employee (ENAME, ESSN, ADDRESS, SALARY) values (\'test\',\'00050\',\'earth\',\'100\' );');
      const res = await this.app.mysql.query('select * from employee;');
      console.log('res');
      ctx.body = {
        result: res.map(x => {
          const { ESSN, ENAME, ADDRESS, SALARY } = x;
          return { ESSN, ENAME, ADDRESS, SALARY };
        }),
        success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }
  }

  async queryNest() {
    const { ctx } = this;
    console.log('params:', ctx.request.body);
    const { pname } = ctx.request.body;
    // insert employee

    try {
      const sql = `SELECT DISTINCT ENAME
FROM employee
WHERE ESSN IN (
    SELECT DISTINCT ESSN
    FROM works_on
             NATURAL JOIN project
    WHERE PNAME = "${pname}")`;
      console.log('sql', sql);
      const res = await this.app.mysql.query(sql);
      // const res2 = await this.app.mysql.query('insert into employee (ENAME, ESSN, ADDRESS, SALARY) values (\'test\',\'00050\',\'earth\',\'100\' );');
      // const res = await this.app.mysql.query('select * from employee;');
      ctx.body = {
        result: res.map(x => {
          const { ESSN, ENAME, ADDRESS, SALARY } = x;
          return { ENAME };
        }),
        success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }

  }

  async queryJoin() {
    const { ctx } = this;
    console.log('params:', ctx.request.body);
    const { dname } = ctx.request.body;
    // insert employee

    try {
      const sql = `select distinct ENAME, ADDRESS
from employee
         natural join department
where DNAME = "${dname}";`;
      console.log('sql', sql);
      const res = await this.app.mysql.query(sql);
      // const res2 = await this.app.mysql.query('insert into employee (ENAME, ESSN, ADDRESS, SALARY) values (\'test\',\'00050\',\'earth\',\'100\' );');
      // const res = await this.app.mysql.query('select * from employee;');
      ctx.body = {
        result: res.map(x => {
          const { ESSN, ENAME, ADDRESS, SALARY } = x;
          return { ENAME, ADDRESS };
        }),
        success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }

  }

  async queryGroup() {
    const { ctx } = this;
    console.log('params:', ctx.request.body);
    const { projectNumber, hours } = ctx.request.body;
    // insert employee

    try {
      const sql = `SELECT DISTINCT ENAME
FROM employee
         NATURAL JOIN works_on
GROUP BY ESSN
HAVING count(DISTINCT PNO) >= ${projectNumber}
   AND sum(HOURS) <= ${hours};`;
      console.log('sql', sql);
      const res = await this.app.mysql.query(sql);
      // const res2 = await this.app.mysql.query('insert into employee (ENAME, ESSN, ADDRESS, SALARY) values (\'test\',\'00050\',\'earth\',\'100\' );');
      // const res = await this.app.mysql.query('select * from employee;');
      ctx.body = {
        result: res.map(x => {
          const { ESSN, ENAME, ADDRESS, SALARY } = x;
          return { ENAME };
        }),
        success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }

  }

  async queryView() {

    const { ctx } = this;
    try {
      const sql = `select * from average_salary`;
      console.log('sql', sql);
      const res = await this.app.mysql.query(sql);
      // const res2 = await this.app.mysql.query('insert into employee (ENAME, ESSN, ADDRESS, SALARY) values (\'test\',\'00050\',\'earth\',\'100\' );');
      // const res = await this.app.mysql.query('select * from employee;');
      const { AVG, MIN, MAX, COUNT, sum } = res[0];
      console.log({ AVG, MIN, MAX, COUNT, sum });
      ctx.body = {
        result: [{ AVG, MIN, MAX, COUNT, sum }],
        success: true,
      };
    } catch (e) {
      ctx.body = { success: false, error: e.sqlMessage };
    }

  }

  async index() {
    this.ctx.body = 'hello!';
  }
}

module.exports = HomeController;
