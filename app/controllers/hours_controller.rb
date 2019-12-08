class HoursController < ApplicationController
  before_action :set_hour, only: [:show, :edit, :update, :destroy]
  layout 'main'

  # GET /hours
  # GET /hours.json
  def index
    @hour = Hour.new
    @date = Date.current
    @arenas = Arena.all
    @hours = Hour.all.order(date: :desc)
  end

  # GET /hours/1
  # GET /hours/1.json
  def show
  end

  # GET /hours/new
  def new
    @hour = Hour.new
    @arenas = Arena.all
  end

  # GET /hours/1/edit
  def edit
    @arenas = Arena.all
  end

  # POST /hours
  # POST /hours.json
  def create
    
    params[:date].each do |date|
      @hour = Hour.new(hour_params)
      @hour.date = date
      @hour.save
    end
    respond_to do |format|
      format.html { redirect_to hours_url, notice: 'Hour was successfully created.' }
      format.json { render :show, status: :created, location: @hour }
    end

    # respond_to do |format|
    #   if @hour.save
    #     format.html { redirect_to hours_url, notice: 'Hour was successfully created.' }
    #     format.json { render :show, status: :created, location: @hour }
    #   else
    #     @arenas = Arena.all
    #     format.html { render :new }
    #     format.json { render json: @hour.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /hours/1
  # PATCH/PUT /hours/1.json
  def update
    respond_to do |format|
      if @hour.update(hour_params)
        format.html { redirect_to hours_url, notice: 'Hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @hour }
      else
        @arenas = Arena.all
        format.html { render :edit }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hours/1
  # DELETE /hours/1.json
  def destroy
    @hour.destroy
    respond_to do |format|
      format.html { redirect_to hours_url, notice: 'Hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def faye
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour
      @hour = Hour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hour_params
      params.require(:hour).permit(:time, :date, :cost, :arena_id)
    end
end
