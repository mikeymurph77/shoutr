class User < ActiveRecord::Base
	has_many :shouts

	has_many :followed_user_relationships,
		class_name: "FollowingRelationship",
		foreign_key: :follower_id

	has_many :followed_users, 
		through: :followed_user_relationships

	def follow(other_users)
		 followed_users << other_users
	end
end
