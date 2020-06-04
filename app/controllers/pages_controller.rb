class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # render 'shared/navbar': false
  end

  def contact
    @spheres = current_user.spheres

  end
end
