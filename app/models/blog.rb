class Blog < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites

  def favorite? (favorite_user_id, favorite_blog_id)
 favorites.where(user_id: favorite_user_id, blog_id: favorite_blog_id).exists?
  end
end
