class Admin::GoodsController < AdminController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  def index
    @goods = Good.recent.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @good = Good.new
  end

  def edit
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to admin_good_path(@good), notice: '商品成功创建.'
    else
      render action: 'new'
    end
  end

  def update
    if @good.update(good_params)
      redirect_to admin_good_path(@good), notice: '商品成功更新.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @good.destroy
    redirect_to admin_goods_path, notice: '商品成功删除.'
  end

  private
    def set_good
      @good = Good.find(params[:id])
    end

    def good_params
      params.require(:good).permit(:title, :brand, :sequence_number, :choices, :description_j, :description_c, :price, :state, :image_1, :image_2, :image_3, :comment, :source)
    end
end
