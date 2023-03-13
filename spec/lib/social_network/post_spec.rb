require "rails_helper"

RSpec.describe SocialNetwork::Post do
  describe "Twitter" do
    describe "#latest" do
      subject { described_class.new("twitter") }

      context "When the request works" do
        let(:posts) do
          [
            {
              username: "@GuyEndoreKaiser",
              tweet: "If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate a pinecone every single day."
            },
            {
              username: "@mikeleffingwell",
              tweet: "STOP TELLING ME YOUR NEWBORN'S WEIGHT AND LENGTH I DON'T KNOW WHAT TO DO WITH THAT INFORMATION."
            }
          ]
        end

        it "returns a list of posts from twitter" do
          stub_request(:get, "https://takehome.io/twitter")
            .to_return(status: 200, body: posts.to_json)

          parsed_response = subject.latest
          expect(parsed_response.to_json).to eq(posts.to_json)
        end
      end

      context "When the request returns an invalid json response" do
        it "returns a JSON::ParseError exception" do
          stub_request(:get, "https://takehome.io/twitter")
            .to_return(status: 200, body: "A invalid json response!")

          expect { subject.latest }.to raise_exception(JSON::ParserError)
        end
      end
    end
  end
  describe "Facebook" do
    describe "#latest" do
      subject { described_class.new("facebook") }

      context "When the request works" do
        let(:posts) do
          [
            {
              name: "Some Friend",
              status: "Here's some photos of my holiday. Look how much more fun I'm having than you are!"
            },
            {
              name: "Drama Pig",
              status: "I am in a hospital. I will not tell you anything about why I am here."
            }
          ]
        end

        it "returns a list of posts from facebook" do
          stub_request(:get, "https://takehome.io/facebook")
            .to_return(status: 200, body: posts.to_json)

          parsed_response = subject.latest
          expect(parsed_response.to_json).to eq(posts.to_json)
        end
      end

      context "When the request returns an invalid json response" do
        it "returns a JSON::ParseError exception" do
          stub_request(:get, "https://takehome.io/facebook")
            .to_return(status: 200, body: "A invalid json response!")

          expect { subject.latest }.to raise_exception(JSON::ParserError)
        end
      end
    end
  end
  describe "Instagram" do
    describe "#latest" do
      subject { described_class.new("instagram") }

      context "When the request works" do
        let(:posts) do
          [
            {
              username: "hipster1",
              picture: "food"
            },
            {
              username: "hipster2",
              picture: "coffee"
            },
            {
              username: "hipster3",
              picture: "coffee"
            },
            {
              username: "hipster4",
              picture: "food"
            },
            {
              username: "hipster5",
              picture: "this one is of a cat"
            }
          ]
        end

        it "returns a list of posts from facebook" do
          stub_request(:get, "https://takehome.io/instagram")
            .to_return(status: 200, body: posts.to_json)

          parsed_response = subject.latest
          expect(parsed_response.to_json).to eq(posts.to_json)
        end
      end

      context "When the request returns an invalid json response" do
        it "returns a JSON::ParseError exception" do
          stub_request(:get, "https://takehome.io/instagram")
            .to_return(status: 200, body: "A invalid json response!")

          expect { subject.latest }.to raise_exception(JSON::ParserError)
        end
      end
    end
  end
end
