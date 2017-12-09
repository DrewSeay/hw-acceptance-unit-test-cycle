Given /^the following movies exist:/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end


Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  step %Q{I should see "#{movie}"}
  step %Q{I should see "#{director}"}
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.delete!("\"")
  if uncheck.nil?
    rating_list.split(',').each do |field|
      check("ratings["+field.strip+"]")
    end
  else
    rating_list.split(',').each do |field|
      uncheck("ratings["+field.strip+"]")
    end
  end
end





Then /I should not see all of the movies/ do
  page.should have_no_css("table#movies tbody tr")
end