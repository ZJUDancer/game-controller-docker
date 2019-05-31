#!/usr/bin/env sh

COLOR_BLUE='\033[0;34m'
COLOR_NULL='\033[0m'

echo -e "${COLOR_BLUE}Starting GameController${COLOR_NULL}"
java -jar GameController.jar $@
