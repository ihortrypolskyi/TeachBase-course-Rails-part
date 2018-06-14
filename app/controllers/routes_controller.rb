class RoutesController < ApplicationController
  before_action :initialize_route, only: %i[ new ]
  before_action :find_route, only: %i[ show edit update destroy ]

  def index
    @routes = Route.all
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to route_path(@route), notice: 'Route created'
    else
      render :new, notice: 'Something went wrong'
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Route updated'
    else
      render :edit, notice: 'Something went wrong'
    end
  end

  def destroy
    if @route.destroy
      redirect_to routes_path, notice: 'Route has been deleted'
    else
      redirect_to @route, notice: 'Something went wrong'
    end
  end

  private

  def initialize_route
    @route = Route.new
  end

  def find_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name)
  end
end
