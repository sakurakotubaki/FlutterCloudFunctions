# Cloud Functionsを使う

## ローカル環境で使用する

1. エミュレーターの初期をする
```
firebase init emulators
```

2. エミュレーターの起動
```
firebase emulators:start
```

-------
## 本番環境にDeploy

**ターミナルで実行するコマンド**
```
firebase deploy --only functions
```
