const express = require('express');

const app = express();

app.set('x-powered-by', false);
app.set('etag', false);

app.get('/*', function (req, res) {
    res.json({ "time": new Date().toUTCString() });
});

app.listen(80);
