class PairingsController < ApplicationController
  def index
    @pairings = Pairing.all
  end

  def new

  end

  def create
    @pairing = Unirest.post(
                              "#{ ENV['API_HOST_URL'] }/api/v1/pairings",
                              headers:{
                                    "Accept" => "application/json"
                                      },
                              parameters:{
                                          title: params[:title],
                                          author: params[:author],
                                          genre: params[:genre],
                                          beer_name: params[:beer_name],
                                          alcohol: params[:alcohol]
                                          }
                              ).body

    redirect_to "/pairings/#{pairings["id"]}"
  end
  
  def show
    @pairing = Pairing.find(params[:id])
  end

  def edit
    @pairing = Unirest.get("#{ ENV['API_HOST_URL'] }/api/v1/pairings.json").body
  end
  
  def destroy
    @pairing = Pairing.find(params[:id])
    @pairing.destroy
    redirect_to '/pairings'
  end
end
