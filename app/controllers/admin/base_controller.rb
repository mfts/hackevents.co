module Admin
  class BaseController < ApplicationController
    before_action :require_admin
    
    layout "admin/layouts/application"
  end
end