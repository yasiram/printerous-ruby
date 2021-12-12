class OrganizationController < ApplicationController
  before_action :require_user_logged_in!
  def index
    if params.has_key?(:q) 
      @organizations = Organization.left_outer_joins(:people).where("organizations.name like ? or people.name like ?", "%#{params[:q]}%", "%#{params[:q]}%").group(:id)
    else
      @organizations = Organization.all
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      #redirect_to @organization
      respond_to do |format|
        format.json { render json: {:status => "S", :message => "Berhasil simpan data"} }
      end
    else
      #render :new
      respond_to do |format|
        format.json { render json: {:status => "E", :message => "Gagal simpan data", :data => organization_params} }
      end
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update(organization_params)
      #redirect_to @organization
      respond_to do |format|
        format.json { render json: {:status => "S", :message => "Berhasil update data"} }
      end
    else
      #render :edit
      respond_to do |format|
        format.json { render json: {:status => "E", :message => "Gagal update data"} }
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    if @organization.destroy
      respond_to do |format|
        format.json { render json: {:status => "S", :message => "Berhasil hapus data"} }
      end
    else
      respond_to do |format|
        format.json { render json: {:status => "E", :message => "Gagal hapus data"} }
      end
    end

    #redirect_to organization_path
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :email, :telp, :website, :logo)
    end
end
