# Laravelプロジェクトサンプル
## 概要
LaravelとDB（MySQL）を使用したプロジェクト作成用のテンプレートです。

## MW
| MW | バージョン |
| - | - |
| PHP | 8.2.7 |
| Laravel | 10.20.0 |
| MySQL | 8.0 |
| Docker | 3 |

# 環境構築手順
1. リポジトリのクローン
2. `sh init.sh`を実行 → `[INFO]初期設定が正常に完了しました。`の出力を確認
3. `docker compose exec -e XDEBUG_MODE=off app php artisan serve --host 0.0.0.0`を実行
4. `http://0.0.0.0:8000`へアクセスし、Laravelの初期画面が表示されることを確認
