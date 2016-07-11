README
======

Bootstrap a salt server

Cloud providers have a once off script that can be run on first boot. We want two very simple scripts that do 4 things:

1) Run the current bootstrap script from a github repository
2) Run any role specific bootstrap script to install salt minion or master
3) Copy any logs from the the scripts above to the root home
4) Reboot the instance

    #!/bin/sh

    # For the salt master
    curl -L https://raw.githubusercontent.com/bretth/bootstrap/master/bootstrap.sh | sh 
    source bootstrap/master.sh
    # On vultr the output is logged to /tmp
    cp /tmp/*.log /root
    reboot

    #!/bin/sh

    # for the salt minion
    curl -L https://raw.githubusercontent.com/bretth/bootstrap/master/bootstrap.sh | sh 
    source bootstrap/minion.sh
    # On vultr the output is logged to /tmp
    cp /tmp/*.log /root
    reboot

Note that in some providers such as Vultr creating a new instance is not the same as re-installing an existing instance.

