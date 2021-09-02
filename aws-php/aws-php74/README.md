# aws-php74

docker イメージをビルド
```
docker build -t aws-php74 .
```

初期設定ファイル
```
./docker/aws-php74-init.d
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
           -v ./docker/aws-php74-init.d:/docker-entrypoint-init.d \
           -p 9074:80 \
           --name aws-php74 wetoda/aws-php74
```
