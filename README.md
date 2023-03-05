# README

## users テーブル
| colum                | type      | options                  |
| -------------------- | --------- | ------------------------ |
| nickname             | string    | null: false              |
| email                | string    | null: false, unique: true|
| encrypted_password   | string    | null: false              |
| family_name          | string    | null: false              |
| last_name            | string    | null: false              |
| family_name_kana     | string    | null: false              |
| last_name_kana       | string    | null: false              |
| birthday             | date      | null: false              |

### Association
- has_many :exhibition_products
- has_many :comments

## exhibition_products(出品商品) テーブル
| colum                   | type        | options                        |
| ----------------------- | ----------- | ------------------------------ |
| product_name            | string      | null: false                    |
| description_item        | text        | null: false                    |
| category                | integer     | null: false                    |
| commodity_condition_id  | integer     | null: false                    |
| delivery_charge_id      | integer     | null: false                    |
| delivery_area_id        | integer     | null: false                    |
| delivery_day_id         | integer     | null: false                    |
| price_id                | integer     | null: false                    |
| user                    | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :sold_outs

## sold_outs(完売) テーブル
| colum                   | type        | options                        |
| ----------------------- | ----------- | ------------------------------ |
| exhibition_product_id   | references  | null: false, foreign_key: true |
| user                    | references  | null: false, foreign_key: true |

## shipping_addresses(配送先住所) テーブル
| colum                | type        | options                        |
| -------------------- | ----------- | ------------------------------ |
| post_code            | string      | null: false                    |
| prefecture_id        | string      | null: false                    |
| municipalities       | string      | null: false                    |
| address              | string      | null: false                    |
| building_name        | string      |                                |
| telephone_number     | string      | null: false                    |


## comments(コメント) テーブル
| colum                | type        | options                        |
| -------------------- | ----------- | ------------------------------ |
| content              | text        | null: false                    | 
| exhibition_product   | references  | null: false, foreign_key: true |
| user                 | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :exhibition_product
