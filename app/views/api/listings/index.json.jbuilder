json.array!(@listings) do |listing|
    json.extract! listing, :id, :name, :description, :price, :image
    json.url image.url
  end