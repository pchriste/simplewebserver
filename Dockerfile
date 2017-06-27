## Simple webserver container
# Using RHEL 7 base image and Apache Web server
# Version 1

# Pull the rhel image from the local repository
FROM rhel7:latest
MAINTAINER <admin@acme.com>

# BUILD COMMAND= docker build -t simpleweb . #
### Add Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels#####
LABEL name="acme/webserver" \
      vendor="Acme Inc" \
      version="1.0" \
      release="1" \
      summary="Acme Corp's Starter app" \
      description="Starter app will do ....." \
      run='docker run -d -p 8080:80 --name=mysimple acme/simpleweb'

# Update and install the application
#RUN yum update -y
RUN yum install httpd -y

RUN echo "This container image was build on:" > /var/www/html/index.html
RUN date >> /var/www/html/index.html
EXPOSE 8080

# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

#confrim container curl http://localhost:8080

