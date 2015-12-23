# display-test-machine-web

## ビルド & 実行

### 環境をビルドする

```
# ビルド
$ docker-compose build
# 実行 
$ docker-compose  up
```

## 設定

### スクリーンショット先のホストディレクトリの設定

```
# capybara_conf.rb

Capybara.configure do |config|
  config.app_host = "http://www.google.com/"
end

```

### スクリーンショット先のurlの設定

```
# screenshot.rb

pages = [
  "",
]

```
