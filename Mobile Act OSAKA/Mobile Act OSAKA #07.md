Mobile Act OSAKA #07
====================

## 概要
- 日時: 2018/11/16 18:45 - 21:30
- [Mobile Act OSAKA \#7 \- connpass](https://mobileact.connpass.com/event/99908/)


## usami-k「Xamarin を使った iOS アプリ開発の現場から」


## shohei「仮想通貨アプリを作ったけどAppleReviwerに弾かれた話」
Appleレビューワーからの国際電話 日本時間19時くらい。

暗号通貨のトランザクションを発生させるアプリは、法人アカウントでの申請が必要(規約化された)。  
Opening Line Ventures からリリースした。


## itok「そら案内の作り方」
- 気象データ (日本気象協会との契約)
- サーバー
- クライアント

政令指定都市になると区ができる。  
そら案内アプリリニューアル予定。


## Takanori Hirobe「Swift Package Managerについて」
現時点で、Swift Package Manager は iOSアプリに対応していない。  
(将来的な対応は予定されている)


## minomata「モバイルアプリ開発に使える設計の話」
MVVM + Clean Architecture  
補助: DI, Rx

制御の反転のためにDIを利用。  
依存を単方向に。


## Hiron「4000のワーニングと戦え！これは警告だ！」
警告とは、コンパイラ判断でバグではないかと思われる箇所の指摘。  
Xcode がコンパイル時に出してくれる警告を放置しがち。  

警告をエラー扱いにする設定がある。  
CIビルド時にこの設定を有効にして、警告が増えないように。

## KatsukiNakatani「個人でもできる簡単CI/CD(Android)」
CircleCI を選択。無料でプライベートリポジトリを参照可能(1コンテナのみ)。

配信先の検討
* DeployGate
    - aab に対応してなかった
    - リリース時は Google Play が必要
* Google Play
    - αやβのリリースチャンネルがある
        + 軽い審査がある(3時間くらい)
    - 内部テストチャンネル
        + 審査なしで即座にリリース可能


## Kenta Nakai「Asset Catalog再入門」
* ベクターイメージ(PDF)を利用可能  
    - iOS11以上、Preserve Vector Data でPDFサイズ以上に拡大しても滲まなくなった。
* 色の管理 (ColorSet)
    - 色に名前をつけて、その名前をコード中に利用できる。

アセットが肥大化してきたとき、
1. namespaces
    - フォルダごとに名前空間を設定できる
2. アセットカタログを別ける
    - ファイルは分かれるように見えるが、実際はできない
    - bundleで別ける

