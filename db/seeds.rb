require 'json'
require 'open-uri'

require 'csv'


# Fetch books data from API
books_url = 'https://gutendex.com/books/'
books_serialized = URI.open(books_url).read
books_data = JSON.parse(books_serialized)

books = books_data['results']
# Create books
books.each do |book_data|
  authors = book_data['authors']

  book = Book.create(
    title: book_data['title'],
    description: Faker::Quote.famous_last_words,
    language: book_data['languages'].join(', '),
    downloads: book_data['download_count']
  )

  authors.each do |author_data|
    author = Author.find_or_create_by(author_name: author_data['name'])
    book.authors << author
  end

  book_data['subjects'].each do |subject_name|
    subject = Subject.find_or_create_by(subject_name: subject_name)
    book.subjects << subject
  end
end

# Fetch subjects data from API
subjects_url = 'https://gutendex.com/books/'
subjects_serialized = URI.open(subjects_url).read
subjects_data = JSON.parse(subjects_serialized)
subjects = subjects_data['results']
# Create subjects
subjects.each do |subject_data|
  Subject.create(
    subject_name: subject_data['name']
  )
end


# Fetch authors data from API
authors_url = 'https://gutendex.com/books/'
authors_serialized = URI.open(authors_url).read
authors_data = JSON.parse(authors_serialized)
records = authors_data['results']

# Iterate over authors and create records
records.each do |record|
  record['authors'].each do |author_data|
    author_name = author_data['name']
    birth_year = author_data['birth_year']

    # Create author record
    Author.create(author_name: author_name, birth_year: birth_year)
  end
end




csv_path = File.join(File.dirname(__FILE__), 'book.csv')

CSV.foreach(csv_path, headers: true) do |row|
  book_data = row.to_hash

  title = book_data['Title']
  author_name = book_data['Author 1 Name']
  author_birth_year = book_data['Author 1 birth_year']
  subjects = book_data.values_at('Subject 1', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5').compact
  downloads = book_data['Downloads']
  language = book_data['Languages']

  book = Book.create(
    title: title,
    description: Faker::Quote.famous_last_words,
    downloads: downloads,
    language: language
  )

  author = Author.find_or_create_by(author_name: author_name)
  author.update(birth_year: author_birth_year)
  book.authors << author

  subjects.each do |subject_name|
    subject = Subject.find_or_create_by(subject_name: subject_name)
    book.subjects << subject
  end
end


# Create readers using Faker gem
200.times do
  Reader.create(
    name: Faker::Name.name
  )
end

# Assign readers to books
Book.all.each do |book|

    reader = Reader.all.sample
    book.readers << reader


    # Generate random values for reader data
    reader.update(
      books_read: rand(10..100),
      books_reading: rand(10..100),
      books_saved: rand(10..100)
    )
    book.save!

end

