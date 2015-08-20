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
      if @tack.save
        redirect_to @tack, notice: 'Tack was successfully created.'
      else
        render action: 'new'    
      end
    end
  end

  # PATCH/PUT /tacks/1
  # PATCH/PUT /tacks/1.json
  def update
    respond_to do |format|
      if @tack.update(tack_params)
        redirect_to @tack, notice: 'Tack was successfully updated.'
      else
        render action: 'edit'   
      end
    end
  end

  # DELETE /tacks/1
  # DELETE /tacks/1.json
  def destroy
    @tack.destroy
    redirect_to tacks_url
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
