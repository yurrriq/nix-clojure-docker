# nix-clojure-docker

*Dockerized Clojure app via Nix*

```fish
# build the docker image and run it
make run

# in another shell
http :3000
```

```http
HTTP/1.1 200 OK
Content-Length: 13
Content-Type: text/plain
Date: Sun, 18 Jun 2017 20:48:03 GMT
Server: Jetty(9.2.z-SNAPSHOT)

Hello, world!
```
