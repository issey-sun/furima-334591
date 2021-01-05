# README
## users テーブル
| Column           | Type       | Options                                |
| ---------------- | ---------- | -------------------------------------- |
| nickname         | string     | null: false                            |
| email            | string     | null: false , unique: true, index:true |
| password         | string     | null: false                            |
| first_name       | string     | null: false                            |
| family_name      | string     | null: false                            |
| first_name_kana  | string     | null: false                            |
| family_name_kana | string     | null: false                            |
| birth_month      | date       | null: false                            |
| birth_day        | date       | null: false                            |
| user             | references | null: false                            |

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| item_img         | references | null: false, foreign_key: true |
| price            | integer    | null: false                    |
| postage_payer    | references | null: false, foreign_key: true |
| category         | references | null: false, foreign_key: true |
| item_condition   | references | null: false, foreign_key: true |
| prefecture       | references | null: false  foreign_key: true |
| preparation_day  | references | null: false, foreign_key: true |

## purchase_records テーブル
| Column                       | Type       | Options                       |
| -----------------------------| ---------- | ----------------------------- |
| card_number                  | integer    | null: false, unique: true     |
| expiration_year              | integer    | null: false                   |
| expiration_month             | integer    | null: false                   |
| security_code                | integer    | null: false                   |
| user                         | references | null: false, foreign_key:true |
| post_code                    | integer(7) | null: false                   |
| prefecture                   | references | null: false                   |
| city                         | string     | null: false                   |
| house_number                 | string     | null: false                   |
| building_name                | string     |                               |
| phone_number                 | integer    | unique: true                  |
| user                         | references | null: false, foreign_key:true |

## comments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
               
                       