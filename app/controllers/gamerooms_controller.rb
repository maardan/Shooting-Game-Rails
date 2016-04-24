class GameroomsController < ApplicationController
  before_action :set_gameroom, only: [:show, :edit, :update, :destroy]

  # GET /gamerooms
  # GET /gamerooms.json
  def index
    @gamerooms = gamerooms.where('id > ?', params[:after_id].to_i).order('created_at DESC')
  end

  # GET /gamerooms/1
  # GET /gamerooms/1.json
  def show
    #@gamerooms = Gameroom.find(params[:id])
  end

  # GET /gamerooms/new
  def new
    @gameroom = Gameroom.new
    @gamerooms = Gameroom.order('created_at DESC')
  end

  # GET /gamerooms/1/edit
  def edit
  end

  # POST /gamerooms
  # POST /gamerooms.json
  def create
    @gameroom = Gameroom.new(gameroom_params)

    respond_to do |format|
      if @gameroom.save
        format.html { redirect_to '/chats/new' }
        format.json { render :nothing, status: :created, location: @gameroom }
      else
        format.html { render :nothing }
        format.json { render json: @gameroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamerooms/1
  # PATCH/PUT /gamerooms/1.json
  def update
    respond_to do |format|
      if @gameroom.update(gameroom_params)
        format.html { redirect_to '/chats/new', notice: 'Gameroom was successfully updated.' }
        format.json { render :nothing, status: :ok, location: @gameroom }
      else
        format.html { render :nothing }
        format.json { render json: @gameroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamerooms/1
  # DELETE /gamerooms/1.json
  def destroy
    @gameroom.destroy
    respond_to do |format|
      format.html { redirect_to '/chats/new' }
      format.json { head :no_content }
    end
  end

  public
    # Use callbacks to share common setup or constraints between actions.
    def set_gameroom
      @gameroom = Gameroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameroom_params
      params.fetch(:gameroom, {})
    end
end
