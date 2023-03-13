class SocialNetwork::UpdatePostsJob < ApplicationJob
  queue_as :default
  retry_on JSON::ParserError

  def perform
    posts_cache = Kredis.hash("my_social_network_posts")
    posts_cache.remove if posts_cache.exists?

    SocialNetwork::PostService.new.call
  end
end
