class ReviewsController < ApplicationController

  before_action :find_tutorial

  def new
    @review = Review.new
  end

  def create
    
    @review = Review.new(review_params)
    @review.tutorial_id = @tutorial.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to tutorial_path(@tutorial)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def find_tutorial
    @tutorial = Tutorial.find(params[:tutorial_id])
  end

end
