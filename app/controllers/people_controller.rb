class PeopleController < ApplicationController
    before_action :require_user_logged_in!
  def index
    
    if params.has_key?(:q) 
      @peoples = People.left_outer_joins(:organization).where("organizations.name like ? or people.name like ?", "%#{params[:q]}%", "%#{params[:q]}%").group(:id)
    else
      @peoples = People.all
    end
  end

  def show
    @people = People.find(params[:id])
  end

  def new
    @people = People.new
    @organizations = Organization.where(fk_accountmanager_id: Current.user.id)
  end

  def create
    @people = People.new(people_params)

    if @people.save
      #redirect_to @people
      respond_to do |format|
        format.json { render json: {:status => "S", :message => "Berhasil simpan data"} }
      end
    else
      #render :new
      respond_to do |format|
        format.json { render json: {:status => "E", :message => "Gagal simpan data"} }
      end
    end
  end

  def edit
    @people = People.find(params[:id])
    @organizations = Organization.where(fk_accountmanager_id: Current.user.id)
  end

  def update
    @people = People.find(params[:id])

    if @people.update(people_params)
      #redirect_to @people
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
    @people = People.find(params[:id])
    if @people.destroy
      respond_to do |format|
        format.json { render json: {:status => "S", :message => "Berhasil hapus data"} }
      end
    else
      respond_to do |format|
        format.json { render json: {:status => "E", :message => "Gagal hapus data"} }
      end
    end

    #redirect_to people_path
  end

  private
    def people_params
      params.require(:people).permit(:name, :email, :phone, :fk_organization_id, :avatar)
    end
end
