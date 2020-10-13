## users テーブル
| Column        | Type   | Options    |
| ---------     | ------ | ---------- |
| email         | string | null: false |
| password      | string | null: false |
| nickname      | string | null: false |
| name_kanji    | string | null: false |
| name_hiragana | string | null: false |
| birthday      | date | null: false |
## アソシエーション
has_many :products
has_many :buys



## products テーブル
| Column              | Type       | Options                          |
| ------------------- | -----------| ---------------------------------|
| product             | string     | null: false                      |
| product_description | text       | null: false                      |
| category            | string     | null: false                      |
| condition           | string     | null: false                      |
| cost_burden_side    | string     | null: false                      |
| ship_form           | string     | null: false                      |
| days_to_ship        | string     | null: false                      |
| price               | string     | null: false                      |
| user                | references | null: false, foreign_key: true   |

## アソシエーション
belongs_to :user
has_one :buy
has_one_attached :image



## buys テーブル
| Column         | Type       | Options                         |
| ---------      | ---------- | ------------------------------- |
| credit_number  | string     | null: false                     |
| effective_date | date       | null: false                     |
| security_code  | string     | null: false                     |
| user           | references | null: false, foreign_key: true  |
| product        | references | null: false, foreign_key: true  |

## アソシエーション
belongs_to :user
belongs_to :product
has_one :product


## addressesテーブル
| Column        | Type       | Options                         |
| ---------     | -----------| --------------------------------|
| postal_code   | string     | null: false                     |
| region        | string     | null: false                     |
| city          | string     | null: false                     |
| house_number  | string     | null: false                     |
| building_name | string     | null: false                     |
| phone_number  | string     | null: false                     |
| buy           | references | null: false, foreign_key: true  |

## アソシエーション
belongs_to :buy



