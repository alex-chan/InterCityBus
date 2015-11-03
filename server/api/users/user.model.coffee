
crypto = require "crypto"

validatePresenceOf = (value)->
    return value && value.length

module.exports = (sequelize, DataType)->

    User = sequelize.define '_user',
        id:
            type: DataType.INTEGER
            allowNull: false
            autoIncrement: true
            primaryKey: true

        name: DataType.STRING

        phoneNumber: DataType.STRING

        email:
            type: DataType.STRING
            unique:
                msg: '这个email已经被使用'
            validate:
                isEmail: true

        role:
            type:   DataType.STRING
            defaultValue: 'user'

        password:
            type:   DataType.STRING
            validate:
                notEmpty: true

        provier:    DataType.STRING
        salt:   DataType.STRING

        regIP:  DataType.STRING
    ,
        getterMethods:
            profile: ->
                name: this.name
                role: this.role

            token: ->
                id: this.id
                role: this.role



        hooks:
            beforeBulkCreate: (users, fields, fn)->
                totalUpdated = 0
                users.forEach (user)->
                    return fn(err) if err
                    totalUpdated += 1
                    return fn() if totalUpdated == users.length

            beforeCreate: (user, fields, fn )->
                user.updatePassword fn

            beforeUpdate: (user,fields, fn)->
                return user.updatePassword fn if user.changed 'password'
                fn()

        instanceMethods:
            ###
               * Authenticate - check if the passwords are the same
               *
               * @param {String} password
               * @param {Function} callback
               * @return {Boolean}
               * @api public
            ###
            authenticate: (password, callback)->
                return this.password == this.encryptPassword password if !callback
                self = this
                this.encryptPassword password, (err, pswGen)->
                    callback err if err
                    if self.password == pswGen
                        callback null, true
                    else
                        callback null , false

            ###
               * Make salt
               *
               * @param {Number} byteSize Optional salt byte size, default to 16
               * @param {Function} callback
               * @return {String}
               * @api public
            ###
            makeSalt: (byteSize, callback)->
                defaultByteSize = 16
                if typeof arguments[0] == 'function'
                    callback = arguments[0]
                    byteSize = defaultByteSize
                else if typeof arguments[1] == 'function'
                    callback = arguments[1]

                byteSize = defaultByteSize if !byteSize

                return crypto.randomBytes(byteSize).toString('base64') if !callback
                crypto.randomBytes(byteSize, (err, salt)->
                    callback err if err
                    callback null, salt.toString('base64')
                )

            ###
            * Encrypt password
            *
            * @param {String} password
            * @param {Function} callback
            * @return {String}
            * @api public
            ###

            encryptPassword: (password, callback)->
                if !password || !this.salt
                    return null if !callback
                    return callback null

                defaultIterations = 10001
                defaultKeyLength = 64
                salt = new Buffer(this.salt, 'base64')

                return crypto.pbkdf2Sync(password, salt, defaultIterations, defaultKeyLength).toString('base64') if !callback

                crypto.pbkdf2Sync(password, salt, defaultIterations, defaultKeyLength, (err,key)->
                    callback err if err
                    callback null, key.toString('base64')
                )



            ###
               * Update password field
               *
               * @param {Function} fn
               * @return {String}
               * @api public
            ###
            updatePassword: (fn)->
                # Handle new/update passwords
                if this.password
                    return fn( new Error('Invalid password') ) if !validatePresenceOf(this.password)


                    # Make salt with a callback
                    self = this
                    this.makeSalt (saltErr, salt)->
                        #TODO: I feel I should return fn(saltErr) if saltErr
                        return fn(saltErr) if saltErr

                        self.salt = salt
                        self.encryptPassword self.password, (encryptErr, hashedPassword)->
                            return fn encryptErr if encryptErr
                            self.password = hashedPassword
                            fn null

                else
                    fn null
                    

    return User