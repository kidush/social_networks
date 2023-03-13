module SocialNetwork
  class Post
    include HTTParty

    base_uri "https://takehome.io"

    def initialize(social_network)
      @social_network = social_network
    end

    def latest
      response = self.class.get("/#{@social_network}", headers: { "Content-Type": "aplication/json"})
      response.body
      #JSON.parse(response)
    end
  end
end
