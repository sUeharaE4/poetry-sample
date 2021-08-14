#!/bin/bash

set -eu

VENV_DIR=.venv

print_msg () {
  echo "### $1"
}

# check requirements
if ! command -v poetry &> /dev/null
then
  print_msg "poetry could not be found. please install before exec this script"
  exit
fi
if ! command -v python3 &> /dev/null
then
  print_msg "python3 could not be found. please install before exec this script"
  exit
fi

cd $(dirname $0)
rm -rf ${VENV_DIR}
python3 -m venv ${VENV_DIR}
source ${VENV_DIR}/bin/activate

poetry install --no-dev

print_msg "setup is done! venv dir is ${VENV_DIR} ."
print_msg "if you need develop libs. exec bellow comands."
print_msg "########################################################"
print_msg "source ${VENV_DIR}/bin/activate"
print_msg "poetry install"