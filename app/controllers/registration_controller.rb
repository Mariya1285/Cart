class RegistrationController < Devise::RegistrationsController

	def new

	@user= User.new

	end

	def create

		@user = User.new(user_params)

		@user.valid?
		
		if @user.errors.blank?

			@user.save

			redirect_to "/"
		else
			render :action => "new"
		end
	end

	protected
	  def after_inactive_sign_up_path_for(resource)
	        '/sign_up/inactive'
	  end

	private

		def user_params
	      params.require(:user).permit(:username, :age, :mobile, :country, :address, :postal_code, :email, :password, :password_confirmation)
	     
	 	 end
	end