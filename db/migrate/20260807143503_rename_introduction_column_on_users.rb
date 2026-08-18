class RenameIntroductionColumnOnUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Introduction, :introduction
  end
end
