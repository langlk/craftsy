class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review created successfully."
      redirect_to product_path(@product)
    else
      flash[:alert] = @review.errors.full_messages
      render template: "products/show"
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
    @review = @product.reviews.find(params[:id])
    authorize_edit!(@review)
    render template: "products/show"
  end

  def update
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
    @review = @product.reviews.find(params[:id])
    authorize_edit!(@review)
    if @review.update(review_params)
      flash[:notice] = "Review updated successfully."
      redirect_to product_path(@product)
    else
      flash[:alert] = @review.errors.full_messages
      render template: "products/show"
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    authorize_delete!(@review)
    @review.destroy
    flash[:notice] = "Review deleted successfully."
    redirect_to product_path(@product)
  end

private
  def review_params
    params.require(:review).permit(:comments, :rating)
  end

  def authorize_delete!(review)
    unless current_user && ((review.user == current_user) || current_user.admin?)
      flash[:alert] = "You aren't authorized to do that."
      redirect_to product_path(review.product)
    end
  end

  def authorize_edit!(review)
    unless current_user && (review.user == current_user)
      flash[:alert] = "You aren't authorized to do that."
      redirect_to product_path(review.product)
    end
  end
end
