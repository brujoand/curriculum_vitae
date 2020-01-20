all: resume.html resume.pdf resume.docx resume.txt resume.zip

resume.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o resume.html resume.md

resume.pdf: resume.html
	weasyprint -s style.css resume.html resume.pdf

resume.docx: resume.md
	pandoc --from markdown --to docx -o resume.docx resume.md

resume.txt: resume.md
	pandoc --standalone --smart --from markdown --to plain -o resume.txt resume.md

resume.zip: resume.md
	zip resume.zip resume.pdf resume.txt resume.docx

clean:
	rm -rf resume.{pdf,txt,docx,zip}

