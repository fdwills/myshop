class Visitor::GoodsController < VisitorController
  before_action :set_all_num, :set_brand_num

  def index
    @goods = Good.released.recent.page(params[:page]).per(20)
  end

  def show
    @good = Good.released.get_or_cache(params[:id])
  end

  def search
    if params[:keyword].present?
      @goods = Good.released.where('description_j LIKE ?', "%#{params[:keyword]}%").recent.page(params[:page]).per(20)
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

  private

  def set_all_num
    @all_num = Good.released.count
  end

  def set_brand_num
    @fancl_num = Good.released.where('brand LIKE ?', '%FANCL%').count()
    @skii_num = Good.released.where('brand LIKE ?', '%SKII%').count()
    @suqqu_num = Good.released.where('brand LIKE ?', '%SUQQU%').count()
  end
end
