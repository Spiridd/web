import json

def app(environ, start_response):
    data = process_request(environ)
    start_response(
        "200 OK",
        [
            ("Content-Type", "text/plain"),
            ("Content-Length", str(len(data)))
        ]
    )
    return iter([data])

def process_request(env):
    return env['QUERY_STRING'].replace('&', '\n').encode('UTF-8')
