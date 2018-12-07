.PHONY: all

CORRECTIONS=$(shell ls *.diff)
HTMLS=$(subst .diff,.html,$(CORRECTIONS))
MSGS=$(subst .diff,.msg,$(CORRECTIONS))
INLINE_HTMLS=$(subst .diff,_inline.html,$(CORRECTIONS))

LAST_CORRECTION=$(shell ls -1t *.diff |head -1)
LAST_MSG=$(subst .diff,.msg,$(LAST_CORRECTION))

.PHONY: all

all: index.html $(HTMLS) $(MSGS) $(INLINE_HTMLS)

%.html : %.diff
	pygmentize -f html -O full -o $@ $^

%_inline.html : %.diff /home/guru/beautify-text-corrections/beautify.py
	/home/guru/beautify-text-corrections/beautify.py $< $@

%.msg : %.diff /home/guru/beautify-text-corrections/beautify.py
	/home/guru/beautify-text-corrections/beautify.py $< $@

index.html : gen-index.sh $(HTMLS) $(INLINE_HTMLS)
	./gen-index.sh > $@


copy : $(LAST_CORRECTION)
	cat $(LAST_MSG) | xclip -sel clip

