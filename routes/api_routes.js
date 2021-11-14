const express=require('express');

const route=express.Router();
const wh_retailer_paths=require('../controllers/wh_retailer');



route.get('/', function (req, res) {
    res.status(200);
    res.json({ success:true,message: 'Thanks for visit',error:{} })
})

route.get('/wholesalers',wh_retailer_paths.all_Wholesaler_list);
route.get('/retailers',wh_retailer_paths.all_retailer_list);
route.get('/wholesaler/:id',wh_retailer_paths.fetch_wholesaler);
route.get('/retailer_single_wholesaler',wh_retailer_paths.single_wholesaler_retailer)
route.get('/monthly_turnover',wh_retailer_paths.monthly_turnover)
route.get('/max_turnover_from_retailers',wh_retailer_paths.turnover_from_retailer)


module.exports={route};