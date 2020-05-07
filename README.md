
# clamshieldcli #

- author/site : Jimmy MG Lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/clamshieldcli

This project consists of two parts : (1) clamshield-cli - a cli wrapper for clamav (2) clamshield - a macos ui for clamshield. clamshield-cli is a commandline application that does the following:

* provides a single maintained scan of one location
* a strategic sweep of systemwide files and folders
* a strategic incremental scan for memory limited machines or instances (less than 512mb)

The rational for this is that clamav is traditionally very memory intensive. it was designed to place files in memory as well as virus signatures for scanning. it is common for out of memory issues to happen if configured improperly. infact it almost always runs out of memory.

This project aims to simply use progressive incremental techniques of marking and isolation of files to scan a system. Ideally this deals with both micro vms or docker containers.

# To use #

requirements,

- linux debian / ubuntu
- macosx

to run and see options/help,
```
$ sh clamshield.xxxx.sh
```


# Guidelines #

a few points to note before submitting PR :

- ensure this is tested on debian (as indicated in vagrantfile)

# References #

- http://forums.clamwin.com/viewtopic.php?t=4279 (for 5 phase clamav scanning optimisation)

# License #

Copyright 2018 Jimmy MG Lim (mirageglobe@gmail.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

License Breakdown: https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)

