class Pairing

  HEADERS ={
            "Accept" => "application/json",
            "X-User-Email" => ENV['API_EMAIL'],
            "Authorization" => "Token token=#{ENV['API_TOKEN']}"
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
    pairings_collection = []
    api_pairings = Unirest.get(
                              "#{ ENV['API_HOST_URL'] }/api/v1/pairings.json"
                              headers: HEADERS
                              ).body
    api_pairings.each do |pairing_hash|
      pairings_collection << Pairing.new(pairing_hash)
    end
  end

  def self.find(pairing_id)
    Pairing.new(Unirest.get(
                            "#{ ENV['API_HOST_URL'] }/api/v1/pairings/#{pairing_id}.json",)
                              headers: HEADERS
                              ).body)
  end

  def destroy
      @pairing = Unirest.delete(
                                "#{ ENV['API_HOST_URL'] }/api/v1/pairings#{ id }",
                                headers: HEADERS
                                ).body
  end

  def self.create(pairing_info)
    response_body = Unirest.post(
                                 "#{ ENV['API_HOST_URL'] }/api/v1/pairings",
                                 headers: HEADERS
                                 parameters: pairing_info
                                 ).body
    Pairing.new(response_body)
  end

  def update(pairing_info)
    response_body = Unirest.patch(
                                  "#{ ENV['API_HOST_URL'] }/api/v1/pairings#{ id }",
                                  headers: HEADERS
                                  parameters: pairing_info
                                  ).body
    Pairing.new(response_body)
  end
end

