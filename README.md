# python-jsonschema/jsonschema#1355 example

A minimal example to support explaining the problem from  [python-jsonschema/jsonschema#1355](https://github.com/python-jsonschema/jsonschema/issues/1355).

## Structure

The `instance_schema.json` contains the schema for instances.
Within `validation-optional` the schema points to the Draft 2020-12 directly.
Within `validation-enforced` the schema points to the Draft 2020-12 via a meta schema that should enforce the validation.

Test data is provided as `valid.json` and `failing.json` in the `data` folder.

## How to use

Run `run_tests.sh`. The actual and expected outcome is described in the file.

If you want to test, how the situation would look like with format validation enforced by the implemention - use line 38 instead of 39 in `validator.py`.
