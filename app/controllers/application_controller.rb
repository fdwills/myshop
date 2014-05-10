class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :login?
  helper_method :author?
  helper_method :admin?
  helper_method :lastest_update

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def lastest_update
    Inforamtion.recent.page(params[:page]).per(10)
  end

  def login?
    return current_user != nil
  end

  def admin?
    if login?
      return current_user.id == 1
    else
      false
    end
  end


  def render_not_permit
    render template: "errors/not_permit", status: 500, layout: 'signin', content_type: 'text/html'
  end

  unless Rails.env.development?
    rescue_from Exception, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404

    def render_404
      render template: "errors/error_404", status: 404, layout: 'signin', content_type: 'text/html'
    end

    def render_500
      render template: "errors/error_500", status:  500, layout: 'singin'
    end
  end
end
