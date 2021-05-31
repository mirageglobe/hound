
# hound

- author/site : Jimmy MG Lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/hound

```
             .--^~,__
 `-,,,,-------'~~'._.'
  `-,,,  ,_      ;
   _,-' ,'`-__; '--,
  (_/`~~      ''''{;
```

Hound is a cli tool that is based off clamav and chrootkit.

There is also several handy cron example scripts for setting up clamav. infact it almost always runs out of memory. This project aims to simply use progressive incremental techniques of marking and isolation of files to scan a system. Ideally this deals with both micro vms or docker containers.

Hound is a commandline application that does the following :

- provides a single maintained scan of one location
- a strategic sweep of systemwide files and folders
- a strategic incremental scan for memory limited machines or instances (less than 512mb)

Use cases :

- as a commandline tool for scanning
- as a prehook vulnerability scanner for git

# instructions

requirements :

- linux debian
- linux ubuntu
- macosx

to install and run,

```

```

or to clone repo run,

```
$ ./clamshield --help
$ ./hound/clamshield scan              # scan contents of current folder
$ ./hound/clamshield update            # update virus definitions
```

# roadmap

- include vulnerability scanner https://github.com/dxa4481/truffleHog
- include repo scanner

# guidelines

a few points to note before submitting PR :

- ensure this is tested on debian (as indicated in vagrantfile)

# references

- http://forums.clamwin.com/viewtopic.php?t=4279 (for 5 phase clamav scanning optimisation)
- https://github.com/ezekg/git-hound
- https://github.com/UKHomeOffice/repo-security-scanner
- https://geekflare.com/github-credentials-scanner/

# license

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

