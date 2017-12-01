class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:landing]
  def landing
    @products = Product.most_recent
  end
end
