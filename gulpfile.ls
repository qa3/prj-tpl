require! <[ gulp ]>
require!{
	"browser-sync": bs
	"pipe-joint": p
	"sc5-styleguide": sg
	}
site = ''
portVal = 3333

# shorthand
t = gulp~task
s = gulp~src
d = gulp~dest
w = gulp~watch

# path
paths =
	tplSrc: 'src/layouts/**'
	htmlSrc: 'src/lauouts/*.pug'
	stylSrc: 'src/styles/*.styl'
	cssSrc: 'src/styles/*.css'
	sassSrc: 'src/styles/*.scss'
	jsSrc: 'src/scripts/*.js'
	imgSrc: 'src/images/**'


# gulp-load-plugins
$ = require("gulp-load-plugins")(
	pattern: ["gulp-*", "gulp.*"]
	replaceString: /\bgulp[\-.]/
)

t 'pug' -> p [
	s './*.pug'
	$.plumber!
	$.pug {pretty: true}
	# $.htmlmin collapseWhitespace: true
	d './'
]


t 'watch' ->
	w '*.pug', ['pug']

t 'bs-reload', ->
	bs.reload()

t 'bsync', ->
	file = 'index.html'
	bs.init file,
		server: {baseDir: '.'}
		port: 3333


t 'default', ['pug', 'bsync'], ->
	w './*.pug', ['pug']
	w './*.html', ['bs-reload']

