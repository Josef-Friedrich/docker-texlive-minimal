# docker-texlive-minimal

Small texlive docker image without any additonal packages.

This docker image is intended for the usage in unit tests. It uses
the latest texlive distribution and is installed portable.

## Other minimal alpine based docker images

* https://github.com/dc-uba/docker-alpine-texlive
* https://github.com/Paperist/docker-alpine-texlive-ja

# Build the image

    sudo docker build --tag texlive .

# Keep container alive

    sudo docker run --name texlive --volume $(pwd)/build:/build --detach texlive tail -f /dev/null

# List all installed packages

    sudo docker exec texlive tlmgr info --only-installed

# Install a package

    sudo docker run -ti texlive tlmgr
