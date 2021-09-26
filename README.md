# docker-schemaspy

SchemaSpy公式Dockerイメージに日本語フォントをインストールし、日本語化する方法をご紹介します。

## Dockerイメージを作成

1. Dockerイメージを作成します。

    ```shell
    docker build -t schemaspy/japanese:ipaexg00401 .
    ```

1. Dockerコンテナを起動して、`SchemaSpy`を実行します。

    ```shell
    docker run \
        --rm \
        --net=host \
        -v $PWD/output:/output \
        -v $PWD/schemaspy.properties:/schemaspy.properties \
        schemaspy/japanese:ipaexg00401 -vizjs
    ```

## Docker HubからDockerイメージをプル

1. Docker HubからDockerイメージをプルします。

    ```shell
    docker pull cmfujikawa/schemaspy
    ```

1. Dockerコンテナを起動して、`SchemaSpy`を実行します。

    ```shell
    docker run \
        --rm \
        --net=host \
        -v $PWD/output:/output \
        -v $PWD/schemaspy.properties:/schemaspy.properties \
        cmfujikawa/schemaspy -vizjs
    ```

## 共通

1. `./output`フォルダに実行結果が出力されます。
1. `./output/index.html`ファイルをブラウザで開きます。

## 参考

- [SchemaSpyで日本語カラム名を含むデータベースからER図を作成 - Developers.IO](https://dev.classmethod.jp/articles/schemaspy-docker-localize-jp/)
- PostgreSQLのサンプルデータベース([cm\-fujikawa/docker\-postgres\-dvdrental](https://github.com/cm-fujikawa/docker-postgres-dvdrental))をDocker環境に構築
