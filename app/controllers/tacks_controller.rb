class TacksController < ApplicationController
  before_action :set_tack, only: [:show, :edit, :update, :destroy]

  # GET /tacks
  # GET /tacks.json
  def index
    @tacks = Tack.all
  end

  # GET /tacks/1
  # GET /tacks/1.json
  def show
  end

  # GET /tacks/new
  def new
    @tack = Tack.new
  end

  # GET /tacks/1/edit
  def edit
  end

  # POST /tacks
  # POST /tacks.json
  def create
    @tack = Tack.new(tack_params)

    respond_to do |format|
      if @tack.save
        format.html { redirect_to @tack, notice: 'Tack was successfully created.' }
        format.json { render :show, status: :created, location: @tack }
      else
        format.html { render :new }
        format.json { render json: @tack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tacks/1
  # PATCH/PUT /tacks/1.json
  def update
    respond_to do |format|
      if @tack.update(tack_params)
        format.html { redirect_to @tack, notice: 'Tack was successfully updated.' }
        format.json { render :show, status: :ok, location: @tack }
      else
        format.html { render :edit }
        format.json { render json: @tack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tacks/1
  # DELETE /tacks/1.json
  def destroy
    @tack.destroy
    respond_to do |format|
      format.html { redirect_to tacks_url, notice: 'Tack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tack
      @tack = Tack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tack_params
      params.require(:tack).permit(:description)
    end
end
