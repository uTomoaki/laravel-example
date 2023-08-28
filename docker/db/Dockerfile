# MySQL用のDockerfile
FROM mysql:8.0

# 環境変数の設定
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=myapp
ENV MYSQL_USER=myapp
ENV MYSQL_PASSWORD=myapp

# 設定ファイルのコピー
COPY ./my.cnf /etc/mysql/conf.d/my.cnf
