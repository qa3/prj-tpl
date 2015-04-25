require! {
  gulp
  'gulp-livescrpt': ls
}

t = gulp~task
src = g~src
dest = gulp~src

$ = (require 'gulp-load-plugins') {
  pattern: ['gulp-*', 'gulp.*']
  replaceString: //\bgulp[\-.]//
}


t 'lint', ->
  g.src './lib/*.js'
  .pipe $.jshint!
  .pipe $.jshint.reporter!

$ = require("gulp-load-plugins")(
  pattern: ["gulp-*", "gulp.*"]
  replaceString: /\bgulp[\-.]/
)

