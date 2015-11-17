gulp = require('gulp')
ngmin = require("gulp-ngmin")
concat = require("gulp-concat")
uglify = require("gulp-uglify")
rename = require("gulp-rename")

gulp.task 'default', ()->
    # place code for your default task here

    gulp.src( ["client/app/**/*.js",'!client/app/admin/**/*.js'])
        .pipe ngmin()
        .pipe concat("sb.js")
        .pipe gulp.dest("dest")
        .pipe uglify()
        .pipe rename
            extname: ".min.js"
        .pipe gulp.dest("dest")



