class TopicService < BaseService
  def self.get_topics(page: 1)
    
    uri = URI("https://hanatane.jp/api/v1/topics")
    uri.query = URI.encode_www_form({ page: page })

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    begin
      request = Net::HTTP::Get.new(uri)
      response = https.request(request)

      if response.is_a?(Net::HTTPSuccess)
        @topics = JSON.parse(response.body)["topics"]
        render json: @topics
      else
        render json: { error: "There was an error retrieving the topics." }
      end
    rescue StandardError => e
      render json: { error: "An unexpected error occurred: #{e.message}" }
    end
  end
end