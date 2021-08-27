# goaccess
Here, you could copy nginx logs from a remote server and run the goaccess in docker mode through bash script towards generate a html file.

To access with Apache... 
```
docker run -d --name goaccess -p 8082:80 -v $home/goaccess/:/usr/local/apache2/htdocs/ httpd:2.4
```
