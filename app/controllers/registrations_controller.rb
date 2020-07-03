class RegistrationsController < Devise::RegistrationsController

    def sign_up_params

        params.require(:user).permit(:username,:firstname,:lastname,:email,:password,:password_confirmation)
         
    end
end
