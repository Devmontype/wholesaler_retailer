const { Sequelize, DataTypes, Model } = require('sequelize');

module.exports = function (sequelize) {
    class Wholesaler extends Model { }

    Wholesaler.init({
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
        modelName: 'Wholesaler',
        tableName: 'wholesaler'
    });

    return Wholesaler;
}
