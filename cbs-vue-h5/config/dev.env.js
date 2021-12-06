'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  BASE_API: 'http://192.168.18.108:8082'
})
//后端测试地址
// BASE_API: 'http://192.168.18.108:8082'
//本地测试地址
// BASE_API: 'http://10.20.1.52:8088/prod-api'
