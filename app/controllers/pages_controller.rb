class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      if current_user.test == true || current_user.admin == true
        redirect_to timeslots_path
      else
        redirect_to about_path
      end
    end
  end
  # def home
  #   if current_user && @user.test = true
  #     redirect_to timeslots_path
  #   elsif current_user && @user.test = false
  #     redirect_to activities_path
  #   end
  # end

  # def home
  #   if current_user
  #     redirect_to timeslots_path
  #   end
  # end
end
