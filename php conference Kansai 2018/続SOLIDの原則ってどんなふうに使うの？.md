## 続・SOLIDの原則ってどんなふうに使うの？
SOLIDの原則 - 流行ではない息の長いものなので今でも使える。そしてこれからも。

### オープンクローズドの原則 (OCP)
"バリエーションを起因として"

1. 変化する部分(バリエーション)がどこか
2. 「バリエーションの軸」に沿ってまとめられているか

`FormatterResolver` -> `***Formatter`
`***Formatter` 自身が対応する `Todo` を判別する (Command 内の switch条件の分解)
`Command` は `FormatterResolver` を使う。 `FormatterResolver` は自身が持つ複数の `***Formatter` に `Todo` を渡す。

### Visitor パターン
既存オブジェクトに対する新たな操作を構造に変更せずに追加できる。
ダブルディスパッチの応用。

条件分岐をオブジェクトでの表現に変えられないか探す。

## 関連リンク
* [続・SOLIDの原則ってどんなふうに使うの？ 〜オープン・クローズドの原則 センパイのコーディングノート編〜 - Speaker Deck](https://speakerdeck.com/hidenorigoto/sok-solidfalseyuan-ze-tutedonnahuunishi-ufalse-opunkurozudofalseyuan-ze-senpaifalsekodeingufalsetobian)
