if [ ! -f "/root/ns-letsencrypt/ns-cronjob.sh" ]; then
	git clone --recursive https://github.com/ryancbutler/ns-letsencrypt /root/ns-letsencrypt
fi

exec "$@"