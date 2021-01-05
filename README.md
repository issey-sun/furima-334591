# README
## users テーブル
Association
has_many :users_items
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
belongs_to :purchase_record
has_many :users

| Column             | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| postage_payer_id   | integer    | null: false,                   |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| preparation_day_id | references | null: false                    |
| seller             | references | null: false, foreign_key: true |
| postage_payer      | references | null: false, foreign_key: true |

## purchase_records テーブル
Association
belongs_to :items

| Column                       | Type       | Options                       |
| -----------------------------| ---------- | ----------------------------- |
| post_code                    | string     | null: false                   |
| prefecture                   | integer    | null: false                   |
| city                         | string     | null: false                   |
| house_number                 | string     | null: false                   |
| building_name                | string     |                               |
| phone_number                 | string     | null: false                   |
| user_item                    | references | null: false, foreign_key:true |

## users_items テーブル
Association
belongs_to :user
belongs_to :item
has_one :purchase_record

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |
               
                       