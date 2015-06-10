if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# http://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
export PATH=/usr/local/bin:$PATH
export PATH=/usr/lib/postgresql/9.1/bin:$PATH
export ARCHFLAGS="-arch x86_64"
export PIP_REQUIRE_VIRTUALENV=true


