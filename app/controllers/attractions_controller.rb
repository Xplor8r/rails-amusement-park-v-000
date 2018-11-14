class AttractionsController < ApplicationController
  before_action :attraction
  skip_before_action :attraction, only: [:new, :create, :index]

  def show
    @ride = Ride.new
  end

  def edit
  end

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if !@attraction.save
      render :new
    else
      notice: 'Attraction was successfully created.'
      redirect_to @attraction
    end
  end

  def update
      if @attraction.update(attraction_params)
        notice: 'Attraction was successfully updated.'
        redirect_to @attraction
      else
        render :edit
      end
    end
  end


  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
    end
  end

  private
    def attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :happiness_rating, :min_height, :nausea_rating, :tickets)
    end
=======
  end

  def new
  end

  def show
  end
>>>>>>> e8377532b7eb71ab9d63994d832d74e2b92e9d61
end
