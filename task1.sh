#!/bin/bash
kill $(ps aux | grep '[i]nfinite.sh' | awk '{print $2}')