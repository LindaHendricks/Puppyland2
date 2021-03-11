class BookingsController < ApplicationController
    def index
        @bookings = Booking.all 
        @my_bookings = current_renter.bookings
    end

    def new
        @new_booking = Booking.new 
        @pets = Pet.all 
        @renters = Renter.all 
        @errors = flash[:errors] 
        @current_renter = session[:renter_id] 
    end 

    def create
        new_booking = Booking.create(booking_params)
        # if new_booking.valid?
        redirect_to booking_path(new_booking) #put the params to arrive to the booking of the user
        # else
        #     flash[:errors] = new_booking.errors.full_messages
        #     redirect_to new_booking_path
        # end 
    end 

    def show
        @booking = Booking.find(params[:id])
        @dog = Pet.find(@booking.pet_id)
    end

   

    # def show 
    #     byebug
    #     @booking = Booking.find(params[:id])
    # end 

    def cancel_confirmation
    end

    def edit
        @booking_to_edit = Booking.find(params[:id])
        @errors = flash[:errors]
    end 

    def update
        updated_booking = Booking.find(params[:id])
        updated_booking.update(booking_params)

        # if updated_booking.valid?
        #     redirect_to booking_path
        # else
        #     flash[:errors] = updated_booking.errors.full_messages
        #     redirect_to edit_booking_path(updated_booking)
        # end 
    
    end 

    def destroy
        @booking = Booking.find(params[:id])        
        @booking.destroy
        redirect_to "/bookings/cancel_confirmation"
    end 

private 

    def booking_params
        params.require(:booking).permit(:location, :date, :pet_id, :renter_id)
    end 
end
