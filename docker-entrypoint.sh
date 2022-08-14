#!/bin/bash
set -e

update-exim4.conf -v --removecomments

exec gosu Debian-exim "$@"
