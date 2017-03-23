class WelcomeController < ApplicationController
  def index
    flash[:alert] = "晚安！该睡觉了！"
end
end
