# json.extract! event, :id, :title, :description, :start_date, :end_date, :created_at, :updated_at

# 下２つはdateを追加したときに不必要だった
# json.extract! event, :id, :title, :description, :start_date, :end_date, :created_at, :updated_at, :date
# json.url event_url(event, format: :json)
