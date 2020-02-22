FROM sonatype/nexus3:3.21.1

#COPY target/nexus-blobstore-azure-cloud-0.4.0-SNAPSHOT-bundle.kar /opt/sonatype/nexus/deploy
COPY target/nexus-blobstore-azure-cloud-0.5.0-SNAPSHOT.jar /opt/sonatype/nexus/deploy
