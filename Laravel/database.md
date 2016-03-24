Database
========

## JSONカラムの内容で検索

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


## whereIn()で配列と同じ順序で取得する(MySQL)

```php
<?php
$idList = [20, 30, 10];

$records = \DB::table('accounts')
            ->whereIn('id', $idList)
            ->orderByRaw('FIELD(`id`, ' . implode(',', $idList) . ')')
            ->get();
```
