## サービス概要
ライブやフェスに参加するユーザーが自身の体験を記録・管理できるアプリケーション

## このサービスへの思い・作りたい理由
- 学生時代にライブやフェスに頻繁に行き、ノートにセットリストやチケットをまとめていた経験と、自身がバンドで年間100本以上ライブをしていた経験から、ライブに関係する情報を管理できるアプリを作りたいと思いました。

## ユーザー層について
- ライブハウスやフェスに行く人

## サービスの利用イメージ
- ライブのセットリストや写真を記録する
- 購入したグッズを記録する
- 参戦予定のライブを確認できる

## ユーザーの獲得について
- SNSや身近にいるライブが好きな人たちに使ってもらう

## サービスの差別化ポイント・推しポイント
- 記録したセットリストをSpotifyのプレイリストにし、ライブを振り返れる
- 購入したグッズも記録でき、どのライブのグッズか記録できる

## 機能候補　
### MVPリリース時
- ユーザー登録機能
- ログイン機能
- ライブ記録機能
- チケットの記録機能
- セットリスト記録
- グッズ記録機能
- マイページ
- セットリストをSpotifyのプレイリストにして再生できる機能

### 本リリース時
- SNS共有
-  スケジュール機能

## 機能の実装方針予定
- Spotify APIを使用してセットリスト順のプレイリストを作成

## 技術スタック
### サーバサイド
- Ruby 3.2.2
- Rails 7.1.3
### フロントエンド
- JavaScript
### CSSフレームワーク
- Bootstrap 
### データベース
- PostgreSQL
### Web API
- Spotify API
### インフラ
- Fly.io

## 画面遷移図
https://www.figma.com/design/fdxmMS8NNprEXDD81lm3RD/Portfolio?node-id=0-1&t=yOS16NimnyfUxXSw-1

## ER図
![Alt text](Portfolio2.png)