# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nick_name        | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_one :destinstions
- has_many :items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| image           | string     | null: false                    |
| description     | string     | null: false                    |
| category        | string     | null: false                    |
| item_state      | string     | null: false                    |
| price           | string     | null: false                    |
| shipping_cost   | string     | null: false                    |
| shipping_source | string     | null: false                    |
| sipping_day     | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## destinations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| credit_card  | string     | null: false                    |
| post_code    | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user