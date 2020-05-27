class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, :polymorphic => true
  after_create :created_update_count_review_user
  after_destroy :destroy_update_count_review_user
  
  private
  def update_count_review_user
    user = User.find(self.user_id)
    user.update(review_count: user.review_count + 1)
  end
  def destroy_update_count_review_user
    user = User.find(self.user_id)
    user.update(review_count: user.review_count - 1)
  end
end
