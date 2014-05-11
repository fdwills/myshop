class VisitorController < ApplicationController
  before_action :writable?, only: [:new, :edit, :update, :create, :destroy]

  def writable?
    unless login?
      render_not_permit
    end
  end

  def about
    render :layout => 'signin'
  end

  def top
    redirect_to visitor_goods_path
  end
end
