
puts 'Start inserting seed "tags" ...'
20.times do |n|
    Tag.create!(
        name: "tags#{n}",    
    )
end