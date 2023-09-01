class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_resource)
    # add your logic here.
    authenticated_root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    # add your logic here.'
    root_path
  end
end
