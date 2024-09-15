# docker-schemaspy

SchemaSpy公式Dockerイメージに日本語フォントをインストールし、日本語化する方法をご紹介します。

## Dockerイメージを作成

1. Dockerイメージを作成します。

    ```shell
    docker build -t schemaspy .
    ```

## 共通

1. `schemaspy.properties`ファイルを設定します。
    * 例) PostgreSQLの場合

    ```shell
    export POSTGRES_USER=postgres
    export POSTGRES_PASSWORD=mysecretpassword
    export POSTGRES_DB=dvdrental

    cat <<EOF > schemaspy.properties
    schemaspy.dp=./drivers
    schemaspy.o=./output
    
    schemaspy.t=pgsql11
    schemaspy.host=host.docker.internal
    schemaspy.port=5432
    schemaspy.db=${POSTGRES_DB}
    schemaspy.s=public
    schemaspy.u=${POSTGRES_USER}
    schemaspy.p=${POSTGRES_PASSWORD}
    EOF
    ```

1. Dockerコンテナを起動して、`SchemaSpy`を実行します。

    ```shell
    mkdir output
    docker run \
        --rm \
        -v $PWD/output:/output \
        -v $PWD/schemaspy.properties:/schemaspy.properties \
        schemaspy -vizjs
    ```

1. `./output`フォルダに実行結果が出力されます。
1. `./output/index.html`ファイルをブラウザで開きます。

## 参考

- [SchemaSpyで日本語カラム名を含むデータベースからER図を作成 - Developers.IO](https://dev.classmethod.jp/articles/schemaspy-docker-localize-jp/)
- PostgreSQLのサンプルデータベース([cm\-fujikawa/docker\-postgres\-dvdrental](https://github.com/cm-fujikawa/docker-postgres-dvdrental))をDocker環境に構築
