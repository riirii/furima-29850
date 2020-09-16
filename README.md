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

| Column       | Type         | Options                        |
| ------------ | ------------ | ------------------------------ |
| item_name    | string       | null: false                    |
| explanation  | text         | null: false                    |
| image        | text         | null: false                    |
| category     | integer      | null: false                    |
| status       | integer      | null: false                    |
| delivery_fee | integer      | null: false                    | 
| delivery_from| integer      | null: false                    |
| delivery_day | integer      | null: false                    |
| user         | references   | null: false, foreign_key: true |


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
| prefectures     | string       | null: false                    |
| municipalities  | string       | null: false                    | 
| address         | string       | null: false                    |
| building_name   | string       |                                |
| tell_number     | string       | null: false                    |
| card            | references   | null: false, foreign_key: true |

### Association

- belongs_to :card


