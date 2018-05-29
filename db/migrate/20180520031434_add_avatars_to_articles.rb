class AddAvatarsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :avatars, :json
  end
end
