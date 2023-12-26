#!/usr/bin/expect


cd /home/amazon/box
spawn git add *
spawn git commit -m "new"
spawn git push origin main

expect -re "Username for 'https://github.com': "
send "amazon7737\n"

expect -re "Password for 'https://amazon7737@github.com': "
send "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\n"

interact



