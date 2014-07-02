class DashboardsController < ApplicationController
  def show
    @shout = Shout.new
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new

    @shouts = Shout.where(user_id: current_user.followed_users + current_user.shouts).order(created_at: :desc)

  end
end