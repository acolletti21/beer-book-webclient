class PairingsController < ApplicationController
  def index
    @pairings = Unirest.get("http://localhost:3000/api/v1/pairings.json").body
  end

  def new

  end

  def create
    @pairing = Unirest.post(
                              "http://localhost:3000/api/v1/pairings",
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

    redirect_to '/pairings/#{pairings[:id]}'
  end
  
  def show
    @pairing = Unirest.get("http://localhost:3000/api/v1/pairings/#{params[:id]}.json").body
  end
end
