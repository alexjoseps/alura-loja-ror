# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :department

  scope :by_name, lambda { |name|
    where("#{table_name}.name LIKE :name", name: "%#{name}%")
  }

  validates :price, presence: true
  validates :name, length: { minimum: 4 }
end
