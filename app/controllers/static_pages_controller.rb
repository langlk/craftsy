class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:landing]
  def landing
    render :landing
  end
end
