class RegistrationController < Devise::RegistrationsController

def new

@user= User.new

end

def create

@user = User.new
@user.username = params[:user][:username]
@user.age = params[:user][:age]
@user.mobile = params[:user][:mobile]
@user.country = params[:user][:country]
@user.address = params[:user][:address]
@user.postal_code = params[:user][:postal_code]
@user.email = params[:user][:email]
@user.password = params[:user][:password]
@user.password_confirmation =params[:user][:password_confirmation]


@user.valid?
if @user.errors.blank?

@user.save

redirect_to "/"
else
render :action => "new"
end
end

end