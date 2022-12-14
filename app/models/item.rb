class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  with_options presence: true, format: { with: /\A\d+\z/, message: '半角数字を使用してください' } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :arrival_time_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :arrival_time

  has_one_attached :image
  has_one :dealing
end
