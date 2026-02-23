# linux-scripts

 Some useful scripts for automation of sysadmin everyday life
 
## cron example

```cron
MAILTO=didim@localhost

# m h  dom mon dow   command
# SMART monitoring
0  1 1 * * /home/didim/bin/disks-auto

# Local backup
0  1 1 * * /home/didim/bin/bu-etc
0  3 * * * /home/didim/bin/bu-mysql >> /home/didim/bin/log/mysql.log
20 3 * * * /home/didim/bin/rsync-home
30 3 * * * /home/didim/bin/rsync-web
45 3 * * * /home/didim/bin/rsync-docker
0  5 * * 0 /home/didim/bin/rsync-raid

```
