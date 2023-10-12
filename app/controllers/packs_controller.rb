require "net/http"
require "uri"
require "json"

class PacksController < ApplicationController

  before_action :set_pack, only: [:show, :edit, :update, :destroy]
  before_action :set_topic, only: [:show, :edit, :update]
  before_action :set_previous_pack, only: [:show]
  before_action :set_next_pack, only: [:show]


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
      return
    end
  end

  def edit
  end

  def update
    if @pack.update(pack_params)
      redirect_to pack_path(@pack), notice: "パックを更新しました"
    else
      render :edit
      return
    end
  end

  def destroy
    @pack.destroy
    redirect_to packs_path, notice: "パックを削除しました"
  end

  private
    def pack_params
      params.require(:pack).permit(:title, packdetails_attributes:[:id, :topic_id, :_destroy])
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

    def set_previous_pack
      @previous_pack = Pack.where("id < ?", @pack.id).last
    end

    def set_next_pack
      @next_pack = Pack.where("id > ?", @pack.id).first
    end
end