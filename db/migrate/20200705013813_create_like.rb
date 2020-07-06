class CreateLike < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :reference_movie_ep_id
      t.references :user, null: false, foreign_key: true

      
      t.timestamps
    end
  end
end 
