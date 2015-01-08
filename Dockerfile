# sudo docker build -t="viatcheslavmogilevsky/suprise:0.0.1" .

FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER V. Mogilevksy "https://github.com/viatcheslavmogilevsky"
RUN echo "LANG=\"en_US.UTF-8\"" > /etc/default/locale && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales
ADD ./playbooks /playbooks
RUN ansible-playbook /playbooks/install-fig.yml -c local
ENV FIG_FILE /figdir/fig.yml
ENV FIG_PROJECT_NAME suprise
VOLUME /figdir
CMD bash -c 'ansible-playbook /playbooks/template-fig.yml -c local; bash'