require 'rubygems'
require 'mechanize'

# Download all the salad recipes from directaccessrecipes
url = "https://www.directaccessrecipes.com/index.jsp?groupId=1&catId=34"
fw = "https://www.directaccessrecipes.com/index.jsp?recId="
# Set up the user agent.
agent = Mechanize.new
agent.history.max_size = 0
agent.user_agent_alias = 'Linux Firefox'
agent.read_timeout = 3
agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# Get the main page with salad recipes
page = agent.get(url)

# Salads are listed on lines
rows = page./('li')
rows.each do |row|
  title = row.text.strip
  # Get the url that points to the salad
  recipe = row./('a').attribute('href').to_s
  # Make sure it's a recipe
  if recipe.match(/recId/)
      # Store recipe in xml folder
      newfile = File.open("recipes/directaccessrecipes/xml/#{title}.xml", "w")
      # Source page contains xml file inside the pre tag
      rec_page = agent.get("#{recipe}&source=")
      newfile.write(rec_page./('pre').text)
      newfile.close
  end
end
