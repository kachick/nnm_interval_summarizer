NNM Interval Summarizer
========================

[![Build Status](https://secure.travis-ci.org/kachick/nnm_interval_summarizer.png)](http://travis-ci.org/kachick/nnm_interval_summarizer)

Description
-----------

An utility for the NNM(NetworkNodeManager).
Summarize Status Polling intervals.

!Notice!
--------

* Author is just a user of NNM, Of course "No Warranty" :)

Features
--------

* "ovsnmp.conf(xnmsnmpconf -export)" to some CSV files.

Usage
-----

### Overview

```shell
$ nnm_interval_summarizer ovsnmp.conf [*ovsnmp.conf]
```

Requirements
------------

* Ruby 1.9.2 or later

  [MRI/YARV, Rubinius, JRuby](http://travis-ci.org/#!/kachick/nnm_interval_summarizer)

* striuct - 0.3.0
* time-unit - 0.0.7
* lettercase - 0.0.2

Install
-------

```shell
$ gem install nnm_interval_summarizer
```

Link
----

* [code](https://github.com/kachick/nnm_interval_summarizer)
* [issues](https://github.com/kachick/nnm_interval_summarizer/issues)
* [CI](http://travis-ci.org/#!/kachick/nnm_interval_summarizer)
* [gem](https://rubygems.org/gems/nnm_interval_summarizer)
* [gem+](http://metagem.info/gems/nnm_interval_summarizer)

License
-------

GPL 3.0

Copyright (c) 2011-2012 Kenichi Kamiya

See the file COPYING for further details.
