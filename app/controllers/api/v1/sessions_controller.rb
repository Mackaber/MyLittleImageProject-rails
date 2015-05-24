class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }


  def create
    logger.info(request)
    logger.info(request.format)

    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                   :info => "Logged in",
                   :auth_token => current_user.authentication_token }
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.update_column(:auth_token,nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                    }
  end

  def failure
    warden.custom_failure!
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }

  end
end
