class CreateJokes < ActiveRecord::Migration[6.0]
  def change
    create_table :jokes do |t|
      t.string :lead_up
      t.string :punchline
      t.integer :funniness
      t.boolean :claire_laugh
      t.integer :category_id

      t.timestamps
    end
  end
end
