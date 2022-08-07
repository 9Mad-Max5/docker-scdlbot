#!/bin/sh
cd /data
export $(grep -v '^#' .env | xargs)
scdlbot