class Visitor::OrdersController < VisitorController
  # GET /orders
  def index
    @orders = Order.recent.page(params[:page]).per(20)
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
  end
end
