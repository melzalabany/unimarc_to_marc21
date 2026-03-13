#migrate binary unimarc to xml 
yaz-marcdump -i marc -o marcxml unimarc.mrc > unimarc.xml

#migrate the unimarc xml to marc21 xml
xsltproc -o output_marc21.xml converttomarc21.xsl your_input_file.xml

# Install the toolkit brew install yaz 
# Convert XML to Binary MARC21 using Marc edit
