#!/usr/bin/env bash
name=$1
cp -r template "$name"
echo "✅ Project $name created."
code "$name"
