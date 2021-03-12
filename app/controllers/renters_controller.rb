class RentersController < ApplicationController
    
    def new_user
        @renter = Renter.new
        @errors = flash[:errors] 
    end

    def welcome
        @renters = Renter.all
    end

    def create
        @renter = Renter.create(new_renter_params)
        session[:renter_id] = @renter.id
        if @renter.valid?
            redirect_to profile_path
        else
            flash[:errors] = @renter.errors.full_messages
            redirect_to "/renters/new_user"
        end
    end
    
    def show 
    end

    def edit
        @current_user_booking_to_edit = session[:renter_id]
    end 

    def destroy
        session[:renter_id] = nil
        redirect_to "/renters/goodbye"
    end

    def goodbye
    end

    def update 

        # updated_current_user = session[:renter_id]
        updated_current_user = current_renter.update(new_renter_params)
        #byebug
        
        redirect_to profile_path(updated_current_user)

        # updated_photographer = Photographer.find(params[:id])
        # updated_photographer.update(photographer_params)

        # if updated_photographer.valid?
        #     redirect_to photographers_path
        # else
        #     flash[:errors] = updated_photographer.errors.full_messages
        #     redirect_to edit_photographer_path(updated_photographer)
        # end 
    end 

    def delete 
    end 

    def login   
        @errors = flash[:ERROR]
    end

    def handle_login
        @renter = Renter.find_by(username: params[:username])
            if @renter && @renter.authenticate(params[:password])
                session[:renter_id] = @renter.id
                redirect_to "/pets/index"
            else
                flash[:ERROR] = "Invalid Login Credentials!"
                redirect_to "/renters/login"
            end
    end

    def logout
        session[:renter_id] = nil
        redirect_to login_path
    end

    def profile  
       @bookings = current_renter.bookings
    end
 
    private

    def new_renter_params
        params.require(:renter).permit(:name, :address, :age, :phone_number, :username, :password)
    end
end
