router_crypt
============

About
-----
Ruby library and executable to (de)crypt various router vendors (JunOS, IOS, NXOS) password.


Installation
------------
gem install router_crypt


CLI usage
---------
rtrcrypt [encrypted password]


Library usage
-------------
```
require 'router_crypt'

RouterCrypt::IOS.decrypt ios_pw
RouterCrypt::NXOS.decrypt nxos_pw
RouterCrypt::JunOS.decrypt junos_pw
```


Thanks
------
I've ripped the JunOS algo from CPAN Crypt::Juniper by Kevin Brintnall. IOS algo
source is unknown I've ported it long time ago from anonymous perl source.


License
-------
Public domain, copyleft, whatnot
