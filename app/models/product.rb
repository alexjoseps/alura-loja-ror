# frozen_string_literal: true

class Product < ApplicationRecord
  scope :by_name, lambda { |name|
    where("#{table_name}.name LIKE :name", name: "%#{name}%")
  }
end
