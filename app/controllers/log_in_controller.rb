class LogInController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

   
   
   
    def create
        user = User.find_by(username: params[:username])
        byebug 
        if user && user.authenticate(params[:password])
            render json: {id:user.id, username: user.username}
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end 
    end 

    private 

    # def record_not_found
    #     render json: {error: "User not found"}, status: :not_found
    # end 
end