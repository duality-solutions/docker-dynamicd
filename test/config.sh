#!/bin/bash
set -e

testAlias+=(
	[dynamicd:xenial]='dynamicd'
)

imageTests+=(
	[dynamicd]='
		rpcpassword
	'
)