class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to :back, notice: 'Review created!'
    else
      redirect_to :back, notice: 'Review not created!'
    end

  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])
  end

  private
     def review_params
       #params.require(:product).permit(:product_id, :product => [:reviews => [:rating, :description]])
       {
         product_id: params[:product_id],
         description: params[:product][:reviews][:description],
         rating: params[:product][:reviews][:rating]
       }
     end

end
