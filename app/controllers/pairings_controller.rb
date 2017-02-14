class PairingsController < ApplicationController
  def index
    @pairings = Pairing.all
  end

  def new
    @pairing = Pairing.new
  end

  def create
    @pairing = Pairing.create(
                              title: params[:title],
                              author: params[:author],
                              genre: params[:genre],
                              beer_name: params[:beer_name],
                              alcohol: params[:alcohol]
                              )

    redirect_to "/pairings/#{pairings.id}"
  end
  
  def show
    @pairing = Pairing.find(params[:id])
  end

  def edit
    @pairing = Unirest.get("#{ ENV['API_HOST_URL'] }/api/v1/pairings.json").body
  end
  
  def update
    @pairing = Pairing.find(params[:id])
    @pairing.update(
                    title: params[:title],
                    author: params[:author],
                    genre: params[:genre],
                    beer_name: params[:beer_name],
                    alcohol: params[:alcohol]
                    )
    redirect_to '/pairings/#{@pairing.id}'
  end

  def destroy
    @pairing = Pairing.find(params[:id])
    @pairing.destroy
    redirect_to '/pairings'
  end
end
