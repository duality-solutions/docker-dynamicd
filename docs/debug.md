# Debugging

## Things to Check

* RAM utilization -- dynamicd is very hungry and typically needs in excess of 1GB.  A swap file might be necessary.
* Disk utilization -- The Dynamic blockchain will continue growing and growing and growing.  Then it will grow some more.  At the time of writing, 1GB is necessary.

## Viewing dynamicd Logs

    docker logs dynamicd-node


## Running Bash in Docker Container

*Note:* This container will be run in the same way as the dynamicd node, but will not connect to already running containers or processes.

    docker run -v dynamicd-data:/dynamic --rm -it dualityblockchainsolutions/dynamicd bash -l

You can also attach bash into running container to debug running dynamicd

    docker exec -it dynamicd-node bash -l


