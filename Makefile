init:
	mkdir -p src/css dist/fonts dist/css src/js dist/js

clean:
	"rm -rf node_modules/ bower_components"

bower:
	cp bower_components/jquery/dist/jquery.min.js dist/js

pkgji: package.json
	make pkgj && npm i

glp: gulpfile.ls
	lsc -c gulpfile.ls

pkgj:
	lsc -c package.json.ls
