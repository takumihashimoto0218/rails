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
    url = pack_params[:packdetails_attributes]["0"][:topic_id]
    modified_url = modify_url(url)
    binding.pry
    modified_pack_params = pack_params.deep_dup
    modified_pack_params[:packdetails_attributes]["0"][:topic_id] = modified_url
    @pack = Pack.new(modified_pack_params)
    @pack.save
    if @pack.save
      redirect_to packs_path, notice: "投稿しました"
    else
      render :new
    end  
  end

  private 
    def pack_params
      params.require(:pack).permit(:name, packdetails_attributes:[:topic_id ])
    end

    # def get_topic_id
    #   @topic_id = Packdetail::Find_Topic_id
    # end

    def modify_url(url)
      topic = url.match(/\/(\d+)$/)[1]
      topic.to_i
    end
end
