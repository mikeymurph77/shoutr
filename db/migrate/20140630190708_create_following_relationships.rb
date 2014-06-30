class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower, index: true, null: false
      t.belongs_to :followed_user, index: true, null: false

      t.timestamps null: false
    end

    add_index :following_relationships, [:follower_id, :followed_user_id], 
    	unique: true, name: "following_realitionships_uniquness_constraint"
  end
end
