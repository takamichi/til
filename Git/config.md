Git設定
=======

## リベースの時、自動でstash->popしてくれる

### gitconfig

```
[rebase]
	autostash = true
```

### config コマンド

```sh
git config --global rebase.autostash true
```

### rebase コマンド

```sh
git rebase —autostash {BRANCH}
```
