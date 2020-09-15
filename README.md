# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birthday   | string | null: false |



### Association

- has_many :items
- has_one  :purchases

## items テーブル

| Column       | Type         | Options                        |
| ------------ | ------------ | ------------------------------ |
| item_name    | string       | null: false                    |
| explanation  | text         | null: false                    |
| image        | text         | null: false                    |
| category     | string       | null: false                    |
| status       | string       | null: false                    |
| delivery_fee | string       | null: false                    | 
| delivery_from| string       | null: false                    |
| delivery_day | string       | null: false                    |
| user_id      | references   | null: false, foreign_key: true |


### Association

- belongs_to :purchase
- belongs_to :user



## purchases テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| card_number     | string       | null: false                    |
| expiration_date | string       | null: false                    |
| security_code   | string       | null: false                    |
| postal_code     | string       | null: false                    |
| prefectures     | string       | null: false                    |
| municipalities  | string       | null: false                    | 
| address         | string       | null: false                    |
| building_name   | string       | null: false                    |
| tell_number     | string       | null: false                    |
| items_id        | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :items

