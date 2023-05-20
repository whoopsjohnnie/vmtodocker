
# 
apt list --installed > ./installed.packages.txt

# Backup your packages list
# Get a packages list
dpkg --get-selections > ./Package.list

# Copy list of repositories
cp -p /etc/apt/sources.list ./
cp -p -R /etc/apt/sources.list.d ./

# Export repo keys
apt-key exportall > ./Repo.keys

