module SlugExtension
  def slug
    self.title.downcase.gsub(/\s/, '-')
  end
end