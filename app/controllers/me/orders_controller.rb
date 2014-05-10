class Me::OrdersController < MeController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :change_state]

  # GET /orders
  def index
    @orders = current_user.orders.recent.page(params[:page]).per(10)
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      redirect_to me_user_order_path(current_user, @order), notice: '创建新订单成功.'
    else
      render action: 'new'
    end
  end

  def update
    if @order.update(order_params)
      redirect_to me_user_order_path(current_user, @order), notice: '更新订单成功.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    redirect_to me_user_orders_path(current_user), notice: '删除订单成功.'
  end

  def change_state
    if @order.user_state_changeable? && @order.change_state
      redirect_to me_user_order_path(current_user, @order), notice: '更新订单状态成功.'
    else
      redirect_to me_user_order_path(current_user, @order), notice: '更新订单状态失败.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:good_id, :quantity, :description)
    end
end
