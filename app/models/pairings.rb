class Pairing

  HEADERS ={
            
  }

  attr_accessor :title, :author, :beer_name, :genre, :alcohol

  def initialize(hash)
    @title = hash["title"]
    @author = hash["author"]
    @genre = hash["genre"]
    @beer_name = hash["beer_name"]
    @alcohol = hash["alcohol"]
  end

  def self.all 
    @pairings = []
    api_pairings = Unirest.get("#{ ENV['API_HOST_URL'] }/api/v1/pairings.json").body
    api_pairings.each do |pairing_hash|
      @pairings << Pairing.new(pairing_hash)
    end
  end

  def self.find(pairing_id)
    Pairing.new(Unirest.get("#{ ENV['API_HOST_URL'] }/api/v1/pairings/#{pairing_id}.json").body)
  end

  def destroy
      @pairing = Unirest.delete(
                                "#{ ENV['API_HOST_URL'] }/api/v1/pairings#{ id }",
                                headers:{
                                        "Accept" => "application/json"
                                      },
                                ).body
  end
end

