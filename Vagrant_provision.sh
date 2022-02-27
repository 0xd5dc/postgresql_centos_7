# add postgres package repo
echo "installing postgres..."
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql14-server
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
sudo systemctl enable postgresql-14
# Configure PostgreSQL
echo "update configs..."
sudo sed -i 's/^#listen_addresses = \x27localhost\x27/listen_addresses = \x27*\x27/' /var/lib/pgsql/14/data/postgresql.conf
sudo sed -i 's/\(host  *all  *all  *\)127.0.0.1\/32/\1192.168.33.1\/32\t\ttrust\t#/' /var/lib/pgsql/14/data/pg_hba.conf
echo "starting postgres..."
sudo systemctl start postgresql-14



