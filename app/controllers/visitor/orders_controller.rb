class Visitor::OrdersController < VisitorController
  # GET /orders
  def index
    @orders = Order.recent.page(params[:page]).per(10)
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
  end
end
