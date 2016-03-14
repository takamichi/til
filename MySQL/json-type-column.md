JSONカラム
=========

`persons` テーブル

| id | doc |
|----|-----|
| 1  | {"last_name": "Yamada", "first_name": "Taro"} |
| 2  | {"last_name": "Suzuki", "first_name": "hanako"} |


## JSON_EXTRACT
JSONからパスを指定して値を取り出す。

```sql
SELECT JSON_EXTRACT(doc, $.last_name) as 'last name' FROM persons;
```

### 結果

| id | last name |
|---|---|
| 1 | Yamada  |
| 2 | Suzuki  |
