################################################################################
# Python
################################################################################
FROM python:3.10-alpine as python

WORKDIR /app

ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

RUN apk add --no-cache gcc musl-dev linux-headers

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 5000

COPY ./app .

CMD ["flask", "run"]
