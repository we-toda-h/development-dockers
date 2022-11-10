# centos7-php72

docker イメージをビルド
```
docker build -t centos7-php72 .
```

初期設定ファイル
```
./docker/centos7-php72-init.d
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
           -v ./docker/centos7-php72-init.d:/docker-entrypoint-init.d \
           -p 9072:80 \
           --name c7-php72 ghcr.io/we-toda-h/centos7-php72 /sbin/init
```
