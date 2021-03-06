#!/bin/bash

# lock logic for semaphore - http://mywiki.wooledge.org/BashFAQ/045
lockdir=/tmp/cron_sh.lock
echo >&2 "$(date '+%Y-%m-%d %H:%M:%S') #################################################"
if mkdir "$lockdir"
 then    # directory did not exist, but was created successfully
     echo >&2 "successfully acquired lock: $lockdir"

cd ../../.. $(pwd)
##########################################################################################################

# -----------------------------------------------------------------
# Sfplatform --->
# ==========
$(pwd)/core/lib/Cake/Console/cake -app $(pwd)/app cron main

##########################################################################################################
	rmdir "$lockdir"
 else
     echo >&2 "cannot acquire lock, giving up on $lockdir"
     exit 0
 fi
