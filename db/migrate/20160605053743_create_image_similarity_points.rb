class CreateImageSimilarityPoints < ActiveRecord::Migration
  def change
    create_table :image_similarity_points do |t|
      t.integer :image_id_1
      t.integer :image_id_2
      t.float :point

      t.timestamps null: false
    end
  end
end
