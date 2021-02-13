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
