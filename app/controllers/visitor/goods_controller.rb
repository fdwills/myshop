class Visitor::GoodsController < VisitorController

  def index
    @goods = Good.released.recent.page(params[:page]).per(20)
  end

  def show
    @good = Good.released.get_or_cache(params[:id])
  end
end
