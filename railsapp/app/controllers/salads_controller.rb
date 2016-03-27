class SaladsController < ApplicationController
  http_basic_authenticate_with name: "tossr", password: "salads", except: [:index, :show]

  def index
    @salads = Salad.all
  end

  def show
    @salad = Salad.find(params[:id])
  end

  def new
    @salad = Salad.new
  end

  def create
    @salad = Salad.new(salad_params)
 
    if @salad.save
      redirect_to @salad
    else
      render 'new'
    end
  end
 
  private
    def salad_params
      params.require(:salad).permit(:title, :text)
    end

end
