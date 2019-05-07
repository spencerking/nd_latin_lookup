require 'net/http'

if ARGV[0] == nil
    puts "Please provide a word to look up."
    exit
end

src = "http://archives.nd.edu/cgi-bin/wordz.pl?keyword=" + ARGV[0]
uri = URI(src)
results = Net::HTTP.get(uri)

i = 0
bracket = false
while i < results.length
    if results[i] == "<"
	bracket = true
    elsif results[i] == ">"
	bracket = false
    elsif bracket == true
	# Do nothing
    else
	print results[i]
    end

    i = i + 1
end
