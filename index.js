const express = require('express');
require('dotenv').config({ path: '.env' })

var db = require('./config/db');
var api_paths = require('./routes/api_routes');

const app = express();

const port = process.env.PORT || 3000;



app.use('/', api_paths.route);

app.use('*', function (req, res) {
    res.status(404).json({
        success: 'false',
        message: 'Page not found',
        error: {
            statusCode: 404,
            message: 'You reached a route that is not defined on this server',
        },
    });
});


app.listen(port, function () {
    db.sequlize
        .authenticate()
        .then(async () => {
            db.sequlize.sync({ alter: true });
            console.log('Connection has been established successfully.');
            console.log(`\nServer listening on port ${port} \n visit http://localhost:${port}`);
        })
        .catch(err => {
            console.error('Unable to connect to the database:', err);
            console.log(`\nServer listening on port ${port} \n visit http://localhost:${port}`);
            process.exit(1);
        });

})