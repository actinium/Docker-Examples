import socket

from flask import Flask, Response
from pymemcache.client.hash import HashClient

app = Flask(__name__)


def getCacheClient():
    return HashClient(
        [
            "memcached-1:11211",
            "memcached-2:11211",
            "memcached-3:11211",
        ]
    )


@app.route("/items/<int:id>")
def get_item(id):
    cache = getCacheClient()

    item = cache.get(str(id))
    if item is None:
        from_cache = False
        item = f"Item({id})"
        cache.set(key=str(id), value=item, expire=60)
    else:
        from_cache = True

    msg = "Id: {}\nItem: {}\n".format(id, item)

    resp = Response(msg)
    resp.headers["X-Server"] = socket.gethostname()
    resp.headers["X-From-Cache"] = from_cache

    return resp
