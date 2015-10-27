require!{
	gulp
	"gulp-util":gutil
	"browser-sync": browserSync
	"pipe-joint": p
	}


# shorthand
dest    = gulp~dest
src     = gulp~src
task    = gulp~task
watch   = gulp~watch

# shorthand
t = gulp~task
s = gulp~src
d = gulp~dest
w = gulp~watch

# path
paths =
	tplSrc: 'src/layout/**'
	htmlSrc: 'src/tpl/*.jade'
	jsSrc: 'src/styles/*.js'
	imgSrc: 'src/images/**'
	rootDir: 'dist/'
	imgDir: 'dist/images'


# gulp-load-plugins
$ = require("gulp-load-plugins")(
	pattern: ["gulp-*", "gulp.*"]
	replaceString: /\bgulp[\-.]/
)

t 'jade' -> p [
	s 'src/layout/*.jade'
	$.plumber!
	$.jade {pretty: true}
	d 'dist/'
]

t 'stylus' -> p [
	s 'src/styles/*.styl'
		$.stylus!
		d 'dist/css'
]


t 'ls' -> p [
	s 'src/scripts/*.ls'
	$.livescript bare: true
	d 'dist/js'
]


t 'watch' ->
	w 'src/layout/*.jade', ['jade']
	w 'src/styles/*.styl', ['stylus']
	w 'src/scripts/*.ls', ['ls']

t 'browser-sync', ->
	file = 'index.html'
	browserSync.init file,
		server: {baseDir: 'dist'}
		port: 3333


t 'default', ['jade', 'watch', 'browser-sync']
