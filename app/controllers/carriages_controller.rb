class CarriagesController < ApplicationController
  before_action :set_carriage, only: %i[ show edit update destroy ]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(train_params)

    respond_to do |format|
      if @carriage.save
        format.html { redirect_to carriage_path(@carriage), notice: "Carriage was successfully created." }
        format.json { render :show, status: :created, location: @carriage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @carriage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @carriage.update(train_params)
        format.html { redirect_to carriage_path(@carriage), notice: "Carriage was successfully updated." }
        format.json { render :show, status: :ok, location: @carriage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carriage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @carriage.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: "Carriage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_carriage
    @carriage = Carriage.find(params[:id]).becomes(Carriage)
  end

  def train_params
    params.require(:carriage).permit(
      :number, :type, :upper_seats, :lower_seats, :side_lower_seats, :side_upper_seats, :chair_seats, :train_id
    )
  end
end
