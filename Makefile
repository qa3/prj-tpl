init:
	mkdir -p src/css dist/fonts dist/css src/js dist/js

clean:
	rm -rf node_modules/ bower_components

pkgji: package.json
	make pkgj && npm i

glp: gulpfile.ls
	lsc -c gulpfile.ls

pkgj:
	lsc -c package.json.ls
