class Admin::OrdersController < AdminController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :change_state]

  # GET /orders
  def index
    @orders = Order.recent.page(params[:page]).per(10)
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

  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: '更新订单成功.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    redirect_to admin_orders_path(current_user), notice: '删除订单成功.'
  end

  def change_state
    if @order.admin_state_changeable? && @order.change_state
      redirect_to admin_order_path(@order), notice: '更新订单状态成功.'
      return
    else
      redirect_to admin_order_path(@order), notice: '更新订单状态失败.'
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:quantity, :description, :deliver_number, :comment)
    end
end
