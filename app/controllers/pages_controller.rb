class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def contact
    @spheres = current_user.spheres

  end
end
