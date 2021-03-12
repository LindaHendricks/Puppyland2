class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new 
        @review = Review.new
        @pets = Pet.all
        @renters = Renter.all
        @current_renter = session[:renter_id] 
        @errors = flash[:errors]
    end  

    def create
        review = Review.create(reviews_params)
        if review.valid?
            redirect_to pet_path(review.pet_id)
        else   
            flash[:errors] = review.errors.full_messages
            redirect_to "/reviews/new"
        end
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
