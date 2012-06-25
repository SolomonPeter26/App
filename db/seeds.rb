
#I had to explicitly write the OPenlibrary fetched data to the Data.txt file because the gem openlibrary was not being loaded into the environment. tried a lot on the issue but couldn't find a solution
counter=0;
b=Book.new

File.open("db/ISBN.csv","r") do |infile|
    line = infile.gets
    while (line = infile.gets)
            puts "#{counter}: #{line}"
            details = Openlibrary::Data
            book_details = details.find_by_isbn(Integer(line))
            if not(book_details)
                next
            end
            b.title=String(book_details.title)
            b.ISBN_10=String(book_details.identifiers['isbn_10'])
            b.authors=String(book_details.authors)
            b.pages=String(book_details.pages)
            b.weight=String(book_details.weight)
            b.save
            b=Book.new
       counter = counter + 1
    end
end
