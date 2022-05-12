json.array! @books do |book|
    json.id book.id
    json.name book.title
    json.created_at book.created_at
end