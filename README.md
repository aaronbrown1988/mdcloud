# Molecular Dynamics Docker containers

This repository contains a bunch of proof of concept containers from running molecular dynamics work loads in containers. All of the contianers are currently based on the ubuntu base images from docker hub and where applicable build from the git source control.

The following tools are available:

* Gromacs - single precision, inbuilt MPI libraries
* NAMD
* VMD 

## Locally?

### Gromacs

To run gromacs from within the container, a docker-compose file is provided which mounts the correct folders into the container and launches simulation. It can be run using the following:

` docker-compose up `


### NAMD 
I'll fill this in once I get the container up and NAMD built.....


### VMD

Running VMD is a little tricky in that it requires an X server on the host machine and access to this server to be passed through to the container. As such the Hardware rending options are likely limited. However it can be run using the following:

`` docker run --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --net=host --env="DISPLAY" -v `pwd`:/media vmd``


# But.. what about the cloud?

* Spin up the infra `` cd infra/terraform && ../../terraform apply ``
* setup the instances: `` cd infra/ansible && ansible-playbook -i inventory main.yml ``
* Tear it all down when your done: `` cd infra/terraform && ../../terraform destory``

## Proposed workflow
1. create a volume with the input files and one to hold the output
2. on a manager create the service to run the job, using the manager volumes.
3. When the service is done mount the volume into a simpler container and copy the results
4. Destroy old volumes periodically.

## Work in progress/ Links to read next time

* Shared Volume driver: https://github.com/craimbert/docker-volume-gc-storage
* * Shared Volume driver: https://github.com/craimbert/docker-volume-gc-storage
* Further investigation of the "Fat Container method" 
* Move the statefile to a GCS bucket : https://www.terraform.io/docs/backends/types/gcs.html