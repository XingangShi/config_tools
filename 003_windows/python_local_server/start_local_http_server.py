#!/usr/bin/python
# *-* coding: utf-8 *-*

import sys, platform


if platform.python_version().find("2.7") != -1:
    import BaseHTTPServer
    from SimpleHTTPServer import SimpleHTTPRequestHandler
    ServerClass = BaseHTTPServer.HTTPServer

else:
    from http.server import HTTPServer, BaseHTTPRequestHandler
    from http.server import SimpleHTTPRequestHandler
    HandlerClass = SimpleHTTPRequestHandler
    ServerClass = HTTPServer


HandlerClass = SimpleHTTPRequestHandler

sever_global_info = {
    "protocol"    : "HTTP/1.0",
    #
    "server_ip"   : "127.0.0.1",
    "server_port" : 8000
}

def LogInfo(**kwargs):
    for key, value in kwargs.items():
        print("%s \t" % (value))
    return

def start_local_http_server(ip = "127.0.0.1", port = 8000):
    global sever_global_info
    Protocol = sever_global_info["protocol"]
    HandlerClass.protocol_version = Protocol
    server_address = (ip, port)
    httpd = ServerClass(server_address, HandlerClass)
    sa = httpd.socket.getsockname()

    LogInfo(prefix = "Serving HTTP on", key_info = "server is %s, port is %s ..." %(sa[0], sa[1]))

    httpd.serve_forever()

if __name__ == "__main__":
    default_ip = sever_global_info["server_ip"]

    if sys.argv[1:]:
        port = int(sys.argv[1])
    else:
        port = sever_global_info["server_port"]

    start_local_http_server(default_ip, port)
