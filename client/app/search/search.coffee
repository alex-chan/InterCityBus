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

            console.log 'fix it'


            lineName =  $(".line_name")

            w1 = $("ul[class='start']").width()
            w2 = $("ul[class='end']").width()

            console.log 'sb'+ (w1+w2)
            console.log 'sb2' + ($("ul[class='start']").width()+$("ul[class='end']").width())

            lineName.css("min-width",w1+w2)

            console.log "linname min width:" + lineName.css("min-width")

            return

            w = lineName.width()



            if( w1+w2 > w )


                $("ul[class='end']").width(w2).css("right", -(w1+w2-w) )
                $(".white_bg_right").css("right",-(w1+w2-w) );


                lineName
                .height("9.4rem")
                .css("margin-top",0)
                .css("overflow-x","auto")
                .css("overflow-y","hidden")


                lineName.children().each (index, item)->
                    $(item).css("margin-top","1.1rem")
            else

                $("ul[class='end']").width('').css('right','')
                $(".white_bg_right").css("right",'' );


                lineName
                .css("margin-top",'')
                .css("overflow-x",'')
                .css("overflow-y",'')

                lineName.children().each (index, item)->
                    $(item).css("margin-top","")




