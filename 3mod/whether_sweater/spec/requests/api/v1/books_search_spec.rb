require 'rails_helper'

RSpec.describe 'Books Search', type: :request, vcr: { record: :new_episodes } do
  xit 'returns a list of books' do
    get api_v1_book_search_path({ location: 'denver,co', quantity: 3 })

    expect(response).to be_successful
    expect(response.status).to eq(200)

    books = JSON.parse(response.body, symbolize_names: true)

    expect(books).to be_a(Hash)
    expect(books.keys.count).to eq(1)
    expect(books).to have_key(:data)

    expect(books[:data]).to be_a(Hash)
    expect(books[:data].keys.count).to eq(3)
    expect(books[:data]).to have_key(:id)
    expect(books[:data]).to have_key(:type)
    expect(books[:data]).to have_key(:attributes)

    expect(books[:data][:id]).to eq(nil)
    expect(books[:data][:type]).to eq('books')
    expect(books[:data][:attributes]).to be_a(Hash)
    expect(books[:data][:attributes].keys.count).to eq(4)

    expect(books[:data][:attributes]).to have_key(:destination)
    expect(books[:data][:attributes]).to have_key(:forecast)
    expect(books[:data][:attributes]).to have_key(:total_books_found)
    expect(books[:data][:attributes]).to have_key(:books)

    expect(books[:data][:attributes][:destination]).to be_a(String)
    expect(books[:data][:attributes][:total_books_found]).to be_a(Integer)
    expect(books[:data][:attributes][:books]).to be_an(Array)

    expect(books[:data][:attributes][:forecast]).to be_a(Hash)
    expect(books[:data][:attributes][:forecast].keys.count).to eq(2)
    expect(books[:data][:attributes][:forecast]).to have_key(:summary)
    expect(books[:data][:attributes][:forecast]).to have_key(:temperature)

    expect(books[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(books[:data][:attributes][:forecast][:temperature]).to be_a(String)

    books[:data][:attributes][:books].each do |book|
      expect(book).to be_a(Hash)
      expect(book.keys.count).to eq(3)
      expect(book).to have_key(:isbn)
      expect(book).to have_key(:title)
      expect(book).to have_key(:publisher)

      expect(book[:isbn]).to be_an(Array)
      expect(book[:isbn]).to all(be_a(String))
      expect(book[:title]).to be_a(String)
      expect(book[:publisher]).to be_an(Array)
      expect(book[:publisher]).to all(be_a(String))
    end
  end
end
