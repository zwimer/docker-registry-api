# Docker Registry API

The following commands are supported:
1. `ls` a registry for all repositories in it
2. `ls` a repository in a registry for all the tags in it
3. `rm` an image from a registry

# Config

Before using this app, the variables in `config.sh` must be set properly. 
If the URI or the username / password of the registry ever change, the `config.sh` file will need to be adjusted.

# Commands

## `ls` repositories


To `ls` a registry do
```bash
./ls-repos.sh

```

## `ls` tags

To `ls` the tags of a repository of a registry do
```bash
./ls-tags.sh <repo>
```

## Delete an image

To delete an image from a docker registry do
```bash
./delete-image.sh <repo> <tag>
```

### Garbage Collection

This will not truly delete the image, but remove pointers. The registry garbage collector (which would run daily) will remove the image when it runs. To run it manually, from the docker registry machine, execute a command similar to (depending on your setup) the following:
```bash
docker exec registry /bin/registry garbage-collect /etc/docker/registry/config.yml
```

### Metadata

The above will not delete the repo itself if no images remain; though the repository itself is just a tiny bit of metadata. However, if you run `./ls-tags.sh <repo>` you will notice that the image you deleted should no longer be there.
