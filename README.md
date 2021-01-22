
## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| surname       | string | null: false |
| name          | string | null: false |
| kana_surname  | string | null: false |
| kana_name     | string | null: false |
| birthday      | string | null: false |
### Association

- has_many :items
- has_many :item_buy

## items テーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| item_name     | string    | null: false |
| item_price    | integer   | null: false |
| item_text     | text      | null: false |
| item_image    | ActiveStorgeで実装
| use_id        |references | null: false |
 ## 以下Active::Hashを使用
| item_state    | string | null: false |
| item_categore | string | null: false |
|delivery_burden| string | null: false |
| delivery_area | string | null: false |
| delivery_days | string | null: false |
### Association

- belongs_to :user
- has_one    :item_buy

## item_buys テーブル
 ### Typeは全てActive::Hashで実装
| Column   | Type        |  Options    |
| -------- | ----------- | ------------|
| user_id  | references  | null: false |
| item_id  | references  | null: false |

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
| phone_number   | integer |  null: false |

- belongs_to :item_buy
