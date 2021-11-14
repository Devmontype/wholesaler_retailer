const { Sequelize, DataTypes, Model } = require('sequelize');

const wholesaler_model=require('./wholesaler')
const retailer_model=require('./retailer')

module.exports = function (sequelize) {
    class Stock extends Model { }

    Stock.init({
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        wholesaler_id: {
            type: DataTypes.INTEGER,
        },
        retailer_id: {
            type: DataTypes.INTEGER,
        },
        stock_amount:{
            type:DataTypes.DECIMAL(10,3)
        },
        date:{
            type:DataTypes.BIGINT
        }
    }, {
        sequelize,
        modelName: 'Stock',
        tableName: 'stock'
    });

    

    return Stock;
}
