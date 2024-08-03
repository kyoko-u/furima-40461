class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :Prefecture
  belongs_to :schedule_delivery
  belongs_to :shipping_free_status  

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_free_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :schedule_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300~9999999の半角数字を使用してください"  },format: { with: /\A[0-9]+\z/, message: "300~9999999の半角数字を使用してください" }
  # validates :user, presence: true
  validates :image, presence: true


end
