json.id          @source.slug
json.title       @source.name
json.pages       @source.pages.size
json.description @source.description

json.created_at  @source.created_at
json.updated_at  @source.updated_at

json.canonical_url source_path(@source)
json.source        @source.attribution

json.resources do
  json.pdf @source.document.url
  json.thumbnail @source.image.thumbnail.url

  json.page do
    json.image "https://antiquarium-development.s3-us-west-1.amazonaws.com/sources/#{@source.uuid}/pages/{page}/{size}.jpg"
  end
end
