FROM ubuntu:latest

# Download/Install Foundry Licensing Tools
RUN apt-get -qq update
RUN apt-get install wget -y
RUN wget http://thefoundry.s3.amazonaws.com/tools/FLT/7.1v1/FLT7.1v1-linux-x86-release-64.tgz
RUN tar xzf FLT7.1v1-linux-x86-release-64.tgz
RUN rm FLT7.1v1-linux-x86-release-64.tgz
RUN cd /FLT_7.1v1_linux-x86-release-64RH/ && echo yes | /bin/sh install.sh

# Replace rlm.foundry to the cracked one.
COPY ./rlm.foundry /usr/local/foundry/LicensingTools7.1/bin/RLM/rlm.foundry
RUN chmod +x /usr/local/foundry/LicensingTools7.1/bin/RLM/rlm.foundry


COPY ./foundry_float.lic /opt/foundry_float.lic

# rlm server
EXPOSE 5053
# admin gui
EXPOSE 5054
# isv server
EXPOSE 4101

# Add startup script
COPY ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

# Run the startup script
CMD ["/opt/start.sh"]
