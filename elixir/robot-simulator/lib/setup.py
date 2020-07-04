import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="pytorch-tf-BRAD-HANKS",
    version="0.0.1",
    author="Brad Hanks",
    author_email="hanks.brad@gmail.com",
    description="Converts a nx2 pytorch dataset into a tensorflow dataset",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/bradhanks/pytorch-tf",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)