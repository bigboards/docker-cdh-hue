#!/bin/bash

export PYTHON_EGG_CACHE='/tmp/.hue-python-eggs'
mkdir -p ${PYTHON_EGG_CACHE}

/usr/lib/hue/build/env/bin/supervisor 

