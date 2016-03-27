require 'nokogiri'
@doc = Nokogiri::XML(File.open("Recipes+Wiki-20160220213729.xml"))
@doc.remove_namespaces!
pages = @doc.xpath("//page")

puts pages[2]
