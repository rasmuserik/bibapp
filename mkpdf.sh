cp header.html bibapp.html 
pandoc README.md >> bibapp.html
cat footer.html >> bibapp.html
wkhtmltopdf bibapp.html bibapp.pdf 
