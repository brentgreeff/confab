# DEV SETUP

Instructions are for MacOS.

#### OpenSSL

`brew install openssl@3`

look at this issue if you still have SSL issues.
https://github.com/rvm/rvm/issues/5254

#### RVM

Install RVM
- then `cd` into the project -
- it will ask you to install the correct version of ruby using RVM.

`rvm install 3.3.7 --with-openssl-dir=$(brew --prefix openssl@3)`

`rvm --default use 3.3.7`

If RVM doesn't tell you to install the correct ruby version:

`type rvm`
Does it produce `-bash: type: rvm: not found`

Make sure that the following line is in your .bashrc or .bash_profile:

```shell
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
```

### bundle

`bin/bundle`

### Start webserver etc

`bin/dev` - to start development services.

Please check for: `Listening on http://127.0.0.1:3100`
to see the PORT the web server is running on.

### Create & migrate DB

`rails db:create`

`rails db:migrate`

### Setup Lefthook (commit hooks)

`git config --unset core.hooksPath`

`lefthook install` - runs rubocop & brakeman before commiting changes.
