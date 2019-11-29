#!/bin/bash
set -e

testAlias+=(
	[dynamicd:trusty]='dynamicd'
)

imageTests+=(
	[dynamicd]='
		rpcpassword
	'
)
