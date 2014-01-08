browser = chromium-browser

gen:
	markdown -o ../output/
	ruby postprocessor.rb

open:
	$(browser) ../output/index.html  &

all: gen open

