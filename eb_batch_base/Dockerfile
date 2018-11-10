FROM centos:centos7

COPY ./conf /

RUN chmod -R 777 entrypoint.sh
RUN chmod -R 777 skilipaca.jar
RUN yum install -y java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64

VOLUME /usr/src/myapp

WORKDIR /usr/src/myapp

ENTRYPOINT ["/entrypoint.sh"]

# docker run -it --name batchforaxess -v C:\MyWorkSpace\Batch:/usr/src/myapp kicompany/batchforaxess:1.0
# docker run -d --privileged --name batchforaxess -v C:\MyWorkSpace\Batch:/usr/src/myapp kicompany/batchforaxess:1.0 --entrypoint /sbin/init
# docker run -d --privileged --name batchforaxess -v C:\MyWorkSpace\Batch:/usr/src/myapp kicompany/batchforaxess:1.0
# docker run -d --restart=always --name batchforaxess -v C:\MyWorkSpace\Batch:/usr/src/myapp kicompany/ec_batch
# docker run -d --name batchforaxess_v2 -v /home/ec2-user/aws/test:/usr/src/myapp ebusinessdocker/ec_axess_batch_v2
# docker run -d --name batchforaxess -v /samba/batch:/usr/src/myapp ebusinessdocker/ec_axess_batch_v2