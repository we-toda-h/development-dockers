# aws-php80

docker イメージをビルド
```
docker build -t aws-php80 .
```

初期設定ファイル
```
./docker/aws-php80-init.d
```

コンテンツ
```
./docker/html
```

ログ出力先
```
./docker/log
```

コンテナを起動
```
docker run --rm --privileged -it -d  \
           -v ./docker/html:/var/www/html \
           -v ./docker/log:/var/log/output \
           -v ./docker/aws-php80-init.d:/docker-entrypoint-init.d \
           -p 9074:80 \
           --name aws-php80 wetoda/aws-php80
```
