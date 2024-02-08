require './spec/fixtures/author_data'
require './spec/fixtures/book_data'
include AuthorData
include BookData

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
Author.destroy_all

gabor_mate = Author.create!(GABOR_MATE)
malcolm_gladwell = Author.create!(MALCOLM_GLADWELL)
seth_godin = Author.create!(SETH_GODIN)
jrr_tolkien = Author.create!(JRR_TOLKIEN)

book1_1 = gabor_mate.books.create!(BOOK1_1)
book1_2 = gabor_mate.books.create!(BOOK1_2)
book1_3 = gabor_mate.books.create!(BOOK1_3)
book1_4 = gabor_mate.books.create!(BOOK1_4)
book1_5 = gabor_mate.books.create!(BOOK1_5)

book2_1 = malcolm_gladwell.books.create!(BOOK2_1)
book2_2 = malcolm_gladwell.books.create!(BOOK2_2)
book2_3 = malcolm_gladwell.books.create!(BOOK2_3)
book2_4 = malcolm_gladwell.books.create!(BOOK2_4)
book2_5 = malcolm_gladwell.books.create!(BOOK2_5)
book2_6 = malcolm_gladwell.books.create!(BOOK2_6)
book2_7 = malcolm_gladwell.books.create!(BOOK2_7)

book3_1 = seth_godin.books.create!(BOOK3_1)
book3_2 = seth_godin.books.create!(BOOK3_2)
book3_3 = seth_godin.books.create!(BOOK3_3)
book3_4 = seth_godin.books.create!(BOOK3_4)
book3_5 = seth_godin.books.create!(BOOK3_5)
book3_6 = seth_godin.books.create!(BOOK3_6)
book3_7 = seth_godin.books.create!(BOOK3_7)
book3_8 = seth_godin.books.create!(BOOK3_8)
book3_9 = seth_godin.books.create!(BOOK3_9)

book4_1 = jrr_tolkien.books.create!(BOOK4_1)
book4_2 = jrr_tolkien.books.create!(BOOK4_2)
book4_3 = jrr_tolkien.books.create!(BOOK4_3)
book4_4 = jrr_tolkien.books.create!(BOOK4_4)
book4_5 = jrr_tolkien.books.create!(BOOK4_5)
book4_6 = jrr_tolkien.books.create!(BOOK4_6)
