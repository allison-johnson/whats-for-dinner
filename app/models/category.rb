class Category < ApplicationRecord
  has_many :recipes

  def slug
    str = self.name
    arr = str.split(" ")
    arr.map{|word| word.downcase}.join("-")
  end #slug

  def self.find_by_slug(slug_name)
    self.all.find{|category| category.slug == slug_name}
  end #self.find_by_slug

end #class