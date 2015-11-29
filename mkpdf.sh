cp header.html report.html
pandoc README.md >> report.html
cat footer.html >> report.html
wkhtmltopdf report.html report.pdf 
