#!/bin/bash

set -x
set -euo pipefail

vagrant box update
vagrant up
