# README
## users テーブル
Association
has_many :users_items
has_many :items
has_many :purchase_records

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
has_many :users_items
has_many :users

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| postage_payer    | references | null: false, foreign_key: true |
| category         | references | null: false, foreign_key: true |
| item_condition   | references | null: false, foreign_key: true |
| prefecture_id    | integer    | null: false                    |
| preparation_day  | references | null: false, foreign_key: true |
| seller           | references | null: false, foreign_key: true |
| postage_payer    | references | null: false, foreign_key: true |

## purchase_records テーブル
Association
belongs_to :user

| Column                       | Type       | Options                       |
| -----------------------------| ---------- | ----------------------------- |
| post_code                    | string     | null: false                   |
| prefecture                   | integer    | null: false                   |
| city                         | string     | null: false                   |
| house_number                 | string     | null: false                   |
| building_name                | string     |                               |
| phone_number                 | string     | unique: true                  |
| user                         | references | null: false, foreign_key:true |

## users_items テーブル
Association
belongs_to :user
belongs_to :item

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user_id   | references | foreign_key: true |
| item_id   | references | foreign_key: true |
               
                       