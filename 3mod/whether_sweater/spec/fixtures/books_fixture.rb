module BooksFixture
  BOOKS = {
    data: {
      id: nil,
      type: 'books',
      attributes: {
        destination: 'denver,co',
        forecast: {
          summary: 'Cloudy with a chance of meatballs',
          temperature: '83 F'
        },
        total_books_found: 758,
        books: [
          {
            isbn: [
              '0762507845',
              '9780762507849'
            ],
            title: 'Denver, Co',
            publisher: [
              'Universal Map Enterprises'
            ]
          },
          {
            isbn: [
              '0607620056',
              '9780607620054'
            ],
            title: 'Denver west, CO and Bailey, CO: Denver, CO',
            publisher: [
              'USGS Branch of Distribution'
            ]
          },
          {
            isbn: [
              '9780607620047',
              '0607620048'
            ],
            title: 'Denver East, CO and Castle Rock, CO: Denver, CO',
            publisher: [
              'USGS Branch of Distribution'
            ]
          }
        ]
      }
    }
  }
end
