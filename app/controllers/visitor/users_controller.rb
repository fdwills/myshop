class Visitor::UsersController < VisitorController
  before_action :set_user, only: [:home, :show]

  def home
    render :layout => 'home'
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
