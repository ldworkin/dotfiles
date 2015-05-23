if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# http://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export ARCHFLAGS="-arch x86_64"
export PIP_REQUIRE_VIRTUALENV=true
export CASTRO_DATA_DIR=~/Dropbox/NetworksData/castro-movies

# http://mkelsey.com/2013/04/30/how-i-setup-virtualenv-and-virtualenvwrapper-on-my-mac/
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


