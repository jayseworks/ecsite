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

### コマンド集

### rubocop
```
docker compose run --rm web bundle exec rubocop
```
