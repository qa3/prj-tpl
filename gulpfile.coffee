g = require "gulp"
$ = require("gulp-load-plugins")(
  pattern: ["gulp-*", "gulp.*"]
  replaceString: /\bgulp[\-.]/
)

bs  = require 'browser-sync'

g.task "bs", ->
  bs
    server:
      baseDir: "./dist"

g.task "tmpl", ->
  g.src 'src/tmpl/*.jade'
    .pipe $.jade()
    .pipe g.dest 'dist'
    .pipe bs.reload(stream: true)

g.task "styles", ->
  g.src "src/css/*.styl"
  .pipe $.cached(styles)
  .pipe $.stylus()
  .pipe g.dest "dist/css"

g.task "css", ->
  g.src "dist/css/*.css"
  .pipe $.cached(css)
  .pipe $.sourcemaps.init()
  .pipe pls(
    browsers: ['last 2 versions']
    cascade: false
    )
  .pipe minifyCSS
    keepBreaks: true
  .pipe g.dest './dist/'


# coffee
g.task "cl", ->
  g.src '/src/js/*.coffee'
  .pipe $.cached(cl)
  .pipe $.coffeelint()
  .pipe $.coffeelint.reporter()

#-------------------
# cmd task
#-------------------

g.task "build", ->

g.task "default", ->
   "tmpls"


