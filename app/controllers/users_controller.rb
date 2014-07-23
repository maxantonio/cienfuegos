class UsersController < Clearance::UsersController

  private

    def user_from_params
      user_params = params[:user] || Hash.new
      name = user_params.delete(:name)
      email = user_params.delete(:email)
      password = user_params.delete(:password)

      Clearance.configuration.user_model.new(user_params).tap do |user|
        user.name = name
        user.email = email
        user.password = password
      end
    end

    def permit_params
      params.require(:user).permit(:name, :email, :password)
    end

end
