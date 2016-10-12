require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A book must have a name, an author, and a description" do
    fake_book = Book.new
    assert fake_book.invalid? "A book must have a name, an author, and a description"

    fake_book_name = Book.new ({name: "A Wrinkle in Time", author: nil, description: nil, votes: 0})
    assert fake_book_name.invalid? "A book must have a name, an author, and a description"

    fake_book_name_author = Book.new ({name: "A Wrinkle in Time", author: "Madeline L'Engle", description: nil, votes: 0})
    assert fake_book_name_author.invalid? "A book must have a name, an author, and a description"

    fake_book_name_author_description = Book.new ({name: "A Wrinkle in Time", author: "Madeline L'Engle", description: "A young girl must traverse the multiverse to save her quirky brother and father.", votes: 0})
    puts fake_book_name_author_description.name
    puts fake_book_name_author_description.author
    puts fake_book_name_author_description.description
    fake_book_name_author_description.save
    assert fake_book_name_author_description.valid?
  end

end
