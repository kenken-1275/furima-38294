# README

# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| chinese_name       | string | null: false |
| japanese_name      | string | null: false |
| date_of_birth      | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :transactions


## itemsテーブル

| Column       | Type       | Options                      |
| ------------ | ---------- | ---------------------------- |
| item_name    | string     | null: false                  |
| explanation  | text       | null: false                  |
| category     | string     | null: false                  |
| price        | integer    | null: false                  |
| condition    | string     | null: false                  |
| postage_load | string     | null: false                  |
| send_area    | string     | null: false                  |
| arrival_time | string     | null: false                  |
| image        | text       | null: false                  |
| user         | references | null: false,foreign_key:true |

### Association
- has_many :comments
- belongs_to :user
- has_one :transaction


## commentsテーブル

| Column  | Type       | Options                      |
| ------- | ---------- | ---------------------------- |
| content | text       | null: false                  |
| user    | references | null: false,foreign_key:true |
| item    | references | null: false,foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item


## transactionsテーブル

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
| prefecture    | string     | null: false                  |
| city          | string     | null: false                  |
| address       | string     | null: false                  |
| building_name | string     | null: false                  |
| tel_number    | string     | null: false                  |
| transaction   | references | null: false,foreign_key:true |

### Association
- belongs_to :transaction
