class MeController < ApplicationController
  before_action :readable?
  before_action :writable?, only: [:new, :edit, :update, :create, :destroy]

  def readable?
    if controller_name.to_sym == :users
      unless (action_name.to_sym == :new || action_name.to_sym == :create)
        unless login? && current_user.readable?(params[:id].to_i)
          render_not_permit
        end
      end
    else
      unless login? && current_user.readable?(params[:user_id].to_i)
        render_not_permit
      end
    end
  end

  def writable?
    readable?
  end
end
