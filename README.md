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

