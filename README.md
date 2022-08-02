# README

# テーブル設計

## usersテーブル

| Column              | Type   | Options                 |
| ------------------- | ------ | ----------------------- |
| nickname            | string | null: false             |
| email               | string | null: false,unique:true |
| encrypted_password  | string | null: false             |
| chinese_last_name   | string | null: false             |
| chinese_first_name  | string | null: false             |
| japanese_last_name  | string | null: false             |
| japanese_first_name | string | null: false             |
| date_of_birth       | date   | null: false             |

### Association
- has_many :items
- has_many :comments
- has_many :dealings


## itemsテーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| item_name       | string     | null: false                  |
| explanation     | text       | null: false                  |
| price           | integer    | null: false                  |
| category_id     | integer    | null: false                  |
| condition_id    | integer    | null: false                  |
| postage_id      | integer    | null: false                  |
| area_id         | integer    | null: false                  |
| arrival_time_id | integer    | null: false                  |
| user            | references | null: false,foreign_key:true |

### Association
- has_many :comments
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :postage
- belongs_to :area
- belongs_to :arrival_time
- has_one :dealing


## commentsテーブル

| Column  | Type       | Options                      |
| ------- | ---------- | ---------------------------- |
| content | text       | null: false                  |
| user    | references | null: false,foreign_key:true |
| item    | references | null: false,foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item


## dealingsテーブル

| Column  | Type       | Options                      |
| ------- | ---------- | ---------------------------- |
| user    | references | null: false,foreign_key:true |
| item    | references | null: false,foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer


## buyersテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| post_number   | string     | null: false                  |
| area_id       | integer    | null: false                  |
| city          | string     | null: false                  |
| address       | string     | null: false                  |
| building_name | string     |                              |
| tel_number    | string     | null: false                  |
| dealing       | references | null: false,foreign_key:true |

### Association
- belongs_to :area
- belongs_to :dealing
