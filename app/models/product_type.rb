class ProductType < ActiveRecord::Base

  has_many :products

  validates_presence_of :title, :message => "Informe o titulo do produto."
  validates_uniqueness_of :title

end
