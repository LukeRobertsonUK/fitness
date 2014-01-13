class UsersController < ApplicationController

  def index
    @users = User.all.reject{|u| (u == current_user) || (u.is_trainer_of?(current_user))}

    respond_to do |format|
      format.html
      format.js {}
    end
  end



end