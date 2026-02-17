# ECサイト

Rails 8 + SQLite3 を Docker で動かすECサイト

## 動作環境

- Docker
- Docker Compose

## セットアップ & 起動手順

### 1. イメージをビルド

```bash
docker compose build
```

### 2. データベースを作成・マイグレーション

```bash
docker compose run --rm web rails db:migrate
```

### 3. アプリを起動

```bash
docker compose up
```

### 4. ブラウザでアクセス
```arduino
http://localhost:3000
```

### 5. コンテナ停止

```bash
docker compose down
```

## コマンド集

### 監視ビルド（SCSS保存するたびに自動ビルドされる）

```
docker compose run --rm web npm run watch:css
```

### 再ビルド

```
docker compose build --no-cache
```

### Rails

```
docker compose run --rm web bin/rails g model User name:string
docker compose run --rm web bin/rails g controller Users index
docker compose run --rm web bin/rails c
docker compose run --rm web bin/rails db:migrate
docker compose run --rm web bin/rails test
```

### RuboCop

```
docker compose run --rm web bundle exec rubocop
```

### CSS

```
docker compose run --rm web bin/rails css:build
```
