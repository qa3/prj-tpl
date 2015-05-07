require! {
  gulp
  'gulp-livescrpt': ls
}

# $ = require("gulp-load-plugins")(
#   pattern: ["gulp-*", "gulp.*"]
#   replaceString: /\bgulp[\-.]/
# )

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
