require "net/http"
require "uri"
require "json"

class PacksController < ApplicationController
  def index
    @packs = Pack.all
  end
  
  def show
    @pack = Pack.find(params[:id])
    # binding.pry
    uri = URI("https://hanatane.jp/api/v1/topics/#{@pack.packdetails.first.topic_id}")
    # uri.query = URI.encode_www_form()

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    begin
      request = Net::HTTP::Get.new(uri)
      response = https.request(request)

      if response.is_a?(Net::HTTPSuccess)
        @topics = JSON.parse(response.body)["topic"]
      else
        flash[:alert] = "There was an error retrieving the topics."
        @topics = []
      end
    rescue StandardError => e
      flash[:alert] = "An unexpected error occurred: #{e.message}"
      @topics = []
    end
    binding.pry
  end

  def new
    @pack = Pack.new
      @pack.packdetails.build
  end

  def create
    modified_pack_params = Pack.modified_packdetails(pack_params)
    @pack = Pack.new(modified_pack_params)
    if @pack.save
      redirect_to packs_path, notice: "投稿しました"
    else
      render :new
      return #繰り返しrenderが呼び出されないように
    end
  end
  

  private 
    def pack_params
      params.require(:pack).permit(:name, packdetails_attributes:[:topic_id ])
    end

    def modify_url(url)
      topic = url.match(/\/(\d+)$/)[1]
      topic.to_i
    end
end