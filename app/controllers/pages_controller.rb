class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

# April action: Only user test can have access to Gege sol
  def home
    if current_user
      if current_user.test == true || current_user.admin == true
        redirect_to timeslots_path
      else
        redirect_to timeslots_path
      end
    end
  end
end
