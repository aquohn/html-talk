BIN := ${CURDIR}/node_modules/.bin

.PHONY: all clean

all: index.html css/scss/djs.css css/node_modules/reveal.js/css/print/pdf.css css/node_modules/reveal.js/css/print/paper.css

clean:
	rm -f index.html js/mj-plugin/*.js `find css -name '*.css'`

index.html: slides.pug layout.pug js/mj-plugin/fragments.js
	"${CURDIR}/bin/compile"

css/%.css: %.scss
	"${BIN}/sass" -q -I . $< $@

js/mj-plugin/%.js: js/mj-plugin/%.js.tpl
	"${CURDIR}/bin/template" --dirname="${CURDIR}/$(dir $@)" $< $@
