# xvcfsubsample

Define a WDL workflow to subsample jointly called VCF files. This workflow accepts input as array of reference URIs. The
reference URIs should be either Google Storage URLs or
[DRS](https://support.terra.bio/hc/en-us/articles/360039330211-Data-Access-with-the-GA4GH-Data-Repository-Service-DRS-)
URIs.

### Description

In order to keep hard disk requirements small and improve performance, input/output objects are streamed directly from
cloud storage using FIFO queus (named pipes).

An appropriate workflow configuration is ~16GB RAM, ~8 CPUs, and standard storage.
