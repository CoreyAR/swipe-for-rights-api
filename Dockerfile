FROM python:3.6-alpine

WORKDIR /app/

COPY setup.cfg setup.py /app/
# Create a temp swipe_for_rights_api package as required in our setup.cfg
RUN mkdir /app/swipe_for_rights_api

RUN pip3 install -U pip \
    && pip3 install -e .[dev]

COPY app.py /app/
COPY ./tests /app/tests
COPY ./swipe_for_rights_api/ /app/swipe_for_rights_api/

ENTRYPOINT ["apistar"]
