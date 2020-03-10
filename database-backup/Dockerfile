from postgres

VOLUME /db/backup

VOLUME /var/lib/postgresql/data

ADD backup-db.sh .

ADD restore-db.sh .

ADD runner.sh .

RUN chmod +x backup-db.sh restore-db.sh

ENTRYPOINT ["/bin/bash", "runner.sh"]

