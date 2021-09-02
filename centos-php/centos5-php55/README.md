# centos5-php55

docker イメージをビルド
```
docker build -t centos5-php55 .
```

初期設定ファイル
```
./docker/centos5-php55-init.d
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
           -v ./docker/centos5-php55-init.d:/docker-entrypoint-init.d \
           -p 9055:80 \
           --name c5-php55 wetoda/centos5-php55 /sbin/init
```
