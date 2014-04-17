class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :image_name

      t.timestamps
    end
  end
end
