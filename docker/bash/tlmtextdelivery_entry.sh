#!/bin/bash

tlmtextdelivery init
tlmtextdelivery adduser --username $COCKROACH_USER
tlmtextdelivery server --listen $LISTEN_ON --port $LISTEN_PORT