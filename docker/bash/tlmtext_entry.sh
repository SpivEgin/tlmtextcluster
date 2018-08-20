#!/usr/bin/env bash

tlmtext init
tlmtext adduser --username $COCKROACH_USER
tlmtext server --listen $LISTEN_ON --port $LISTEN_PORT