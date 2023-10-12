class PackWrapper
  def self.fetch_topics(pack)
    uris = pack.packdetails.map { |packdetail| URI("https://hanatane.jp/api/v1/topics/#{packdetail.topic_id}") }
    topics = []

    begin
      uris.each do |uri|
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(uri)
        response = https.request(request)

        if response.is_a?(Net::HTTPSuccess)
          topics << JSON.parse(response.body)["topic"]
        else
          flash[:alert] = "There was an error retrieving the topics."
        end
      end
    rescue StandardError => e
      flash[:alert] = "An unexpected error occurred: #{e.message}"
    end
    topics
  end
end
