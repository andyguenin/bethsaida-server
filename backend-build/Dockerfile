FROM openjdk:12

RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && yum install -y sbt git

COPY backend-build.sh .

COPY backend-deploy.sh .

VOLUME /root/.ivy2

VOLUME /root/.sbt

VOLUME /app

VOLUME /backend


