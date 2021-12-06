const express = require('express');
const os = require("os");

const app = express();

app.set('x-powered-by', false);
app.set('etag', false);

app.get('/*', function (req, res) {
    res.set('X-Server', os.hostname());
    res.json({
        "path": req.path
    });
});

app.listen(80);
