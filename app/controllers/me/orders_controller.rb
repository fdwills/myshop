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
      @good = Good.released.find(order_params[:good_id])
      redirect_to visitor_good_path(@good), notice: '创建新订单失败：商品不存在或缺少数量！'
    end
  end

  def update
    if !@order.editable?
      redirect_to me_user_order_path(current_user, @order), flash: { error: '订单状态已改变无法修改内容！' }
    elsif @order.update(order_params)
      redirect_to me_user_order_path(current_user, @order), notice: '更新订单成功.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    if @order.editable? && @order.destroy
      redirect_to me_user_orders_path(current_user), notice: '删除订单成功.'
    else
      redirect_to me_user_order_path(current_user, @order), flash: { error: '订单状态已改变暂时无法删除！' }
    end
  end

  def change_state
    if @order.user_state_changeable? && @order.change_state
      redirect_to me_user_order_path(current_user, @order), notice: '更新订单状态成功.'
    else
      redirect_to me_user_order_path(current_user, @order), flash: { error: '订单状态暂时无法更改！' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_user.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:good_id, :quantity, :description)
    end
end
