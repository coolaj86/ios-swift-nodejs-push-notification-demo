'use strict';

var http = require('http')
  , path = require('path')
  , connect = require('connect')
  , send = require('connect-send-json')
  , app = connect()
  , port = 3030
  , server
  ;

send.error = require('connect-send-error').error;

app
  .use(connect.static(path.join(__dirname, 'public')))
  .use(send.json())
  .use(send.error())
  .use('/api/push', function (req, res) {
    console.log('A device tried to register!');
    console.log(req.body);

    res.json({ "success": true });
  });

server = http.createServer(app).listen(port, function () {
  console.log('Listening on ', server.address());
});
