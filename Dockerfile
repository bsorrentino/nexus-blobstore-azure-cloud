FROM sonatype/nexus3:3.21.1

#COPY target/nexus-blobstore-azure-cloud-0.4.0-SNAPSHOT-bundle.kar /opt/sonatype/nexus/deploy
COPY target/nexus-blobstore-azure-cloud-0.5.0-SNAPSHOT.jar /opt/sonatype/nexus/deploy

USER root

#
# see
# https://centos.pkgs.org
# https://docs.microsoft.com/en-US/azure/app-service/containers/configure-custom-container#enable-ssh
#
ENV SSH_PASSWD "root:Docker!"
RUN yum install -y --disableplugin=subscription-manager http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/openssh-server-8.0p1-4.el8_1.x86_64.rpm
RUN echo "$SSH_PASSWD" | chpasswd

COPY sshd_config /etc/ssh/
COPY ssh_setup.sh /tmp

RUN chmod +x /tmp/ssh_setup.sh && \
    /tmp/ssh_setup.sh && \
    rm -rf /tmp/ssh_setup.sh

EXPOSE 2222

COPY start-nexus-repository-manager.sh ${SONATYPE_DIR}
RUN chmod +x ${SONATYPE_DIR}/start-nexus-repository-manager.sh

#USER nexus
