docker run --rm -it -p 8787:8787 \
    -e PASSWORD=password \
    -e USERID=$(id -u) \
    -e GROUPID=$(id -g) \
    rstudio
