json.array!(@movies) do |movie|
  json.extract! movie, :title, :plot, :released_at
  json.url movie_url(movie, format: :json)
end
