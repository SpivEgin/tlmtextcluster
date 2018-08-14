#!/bin/bash

tlmtextdb init
tlmtextdb adduser --username root
tlmtextdb adduser --username $COCKROACH_USER
tlmtextdb database -dcl

