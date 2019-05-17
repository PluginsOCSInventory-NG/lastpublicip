##
# LAST PUBLIC IP PLUGIN
# Author: Valentin COSSE & Valentin DEVILLE
##
package Apache::Ocsinventory::Plugins::Lastpublicip::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;
$DATA_MAP{lastpublicip} = {
   mask => 0,
   multi => 1,
   auto => 1,
   delOnReplace => 1,
   sortBy => 'IP',
   writeDiff => 0,
   cache => 0,
   fields => {
        IP => {},
        CITY => {},
        ORG => {}
    }
};
1;
