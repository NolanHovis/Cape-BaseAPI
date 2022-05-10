module Api
  module V1
    class BooksController < ApplicationController
       # POST /api/v1/books
       def create 
        result = Books.new_book(book_params, @current_user)
        render_error(errors: "Error saving book!", status: 400) and return unless result.success?
        payload = {
          book: BookBlueprint.render_as_hash(result.payload)
        }
        render_success(payload: payload)
       end
       # PATCH/PUT /api/v1/books/:id
       def update 
        result = Books.update_book(params[:id], book_params, @current_user)
        render_error(error: "Error updating book!", status: 400) and return unless result.success?
        payload = {
          book: BookBlueprint.render_as_hash(result.payload)
        }
        render_success(payload)
       end
       # DELETE /api/v1/books:id
       def delete 
        result = Books.destroy_book(params[:id], @current_user)
        render_error(error: "Error deleting book", status: 400) and return unless result.success?
        render_success(payload: nil)
       end
       # GET
       # user books - get current user books 
       def my_books 
        render_success(payload: BookBlueprint.render_as_hash(@current_user.books))
       end

       private 
       def book_params
          params.require(:book).permit(:title, :author, :genre, :coverImagePath)
       end
    end
  end
end

