all: resume.html resume.pdf resume.docx resume.txt resume.zip

resume.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o output/resume.html resume.md

resume.pdf: resume.html
	wkhtmltopdf --zoom 3 -s Letter output/resume.html resume.pdf

resume.docx: resume.md
	pandoc --from markdown --to docx -o output/resume.docx resume.md

resume.txt: resume.md
	pandoc --standalone --smart --from markdown --to plain -o output/resume.txt resume.md

resume.zip: resume.md
	zip output/resume.zip *.{pdf,txt,docx}

clean:
	rm -rf output/*
