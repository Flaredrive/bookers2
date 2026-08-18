class ChangeIntroductionNullOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :Introduction, true
  end
end
