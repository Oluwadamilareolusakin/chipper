class AdministratorsController < ApplicationController
  include AdministratorsHelper
  before_action :set_administrator, only: [:show, :edit, :update, :destroy]

  # GET /administrators
  # GET /administrators.json
  def index
    @administrators = Administrator.all
  end

  # GET /administrators/1
  # GET /administrators/1.json
  def show
    @user = User.new
  end

  # GET /administrators/new
  def new
    @administrator = Administrator.new
  end
  
  # GET /administrators/1/edit
  def edit
  end
  
  # POST /administrators
  # POST /administrators.json
  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      flash[:success] = "Welcome to Chipper #{@administrator.name}"
      redirect_to @administrator 
    else
      render :new
    end
  end
  
  # PATCH/PUT /administrators/1
  # PATCH/PUT /administrators/1.json
  def update
    if @administrator.update(administrator_params)
      redirect_to @administrator 
    else
      render :edit
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  def destroy
    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to administrators_url, notice: 'Administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    
end
