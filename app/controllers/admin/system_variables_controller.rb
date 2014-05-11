class Admin::SystemVariablesController < AdminController
  before_action :set_system_variable, only: [:show, :edit, :update, :destroy]

  def index
    @system_variables = SystemVariable.recent.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @system_variable = SystemVariable.new
  end

  def edit
  end

  def create
    @system_variable = SystemVariable.new(system_variable_params)
    if @system_variable.save
      redirect_to admin_system_variable_path(@system_variable), notice: '系统变量成功创建.'
    else
      render action: 'new'
    end
  end

  def update
    if @system_variable.update(system_variable_params)
      redirect_to admin_system_variable_path(@system_variable), notice: '系统变量成功更新.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @system_variable.destroy
    redirect_to admin_system_variables_path, notice: '系统变量成功删除.'
  end

  private
    def set_system_variable
      @system_variable = SystemVariable.find(params[:id])
    end

    def system_variable_params
      params.require(:system_variable).permit(:name, :value)
    end
end
