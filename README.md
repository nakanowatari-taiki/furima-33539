
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :comments, through: :items
- has_one  :profile

## profiles テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| full_name   | string | null: false |
|furigan_name | string | null: false |
| birthday    | string | null: false |

### Association

- belongs_to :user

## items テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| item_name   | string | null: false |
| item_price  | integer| null: false |
| item_text   | text   | null: false |
| item_image  | ActiveStorgeで実装

### Association

- belongs_to :user
- has_many   :comments, through: :users
- has_one    :item_buy

## item_buys テーブル
 ### Typeは全てActive::Hashで実装
| Column         |  Options     |
| -------------- | ------------ |
| item_state     |  null: false |
| item_categore  |  null: false |
| delivery_burden|  null: false |
| delivery_area  |  null: false |
| delivery_days  |  null: false |
|card_information|  null: false |
| card_deadline  |  null: false |
| card_security  |  null: false |

### Association

- belongs_to :item
- has_one    :buyer_area

# buyer_areas テーブル
 ### Typeは全てActive::Hashで実装
| Column         |  Options     |
| -------------- | ------------ |
| postal_codo    |  null: false |
| prefectures    |  null: false |
| municipality   |  null: false |
| address        |  null: false |
| bulid          |  null: false |
| phone_number   |  null: false |
| card_deadline  |  null: false |
| card_security  |  null: false |

- belongs_to :item_buy

## commnetsテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | text       |             |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
 
 - belongs_to :user
 - belongs_to :item