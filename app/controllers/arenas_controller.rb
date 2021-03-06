class ArenasController < ApplicationController
  #enable_sync only: [:create, :update, :destroy]
  before_action :set_arena, only: [:show, :edit, :update, :destroy]
  layout 'main'  

  # GET /arenas
  # GET /arenas.json
  def index
    @arenas = Arena.all
  end

  # GET /arenas/1
  # GET /arenas/1.json
  def show
  end

  # GET /arenas/new
  def new
    @arena = Arena.new
  end

  # GET /arenas/1/edit
  def edit
  end

  # POST /arenas
  # POST /arenas.json
  def create
    @arena = Arena.new(arena_params)

    respond_to do |format|
      if @arena.save
        sync_new @arena
        format.html { redirect_to arenas_url, notice: 'Arena was successfully created.' }
        format.json { render :show, status: :created, location: @arena }
      else
        format.html { render :new }
        format.json { render json: @arena.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arenas/1
  # PATCH/PUT /arenas/1.json
  def update
    respond_to do |format|
      if @arena.update(arena_params)
        format.html { redirect_to arenas_url, notice: 'Arena was successfully updated.' }
        format.json { render :show, status: :ok, location: @arena }
      else
        format.html { render :edit }
        format.json { render json: @arena.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arenas/1
  # DELETE /arenas/1.json
  def destroy
    if @arena.hours.count == 0
      @arena.destroy
      respond_to do |format|
        format.html { redirect_to arenas_url, notice: 'Arena was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to arenas_url, notice: 'You can\'t destroy this arena.' }
        format.json { head :no_content }
      end
    end
  end

  def faye
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arena
      @arena = Arena.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arena_params
      params.require(:arena).permit(:name, :address)
    end
end
