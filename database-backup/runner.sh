action=backup
env=prod

if [ -n "$1" ]
then
	action=$1
	if [ -n "$2" ]
	then
		env=$2
	fi

	if [ $action == backup ]
	then
		/backup-db.sh $env
	elif [ $action == restore ]
	then
		/restore-db.sh $env
	else
		echo 'non valid action'
	fi
fi
