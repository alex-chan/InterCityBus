module.exports =
    up: (queryInterface, Sequelize)->
        # logic for transforming into the new state

        queryInterface.addColumn(
            'hotlines',
            'requestCount',
            {
                type: Sequelize.INTEGER
                defaultValue: 0
            }
        )


    down: (queryInterface, Sequelize)->
            # logic for reverting the changes
