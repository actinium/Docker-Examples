const express = require('express');
const os = require("os");

const app = express();

app.set('x-powered-by', false);
app.set('etag', false);

app.get('/', function (req, res) {
    res.set('X-Server', os.hostname());
    res.json({
        "server": os.hostname(),
        "time": new Date().toUTCString()
    });
});

app.listen(80);
