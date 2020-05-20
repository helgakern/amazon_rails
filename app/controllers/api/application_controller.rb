class Api::ApplicationController < ApplicationController
    skip_before_action :verify_authenticity_token

    def authenticate_user!
        unless user_signed_in?
          flash[:danger] = "Sign in before trying that!"
          render(
              json: { errors: "Not Authorized" },
              status: 401
          )
        end
    end
end