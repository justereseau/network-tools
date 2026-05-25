# Network Tools

This is a container image that contains a set of network tools that can be used for troubleshooting and debugging network issues.

## Usage

### Docker

```bash
docker run --rm -ti ghcr.io/justereseau/network-tools
```

or

```bash
docker run --rm -ti justereseau/network-tools
```

### Kubernetes

```bash
kubectl run test-network --rm -ti --restart=Never --image='ghcr.io/justereseau/network-tools'
```

or

```bash
kubectl run test-network --rm -ti --restart=Never --image='justereseau/network-tools'
```

## Tools included

- `ping`
- `traceroute`
- `nslookup`
- `dig`
- `netstat`
- `tcpdump`
- `curl`
- `wget`
- `iperf3`
- `nmap`
- `mtr`
- `telnet`
- `ssh`
- `sftp`
- `ftp`
- `nc`
