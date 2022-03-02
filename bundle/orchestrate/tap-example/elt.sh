#!/bin/bash

# Exit on error
set -e

# Meltano setup
meltano install extractor "$EXTRACTOR"
meltano install loader "$LOADER"
meltano install transform "$EXTRACTOR"
meltano install transformer dbt

# Temporary fix for markdown dependencies issue: https://github.com/dbt-labs/dbt-core/issues/4745
.meltano/transformers/dbt/venv/bin/pip3 install --force-reinstall MarkupSafe==2.0.1

# Install dbt dependencies files
meltano invoke dbt deps

# Run the elt, and dbt commands and tests
meltano elt "$EXTRACTOR" "$LOADER" --transform=skip
meltano invoke dbt snapshot --select tap_example
meltano invoke dbt run -m tap_example --full-refresh