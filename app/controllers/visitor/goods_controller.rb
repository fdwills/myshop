class Visitor::GoodsController < VisitorController

  def index
    @goods = Good.released.recent.page(params[:page]).per(20)
  end

  def show
    @good = Good.released.get_or_cache(params[:id])
  end

  def search
    if params[:keyword].present?
      @goosd = Good.released.where('description_j LIKE ?', "%#{params[:keyword]}%").recent.page(params[:page]).per(20)
    end
    render :index
  end

  def brand
    @brand = params[:brand]
    if @brand.present?
      @goods = Good.released.where('brand LIKE ?', "%#{@brand}%").recent.page(params[:page]).per(20)
    end
    render :index
  end
end
