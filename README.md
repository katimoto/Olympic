# README

# :ocean: アプリ名:Olympic

## URL
https://www.olimpic-app.com/articles

# :speaker: 概要
記事、チャット、質問を通じて、マイナースポーツ界の発展につながるようなサービスです。このアプリはプロスポーツ選手、プロを目指している選手、社会に出てもスポーツに関わりたいOBにメリットのある場を提供いたします。

## 制作背景
日常で鳥肌が立つ経験はありますか？？スポーツは毎秒鳥肌を立たせるパワーがあります。
そんなスポーツの課題解決は3点あり、スポーツ選手の低賃金、平等なスポーツ教育の導入、社会に出た後もスポーツに関わるきっかけを与えてくれます。

## ER図
[![Image from Gyazo](https://i.gyazo.com/26dcd8adeca1a1ce2f93e1a749444635.png)](https://gyazo.com/26dcd8adeca1a1ce2f93e1a749444635)

## インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/8b0b65553498937e441a89d2e307292d.png)](https://gyazo.com/8b0b65553498937e441a89d2e307292d)

# :whale: 開発環境
【使用技術】
フロントエンド
 - HTML/CSS
 - JavaScript
 - jQuery
バックエンド
 - Ruby : 2.6.5
 - Rails : 6.0.0
Webサーバー
 - Nginx : 1.18.0
アプリケーションサーバー
 - （開発環境）Puma : 4.3.3
 - （本番環境）Unicorn : 5.4.1
データベース
 - （開発環境）MySQL 5.6.47
 - （本番環境）MariaDB : 5.5.64
インフラ
 - （開発環境のみ）Docker : 19.03.13
 - docker-compose : 1.27.4
 - AWS (EC2, S3, VPC, Route53, ALB, ACM)
 - Git, GitHub
 - CircleCI : 2.1
 - Capistrano : 3.14.1
 
## 実装機能

### :cop: ユーザー管理機能
 - デバイスの導入
 - SNS認証機能
 - 編集/詳細/削除機能
 - フォロー関係
 - ユーザーの質問一覧
 - ユーザーの記事一覧
 - そのユーザのお気に入り投稿一覧
 - PAY.JPのカード情報をユーザー情報としての保持機能
### :thought_balloon: 質問機能
 - 質問投稿機能（画像付き）
 - 編集、削除、詳細機能
 - 回答コメント機能
 - ベストアンサー機能
 - 各コメントに対するリアクション機能
 - カテゴリー検索機能(ransackの導入)
 - ベストアンサーランキング
 - ランキング機能
### :notebook: 記事機能
 - 記事投稿機能（画像付き）
 - いいね機能（非同期）
 - 編集、削除、詳細機能
 - ランキング機能
 - 回答コメント機能
 - タグ/カテゴリー検索機能(ransackの導入)
### :credit_card: 購入機能
 - ルーム出品機能
 - ルーム購入機能
 - PAY.JPでの購入
 - カード情報を保持する簡単決済
 - ルーム検索機能
 - ルームのカテゴリー機能
 - 購入画面の実装
 - お気に入り機能の実装
 - いいねランキング
### :speech_balloon: チャット機能
 - メッセージ機能（非同期）
 - 画像の送信
 - 自動スクロール機能
 - Action Cableの導入

# :evergreen_tree: 本番環境


## 必要な機能

 - 購入機能
 - チャット機能
 - 質問機能
 - 宣伝機能
 - 豊富なユーザー情報

# :eyes: 工夫したポイント

## 多機能
未経験ながら、様々なチャレンジによって多数の知識を活用しました。
 - AWSを利用した本番環境
 - Action Cableの導入
 - ajax通信による非同期機能
 - react.js/Sassといった新しい言語の導入
 - APIの導入（PAY.JP)
 - gemの多様
 - 画像プレビュー機能
 - パンくずリスト

# :see_no_evil: 苦労したポイント

## 統一感のあるUIデザイン
 - 多機能であるがゆえにシンプルにまとめることができなかった
 - ページ数が増えてしまい、ロードの時間が多い

## 要件定義・設計
 - DB設計が不十分で途中から実装した機能が多いため、テーブル周りが複雑になった
 - 完成図を描く前に制作し始めたので、ユーザビリティが下がる機能の実装の仕方をしてしまった

# :pray: 追加したい機能

## チャット機能の充実か
 - ビデオの添付機能（課題解決改善のために、ビデオを添付するチャット機能を作成する
 - 部屋のランクによって、電話機能やビデオ通話機能を搭載する

## UIの向上
 - RailsをAPI化し、フロントはReact.jsで作成する
 - 基本的な動作は全て非同期化する


# :video_camera: DEMO
[![Image from Gyazo](https://i.gyazo.com/0ce7bc23b2432e59b37b4a708f50bfbc.gif)](https://gyazo.com/0ce7bc23b2432e59b37b4a708f50bfbc)

[![Image from Gyazo](https://i.gyazo.com/ad25db3c91893ee4f22d3aa3a509052b.gif)](https://gyazo.com/ad25db3c91893ee4f22d3aa3a509052b)

[![Image from Gyazo](https://i.gyazo.com/6d76c4ba0e08f5b7d2b26fc6f66646e6.gif)](https://gyazo.com/6d76c4ba0e08f5b7d2b26fc6f66646e6)

[![Image from Gyazo](https://i.gyazo.com/22e4750006f82d111914e59973b670c0.gif)](https://gyazo.com/22e4750006f82d111914e59973b670c0)


# :book: テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| career   | string |             |
| introduce| string |             |


### :link: Association

- has_many :room_users 
- has_many :rooms ,through: :room_users
- has_many :messages
- has_many :articles, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :favorite_articles, through: :favorites, source: :article
- has_many :questions
- has_many :likes
- has_many :answers
- has_many :sns_credentials
- has_one :card, dependent: :destroy
- has_one_attached :image
- has_many :reactions
- has_one :room_orders

  ##### 自分がフォローしているユーザーとの関連 
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
  ##### 自分がフォローされているユーザーとの関連
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following

## sns_credentialsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| provider | string |  |
| uid | string |  |

### :link: Association

- belongs_to :user, optional: true

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| price  | integer | null: false |
| text   | string | null: false |
| category_id | integer | null: false |
| user_id | integer | null: false |

### :link: Association

- belongs_to_active_hash :category
- has_many :room_users, dependent: :destroy
- belongs_to :user
- has_many :messages, dependent: :destroy
- has_one :room_order, dependent: :destroy

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### :link: Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### :link: Association

- belongs_to :room
- belongs_to :user
- has_one_attached :image


## room_orders テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id | integer | null: false |
| room    | references | null: false, foreign_key: true |

### :link: Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## cards テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| card_token | string | null: false |
| customer_token | string | null: false |
| user    | references | null: false, foreign_key: true |

### :link: Association

- belongs_to :user

## questions テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| text  | string | null: false |
| title | string | null: false |
| best_answer_id | integer | default: nil |
| category_id | integer | null: false |
| user_id | integer | null: false |

### :link: Association

- belongs_to_active_hash :category
- belongs_to :user
- has_many :answers
- has_one_attached :image
- has_many :likes

## answers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user_id | integer | null: false |
| question_id | integer| null: false |

### :link: Association

- belongs_to :question  
- belongs_to :user 
- has_many :reactions

## reactions テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| answer_id | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| text | string | null: false |

### :link: Association

- belongs_to :user
- belongs_to :answer

## relationships テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| following_id | integer |  |
| followers_id | integer |  |

### :link: Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"

## articles テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id | integer | null: false |
| title | string | null: false|
| text | string | null: false|

### :link: Association

- has_one_attached :image
- belongs_to :user
- has_many :favorites, dependent: :destroy
- has_many :article_tag_relations
- has_many :tags, through: :article_tag_relations, dependent: :destroy
- has_many :comments, dependent: :destroy

## favorites テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true, unique: true |
| article | references | null: false, foreign_key: true, unique: true |

### :link: Association

- belongs_to :user
- belongs_to :article

## tags テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| word | string | uniqueness: true |

### :link: Association

- has_many :article_tag_relations
- has_many :articles, through: :article_tag_relations

## articles_tag テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| tag | references | null: false, foreign_key: true |

### :link: Association

- belongs_to :article
- belongs_to :tag

## likes テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user    | references | null: false, foreign_key: true, unique: true |
| question | references | null: false, foreign_key: true, unique: true |

### :link: Association

- belongs_to :user
- belongs_to :question
