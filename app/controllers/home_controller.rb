class HomeController < ApplicationController

  def handler
    if current_admin_user.present?
      redirect_to_role_home
    elsif current_user.present?
      redirect_to controller: 'pwa/field_forms', action: 'index'
    else
      redirect_to controller: 'pwa/auth/sessions', action: 'new'
    end
  end

  private

  def redirect_to_role_home
    case current_admin_user.role
    when 'lab'
      redirect_to controller: 'admin/field_forms', action: 'index'
    when 'supervisor'
      redirect_to controller: 'admin/users', action: 'index'
    else
      redirect_to controller: 'admin/users', action: 'index'
    end
  end
end
