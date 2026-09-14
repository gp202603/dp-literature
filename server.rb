require 'socket'
require 'uri'

ROOT = '/Users/Alexandra/Desktop/DP English Textbooks/lit-site'
PORT = 3000

MIME = {
  '.html' => 'text/html; charset=utf-8',
  '.css'  => 'text/css',
  '.js'   => 'application/javascript',
  '.png'  => 'image/png',
  '.svg'  => 'image/svg+xml',
  '.jpg'  => 'image/jpeg',
  '.ico'  => 'image/x-icon',
}

server = TCPServer.new('127.0.0.1', PORT)
$stdout.sync = true
puts "Serving #{ROOT} on http://localhost:#{PORT}"

loop do
  client = server.accept
  begin
    req = client.readline
    method, path, _ = req.split
    while (line = client.readline) && line !~ /\A\r?\n\z/; end

    path = URI.decode_www_form_component(path.to_s.split('?').first)
    path = '/index.html' if path == '/'
    path = path.gsub(/\.\.+/, '')

    file = File.join(ROOT, path)
    ext  = File.extname(file)
    mime = MIME[ext] || 'text/plain'

    if File.file?(file)
      body = File.binread(file)
      client.print "HTTP/1.1 200 OK\r\nContent-Type: #{mime}\r\nContent-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n"
      client.write body
    else
      body = "404 Not Found: #{path}"
      client.print "HTTP/1.1 404 Not Found\r\nContent-Type: text/plain\r\nContent-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n#{body}"
    end
  rescue => e
    STDERR.puts "Error: #{e}"
  ensure
    client.close
  end
end
