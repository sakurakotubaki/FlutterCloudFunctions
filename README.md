# functions_app
Cloud FunctionsのDemoアプリ

- 機能要件
  - Cloud Functionsで追加、更新、削除がされる関数を作成
    - コードはTypeScriptで作成.
    - ESLintは設定したが、なしでもOK.
    - ESLintはDefaultの設定はチェックが厳しかった!

------

## Flutterでアプリを作成
アプリ側から、FireStoreに値が追加されたら関数が実行される動作検証用のアプリを作成する。

## 気になったこと
buyersコレクションを削除してもデータが消えないことがあった?
更新をして、削除をしたらすぐに消えた?
