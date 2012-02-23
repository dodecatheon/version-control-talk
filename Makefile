all:	vctalk.html

vctalk.html:	vctalk.md
	pandoc -s --webtex \
		--offline \
		-t slidy \
		$< -o $@
