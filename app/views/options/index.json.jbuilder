json.array!(@options) do |option|
  json.extract! option, :question_id, :text, :correct
  json.url option_url(option, format: :json)
end
