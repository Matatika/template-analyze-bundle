#!/bin/bash

# exit on error
set -e

# run extract-load
meltano run tap-example "$LOADER"

# install dbt dependencies
meltano invoke dbt deps

# snapshot and run transforms
meltano invoke dbt snapshot --select tap_example
meltano invoke dbt run -m tap_example --full-refresh
