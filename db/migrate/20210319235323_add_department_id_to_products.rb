# frozen_string_literal: true

class AddDepartmentIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :department
  end
end
