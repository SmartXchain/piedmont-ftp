# Use a small Linux base image
FROM debian:bookworm-slim

# Install vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*


# Add vsftpd config file
COPY vsftpd.conf /etc/vsftpd.conf

# Expose FTP ports:
# - 21 = control port
# - 21100-21110 = passive ports
EXPOSE 21 21100-21110

# Start vsftpd in foreground
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
