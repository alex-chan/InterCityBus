angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('search', {
            url: '/search?start&end', #http://stackoverflow.com/questions/20461714/query-string-parameter-in-ui-router-urls
            templateUrl: 'app/search/search.html',
            controller: 'SearchController'

        })


angular.module('InterCityBus.services')
.factory 'Utils', ->
    return {} =
        fixTooLongIssue: ->
            lineName =  $(".line_name")

            w1 = $("ul[class='start']").width()
            w2 = $("ul[class='end']").width()

            w = lineName.width()
            if( w1+w2 > w )

                console.log 'ok fix it'

                $("ul[class='end']").width(w2)

                $("ul[class='end']").css("right", -(w1+w2-w) )


                lineName.css("max-width", w)
                .height("9.4rem")
                .css("margin-top",0)
                .css("overflow-x","auto")
                .css("overflow-y","hidden")

                $(".white_bg_right").css("right",-(w1+w2-w) );

                lineName.children().each (index, item)->
                    $(item).css("margin-top","1.1rem")


