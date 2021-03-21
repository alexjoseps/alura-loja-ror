# frozen_string_literal: true

class Department < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 4 }
end
