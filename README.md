# Pterodactyl Panel Node Dockerfile #
__A Free and Open Source Agnostic Game Panel__


Main repository link: https://github.com/ccarney16/pterodactyl-panel-dockerfile

### Usage ###

---

The Pterodactyl Daemon needs to have access to the docker host filesystem and the daemon to work correctly.
Refer to the main repository link for all information regarding running the pterodactyl panel within docker.

### Required Mounts ###

* _/srv/daemon/config/_: Main configuration directory for the daemon.
* _/srv/daemon/packs/_: For server packs.
* _/srv/daemon/scripts/_: For startup scripts.
* _/srv/daemon-data/_: Server Data.
* _/tmp/pterodactyl/_: 
* _/var/run/docker.sock_: Requires the docker daemon docket to operate.

All mounts are recommended to be mirrored exactly. 