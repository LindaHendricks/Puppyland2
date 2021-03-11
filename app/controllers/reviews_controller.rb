class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new 
        @review = Review.new
        @pets = Pet.all
        @renters = Renter.all
        @current_renter = session[:renter_id] 
    end  
   

    def create
        review = Review.create(reviews_params)
        redirect_to pet_path(review.pet_id)
    end 

    def edit
    end 

    def update
    end 

    def delete
    end 

private 

    def reviews_params
        params.require(:review).permit(:comment, :rating, :date, :pet_id, :renter_id)
    end 
 
end
