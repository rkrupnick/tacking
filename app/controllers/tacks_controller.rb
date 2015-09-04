class TacksController < ApplicationController
  before_action :set_tack, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tacks = Tack.all.order("created_at DESC")
  end

  def show
  end

  def new
    @tack = current_user.tacks.build
  end

  def edit
  end

  def create
    @tack = current_user.tacks.build(tack_params)
      if @tack.save
        redirect_to @tack, notice: 'Tack was successfully created.'
      else
        render action: 'new'    
      end
    end
  end

  def update
    respond_to do |format|
      if @tack.update(tack_params)
        redirect_to @tack, notice: 'Tack was successfully updated.'
      else        render action: 'edit'   
      end
    end
  end

  def destroy
    @tack.destroy
    redirect_to tacks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tack
      @tack = Tack.find_by(id: params[:id])
    end

    def correct_user
      @tack = current_user.tacks.find_by(id: params[:id])
      redirect_to tacks_path, notice: "Not authorized to edit this pin."
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def tack_params
      params.require(:tack).permit(:description, :image)
    end
