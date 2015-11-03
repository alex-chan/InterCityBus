express = require 'express'

model =  require '../lib/model'

router = express.Router()

config = null

require('./local/passport').setup(model.User, config)

router.use 'local', require('./local')

module.exports = router