# xvcfsubsample

Define a WDL workflow to subsample jointly called VCF files. This workflow accepts an input VCF referenced with either a
[DRS](https://support.terra.bio/hc/en-us/articles/360039330211-Data-Access-with-the-GA4GH-Data-Repository-Service-DRS-)
URI or Google Storage URL, and an array of sample IDs. Output is a Google Storage URL.

### Description

In order to keep hard disk requirements small and improve performance, input/output objects are streamed directly from
cloud storage using FIFO queus (named pipes).

An appropriate workflow configuration is ~16GB RAM, ~8 CPUs, and standard storage.
