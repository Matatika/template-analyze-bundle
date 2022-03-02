# Using this template

Find `tap-example`, `tap_example`, and `analyze-example` in all files and folders in this project and update as required.

- [ ] Update directory tap-example with your taps name under `bundle/analyze/datasets/tap-example`.
- [ ] Update `Makefile`, replacing `tap-example` with your tap name.
- [ ] Update `setup.py` replacing `tap-example` with your tap name.



- [ ] Update or Remove `bundle/analyze/orchestrate/tap-example`. 

Only needed if you need different pipeline commands to the [Matatika default pipeline actions](https://github.com/Matatika/matatika-examples/blob/master/example_data_import_scripts/default-actions.sh)

Examples of these scripts: [custom data import scripts](https://github.com/Matatika/matatika-examples/blob/master/example_data_import_scripts/default-actions.sh)

- [ ] Update or remove `setup.py` path for `/orchestrate/tap-example/elt.sh`
- [ ] Update `elt.sh` inside of `bundle/analyze/orchestrate/tap-example` with your custom default pipeline script is needed.



- [ ] Update `README` replacing `tap-example`, `tap_example` and `analyze-example`.
- [ ] Update `README` adding your tap and analyze bundle details in the example snippets.



A `README` template is included below starting with the title `analyze-example`.



- [ ] Create or edit some dataset yml files, examples included in `bundle/analyze/datasets/tap-example`.

[Dataset docs](https://www.matatika.com/docs/data/data-visualisation/dataset-yaml).

Analyze bundle examples: [analyze-solarvista](https://github.com/Matatika/analyze-solarvista), [analyze-meltano](https://github.com/Matatika/analyze-meltano)

## Adding rawdata files

NOTE: You only need to include `rawdata` if you plan on producing the chart snippets for documentation. Then you only need rawdata files for `chart` datasets. 

Snippets for table datasets get automatically created, exports currently do not have snippets created.

When creating rawdata files keep in mind:
- The name of the `rawdata` file should match the `dataset` file.
- There should be only one key inside the `rawdata` file and it should also match the name of the `dataset` file.
- The rawdata will be an array of objects with the same names as the metadata of the `dataset` expects.

Example: [tap meltano dataset](https://github.com/Matatika/analyze-meltano/blob/master/bundle/analyze/datasets/tap-meltano/meltano-daily-jobs-stats-last-30-days.yml) and [tap meltano dataset rawdata](https://github.com/Matatika/analyze-meltano/blob/master/rawdata/meltano-daily-jobs-stats-last-30-days.yml).

See how the in the metadata of the dataset the `name` is `mdj`, then the column and aggregate names are `date`, `total_jobs`, `successful_jobs` and `failed_jobs`. In the rawdata we reference these by `mdj.date` and so on.

---

# analyze-example

Meltano project [file bundle](https://meltano.com/docs/command-line-interface.html#file-bundle) of Matatika datasets for `tap-example`. These datasets are automatically added to your Matatika workspace when you initialize a `tap-example` pipeline.

Files:
- [`analyze/datasets`](./bundle/analyze/datasets) (directory)

### Adding this file bundle to your own Meltano project

Add plugin to `discovery.yml`:
```yaml
files:
- name: analyze-example
  namespace: tap_example
  repo: https://github.com/Matatika/analyze-example.git
  pip_url: git+https://github.com/Matatika/analyze-example.git
```

Add plugin to your Meltano project:
```bash
# Add only the file bundle
meltano add files analyze-example

# Add the file bundle as a related plugin through adding the extractor
meltano add extractor --include-related tap-example
```

### Adding this along with tap-example as a custom plug-in for in Matatika

Go to data imports, click on `Custom Data Source` and copy and paste in:

```yaml
extractors:
  - name: tap-example
    namespace: tap_example
    pip_url: git+https://github.com/Matatika/tap-example.git
    capabilities:
      - state
      - discover
      - catalog
    settings:
      - name: example_setting_one
        kind: password
      - name: example_setting_two
files:
  - name: analyze-example
    namespace: tap_example
    update:
      analyze/datasets/tap-example: true
    pip_url: git+https://github.com/Matatika/analyze-example.git
```