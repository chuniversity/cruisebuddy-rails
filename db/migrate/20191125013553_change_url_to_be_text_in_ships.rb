class ChangeUrlToBeTextInShips < ActiveRecord::Migration[6.0]
  def change
    change_column :ships, :url, :text
  end
end
