class Search < ApplicationRecord

  def search_books
    books = Book.all

    books = books.where(["title LIKE ?", "%#{title}%"]) if title.present?
    books = books.where(["author LIKE ?", "%#{author}%"]) if author.present?
    books = books.where(["year LIKE ?", year]) if year.present?

    return books
  end
end
