class Admin::InforamtionsController < AdminController
  before_action :set_inforamtion, only: [:show, :edit, :update, :destroy]

  # GET /inforamtions
  # GET /inforamtions.json
  def index
    @informations = Inforamtion.recent
  end

  # GET /inforamtions/1
  # GET /inforamtions/1.json
  def show
  end

  # GET /inforamtions/new
  def new
    @information = Inforamtion.new
  end

  # GET /inforamtions/1/edit
  def edit
  end

  # POST /inforamtions
  # POST /inforamtions.json
  def create
    @information = Inforamtion.new(inforamtion_params)

    respond_to do |format|
      if @information.save
        format.html { redirect_to admin_inforamtion_path(@information), notice: 'Inforamtion was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /inforamtions/1
  # PATCH/PUT /inforamtions/1.json
  def update
    respond_to do |format|
      if @information.update(inforamtion_params)
        format.html { redirect_to admin_inforamtion_path(@information), notice: 'Inforamtion was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /inforamtions/1
  # DELETE /inforamtions/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to admin_inforamtions_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inforamtion
      @information = Inforamtion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inforamtion_params
      params.require(:information).permit(:title, :content)
    end
end
