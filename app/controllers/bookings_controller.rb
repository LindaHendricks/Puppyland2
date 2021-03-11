class BookingsController < ApplicationController
    def index
        @bookings = Booking.all 
        #byebug
        @my_bookings = @bookings.renter
    end

    def new
        @booking = Booking.new 
        @pets = Pet.all 
        @renters = Renter.all 
        @errors = flash[:errors] 
    end 

    def create
        new_booking = Booking.create(booking_params)
        # if new_booking.valid?
        redirect_to bookings_path #put the params to arrive to the booking of the user
        # else
        #     flash[:errors] = new_booking.errors.full_messages
        #     redirect_to new_booking_path
        # end 
    end 

    # def show 
    #     byebug
    #     @booking = Booking.find(params[:id])
    # end 

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

    def delete
    end 

private 

    def booking_params
        params.require(:booking).permit(:location, :date, :pet_id, :renter_id)
    end 

end
