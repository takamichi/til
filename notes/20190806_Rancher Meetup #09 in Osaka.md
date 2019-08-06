Rancher Meetup #09 in Osaka
===========================

- 日時: 2019/08/06 18:30-21:00
- 場所: さくらインターネット本社(グランフロント大阪タワーA 35F)
- [Rancher Meetup #09 in Osaka - connpass](https://rancherjp.connpass.com/event/137878/)


## Rancherの全プロダクト解説 - cheng さん (RancherLab)

### Rancher
* ver.2.3 で Istio デフォルト搭載

### k3s
* バイナリ40MB, 250MBメモリ使用量の軽量な動作
* 1バイナリ

### RancherOS
* 

### K3os
* Kubernertes 特化のOS
* Ubuntuベース

### Submariner
* マルチクラスタ間通信
* pre-release 段階

### Longhorn
* 分散ブロックストレージ
* CNCFに寄贈作業中

### Rio
* micro PaaS based Kubernetes


## オンプレ×Google Cloud PlatformなML基盤におけるRancherの活用 - やっさん さん
Rancher, Kubeflow を利用のPoCレベルの内容。

* Rabcherを選んだ理由
    - オンプレとクラウドの両方をカバーできる
    - Rancherにロックインされたくない (Kubernetes だけに移れる)
    - Kubernetesに強い人がいない


## AlpacaJapanの機械学習環境になぜRancherが必要なのか？ - sasaki さん
Tick (ティック) ･･･ 取引の最小単位

### マネージドKubernetesがあるのに、Rancherを使う理由
* クラスタの増加
    - マルチクラスタのデメリット
        + 複数のURL、kubeconfig
        + クラスタ分の料金が発生
    - シングルクラスタのデメリット
        + バージョンアップなどのメンテナンス、障害時に影響が多い
* 利用ユーザーの増加
    - 権限管理が煩雑に
* 利用シーンの増加

Rancherでマルチクラスタを管理できる。


## Rancher本をナナメ読み - katsuhiro

RancherによるKubernetes活用完全ガイド（Think IT Books） - インプレスブックス
https://book.impress.co.jp/books/1119101048



