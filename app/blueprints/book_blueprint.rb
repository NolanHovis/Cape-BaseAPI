class BookBlueprint < Blueprinter::Base 
  identifier :id
  fields :title, :author, :genre, :coverImagePath

  view :normal do
    fields :created_at, :updated_at
  end
end