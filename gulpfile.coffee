g = require "gulp"
$ = require("gulp-load-plugins")(
  pattern: ["gulp-*", "gulp.*"]
  replaceString: /\bgulp[\-.]/
)

ps = require 'psi'
bs  = require 'browser-sync'

#browser-sync
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

#pagespeed
gulp.task 'ps', ps.bind(null,
  url: 'https://example.com'
  strategy: 'mobile')


#-------------------
# cmd task
#-------------------

g.task "build", ->

g.task "default", ->
   "tmpls"


