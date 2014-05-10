class Visitor::GoodsController < VisitorController

  def index
    @goods = Good.released.recent.page(params[:page]).per(10)
  end

  def show
    @good = Good.released.find(params[:id])
  end
end
