FROM php:8.4-apache

#  Apacheのmod_rewrite（URL書き換え）モジュールを有効化
RUN cd /etc/apache2/mods-enabled \
  && ln -s ../mods-available/rewrite.load

#  カスタムPHP設定とApacheのバーチャルホスト設定を追加
ADD php.ini /usr/local/etc/php/
ADD 000-default.conf /etc/apache2/sites-enabled/

RUN apt-get update \
  && apt-get install -y \
    git \
    zip unzip \
    libzip-dev \
    vim \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libpq-dev \
    libonig-dev \
    libxml2-dev \
  && docker-php-ext-configure zip \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install \
    pdo pdo_mysql mysqli zip gd

#  GD（画像処理ライブラリ）をJPEG/Freetype対応でビルド
RUN docker-php-ext-configure gd \
  --with-freetype=/usr/include/ \
  --with-jpeg=/usr/include \
  && docker-php-ext-install -j$(nproc) gd

#  Composerのインストール（古典的な方法）
# 後で COPY --from=composer:latest でも上書きされるので冗長かも
RUN cd /usr/bin \
  && curl -s http://getcomposer.org/installer | php \
  && ln -s /usr/bin/composer.phar /usr/bin/composer

#  Composerの環境変数と実行ファイルのコピー（推奨のインストール方法）
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

#  最新のcomposerバイナリを別ステージからコピー（推奨）
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#  Composerのバージョンを2に固定
RUN composer self-update --2

#  Node.js 20.x のインストール（最新のLTS対応）
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

#  npm環境構築（フロントビルドツール用）
RUN rm -rf node_modules                              # node_modules削除（前段のゴミ削除）
RUN npm install -g npm n cross-env                   # npm自体 + cross-envなどツールをグローバルに
RUN npm cache clear --force                          # npmキャッシュ削除でクリーンな状態に
RUN npm install webpack --save                       # webpackインストール（ローカルプロジェクト想定）
RUN npm install node-sass --nodedir=/usr/include/node # node-sassビルド用にnodeヘッダ指定