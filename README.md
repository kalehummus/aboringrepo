
A deployed version of this application can be viewed at https://radiant-sea-87030.herokuapp.com/

Ruby version: 2.4.1
Rails version: 5.2.1

I initially started out with a script that looked like this:
```
require 'httparty'
require 'uri'

def make_url(query)
  search_url = "https://www.googleapis.com/books/v1/volumes?q="
  get_search = search_url + query
end

def search_by_title(url)
  response = HTTParty.get(url)
  response["items"].each do |x|
    puts "Title: #{x["volumeInfo"]["title"]}"
    puts "The author(s): "
    authors = x["volumeInfo"]["authors"]
    authors.each do |y|
      puts y
    end
  end
end

puts "what book would you like to search?"
my_search = URI.escape(gets.chomp.to_s)
the_response = make_url(my_search)

search_by_title(the_response)
```

This printed book information to the command line. I wasn't great about version control and I didn't actually start using git until I had a working rails app.

I used similar methods in my Books controller to what's listed above in the first version of my app.

Then, I refactored my code to make it more readable and single-use functions.
