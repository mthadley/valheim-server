# Docker-based Valheim Server

## Setup with Dokku

Create the app:

```sh
$ dokku apps:create valheim-server
```

Setup persistent storage:

```sh
$ dokku storage:mount valheim-server /var/lib/valheim/server:/server
$ dokku storage:mount valheim-server /var/lib/valheim/world-data:/world-data
```

Remove Nginx Proxy (this isn't a web server, after all):

```sh
$ dokku proxy:disable valheim-server
$ dokku docker-options add valheim-server deploy "--network=host"
$ dokku checks:disable valheim-server
```

Make sure the server ports are allowed:

```sh
$ ufw allow 2456
$ ufw allow 2457
$ ufw allow 2458
$ ufw allow 27015
```
