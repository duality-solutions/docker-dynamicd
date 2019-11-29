dynamicd for Docker
================

[![Docker Stats](http://dockeri.co/image/dualitysolutions/docker-dynamicd)](https://hub.docker.com/r/dualitysolutions/docker-dynamicd/)

[![Build Status](https://travis-ci.com/duality-solutions/docker-dynamicd.svg?branch=master)](https://travis-ci.org/duality-solutions/docker-dynamicd/)


Docker image that runs the Dynamic dynamicd node in a container for easy deployment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker (i.e. Vultr, Digital Ocean, KVM or XEN based VMs) running Ubuntu 16.04 or later (*not OpenVZ containers!*)
* At least 4 GB to store the block chain files
* At least 1 GB RAM + 2 GB swap file

Recommended and tested on Vultr 1024 MB RAM/50 GB disk instance @ $8/mo.  Vultr also *accepts Bitcoin payments*!


Really Fast Quick Start
-----------------------

One liner for Ubuntu 16.04 LTS machines with JSON-RPC enabled on localhost and adds upstart init script:

    curl https://raw.githubusercontent.com/duality-solutions/docker-dynamicd/master/bootstrap-host.sh | sh -s xenial


Quick Start
-----------

1. Create a `dynamicd-data` volume to persist the dynamicd blockchain data, should exit immediately.  The `dynamicd-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        docker volume create --name=dynamicd-data
        docker run -v dynamicd-data:/dynamic --name=dynamicd-node -d \
            -p 33300:33300 \
            -p 127.0.0.1:33350:33350 \
            dualitysolutions/dynamicd

2. Verify that the container is running and dynamicd node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                              NAMES
        28bde7d11775        dualitysolutions/dynamicd:latest          "dynamic_oneshot"      2 seconds ago       Up 1 seconds        127.0.0.1:33350->33350/tcp, 0.0.0.0:33300->33300/tcp   dynamicd-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f dynamicd-node

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* To run in testnet, add environment variable `TESTNET=1` to `docker run` as such:

        docker run -v dynamicd-data:/dynamic --name=dynamicd-node -d \
            --env TESTNET=1 \
            -p 33300:33300 \
            -p 127.0.0.1:33350:33350 \
            dualitysolutions/docker-dynamicd

* Additional documentation in the [docs folder](docs).

Credits
-------

Original work by Kyle Manna [https://github.com/kylemanna/docker-bitcoind](https://github.com/kylemanna/docker-bitcoind).
Modified to use Dynamic instead of Bitcoin Core.

