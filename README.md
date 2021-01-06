# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :order
- has_many :items

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | string     | null: false |
| item_state_id    | string     | null: false |
| price            | string     | null: false |
| shipping_cost_id | string     | null: false |
| prefecture_id    | string     | null: false |
| sipping_day_id   | string     | null: false |
| user_id          | string     | null: false |

### Association
- has_one :order 
- belongs_to :user

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column        | Type       | Options     |
| ------------  | ---------- | ----------- |
| credit_card   | string     | null: false |
| post_code     | string     | null: false |
| prefecture_id | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |

### Association

- belongs_to :order