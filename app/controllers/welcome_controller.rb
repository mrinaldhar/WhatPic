class WelcomeController < ApplicationController
   before_action :signed_in_user,     only: :home
  def index
  end
  def help
  end
  def home

      redirect_to current_user
  	end

def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end


end