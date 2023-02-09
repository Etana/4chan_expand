.PHONY: update

extension.zip:	extension/e.js extension/manifest.json
	rm -f $@
	7z -mx=9 a $@ extension

extension/e.js:	e.js
	cat e.js|tr \\n ' '|sed -r 's/(data-c)licked|(a)uto_enlarge/\1\2/g;s/\s*([^a-z])\s+|\s+([^a-z])\s*/\1\2/g' > $@

extension/manifest.json:	manifest.json
	cat manifest.json | tr '\n' ' '|sed -r 's/([\{\},:\["]|\])\s+/\1/g' > $@

clean:
	rm -f extension{.zip,/{e.js,manifest.json}}
