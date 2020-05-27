class ChangeReviewCountToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :review_count, :integer ,null: false, default: 0
  end
end
