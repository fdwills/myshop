class VisitorController < ApplicationController
  before_action :writable?, only: [:new, :edit, :update, :create, :destroy]

  def writable?
    unless login?
      render_not_permit
    end
  end
end
