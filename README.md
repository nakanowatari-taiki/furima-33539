
## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| surname          | string | null: false |
| name             | string | null: false |
| kana_surname     | string | null: false |
| kana_name        | string | null: false |
| birthday         | date   | null: false |
| email            | string | null: false |
|encrypted_password| string | null: false |
### Association

- has_many :items
- has_many :item_buys

## items テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| product_name     | string    | null: false |
| price            | integer   | null: false |
| text             | text      | null: false |
| user             |references | null: false,foreign_key: true |
 ## 以下Active::Hashを使用
| state_id         | integer   | null: false |
| categore_id      | integer   | null: false |
|delivery_burden_id| integer   | null: false |
| delivery_area_id | integer   | null: false |
| delivery_days_id | integer   | null: false |
### Association

- belongs_to :user
- has_one    :item_buy

## item_buys テーブル
 
| Column   | Type        |  Options    |
| -------- | ----------- | ------------|
| user     | references  | null: false ,foreign_key: true |
| item     | references  | null: false ,foreign_key: true |

### Association
- belongs_to user
- belongs_to :item
- has_one    :buyer_area

# buyer_areas テーブル
 
| Column          |Type      |  Options     |
| --------------- | -------- | ------------ |
| postal_code     | string   |  null: false |
|deliverry_area_id| integer  |  null: false |
| municipality    | string   |  null: false |
| address         | string   |  null: false |
| bulid           | string   |              |
| phone_number    | string   |  null: false |
| item_buy       |references|  null: false,foreign_key: true |

- belongs_to :item_buy
