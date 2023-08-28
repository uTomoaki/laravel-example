# Laravelプロジェクトサンプル

# 環境構築手順
1. リポジトリのクローン
2. `sh init.sh`を実行 → `[INFO]初期設定が正常に完了しました。`の出力を確認
3. `docker compose exec -e XDEBUG_MODE=off app php artisan serve --host 0.0.0.0`を実行
4. `http://0.0.0.0:8000`へアクセスし、Laravelの初期画面が表示されることを確認
