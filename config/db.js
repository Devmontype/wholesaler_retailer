const Sequelize = require('sequelize');
require('dotenv').config({ path: '.env' })

const wholesaler = require('../models/wholesaler');
const retailer = require('../models/retailer');
const stock = require('../models/stock');

const db = {};


var sequlize = new Sequelize(process.env.db_name, process.env.db_username, process.env.db_password, {
    host: process.env.host,
    dialect: 'mysql',
    port: process.env.db_port,
    logging: false
});

db.sequlize = sequlize
db.Sequelize = Sequelize
db.wholesaler_model = wholesaler(sequlize)
db.retailer_model = retailer(sequlize)
db.stock_model = stock(sequlize)

db.stock_model.belongsTo(db.retailer_model, { as: "retailer",foreignKey:"retailer_id"})
db.retailer_model.hasMany(db.stock_model, {
    foreignKey: "id",
    as: "retailers",
});



db.stock_model.belongsTo(db.wholesaler_model, { as: "wholesaler",foreignKey: "wholesaler_id" })
db.wholesaler_model.hasMany(db.stock_model, {
    foreignKey: "id",
    as: "wholesalers",
});
module.exports = db