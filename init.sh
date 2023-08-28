#!/bin/bash

# 開始
echo "=================================================="
echo "                                                               "
echo "####                                                   ####    "
echo " #                                                        #    "
echo " #                                                        #    "
echo " #                                                        #    "
echo " #         ####   ### ##     ####   ##   ##    ###        #    "
echo " #        #    #    ##  #   #    #  #     #   #   #       #    "
echo " #             #    #   #        #  #     #  #     #      #    "
echo " #         #####    #        #####   #   #   #######      #    "
echo " #        #    #    #       #    #   #   #   #            #    "
echo " #    #  #     #    #      #     #   #   #   #            #    "
echo " #    #  #     #    #      #     #    # #    #     #      #    "
echo " #    #  #    ##    #      #    ##    # #     #    #      #    "
echo "#######   #### ## ######    #### ##    #       ####   ######## "
echo "                                                               "
echo "\033[36m[INFO]初期設定を開始します。\033[0m"

# Dockerイメージのビルド
STEP="Dockerイメージのビルド"
echo "\033[36m[INFO]"$STEP"を開始します。\033[0m"
docker-compose build --no-cache \
    || { echo "\033[31m"$STEP"に失敗しました。\033[0m" \
        ; echo "==================================================" \
        ; exit 1; }

echo "\033[36m[INFO]"$STEP"が完了しました。\033[0m"

# Dockerコンテナの起動
STEP="Dockerコンテナの起動"
echo "\033[36m[INFO]"$STEP"を開始します。\033[0m"
docker-compose up -d \
    || { echo "\033[31m"$STEP"に失敗しました。\033[0m" \
        ; echo "==================================================" \
        ; exit 1; }

echo "\033[36m[INFO]"$STEP"が完了しました。\033[0m"

# Laravelの依存関係のインストール
STEP="Laravelの依存関係のインストール"
echo "\033[36m[INFO]"$STEP"を開始します。\033[0m"
docker-compose exec -e XDEBUG_MODE=off app composer install \
    || { echo "\033[31m"$STEP"に失敗しました。\033[0m" \
        ; echo "==================================================" \
        ; exit 1; }

echo "\n"
echo "\033[36m[INFO]"$STEP"が完了しました。\033[0m"

# .envファイルのコピー
STEP="envファイルのコピー"
echo "\033[36m[INFO]"$STEP"を開始します。\033[0m"

if [ ! -f ./laravel-app/.env ]; then
    cp ./laravel-app/.env.example ./laravel-app/.env \
        || { echo "\033[31m"$STEP"に失敗しました。\033[0m" \
            ; echo "==================================================" \
            ; exit 1; }
fi

echo "\033[36m[INFO]"$STEP"が完了しました。\033[0m"

# アプリケーションキーの生成
STEP="アプリケーションキーの生成"
echo "\033[36m[INFO]"$STEP"を開始します。\033[0m"
docker-compose exec -e XDEBUG_MODE=off app php artisan key:generate \
    || { echo "\033[31m"$STEP"に失敗しました。\033[0m" \
        ; echo "==================================================" \
        ; exit 1; }

echo "\033[36m[INFO]"$STEP"が完了しました。\033[0m"

# Todo: マイグレーション作成後、下記コメントアウトを外す
# マイグレーションの実行
# STEP="マイグレーションの実行"
# echo "\033[36m[INFO]"$STEP"を開始します。\033[0m"
# docker-compose exec -e XDEBUG_MODE=off app php artisan migrate \
    # || { echo "\033[31m"$STEP"に失敗しました。\033[0m" \
    #     ; echo "==================================================" \
    #     ; exit 1; }
# echo "\033[36m[INFO]"$STEP"が完了しました。\033[0m"

# 終了
echo "\033[36m[INFO]初期設定が正常に完了しました。\033[0m"
echo "=================================================="
