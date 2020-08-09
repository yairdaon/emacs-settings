#!/bin/bash

## Place this in /home/yairdaon/bin
kill $(ps aux | grep 'python' | awk '{print $2}')
kill $(ps aux | grep 'pytest' | awk '{print $2}')

