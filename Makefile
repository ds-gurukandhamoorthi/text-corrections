.PHONY: all

CORRECTIONS=$(shell ls *.diff)
HTMLS=$(subst .diff,.html,$(CORRECTIONS))
MSGS=$(subst .diff,.msg,$(CORRECTIONS))

LAST_CORRECTION=$(shell ls -1t *.diff |head -1)
LAST_MSG=$(subst .diff,.msg,$(LAST_CORRECTION))

.PHONY: all

all: index.html $(HTMLS) $(MSGS)

%.html : %.diff
	pygmentize -f html -O full -o $@ $^

%.msg : %.diff
	/home/guru/beautify-text-corrections/beautify.py $^ $@

index.html : gen-index.sh $(HTMLS)
	./gen-index.sh > $@


copy : $(LAST_CORRECTION)
	cat $(LAST_MSG) | xclip -sel clip

