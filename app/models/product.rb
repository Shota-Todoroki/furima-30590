class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost_burden_side
  belongs_to_active_hash :ship_form
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :cost_burden_side
    validates :ship_form
    validates :days_to_ship
    validates :price
    validates :image
    validates :category_id, :condition_id, :cost_burden_side_id, :ship_form_id, :days_to_ship_id, numericality: { other_than: 1 }
  end
  VALID_PRICEL_HALF =                 /\A[0-9]+\z/

  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
    greater_than: 299, less_than: 10000000
    }
end
