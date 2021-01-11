# README
## users テーブル
Association
has_many :orders (user_items)
has_many :items

| Column             | Type       | Options                    |
| ------------------ | ---------- | ---------------------------|
| nickname           | string     | null: false                |
| email              | string     | null: false , unique: true |
| encrypted_password | string     | null: false                |
| first_name         | string     | null: false                |
| family_name        | string     | null: false                |
| first_name_kana    | string     | null: false                |
| family_name_kana   | string     | null: false                |
| birth_day          | date       | null: false                |

## items テーブル
Association
belongs_to :user
has_one :order (user_item)

| Column             | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| postage_payer_id   | integer    | null: false                    |
| introduce          | text       | null: false                    |

## purchase_records テーブル
Association
belongs_to :order (user_item)

| Column                       | Type       | Options                       |
| -----------------------------| ---------- | ----------------------------- |
| post_code                    | string     | null: false                   |
| prefecture_id                | integer    | null: false                   |
| city                         | string     | null: false                   |
| house_number                 | string     | null: false                   |
| building_name                | string     |                               |
| phone_number                 | string     | null: false                   |
| order(user_item)             | references | null: false, foreign_key:true |

## orders (user_items) テーブル
Association
belongs_to :user
belongs_to :item
has_one :purchase_record

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |
               
                       