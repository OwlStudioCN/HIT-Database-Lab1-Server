'use strict';

/** @type Egg.EggPlugin */
module.exports = {
  // had enabled by egg
  // static: {
  //   enable: true,
  // }
  mysql: {
    enable: true,
    package: 'egg-mysql',
  }
};

/**

 const sequelize = {
  dialect: 'mysql',
  database: 'test',
  host: 'localhost',
  port: '3306',
  username: 'root',
  password: 'password',
};

 */
