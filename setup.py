from setuptools import setup, find_packages

setup(
    name="tap-example",
    version="0.1.0",
    description="Meltano project file bundle of Matatika datasets for tap-example",
    packages=find_packages(),
    package_data={
        "bundle": [
            "analyze/datasets/tap-example/*.yml",
        ]
    },
)
