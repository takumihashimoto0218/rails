require "net/http"
require "uri"
require "json"

class PacksController < ApplicationController
 
  before_action :set_pack, only: [:show, :edit, :update]
  before_action :set_topic, only: [:show]
 
  def index
    @packs = Pack.all
  end
  
  def show
    
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

  def edit
  end

  def update
    update_modified_pack_params = Pack.update_modified_packdetails(pack_params)
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

    def set_topic
      begin
        @topics = PackWrapper.fetch_topics(@pack)
      rescue StandardError => e
        flash[:alert] = e.message
      end
    end
end