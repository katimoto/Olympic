# README
---
# アプリ名
Olympic

# 概要
## 実装機能

### ユーザー管理機能
 - デバイスの導入
 - SNS認証機能
 - 編集/詳細/削除機能
 - フォロー関係
 - ユーザーの質問一覧
 - ユーザーの記事一覧
 - そのユーザのお気に入り投稿一覧
 - PAY.JPのカード情報をユーザー情報としての保持機能
### 質問機能
 - 質問投稿機能（画像付き）
 - 編集、削除、詳細機能
 - 回答コメント機能
 - ベストアンサー機能
 - 各コメントに対するリアクション機能
 - カテゴリー検索機能
 - ベストアンサーランキング
 - ランキング機能
### 記事機能
 - 記事投稿機能（画像付き）
 - いいね機能（非同期）
 - 編集、削除、詳細機能
 - ランキング機能
 - 回答コメント機能
 - タグ/カテゴリー検索機能
### 購入機能
 - ルーム出品機能
 - ルーム購入機能
 - PAY.JPでの購入
 - カード情報を保持する簡単決済
 - ルーム検索機能
 - ルームのカテゴリー機能
 - 購入画面の実装
 - お気に入り機能の実装
 - いいねランキング
### チャット機能
 - メッセージ機能（非同期）
 - 画像の送信
 - 自動スクロール機能
 - Action Cableの導入
### 検索機能
### ランキング機能

# 本番環境
---
## URL
---
## ユーザー認証
---
 - ID:katimoto
 - password:1211

## テストアカウント
---
 - ユーザー名：moyashi
 - email:moyashi@gmail.com
 - password:moyashi123

## 制作背景
---
## 必要な機能
---
 - 購入機能
 - チャット機能
 - 質問機能
 - 宣伝機能
 - 豊富なユーザー情報

# 工夫したポイント
---

# 苦労したポイント
---
## 要件定義・設計
---

# 追加したい機能
---
## ビデオの添付機能
---
## UIの向上
---
機能が増え、画面移動が多いから。

# DEMO
---

# 開発環境
---
 - Ruby 2.6.5
 - Rails 6.0.0
 - javascript
 - jQuery
 - AWS/Unicorn/Nginx/S3/capistrano
 - Docker/Cicrle CI/Kurbetenes

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| career   | string |             |
| introduce| string |             |


### Association

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

### Association

- belongs_to :user, optional: true

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| price  | integer | null: false |
| text   | string | null: false |
| category_id | integer | null: false |
| user_id | integer | null: false |

### Association

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

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- has_one_attached :image


## room_orders テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id | integer | null: false |
| room    | references | null: false, foreign_key: true |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## cards テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| card_token | string | null: false |
| customer_token | string | null: false |
| user    | references | null: false, foreign_key: true |

### Association

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

### Association

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

### Association

- belongs_to :question  
- belongs_to :user 
- has_many :reactions

## reactions テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| answer_id | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| text | string | null: false |

### Association

- belongs_to :user
- belongs_to :answer

## relationships テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| following_id | integer |  |
| followers_id | integer |  |

### Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"

## articles テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id | integer | null: false |
| title | string | null: false|
| text | string | null: false|

### Association

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

### Association

- belongs_to :user
- belongs_to :article

## tags テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| word | string | uniqueness: true |

### Association

- has_many :article_tag_relations
- has_many :articles, through: :article_tag_relations

## articles_tag テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| tag | references | null: false, foreign_key: true |

### Association

- belongs_to :article
- belongs_to :tag

## likes テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user    | references | null: false, foreign_key: true, unique: true |
| question | references | null: false, foreign_key: true, unique: true |

### Association

- belongs_to :user
- belongs_to :question
