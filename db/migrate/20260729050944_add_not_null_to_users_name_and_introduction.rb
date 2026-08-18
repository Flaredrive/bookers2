class AddNotNullToUsersNameAndIntroduction < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :Introduction, false
  end
end
