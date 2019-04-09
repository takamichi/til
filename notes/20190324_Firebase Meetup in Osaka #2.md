Firebase Meetup in Osaka #2
===========================

* 日時: 2019/03/24(日) 14:30 〜 17:30
* 場所: billage OSAKA - 大阪市中央区本町4丁目2番12号(東芝大阪ビル8F)

## Firebase - Michael McDonald

参考リンク

* [Introduction · A Roadmap for Node\.js Security](https://nodesecroadmap.fyi/)

### ゼロデイ攻撃

通常の脆弱性はパッチが公開され、パッチが適用されるまでの間が危険。
ゼロデイ攻撃の場合は、パッチの公開以前のバグが認識されていない段階から危険。

[CVE](https://cve.mitre.org/), [CWE](https://cwe.mitre.org/)

[ざっくり分かる脆弱性指標 \- CVE CVSS CWE \- Qiita](https://qiita.com/sahn/items/563db4345f9ce502f3d2)

サーバーレスでは、依存とアプリケーションコードの脆弱性に注意を払う。

### 悪意のあるコード/低品質コード

悪意のあるコードが製品に入ってしまう原因は、依存パッケージに悪意のあるコードが混入するなど。

パッケージマネージャーの依存パッケージのCVEをチェックする機能や、  
lockファイルを使って意図せずに依存パッケージのアップデートが行われることを避ける。

### DoS

DoSの目的

- リソースを枯渇させる
- コードエラーを意図的に起こす
- 金銭的負荷をかける

Firebase なら Scaling Control でリソース負荷の上限を設定して、想定していないレベルでのリソース利用を防ぐ。
Budget アラートで利用金額が一定レベルを超えたら通知する。

### Credentials の流出

secrets を管理するサービス・ミドルウェアの利用

HshiCorp Vault


参考: [Secrets in Serverless \| Seth Vargo](https://www.sethvargo.com/secrets-in-serverless/)

### 実行フローの不正操作

対応するための、 Firebase での新機能

* Security Controls ･･･ IAM を使用して function の操作を制限
* function別のIAM設定 ･･･ 通常は　1つのIAMですべての Function を管理するが、個別のIAMを設定できるようになる

[Spinnaker](https://www.spinnaker.io/)

