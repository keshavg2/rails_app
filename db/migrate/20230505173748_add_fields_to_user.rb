class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :referred_by, foreign_key: {to_table: :users}, index: true
  end
end
