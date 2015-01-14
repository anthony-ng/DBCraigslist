class Article < ActiveRecord::Base
  after_save :generate_key
  belongs_to :category

  private
  def generate_key
    key = Digest::MD5.hexdigest(self.id.to_s)[0..6]
    self.update_column(:article_key, key)
  end
end
