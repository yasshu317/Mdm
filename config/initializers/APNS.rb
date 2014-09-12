

#APNS.host = 'gateway.push.apple.com'
APNS.host = 'gateway.sandbox.push.apple.com'
# gateway.sandbox.push.apple.com is default

#APNS.pem  = '/path/to/pem/file'
APNS.pem  = File.join(Rails.root, 'config','cert.pem')

# this is the file you just created

APNS.pass = 'valuelabs'

APNS.port = 2195
# this is also the default. Shouldn't ever have to set this, but just in case Apple goes crazy, you can.


