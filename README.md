# CKS Study Playground

This setup is influenced by Killer.sh.

## Prerequisites

- Install Virtualbox
- Install Vagrant

## Setup

- Run the following command to bring up the single controller two worker cluster:

```bash
./first-bringup.sh
```

- Run the following command to copy the kubeconfig locally.

```bash
./copy-kubeconfig.sh
```

## Cleanup

- Run the following command to clean up the cluster.

```bash
./cleanup.sh
```
