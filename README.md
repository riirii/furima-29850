# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |


### Association

- has_many :items
- has_many :cards

## items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| item_name       | string       | null: false                    |
| explanation     | text         | null: false                    |
| category_id     | integer      | null: false                    |
| status_id       | integer      | null: false                    |
| delivery_fee_id | integer      | null: false                    | 
| delivery_from_id| integer      | null: false                    |
| delivery_day_id | integer      | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :card



## cards テーブル

| user           | references   | null: false, foreign_key: true |
| item           | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| postal_code     | string       | null: false                    |
| prefectures_id  | integer      | null: false                    |
| municipalities  | string       | null: false                    | 
| address         | string       | null: false                    |
| building_name   | string       |                                |
| tell_number     | string       | null: false                    |
| card            | references   | null: false, foreign_key: true |

### Association

- belongs_to :card


