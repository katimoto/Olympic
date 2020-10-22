# README

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

  # 自分がフォローしているユーザーとの関連 
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
  # 自分がフォローされているユーザーとの関連
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
