* https://developer.apple.com/account/overview.action
* https://blog.serverdensity.com/how-to-build-an-apple-push-notification-provider-server-tutorial/
* http://nathanmock.com/files/com.apple.adc.documentation.AppleiOS6.0.iOSLibrary.docset/Contents/Resources/Documents/#documentation/ToolsLanguages/Conceptual/DevPortalGuide/CreatingandConfiguringAppIDs/CreatingandConfiguringAppIDs.html
* https://developer.apple.com/account/ios/certificate/certificateLanding.action
* http://stackoverflow.com/questions/16070277/linux-apns-server-which-cert-should-i-create

```bash
openssl pkcs12 -clcerts -nokeys -out apns-dev-cert.pem -in apns-dev-cert.p12
openssl pkcs12 -nocerts -out apns-dev-key.pem -in apns-dev-key.p12
```

* https://github.com/argon/node-apn/wiki/Preparing-Certificates

```bash
openssl x509 -in cert.cer -inform DER -outform PEM -out cert.pem
openssl pkcs12 -in key.p12 -out key.pem -nodes
```

Xcode -> Prefs -> Accounts -> View Details -> [Refresh Icon]

RJC2BHMV96.com.coolaj86.push-demo

Bundle ID must match app name in apple account

```bash
npm install apn
```
