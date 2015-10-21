express = require "express"

router = express.Router()


apiRouter = require("../api")(router)

#router.all "/*", (req, res, next)->
#
#    # TODO: use config path
#    res.sendFile  path.join(config.root , 'client/app/admin/index.html' )


#router.all("/*")
#    .get (req,res)->
#
#        console.log(  path.resolve( app.get('appRoot') + '/client/admin/index.html' ) )
#
#        res.sendFile( path.resolve( app.get('appRoot') + '/client/admin/index.html' )  )

module.exports = apiRouter