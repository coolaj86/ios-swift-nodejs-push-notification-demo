'use strict';

var apn = require('apn')
  , options = { production: false }
  , apnConnection = new apn.Connection(options)
    // replace with your device id
  , token = '62aadff76df44261318ed16dfcd287ecd8b71cd50339f3592e2e27a9eede9558'
  , myDevice = new apn.Device(token)
  , note = new apn.Notification()
  , feedback
  ;

note.expiry = Math.floor(Date.now() / 1000) + 3600; // in seconds
note.badge = 3; // how many new messages, etc
note.sound = "default"; //"ping.aiff";
note.alert = "\uD83D\uDCE7 \u2709 You have a new message";
note.payload = { 'messageFrom': 'Sweet Caroline' };

apnConnection.pushNotification(note, myDevice);

feedback = new apn.Feedback(options);
feedback.on("feedback", function(devices) {
  devices.forEach(function(item) {
    console.log('failure');
    console.log(item);
    // Do something with item.device and item.time;
  });
});
