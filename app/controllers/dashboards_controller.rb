class DashboardsController < ApplicationController
  def show
    @shout = Shout.new
    @text_subject = TextSubject.new
  end
end