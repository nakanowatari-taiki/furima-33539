
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
- has_many :item_buy

## items テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| item_name        | string    | null: false |
| item_price       | integer   | null: false |
| item_text        | text      | null: false |
| user             |references | null: false |
 ## 以下Active::Hashを使用
| item_state_id    | integer   | null: false |
| item_categore_id | integer   | null: false |
|delivery_burden_id| integer   | null: false |
| delivery_area_id | integer   | null: false |
| delivery_days_id | integer   | null: false |
### Association

- belongs_to :user
- has_one    :item_buy

## item_buys テーブル
 ### Typeは全てActive::Hashで実装
| Column   | Type        |  Options    |
| -------- | ----------- | ------------|
| user     | references  | null: false |
| item     | references  | null: false |

### Association
- belongs_to user
- belongs_to :item
- has_one    :buyer_area

# buyer_areas テーブル
 ### Active::Hashで実装
| Column         |Type      |  Options     |
| -------------- | -------- | ------------ |
| postal_codo    | integer  |  null: false |
| prefectures    | string   |  null: false |
| municipality   | string   |  null: false |
| address        | string   |  null: false |
| bulid          | text     |  null: false |
| phone_number   | integer  |  null: false |
| buyer_area     |references|  null: false |

- belongs_to :item_buy
