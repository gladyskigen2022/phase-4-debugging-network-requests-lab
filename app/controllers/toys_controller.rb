class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    #NameError -Toys instead of Toy
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    #replace find_by with find
    toy = Toy.find(params[:id])
    toy.update(toy_params)
    #Not rendering, add render json:
    render json: toy
  end

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
