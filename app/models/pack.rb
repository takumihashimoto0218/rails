class Pack < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 30}
  has_many :packdetails, dependent: :destroy
  accepts_nested_attributes_for :packdetails 

  def self.modified_packdetails(pack_params)
    modified_pack_params = pack_params.deep_dup

    pack_params[:packdetails_attributes].each do |key, value|
      t = key.to_i
      url = value[:topic_id]
      modified_url = modify_url(url)
      modified_pack_params[:packdetails_attributes][t.to_s][:topic_id] = modified_url
    end

    modified_pack_params
  end

  def self.modify_url(url)
    topic = url.match(/\/(\d+)$/)[1]
    topic.to_i
  end

end
