# README
## デモ動画

### ユーザー側
https://github.com/nagaoka1166/spark-2023-teamA-backend/assets/69971830/ab1b0c86-d9bf-4495-86c9-c6ba9867d007

### アドミン（管理者)側


https://github.com/nagaoka1166/spark-2023-teamA-backend/assets/69971830/f38ff905-6c3b-4621-ba5c-79a018b3a100



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

