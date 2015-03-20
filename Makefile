.PHONY: update

extension.zip:	extension/e.js extension/manifest.json
	rm -f $@
	7z -mx=9 a $@ extension

extension/e.js: e.js
	closure --compilation_level ADVANCED_OPTIMIZATIONS --js e.js|tr \\n ' '|sed -r 's/(data-c)licked|(a)uto_enlarge/\1\2/g' > $@

extension/manifest.json:	manifest.json
	cat manifest.json | tr '\n' ' '|sed -r 's/([\{\},:\["]|\])\s+/\1/g' > $@

clean:
	rm -f extension{.zip,/{t.js,manifest.json}}
