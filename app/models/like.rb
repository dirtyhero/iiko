class Like
  include Cequel::Record

  key :image_id, :text
  column :user_ids, :text
end

