# README

## 環境構築

```shell
# entrypoint.shの以下の行をコメントアウトした上でmake upでコンテナを起動する
# bundle exec ridgepole -c config/database.yml -E $db_env -f db/Schemafile --apply
make up

# コンテナを立ち上げた状態で、データベースを作成する
make create

# テーブルを作成する
make migrate

# シードデータを登録する
make seed

# 上記のコメントアウトを戻した状態で、再度コンテナを起動する
make up
```

## 以下のようなエラーが出てdatebaseに接続できない際の対処法

docker-compose run --rm api rails db:create
```
[+] Running 1/0
 ⠿ Container fill-home-app-db-1  Running                                                   0.0s
[ERROR] We could not find your database:  fill-home-app. Which can be found in the database configuration file located at config/database.yml.

To resolve this issue:

- Did you create the database for this app, or delete it? You may need to create your database.
- Has the database name changed? Check your database.yml config has the correct database name.

To create your database, run:

        bin/rails db:create

        /usr/local/bundle/gems/activerecord-7.0.4/lib/active_record/connection_adapters/postgresql_adapter.rb:81:in `rescue in new_client'
make: *** [create] Error 1
```

