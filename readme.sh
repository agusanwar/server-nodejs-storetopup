structur folder NODE js
    1. create folder app
        1. folder project
            - model - create model
                const mongoose = require("mongoose");

            - controller -> get model
                const Category = require("./model");


            - router -> get controller
                var express = require('express');
                var router = express.Router();
                const {index, viewCreate} = require('./controller');

                /* GET home page. */
                router.get('/', index);
                router.get('/create', viewCreate);

module.exports = router;

    2. create folder config
        - untuk baca file .env
            serviceName: process.env.SERVICE_NAME,
            urlDb: process.env.MONGO_URL,
    
    3. create folder database untuk connectikan dengan database
        - connecti dengan database mongo
            const mongoose = require('mongoose')
            const { urlDb} = require('../config')
            mongoose
            .connect(urlDb, {
                useNewUrlParser: true,
                useUnifiedTopology: true,
                useUnifiedTopology: true,
                // useCreateIndex: true,
            })
            .then(() => {
                console.log("Connected to DB");
            })
            .catch((err) => {
                console.log(err);
            });
            const db = mongoose.connection;
            module.exports = db;
        - inmport db in folder bin to connect database server
            . add variable db
                const db = require('../db');
            . cek db
                db.on("error", function (err) {
                console.log("connection error: tidak bisa terhubung ke mongoose");
                });

                db.on("open", function () {
                server.listen(port);
                server.on("error", onError);
                server.on("listening", onListening);
                });


    4. connect node js express js dengan database mongodb
        - install ODM mongo db
            npm install mongoose --save

    5. add devedncies 
        - .env ( npm i dotenv) 
            . set up database
            . MODE devlopment
            . SERVICE_NAME

        - nodemon for automatic mode  dev

        - add to github
            - git init in terminal
            - create .gitignore untuk menentukan apa yg tidak akan kita masukan
                node_modules/
                .env
    6. install admin dashboard
        - npm i admin-lte
        - add in app.js
           app.use('admin-lte', express.static(path.join(__dirname, '/node_modules/admin-lte/')));
        - add folder dashboard untuk cenneksikan folder admin di view
            - app/dashboard/
                . controller
                . routeer
            - add router in app.js
                . const dashboardRouter = require('./app/dahboard/router');

