Docker Meetup Kansai #3
=======================

- 日時: 2019/05/24(金) 19:00 〜 21:30
- 場所: さくらインターネット株式会社 大阪本社
- [Docker Meetup Kansai \#3 \- connpass](https://dockerkansai.connpass.com/event/129089/)

## DockerCon 2019振り返りとまとめ(仮) - @zembutsuさん
DockerCon 2019 で発表されたことのまとめ。

CodePass、アメリカで学術的技術とビジネス領域で使われている技術の乖離を埋めるための取り組み。

### DockerCon 2019 での主な発表
* Docker Enterprise 3.0
* Docker Kubernetes Service (DKS) 
* docker/buildx
    - `docker build` とは別のコマンド。BuildKitが最初から有効なビルドコマンド。
    - https://github.com/docker/buildx
    - 現時点では Tech Preview

## Dockerfile Best Practices DCSF19を読み込む - @zembutsuさん
[Best practices for writing Dockerfiles \| Docker Documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

`Dockerfile` ･･･ Dockerイメージを作るための青写真

* COPY で `.` を指定するのではなく、ファイルを指定する
* 行を && でまとめる 
* パッケージのインストール時に不要な依存関係をいれない
* 適切なベースイメージを使う。公式で用意されているものがあればそれを優先して使う
* latestタグより、バージョン指定のタグ
* `docker build --targer ステージ名` でそのステージのみのビルドが可能
* --mount でのキャッシュ

## jupyterhubのdockerspawnerの紹介 - kozo2さん
JupyterHub

## AB test with Docker - chimameさん
Docker 使ってABテスト  
ALBでsticky session

## オンプレでPrivate Registry使ったDockerイメージの運用について - やっさん
Portus, Harbor  
Dragonfly, Kraken
