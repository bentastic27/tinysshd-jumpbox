FROM ubuntu:latest
RUN apt update && apt install tinysshd ucspi-tcp --yes && apt-get clean
EXPOSE 22
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh && mkdir /key-src
CMD ["/entrypoint.sh"]