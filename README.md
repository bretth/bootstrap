README
======

Add a node with a one-off startup script that executes the current bootstrap.sh script and minion.sh or master.sh

    #!/bin/sh

    curl -L https://raw.githubusercontent.com/bretth/bootstrap/master/bootstrap.sh | sh 
    source bootstrap/minion.sh

On Vultr these scripts are executed by the VPS the very first time it starts up.

The startup script is saved to /tmp/firstboot.exec
Output produced can be found in /tmp/firstboot.log
Scripts are executed using /bin/bash (Linux)