class Admin::DomainsController < Admin::AdminController
  load_and_authorize_resource

  def index
    @domains = Domain.all
  end

  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new(domain_params)
    if @domain.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @domain = Domain.find(params[:id])
    if @domain.update_attributes(domain_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @domain = Domain.find(params[:id])
    @user = @domain.owner
  end

  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy
    redirect_to root_path
  end

  private

  def domain_params
    params.require(:domain).permit(:name,:extension,:owner_id,:owner_type)
  end
end
