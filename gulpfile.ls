require! {
  gulp
  'gulp-livescript': ls
}

# $ = require("gulp-load-plugins")(
#   pattern: ["gulp-*", "gulp.*"]
#   replaceString: /\bgulp[\-.]/
# )

t = gulp~task
src = g~src
dest = gulp~dest

$ = (require 'gulp-load-plugins') {
  pattern: ['gulp-*', 'gulp.*']
  replaceString: //\bgulp[\-.]//
}

t 'task', ->
  g.src './lib/*.js'
