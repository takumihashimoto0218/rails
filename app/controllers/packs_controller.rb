class PacksController < ApplicationController
  def index
    @packs = Pack.all
  end
  
  def show
    @pack = Pack.find(params[:id])
  end

  def new
    @pack = Pack.new
    # @pack.packdetails.build
  end

  def create
    plan_array = params[:pack][:topic]
    params[:pack][:topic] = plan_array.join(',')
    @pack = Pack.new(pack_params)
    if @pack.save!
      redirect_to packs_path, notice: "投稿しました"
    else
      render :new
    end  
  end

  private 
    def pack_params
      params.require(:pack).permit(:name, packdetails_attributes:[:id, :topic_id ])
    end
end
