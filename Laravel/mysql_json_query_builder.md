MySQL5.7のJSONカラムの内容で検索
=============================

Laravel 5.2.23 からJSONカラムの内容に対してQuery Builderで指定ができるようになるぽい。


```json
{
  "name": "takamichi",
  "gender": "male"
}
```

みたいなJSONが入った`profile`というJSON型のカラム名に対して検索するなら

```php
Eloquent::where('profile->name', 'takamichi')->first();
```

こんな感じ。

whereのカラム名指定に

```
カラム名->JSONキー->JSONキー(子) ...
```

のフォーマットの文字列で記述する。


2016/03/12 01:54 現在、まだ5.2.23はリリースされてない。
