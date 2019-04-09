Mix Leap Study #40 - Spring BootベースのDDDサンプル徹底解説！
=======================================================

- 日時: 2019/04/04(木) 19:00 〜 21:30
- 場所: ヤフー株式会社 大阪グランフロントオフィス


## ドメイン

[system\-sekkei/isolating\-the\-domain: architecture sample using : Spring Boot gradle, Spring MVC, Thymeleaf, and MyBatis](https://github.com/system-sekkei/isolating-the-domain)

関心の分離・モジュール構造の工夫
モデリング、単純化、どのようにも書けるがコードとモデルが一致するように。

データモデルではなく計算モデルでの設計の話。

[ドメイン駆動設計 本格入門](https://www.slideshare.net/masuda220/ss-137608652)

モジュール構造の工夫の方式
- トランザクションスクリプト (やるべきではないがするなら、サービス)
- オブジェクト志向 (ドメイン)

| 要素 |  |
|---|---|
| Fact | 事実の表現 |
| Rule | 事実に基づく計算や判定のロジック |
| Goal | 知りたいこと。計算結果の表現 |

modelパッケージでドメインモデルを、typeパッケージにモデルを表現する基本部品と別けている。
どちらに置くかはコードを書きながら判断して、変わりがち。

[Home · masuda220/business\-logic\-patterns Wiki](https://github.com/masuda220/business-logic-patterns/wiki)

コレクションの合計計算ロジックをコレクションクラスに持つこともできる
その代わりコレクションクラスと要素が密結合になってしまうこともある。
疎結合にするために上の階層のクラスに持つという選択もあり得る。


## アプリケーション層
理論的にはアプリケーション層はシンプルになるはずだが、アプリケーション層にもそれなりの複雑さが残る。

アプリケーション層での要素
- Factory 計算モデルのインスタンスを生成する
- Query 計算結果を返しプレゼンテーション層へ
- Operation 計算結果からの記録・通知、データソース層へ 

要素のserviceクラスを使う、複合serviceクラス (例えば命名的には Coordinatorクラスとか)


## データソース層
計算モデルとデータモデルのマッピングを行う。

イミュータブルデータモデル

