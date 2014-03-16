User.destroy_all
["Joe"].each do |name|
  u = User.new
  u.first_name = name
  u.email = "jmead2014@kellogg.northwestern.edu"
  u.password = "badpassword"
  u.save
end

puts "There are now #{User.count} users in the database."

Category.destroy_all
["Original", "ESPN TV", "ESPN Radio"].each do |category_name|
  c = Category.new
  c.name = category_name
  c.save
end

Item.destroy_all
audio_catalog = [ { :name => "The B.S.Report",
                      :category_name => 'Original',
                      :date => "February 19, 2014",
                      :image_url => 'http://a.espncdn.com/i/espnradio/stations/espn/podcasts/bs_report_288.jpg',
                      :description => "Lena Dunham reveals to Bill Simmons how she found out her boyfriend had dated Scarlett Johansson, and why she found the Internet's backlash to 'Girls' hilarious.",
                      :link => "http://espn.go.com/espnradio/play?id=10486368",
                    },
                    { :name => "NBA Lockdown",
                      :category_name => 'Original',
                      :date => "February 21, 2014",
                      :image_url => 'http://a.espncdn.com/i/espnradio/stations/espn/podcasts/nbaLockdown_288.jpg',
                      :description => "Bruce Bowen and Israel Gutierrez break down the Heat's big win over the Thunder, evaluate Russell Westbrook's return and react to the relatively uneventful trade deadline.",
                      :link => "http://espn.go.com/espnradio/play?id=10496891",
                    },
                    { :name => "Real Talk",
                      :category_name => 'Original',
                      :date => "February 20, 2014",
                      :image_url => 'http://a.espncdn.com/i/espnradio/stations/espn/podcasts/realtalk_288.jpg',
                      :description => "Shannon Sharpe joins Jason Whitlock to discuss his firing from CBS in favor of retired TE Tony Gonzalez, why he doesn't take it personally and much more.",
                      :link => "http://espn.go.com/espnradio/play?id=10492663",
                    },
                    { :name => "Mike & Mike",
                      :category_name => 'ESPN Radio',
                      :date => "February 21, 2014",
                      :image_url => 'http://a.espncdn.com/i/espnradio/stations/espn/podcasts/mm_288.jpg',
                      :description => "Mike Greenberg and Mike Golic discuss the Heat's big win over the Thunder, the latest with Ray Rice and chat with Adnan Virk.",
                      :link => "http://espn.go.com/espnradio/play?id=10496061",
                    },
                    { :name => "The Herd",
                      :category_name => 'ESPN Radio',
                      :date => "February 21, 2014",
                      :image_url => 'http://a.espncdn.com/i/espnradio/stations/espn/podcasts/herd_288.jpg',
                      :description => "Colin Cowherd discusses the NBA trade deadline, the latest with Ray Rice and chats with Marc Stein, Greg Cosell and Doug Flutie.",
                      :link => "http://espn.go.com/espnradio/play?id=10496718",
                    },
                    { :name => "SVP & Russillo",
                      :category_name => 'ESPN Radio',
                      :date => "February 21, 2014",
                      :image_url => 'http://a.espncdn.com/i/espnradio/stations/espn/podcasts/svpr_288.jpg',
                      :description => "Ryen Russillo and Chris Broussard break down Miami's big win over OKC last night. Plus, they chat with Wizards coach Randy Wittman and answer NBA questions.",
                      :link => "http://espn.go.com/espnradio/play?id=10498167",
                    },
                    { :name => "First Take",
                      :category_name => 'ESPN TV',
                      :date => "February 21, 2014",
                      :image_url => 'http://a.espncdn.com/i/espnradio/stations/espn/podcasts/first_take_288.jpg',
                      :description => "Skip Bayless and Stephen A. Smith react to the Heat's win over the Thunder. Debate if Lebron James is now the favorite to win the MVP and discuss what Johnny Manziel's height means for his draft stock.",
                      :link => "http://espn.go.com/espnradio/play?id=10496004",
                    }
                  ]

audio_catalog.each do |audio_info|
  p = Item.new
  p.name = audio_info[:name]
  p.date = audio_info[:date]
  p.image_url = audio_info[:image_url]
  p.description = audio_info[:description]
  p.link = audio_info[:link]

  category = Category.find_by(:name => audio_info[:category_name])
  p.category_id = category.id
  p.save
end

puts "There are now #{Item.count} audio files in the catalog."


Review.destroy_all
some_item = Item.order('name').first
review = Review.new
review.item_id = some_item.id
review.title = "Not bad"
review.rating = 3
review.user_id = User.first.id
review.body = "This is a pretty good episode."
review.save

puts "There are now #{Review.count} reviews."
