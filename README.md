## users テーブル
| Column              | Type   | Options     |
| --------------------| ------ | ----------  |
| email               | string | null: false |
| password            | string | null: false |
| nickname            | string | null: false |
| last_name_kanji     | string | null: false |
| first_name_kanji    | string | null: false |
| last_name_hiragana  | string | null: false |
| first_name_hiragana | string | null: false |
| birthday            | date   | null: false |
## アソシエーション
has_many :products
has_many :buys



## products テーブル
| Column              | Type       | Options                          |
| ------------------- | -----------| ---------------------------------|
| name                | string     | null: false                      |
| description         | text       | null: false                      |
| category_id         | integer    | null: false                      |
| condition_id        | integer    | null: false                      |
| cost_burden_side_id | integer    | null: false                      |
| ship_form_id        | integer    | null: false                      |
| days_to_ship_id     | integer    | null: false                      |
| price               | integer    | null: false                      |
| user                | references | null: false, foreign_key: true   |

## アソシエーション
belongs_to :user
has_one :buy
has_one_attached :image



## buys テーブル
| Column         | Type       | Options                         |
| ---------      | ---------- | ------------------------------- |
| user           | references | null: false, foreign_key: true  |
| product        | references | null: false, foreign_key: true  |

## アソシエーション
belongs_to :user
belongs_to :product
has_one :address


## addressesテーブル
| Column         | Type       | Options                         |
| ---------------| -----------| --------------------------------|
| postal_code    | string     | null: false                     |
| region_id      | integer    | null: false                     |
| city           | string     | null: false                     |
| address        | string     | null: false                     |
| building_name  | string     |                                 |
| phone_number   | string     | null: false                     |
| buy            | references | null: false, foreign_key: true  |

## アソシエーション
belongs_to :buy



