FROM ubuntu

# Add config script to install apache2
COPY setup/scripts/install_apache2.sh /root/.install_apache2
COPY setup/scripts/script_base.sh /root/script_base.sh
RUN chmod +x /root/.install_apache2 && chmod +x /root/script_base.sh

# Starting script install
RUN ./root/.install_apache2

# Add config apache2
COPY setup/config/apache2/sites-enable/000-default.conf /etc/apache2/sites-enabled/ 
COPY setup/config/apache2/sites-available/000-default.conf /etc/apache2/sites-available/
COPY setup/config/apache2/apache2.conf /etc/apache2/

# Add apaxy
COPY setup/apaxy2/ /app/

# Starting apache2 script
COPY setup/scripts/run /.run
RUN chmod +x /.run

# Volume
VOLUME ["/etc/apache2/sites-enabled", "/var/log/apache2", "/app/web"]

# WORKDIR
WORKDIR /app/web

# Expose port 80 and port 22
EXPOSE 80 22

# start apache2
CMD "/.run"
