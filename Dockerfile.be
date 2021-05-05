FROM ibmcom/ace-server:11.0.0.12-r1-eus-20210422-114930-amd64
COPY BackEnd /home/aceuser/BackEnd
RUN export LICENSE="accept" \
    && source /opt/ibm/ace-11/server/bin/mqsiprofile \
    && mkdir /home/aceuser/bars \
    && mqsipackagebar -a bars/BE.bar -k BackEnd \
    && mqsibar -a bars/BE.bar -w /home/aceuser/ace-server \
    && chmod -R 777 /home/aceuser/ace-server/run/BackEnd
