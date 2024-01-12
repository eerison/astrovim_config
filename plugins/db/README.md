### Requirements
You need to install mysql client on your machine

MacOs
```
brew install mysql-client
```

Add variables in your `~/.zshrc` config
```
export MYSQL_CLIENT=/opt/homebrew/opt/mysql-client/bin
#export PATH=$PATH:$MYSQL_CLIENT
```

- Config files will be storaged at `~/.local/share/db_ui`
- Move files from `db_ui` to storage `folder above`.
