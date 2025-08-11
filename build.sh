#!/bin/bash
act workflow_dispatch \
   -j "build-kernel-a12-5-10" \
  -P ubuntu-latest=docker.1ms.run/catthehacker/ubuntu:full-latest