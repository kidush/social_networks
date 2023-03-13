module SocialNetwork
  class PostService
    attr_reader :social_network_klass, :posts_cache

    SOCIAL_NETWORKS = %w[twitter facebook instagram]

    def initialize(social_network_klass = SocialNetwork::Post)
      @social_network_klass = social_network_klass
      @posts_cache = Kredis.hash("my_social_network_posts")
    end

    def call
      posts = SOCIAL_NETWORKS.to_h { |social_network| [social_network, []] }

      return posts_cache.to_h if posts_cache.exists?

      posts.each do |social_network, _|
        posts[social_network] = social_network_klass.new(social_network).latest
      end

      cache_result(posts)

      posts
    end

    private

    def cache_result(posts)
      posts_cache.update(**posts)
    end
  end
end
