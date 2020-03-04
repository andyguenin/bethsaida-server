from postgres

VOLUME /backup

VOLUME /var/lib/postgresql/data

ADD backup-db.sh .

CMD ["/bin/bash", "backup-db.sh"]

