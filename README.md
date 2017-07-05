# Plex Media Server for Raspberry PI

This container runs Plex Server on a ARMv7 board, like Raspberry Pi 2 or 3.

## Build

```
docker build -t croc/plex-rpi .
```

## Usage

```
docker run -tid --name plex --net host -v /srv/media/tv:/data/series -v /srv/plex/config:/config -v /srv/plex/transcode:/transcode croc/plex-rpi
```

Where:
  - `--net host` is a simplest mode for run without NAT restrictions :)
  - `--name plex` the name of the conatiner
  - `-v /srv/media/tv:/data/series` a volume for TV series where `/srv/media/tv` contains the TV series on the Docker host and available in the `/data/series` folder in the plex container. This is your choice. You can use any folder for this, but you can choose the selected folder on the web UI of the plex 
  - `-v /srv/plex/config:/config` for the plex's config
  - `-v /srv/plex/transcode:/transcode` for the template files of the transcoding

## Config

**VERY IMPORTANT!!**
You can config the plex server only with `http://127.0.0.1:32400/web` page. So you should use port forward the plex port on the raspberry to your machine.

Example:
```
ssh -L 32400:127.0.0.1:32400 rpi@192.168.1.102
```

Good Luck!
