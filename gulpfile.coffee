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
    .pipe g.dest './dist/'
    # キレイに整形するならコメントインする
    .pipe gif(prty, $.prettify())
    # minifyするならコメントインする　オプションなしがdefault
    # minifyHTML: All options are false by default.
    # .pipe minifyHTML(comments: true, spare: true)
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
g.task "scripts", ->
  g.src "src/js/*.coffee"
  .pipe $.cached(scripts)
  .pipe $.coffeelint()
  .pipe $.coffeelint.reporter()
  .pipe bs()
  .pipe $.coffee()
  .pipe $.uglify()
  .pipe g.dest "dist/js"


# coffee
g.task "cl", ->
  g.src '/src/js/*.coffee'
  .pipe $.cached(cl)
  .pipe $.coffeelint()
  .pipe $.coffeelint.reporter()

# styledocco
g.task "docco", ->
  g.src ''
  .pipe $.styledocco
    out: './dist/sg'
    name: 'StyleGuide'

  .pipe g.dest "dist/styleguide"

g.task "pls", ->
  g.src '/src/css/style.css'
  .pipe pls()
  .pipe g.dest '/dist/css/'


#-------------------
# cmd task
#-------------------


g.task "build", ->

g.task "default", ->
   "tmpls"


