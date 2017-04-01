class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    if MasterUser.where(email: params[:email]).empty?
      render :status=>422,
        :json =>  {errors: 'Email not registered, please contact your manager to register your email first.'}
    else
      forged_params = MasterUser.forge_params(registration_params)
      build_resource(forged_params)
      yield resource if block_given?
      if resource.save
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        clean_up_passwords resource
        respond_with resource, status: 422, json: {errors: resource.errors.full_messages}
      end
    end
  end

  private
    def registration_params
      params.permit(:email, :password, :password_confirmation)
    end
end