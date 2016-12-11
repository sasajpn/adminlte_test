class Admin::SessionsController < Devise::SessionsController
  layout 'admin/login'

  def after_sign_in_path_for(resource)
    admin_blogs_url
  end

  def after_sign_out_path_for(resource)
    new_admin_user_session_url
  end
end
