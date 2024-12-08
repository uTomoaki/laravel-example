# Laravel プロジェクトサンプル

## 概要

Laravel と DB（MySQL）を使用したプロジェクト作成用のテンプレートです。

## MW

| MW      | バージョン |
| ------- | ---------- |
| PHP     | 8.2.7      |
| Laravel | 10.48.25   |
| MySQL   | 8.0        |
| Docker  | 3          |

# 環境構築手順

1. リポジトリのクローン
2. `sh init.sh`を実行 → `[INFO]初期設定が正常に完了しました。`の出力を確認
3. `docker compose exec -e XDEBUG_MODE=off app php artisan serve --host 0.0.0.0`を実行
4. `http://0.0.0.0:8000`へアクセスし、Laravel の初期画面が表示されることを確認

# Larastan の実行方法
- level5で設定

```
./vendor/bin/phpstan analyse
```
