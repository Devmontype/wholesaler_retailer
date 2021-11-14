const { Sequelize, DataTypes, Model } = require('sequelize');




module.exports = function (sequelize) {
    class Retailer extends Model { }

    Retailer.init({
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING,
        },
        mobile_number: {
            type: DataTypes.STRING,
        }
    }, {
        sequelize,
        modelName: 'Retailer',
        tableName: 'retailer'
    });

    return Retailer;
}
