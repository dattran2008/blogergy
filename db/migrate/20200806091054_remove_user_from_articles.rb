class RemoveUserFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :user, :string
  end
end
