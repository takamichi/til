## 概要
- 日時: 2018/10/05 19:00-21:00
- [Umeda\.go 2018 Autumn \- connpass](https://umedago.connpass.com/event/98745/)

## GoでWebSocketサーバー開発色々やってみました
golang の websocket パッケージは機能が足りないので非推奨。

発表者が使用したのは [gorilla/websocket: A WebSocket implementation for Go\.](https://github.com/gorilla/websocket) 。
- 分割されたメッセージの受信
- ping and pong
- close message

フレームワーク: [gin\-gonic/gin: Gin is a HTTP web framework written in Go \(Golang\)\. It features a Martini\-like API with much better performance \-\- up to 40 times faster\. If you need smashing performance, get yourself some Gin\.](https://github.com/gin-gonic/gin) 
MessagePack: [vmihailenco/msgpack: msgpack\.org\[Go\] MessagePack encoding for Golang](https://github.com/vmihailenco/msgpack)


## GoでAPIサーバーを立てて得た知見
Echo のミドルウェアサポートが便利。


## よくあるWebサービスのAPIを作ったらいろいろ勉強になった話
[よくあるWebサービスのAPIを作ったらいろいろ勉強になった話/WebApplicationAPITips \- Speaker Deck](https://speakerdeck.com/decafe09/webapplicationapitips)

GopherJS + Vecty


## Goだけで〇〇〇〇を作ってみた
[Goだけでロビーサーバーを作ってみた \- Speaker Deck](https://speakerdeck.com/nobonobo/godakederobisabawozuo-tutemita)
