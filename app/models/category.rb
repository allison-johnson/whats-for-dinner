class Category < ApplicationRecord
  @@all_categories = [new Category(name: "Chicken")]
  has_many :recipes

  def slug
    str = self.name
    arr = str.split(" ")
    arr.map{|word| word.downcase}.join("-")
  end #slug

  def self.find_by_slug(slug_name)
    self.all.find{|category| category.slug == slug_name}
  end #self.find_by_slug

  def self.get_all_categories
    @@all_categories
  end #self.get_all_categories

end #class