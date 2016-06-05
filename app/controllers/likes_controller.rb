class LikesController < ApplicationController
  def create
    Like.create user_id: current_user.id, image_id: params[:like][:image_id]
    update_similarity_point
    @image = get_next_image
  end

  private
  def update_similarity_point
    base_user_ids = Like.where(image_id: params[:like][:image_id]).pluck :user_id
    Image.all.each do |image|
      user_ids = Like.where(image_id: image.id).pluck :user_id
      point = ImageSimilarityPoint.find_by image_id_1: image.id, image_id_2: params[:like][:image_id]
      unless point.present?
        point = ImageSimilarityPoint.find_by image_id_2: image.id, image_id_1: params[:like][:image_id]
      end

      likes_hash = {
        params[:like][:image_id] => base_user_ids,
        image.id => user_ids
      }
      if point.present?
        point.update point: RecommendService.caculate_similarity_point(likes_hash)
      else
        ImageSimilarityPoint.create image_id_1: params[:like][:image_id], image_id_2: image.id
      end
    end
  end

  def get_next_image
    condition = "image_id_1 = #{params[:like][:image_id]} || image_id_2 = #{params[:like][:image_id]}"
    point = ImageSimilarityPoint.where(condition).order(point: :desc).first
    return Image.find rand(1..1800) unless point.present?
    Image.find_by id: point.image_id_1
  end
end
