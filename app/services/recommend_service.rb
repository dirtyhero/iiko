class RecommendService
  class << self
    # likes_hash = {
    #    1 => [1, 2, 3],
    #    2 => [2, 3, 4]
    # }
    def caculate_similarity_point likes_hash
      return 0 unless likes_hash.present?
      array_1 = likes_hash[likes_hash.keys.first]
      array_2 = likes_hash[likes_hash.keys.second]

      denominator = (Math.sqrt(array_1.size) * Math.sqrt(array_2.size))

      ((array_1 & array_2).size / denominator).round 3
    end
  end
end
