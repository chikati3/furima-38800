# README

## users テーブル
| colum                | type      | options                  |
| -------------------- | --------- | ------------------------ |
| nickname             | string    | null: false              |
| email                | string    | null: false, unique: true|
| password             | string    | null: false              |
| encrypted_password   | string    | null: false              |
| family_name          | string    | null: false              |
| last_name            | string    | null: false              |
| family_name_kana     | string    | null: false              |
| last_name_kana       | string    | null: false              |
| birthday             | date      | null: false              |

### Association
- has_many :exhibition_product
- has_many :comments

## exhibition_product(出品商品) テーブル
| colum                | type        | options                        |
| -------------------- | ----------- | ------------------------------ |
| image                | text        | null: false                    |
| product_name         | string      | null: false                    |
| description_item     | text        | null: false                    |
| category             | integer     | null: false                    |
| commodity_condition  | integer     | null: false                    |
| delivery_charge      | integer     | null: false                    |
| delivery_area        | integer     | null: false                    |
| delivery_day         | integer     | null: false                    |
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## sold_out(完売) テーブル
| colum                | type        | options                        |
| -------------------- | ----------- | ------------------------------ |
| image_sold_out       | text        | null: false                    |
| user                 | references  | null: false, foreign_key: true |

## shipping_address(配送先住所) テーブル
| colum                | type        | options                        |
| -------------------- | ----------- | ------------------------------ |
| post_code            | string      | null: false                    |
| prefectures          | string      | null: false                    |
| municipalities       | string      | null: false                    |
| address              | string      | null: false                    |
| building_name        | string      |                                |
| telephone_number     | string      | null: false                    |

## credit_card(カード情報) テーブル
| colum                | type        | options                        |
| -------------------- | ----------- | ------------------------------ |
| card_information     | string      | null: false                    |
| date_of_expiry       | string      | null: false                    |
| security_code        | string      | null: false                    |

## comments(コメント) テーブル
| colum                | type        | options                        |
| -------------------- | ----------- | ------------------------------ |
| content              | text        | null: false                    | 
| exhibition_product   | references  | null: false, foreign_key: true |
| user                 | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :exhibition_product
