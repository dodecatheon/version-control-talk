all:	vctalk.html

vctalk.html:	vctalk.md
	pandoc -s --webtex -i -t slidy $< -o $@
