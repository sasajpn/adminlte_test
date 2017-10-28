class AdminController < ActionController::Base
  layout 'admin/application'
  before_action :authenticate_admin_user!
	
end
