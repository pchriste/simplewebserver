## Simple webserver container
# Using RHEL 7 base image and Apache Web server
# Version 1

# Pull the rhel image from the local repository
FROM rhel7:latest
MAINTAINER <admin@acme.com>

# BUILD COMMAND= docker build -t simpleweb . #
### Add Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels#####
LABEL description="Red Hat OpenStack Platform 13.0 nuage-neutron-server"

LABEL version-release=5.3.2

LABEL summary="Nuage Neutron Plugin"

LABEL io.k8s.display-name="Red Hat OpenStack Platform 13.0 nuage-neutron-server"

LABEL com.redhat.component="openstack-nuage-neutron-docker"

LABEL name="rhosp13/openstack-nuage-neutron-server"

LABEL version=13

LABEL release=5.3.2

LABEL architecture="x86_64"

LABEL vendor="Nokia Nuage"

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

