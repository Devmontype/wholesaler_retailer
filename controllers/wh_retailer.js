const { Sequelize, QueryTypes } = require('sequelize');

var successResp = require('../helper/success_handler').SuccessResponse;
var errorResp = require('../helper/error_handler').errorResponse;

const wholesaler_model = require('../config/db').wholesaler_model;
const retailer_model = require('../config/db').retailer_model;
const stock_model = require('../config/db').stock_model;
const sequlize = require('../config/db').sequlize;

function all_Wholesaler_list(req, res, next) {
    wholesaler_model.findAll().then(function (data) {
        successResp(res, "list found", 200, data)
    }).catch(function (err) {
        
        errorResp(res, 'Something Wrong', 404, false);
    })
}

function all_retailer_list(req, res, next) {
    retailer_model.findAll().then(function (data) {
        successResp(res, "list found", 200, data)
    }).catch(function (err) {
        
        errorResp(res, 'Something Wrong', 404, false);
    })
}


async function fetch_wholesaler(req, res, next) {
    try {
        let saler_id = req.params.id
        let wholesaler = await wholesaler_model.findAll({
            where: {
                id: saler_id
            },
            attributes: { exclude: ['createdAt', 'updatedAt'] }
        })
        if (wholesaler.length != 0) {
            let retailers = await stock_model.findAll({
                where: { wholesaler_id: saler_id },
                include: [{
                    model: retailer_model,
                    as: "retailer",
                    attributes: { exclude: ['createdAt', 'updatedAt'] }
                }],
                attributes: { exclude: ['stock_amount', 'createdAt', 'updatedAt', 'date', 'retailer_id'] }
            })
            let result = []
            if (retailers.length > 0) {
                await retailers.forEach(function (retail) {
                    result.push(retail.retailer)
                })
                wholesaler = { ...wholesaler[0].dataValues, retailer: result }
            }


        }
        successResp(res, "Details found", 200, wholesaler)
    } catch (err) {
        errorResp(res, "something wrong", 200, err);
    }

}

async function single_wholesaler_retailer(req, res, next) {
    try {
        let result = []
        let retailers = await stock_model.findAll({
            attributes: [
                'retailer_id',
                [Sequelize.literal('COUNT(id)'), 'countOfRetailers'],

            ],
            group: 'retailer_id',
            having: { 'countOfRetailers': 1 }
        })
        

        if(retailers.length!=0){

            await Promise.all(retailers.map(async function(retail){
                let obj = {
                    ...retail.dataValues
                }
                let retail_details=await retailer_model.findOne({
                    where:{id:retail.dataValues.retailer_id},
                    attributes:{exclude:['createdAt','updatedAt']}
                })
                obj['details']=retail_details.dataValues;
                result.push(obj)
            }))
            
        }

        successResp(res, "Details found", 200, result)
    } catch (err) {
        
        errorResp(res, "something wrong", 200, err);
    }
}

async function monthly_turnover(req, res, next) {
    let result = []
    try{
        let wholesales=await wholesaler_model.findAll();
        if(wholesales.length!=0){
            await Promise.all(wholesales.map(async function (x) {
                let obj = {
                    ...x.dataValues
                }
                let amounts = await sequlize.query(`SELECT SUM(s1.stock_amount) AS total,s1.sale_month_name as month FROM (SELECT FROM_UNIXTIME(DATE / 1000, '%Y') AS sale_year,FROM_UNIXTIME(DATE / 1000, '%c') AS sale_month,FROM_UNIXTIME(DATE / 1000, '%M') AS sale_month_name,stock_amount FROM stock WHERE wholesaler_id = ? ) AS s1 GROUP BY s1.sale_month`,
                    { replacements: [x.dataValues.id,], type: QueryTypes.SELECT })
                obj['amounts'] = amounts
                result.push(obj)

            }))
        }
        successResp(res, "Details found", 200, result)
    }catch(err){
        
        errorResp(res, "something wrong", 200, err);
    }
}

async function turnover_from_retailer(req, res, next) {
    try {
        let result = []
        let wholesales = await wholesaler_model.findAll();
        if (wholesales.length != 0) {
            await Promise.all(wholesales.map(async function (y) {
                let obj = {
                    ...y.dataValues
                }
                let retailers = await sequlize.query(`SELECT name,mobile_number,max_turn from retailer INNER JOIN (SELECT SUM(stock_amount) AS max_turn,retailer_id FROM stock WHERE wholesaler_id = ? GROUP BY retailer_id) as s1 ON(s1.retailer_id=retailer.id)`,
                    { replacements: [y.dataValues.id,], type: QueryTypes.SELECT })
                obj['retailers'] = retailers
                result.push(obj)
            }))
        }
        successResp(res, "Details found", 200, result)
    } catch (err) {
        
        errorResp(res, "something wrong", 200, err);
    }
}

module.exports = {
    all_Wholesaler_list,
    all_retailer_list,
    fetch_wholesaler,
    single_wholesaler_retailer,
    monthly_turnover,
    turnover_from_retailer
}