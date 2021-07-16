#!/bin/bash

set -euo pipefail

KUBECONFIG="$HOME/.kube/config"

vagrant ssh vagrant-master -c 'sudo cat /root/.kube/config' >"${KUBECONFIG}" 2>/dev/null
echo "Copied to ${KUBECONFIG}."
