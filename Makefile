TARGET=slides

all:
	pdflatex -file-line-error $(TARGET)

bib:
	-for i in 1; do \
		bibtex $(TARGET); \
		pdflatex -interaction nonstopmode $(TARGET) > /dev/null; \
	done

clean:
	rm \
            $(TARGET).aux \
            $(TARGET).bbl \
            $(TARGET).blg \
            $(TARGET).log \
			$(TARGET).nav \
			$(TARGET).out \
			$(TARGET).snm \
			$(TARGET).toc

spell:
	aspell --lang=en --mode=tex check $(TARGET).tex
