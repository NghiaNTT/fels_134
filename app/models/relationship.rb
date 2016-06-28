class Relationship < ActiveRecord::Base
  include CreateActivity

  belongs_to :follower, class_name: User.name
  belongs_to :following, class_name: User.name

  after_create :create_activity_follow
  before_destroy :create_activity_unfollow

  private
  def create_activity_follow
    create_activity self.follower_id, self.following_id, Settings.activity.follow
  end

  def create_activity_unfollow
    create_activity self.follower_id, self.following_id, Settings.activity.unfollow
  end
end
