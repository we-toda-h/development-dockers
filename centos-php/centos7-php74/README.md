# centos7-php74

docker イメージをビルド
```
docker build -t centos7-php74 .
```

初期設定ファイル
```
./docker/centos7-php74-init.d
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
           -v ./docker/centos7-php74-init.d:/docker-entrypoint-init.d \
           -p 9074:80 \
           --name c7-php74 ghcr.io/we-toda-h/centos7-php74 /sbin/init
```
