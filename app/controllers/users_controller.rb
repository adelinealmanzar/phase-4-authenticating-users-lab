class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_res
    def show
        user = User.find(session[:user_id])
        render json: user
    end

    private

    def render_not_found_res
        render json: { error: "User not authorized" }, status: :un
    end
end
