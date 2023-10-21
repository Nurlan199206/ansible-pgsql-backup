#!/bin/bash
# Location to place backups.
backup_dir="/home/nurlan/"

#String to append to the name of the backup files
backup_date=`date +%d-%m-%Y`


#Numbers of days you want to keep copie of your databases
number_of_days=15
databases=`sudo -iu postgres psql -l -t | cut -d'|' -f1 | sed -e 's/ //g' -e '/^$/d'`


#exclude databases
for i in $databases; do if [ "$i" != "postgres" ] && [ "$i" != "template0" ] && [ "$i" != "template1" ] && [ "$i" != "template_postgis" ] && [ "$i" != "nurlan" ]; then
echo Dumping $i to $backup_dir/$i-$backup_date.sql
PGPASSWORD=123 pg_dump -U postgres -h 192.168.1.150 -Fc $i > $backup_dir/$i-$backup_date.sql
#bzip2 $backup_dir/$i-$backup_date.sql
#ln -fs $backup_dir/$i-$backup_date.sql.bz2
fi
done
#find $backup_dir -type f -prune -mtime +$number_of_days -exec rm -f {} \;
