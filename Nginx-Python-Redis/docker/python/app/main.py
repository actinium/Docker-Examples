import socket
import time

from flask import Flask, Response
from redis import Redis
from redis.exceptions import ConnectionError as RedisConnectionError

app = Flask(__name__)

cache = Redis(
    host='redis',
    port=6379
)


def with_retries(retries, f):
    while True:
        try:
            return f()
        except RedisConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


def get_count():
    return with_retries(5, lambda: cache.incr('hits'))


@app.route('/')
def hello():
    msg = 'Hello World!\nI have been seen {} times.\n'.format(get_count())
    resp = Response(msg)
    resp.headers['X-Server'] = socket.gethostname()
    return resp
