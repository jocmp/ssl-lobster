# frozen_string_literal: true
require "socket"
require "rack"
require "rack/lobster"
require "openssl"

PORT = 3001

app = Rack::Lobster.new
server = TCPServer.new(PORT)

ssl_context = OpenSSL::SSL::SSLContext.new.add_certificate(
  OpenSSL::X509::Certificate.new(File.read("./cert.pem")),
  OpenSSL::PKey::RSA.new(File.read("./key.pem"))
)
ssl_server = OpenSSL::SSL::SSLServer.new(server, ssl_context)

while session = ssl_server.accept
  request = session.gets
  puts request

  method, full_path = request.split(' ')
  path, query = full_path.split('?')
  status, headers, body = app.call({
    "REQUEST_METHOD" => method,
    "PATH_INFO" => path,
    "QUERY_STRING" => query
  })

  session.print "HTTP/1.1 #{status}\r\n"
  headers.each do |key, value|
    session.print "#{key}: #{value}\r\n"
  end
  session.print "\r\n"
  body.each do |part|
    session.print part
  end
  session.close
end
