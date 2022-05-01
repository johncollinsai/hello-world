FROM python:slim

# RUN useradd microblog

WORKDIR /home/posts/hello-world

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn 

COPY app app
COPY hello-world.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP hello-world.py

# RUN chown -R johncollins:johncollins ./
# USER microblog

# https://www.cloudsavvyit.com/14880/whats-the-difference-between-exposing-and-publishing-a-docker-port/
# EXPOSE 5000  NB: 5000 follows grinberg, see https://github.com/miguelgrinberg/microblog/blob/main/Dockerfile

# following https://github.com/GoogleCloudPlatform/kubernetes-engine-samples/blob/main/hello-app/Dockerfile
ENV PORT 8090
ENTRYPOINT ["./boot.sh"]

