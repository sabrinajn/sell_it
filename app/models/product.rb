class Product < ActiveRecord::Base

  belongs_to :product_type

  validates_presence_of :title, :message => "Informe o titulo do produto."
  validates_presence_of :description, :message => "Informe a descrição do produto."
  validates_presence_of :price, :message => "Informe o preço do produto."
  validates_presence_of :image_url, :message => "Informe a url da imagem do produto."

  validates_uniqueness_of :title
  validates_numericality_of :price


  def validate
    self.errors.add(:price, "O preço precisa ser maior que R$ 0.01!") if self.price.nil? or self.price < 0.01
  end

end
