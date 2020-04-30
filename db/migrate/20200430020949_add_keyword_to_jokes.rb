class AddKeywordToJokes < ActiveRecord::Migration[6.0]
  def change
    add_column :jokes, :keyword, :string
  end
end
