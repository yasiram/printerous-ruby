class UserController < ApplicationController
    before_action :require_user_logged_in!
  def index
    if params.has_key?(:q) 
      @users = User.where("name like ?", "%#{params[:q]}%")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @organizations = Organization.all
  end

  def create

    ActiveRecord::Base.transaction do
        org_id = user_params[:organization_id]
        user = User.new(user_params.except(:organization_id))
        user.save
        organ = Organization.where("id in (?)",org_id).update_all(fk_accountmanager_id: user.id)
            #redirect_to @user
        respond_to do |format|
            format.json { render json: {:status => "S", :message => "Berhasil simpan data"} }
        end
        
    end
    rescue ActiveRecord::RecordInvalid => exception
        respond_to do |format|
            format.json { render json: {:status => "E", :message => "Gagal simpan data"} }
        end

  end

  def edit
    @user = User.find(params[:id])
    @organizations = Organization.all
  end

  def update
    ActiveRecord::Base.transaction do
        org_id = user_params[:organization_id]
        @user = User.find(params[:id])
        Organization.where(fk_accountmanager_id: @user.id).update_all(fk_accountmanager_id: nil)
        organ = Organization.where("id in (?)",org_id).update_all(fk_accountmanager_id: @user.id)
        @user.update(user_params.except(:organization_id))
        #redirect_to @user
        respond_to do |format|
            format.json { render json: {:status => "S", :message => "Berhasil update data"} }
        end
    end
    rescue ActiveRecord::RecordInvalid => exception
        #render :edit
        respond_to do |format|
            format.json { render json: {:status => "E", :message => "Gagal update data"} }
        end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      respond_to do |format|
        format.json { render json: {:status => "S", :message => "Berhasil hapus data"} }
      end
    else
      respond_to do |format|
        format.json { render json: {:status => "E", :message => "Gagal hapus data"} }
      end
    end

    #redirect_to user_path
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
