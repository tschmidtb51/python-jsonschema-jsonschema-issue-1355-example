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

# Use schema that enforces validation against a JSON
SCHEMA="validation-enforced/"${SCHEMANAME}

# ... with a valid date-time string; expected: valid, actual: error
validate "data/valid.json" 0
# ... with an invalid date-time string; expected: invalid, actual: error
validate "data/failing.json" 1

# Use schema that does not enforce validation against a JSON
SCHEMA="validation-optional/"${SCHEMANAME}

# ... with a valid date-time string; expected: valid, actual: valid
validate "data/valid.json" 0
# ... with an invalid date-time string; expected: valid, actual: valid
validate "data/failing.json" 0

exit ${FAIL}
