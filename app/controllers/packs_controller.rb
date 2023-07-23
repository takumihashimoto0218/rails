require "net/http"
require "uri"
require "json"

class PacksController < ApplicationController
  before_action :set_pack, only: [:show, :edit, :update]
  def index
    @packs = Pack.all
  end
  
  def show
    uris = @pack.packdetails.map { |packdetail| URI("https://hanatane.jp/api/v1/topics/#{packdetail.topic_id}") }
    @topics = []
  
    begin
      uris.each do |uri|
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true
  
        request = Net::HTTP::Get.new(uri)
        response = https.request(request)
  
        if response.is_a?(Net::HTTPSuccess)
          @topics << JSON.parse(response.body)["topic"]
        else
          flash[:alert] = "There was an error retrieving the topics."
        end
      end
    rescue StandardError => e
      flash[:alert] = "An unexpected error occurred: #{e.message}"
    end
  end
    

  def new
    @pack = Pack.new
    @pack.packdetails.build
  end

  def create
    modified_pack_params = Pack.modified_packdetails(pack_params)
    @pack = Pack.new(modified_pack_params)
    if @pack.save
      binding.pry
      redirect_to packs_path, notice: "投稿しました"
    else
      render :new
      return #繰り返しrenderが呼び出されないように
    end
  end

  def edit
  end

  def update
    update_modified_pack_params = Pack.update_modified_packdetails(pack_params)
    binding.pry
    if @pack.update!(update_modified_pack_params)
      redirect_to pack_path(@pack)
    else
      render :edit
      return
    end
  end
  

  private 
    def pack_params
      params.require(:pack).permit(:name, packdetails_attributes:[:id, :topic_id ])
    end

    def set_pack
      @pack = Pack.find(params[:id])
    end
end