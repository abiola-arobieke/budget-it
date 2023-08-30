class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    # add your logic here.
  end

  def after_sign_out_path_for(resource)
    # add your logic here.
  end
end
