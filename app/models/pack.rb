class Pack < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 30}
  has_many :packdetails, dependent: :destroy
  accepts_nested_attributes_for :packdetails 

  def self.modified_packdetails(pack_params)
    begin
      modified_pack_params = pack_params.deep_dup
  
      pack_params[:packdetails_attributes].each do |key, value|
        t = key.to_i
        url = value[:topic_id]
        modified_url = modify_url(url)
        modified_pack_params[:packdetails_attributes][t.to_s][:topic_id] = modified_url
      end
  
      modified_pack_params
  
    rescue StandardError => e
      puts "エラーが発生しました: #{e.message}"
      nil
    end
  end
  


  def self.modify_url(url)
    topic = url.to_s.match(/\/(\d+)$/)&.captures&.first
    topic.to_i if topic
  end 
  
  def self.update_modified_packdetails(pack_params)
    begin
      modified_pack_params = modified_packdetails(pack_params)
      update_modified_pack_params = modified_pack_params.deep_dup
    
      pack_params[:packdetails_attributes].each do |key, value|
        t = key.to_i
        url = value[:topic_id]
        modified_url = modify_url(url)
        update_modified_pack_params[:packdetails_attributes][t.to_s][:topic_id] = modified_url
      end
    
      update_modified_pack_params

    rescue StandardError => e
      puts "エラーが発生しました: #{e.message}"
      nil
    end
  end

end
