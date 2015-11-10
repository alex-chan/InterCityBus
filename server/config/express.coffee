config = require "./config"

express = require "express"


path = require('path')
favicon = require('serve-favicon');
logger = require('morgan');
cookieParser = require('cookie-parser');
bodyParser = require('body-parser');

routes = require('../routes/index');
users = require('../routes/users');
admin = require('../routes/admin');


config = require("./config");


module.exports = (app)->



    # view engine setup
    app.set('views', path.join(__dirname, '../views'));
    app.set('view engine', 'ejs');


    app.set("appRoot", config.root)



    # uncomment after placing your favicon in /public
    # app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
    app.use(logger('dev'));
    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(cookieParser());
    app.use(require('less-middleware')(path.join(app.get("appRoot"), 'client', )))
    app.use(express.static(path.join(app.get("appRoot"), 'client')) )


    app.use('/users', users);
    app.use('/admin', admin);
    app.use('/api', require("../routes/api"))
    app.use('/auth', require("../auth"))
    app.use('/', routes);


    # catch 404 and forward to error handler
    app.use (req, res, next)->
        err = new Error('Not Found')
        err.status = 404
        next(err)


    # error handlers

    # development error handler
    # will print stacktrace
    if (app.get('env') == 'development')
        app.use (err, req, res, next)->
            res.status(err.status || 500)
            res.render 'error',
                message: err.message
                error: err


    # production error handler
    # no stacktraces leaked to user
    app.use (err, req, res, next)->
        res.status(err.status || 500)
        res.render 'error',
            message: err.message
            error: {}




