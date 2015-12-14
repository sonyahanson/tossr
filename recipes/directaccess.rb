require "rbconfig"
require "mechanize"

require 'rubygems'
require 'mechanize'

url = "https://www.directaccessrecipes.com/index.jsp?groupId=1&catId=34"
fw = "https://www.directaccessrecipes.com/index.jsp?recId="
# Set up the user agent.
agent = Mechanize.new
agent.history.max_size = 0
agent.user_agent_alias = 'Linux Firefox'
agent.read_timeout = 3
agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

page = agent.get(url)
rows = page./('li')
rows.each do |row|
  title = row.text.strip
  puts title
  links = agent.get("#{fw}#{title}")
  puts links
  links./('a').each do |link|
    url = link.attribute('href').to_s
    if url.match(/recid/)
      puts url
    end
  end
end