#!/usr/bin/env bash

set -e
# https://www.dartlang.org/tools/dart2js/
pub --version
pub deps > dependencies.txt

dartanalyzer lib/charted.dart
dartanalyzer web/main.dart

pub build --mode=debug

ls -lh build/web

