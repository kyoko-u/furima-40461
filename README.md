# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| password           | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name _kana    | string  | null: false |
| first_name _kana   | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_date         | integer | null: false |


### Association

- has_many :items 
- has_many :orders

## items テーブル

| Column                    | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| item_name                 | string     | null: false |
| item_info                 | text       | null: false |
| item_category             | text       | null: false |
| item_condition            | string     | null: false |
| item_shipping_free_status | string     | null: false |
| item_prefecture           | string     | null: false |
| item_schedule_delivery    | string     | null: false |
| item_price                | string     | null: false |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses


## shipping_addresses テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | integer    | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| addresses   | string     | null: false |
| building    | string     | null: false |
| phone_number| integer    | null: false |
| order       | references | null: false, foreign_key: true |

### Association

- belongs_to :order
