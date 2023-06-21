class PacksController < ApplicationController
  def index
    @packs = Pack.all
  end
  
  def show
    @pack = Pack.find(params[:id])
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
