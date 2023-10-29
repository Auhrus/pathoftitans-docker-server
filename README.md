# Path of Titans Server 🦖

This image provides a Path of Titans server. After the first start it downloads the necessary files from the Alderon Games servers. If there is an update to the server files, simply recreate the container without having to re-download the image. It will download everything again (just in new) and the show can go on.
## Content🧾

* [Deployment👩‍💻](https://github.com/Auhrus/pathoftitans-docker-server?tab=readme-ov-file#deployment)
* [Environment Variables🔢](https://github.com/Auhrus/pathoftitans-docker-server?tab=readme-ov-file#environment-variables)
* [Update⏫](https://github.com/Auhrus/pathoftitans-docker-server?tab=readme-ov-file#update)
* [Official Documentation📖](https://github.com/Auhrus/pathoftitans-docker-server#original-documentation)
* [Support❤️](https://github.com/Auhrus/pathoftitans-docker-server?tab=readme-ov-file#official-documentation)

## Deployment👩‍💻

How to install this Docker Container

1. Install Docker on your Server. Here is a guide [here](https://duckduckgo.com/?t=ffab&q=How+to+install+Docker+on+Ubuntu)
2. Run that command
```bash
docker run -p 7777:7777/udp -v VOLUME_NAME:/opt/data/PathOfTitans/Saved -e username=ALDERON_MAILADDRESS -e password=ALDERON_PASSWORD -e guid=GUID --name CONAINER_NAME ghcr.io/auhrus/pathoftitans:latest
```
Please replace all things written in CAPS.

3. After all data has been downloaded, restart the container.
```bash
docker restart CONAINER_NAME
```
4. After that the Path of Titans server starts again it generates the save files, etc.

## Environment Variables🔢

To run this project, you will need to set the following environment variables.
The ones without content are mandatory.

| Variable      | Function      | Default |
|:------------- |:-------------:|:-------------|
| `username`   |Put here your Alderon games mail address.|--|
| `password`   |Put here your Alderon password.|--|
| `guid`       |"Globally Unique Identifier" this identifies the server in the Alderon Games server list. Here you can find a generator: [Find](https://duckduckgo.com/?q=random+guid&atb=v296-1&ia=answer)|--|
| `branch`     |Here you can specify the branch which should be downloaded.|production|
| `database`   |Here you can define if the server should use a local or remote database. For more information see: [Alderon Games Wiki](https://github.com/Alderon-Games/pot-community-servers/wiki/Hosting-on-your-own-hardware#database)|Local|
| `port`       |Specifies the port of the game server. **IMPORTANT** it must be UDP!|7777|
| `PATH`       |You can ignore this, it will be created automatically by the Ubuntu base.|/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin|


## Update⏫

How do i update my Path of Titans Server to a newer Version?

1. First stop and remove the existing Container.
```bash
docker stop CONAINER_NAME && docker rm CONAINER_NAME
```
2. Them create him again like in the [Deployment👩‍💻](https://github.com/Auhrus/pathoftitans-docker-server#deployment)

## Official Documentation📖

Here you can find the Official Alderon Games Documentation for more settings, mods, etc.

[Complete Alderon Games Documentation](https://github.com/Alderon-Games/pot-community-servers/wiki/Hosting-on-your-own-hardware)
## Support❤️

If you find any bugs have improvements for this Documentation or have any other suggestions/improvements, please post a bug report or feature suggestion in the 
[Issues Tab](https://github.com/Auhrus/pathoftitans-docker-server/issues).
