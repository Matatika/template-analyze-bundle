# Using this template

Set up find `tap-example` and `TODO` in all files and folders in this project and update as required.

- [ ] Update directory tap-example with your taps name under `bundle/analyze/datasets/tap-example`.
- [ ] Update `Makefile`, replacing `tap-example` with your tap name.
- [ ] Updated `setup.py` replacing `tap-example` with your tap name.
- [ ] Update `README` replacing `tap-example`, `tap_example` and `analyze-example`.
- [ ] Update `README` adding your tap and analyze bundle details in the example snippets.

A `README` template is included below.

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