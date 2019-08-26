**Goal**

To run Foundry licenses through a Docker container.

**Setup**

In order for the container to serve licenses, you need to be able to ping the container. For Windows/Mac please follow this: https://stackoverflow.com/questions/39216830/how-could-i-ping-my-docker-container-from-my-host or https://github.com/docker/for-win/issues/221

Using Docker Desktop the above setup is not necessary.

**Install**

```Bash
git clone https://github.com/aaronrancsik/docker-foundry-rlm.git
cd docker-foundry-rlm
docker build -t rlm-foundry .
```

**Usage**
*Verbose*
```bash
docker run --mac-address 08:00:27:ef:70:d3 --hostname licenseserver -i -t rlm-foundry:latest
```
*In background*
```bash
docker run -d --rm --mac-address 08:00:27:ef:70:d3 --hostname licenseserver -i -t rlm-foundry:latest
```


In verbose the first line of the output will show the IP address. Ex.:
```
IP ADDRESS:
172.17.0.2
```

When inputting the license server to use in a Foundry Product use ```5053@{IP ADDRESS}```.

**Restarting**

 You can have the license server always running even between reboots of the host machine by adding the ```--restart=always```.

```bash
docker run --restart=always -d --rm --mac-address 08:00:27:ef:70:d3 --hostname licenseserver -i -t rlm-foundry:latest
```
