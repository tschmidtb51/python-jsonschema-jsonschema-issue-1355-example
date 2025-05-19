#!/bin/bash

SCHEMANAME=instance_schema.json

VALIDATOR=validator.py
FAIL=0


validate() {
  printf "%s" "Testing file $1 against schema ${SCHEMA} - expected outcome $2 ... "
  if [[ $(python3 $VALIDATOR $SCHEMA $1; echo $?) = $2 ]]; then
    printf "%s\n" SUCCESS
  else
    printf "%s\n" FAILED
    FAIL=1
  fi

}

SCHEMA="validation-enforced/"${SCHEMANAME}

validate "data/valid.json" 0
validate "data/failing.json" 1

SCHEMA="validation-optional/"${SCHEMANAME}

validate "data/valid.json" 0
validate "data/failing.json" 0

exit ${FAIL}
