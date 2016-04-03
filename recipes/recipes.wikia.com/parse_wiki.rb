require 'nokogiri'
@doc = Nokogiri::XML(File.open("Recipes+Wiki-20160220213729.xml"))
@doc.remove_namespaces!
pages = @doc.xpath("//page")

def parse_wikia_recipe(text)
    ingredients = []
    
    text.each_line do |line|
        if line.start_with?("*")
            line.scan(/\[\[(\w*-?\w*)\]\]|\[\[(\w*-?\w*)\|/) do |ingredient|
                if not $1.nil?
                    ingredients.push($1)
                end
                if not $2.nil?
                    ingredients.push($2)
                end
            end
        end
    end
    if ingredients.length == 0
    end
    return ingredients
    
end

builder = Nokogiri::XML::Builder.new do |xml|
  xml.root {
      
    xml.salads {
        
        pages.each_with_index  do |page,pi|
            xml.salad {
                xml.title page.xpath("//title")[pi].text
                xml.ingredients {
                    parse_wikia_recipe(page.xpath("//text")[pi].text).each do |ingredient|
                        xml.ingedient ingredient
                    end
                }
            }
        end
      }
  }
end
File.open('tossr.xml', 'w') { |file| file.write(builder.to_xml) }
    
