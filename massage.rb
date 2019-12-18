require 'json'
require 'nokogiri'

if ARGV.length < 2
  puts "Too few arguments.  First argument should be Path to VS file, second should be path to associated CS file."
  exit
end
 


VS_JSON_FILENAME = ARGV[0]
CS_JSON_FILENAME = ARGV[1]
VS_JSON_FILENAME_BAK = "#{VS_JSON_FILENAME}" + ".bak"
CS_JSON_FILENAME_BAK = "#{CS_JSON_FILENAME}" + ".bak"

#VS_JSON_FILENAME = "#{TARGET_PATH}" + "fhir/guide/resources/valueset-usdf-DrugTierVS.json"
#VS_JSON_FILENAME_BAK = "#{TARGET_PATH}" + "fhir/guide/resources/valueset-usdf-DrugTierVS.json.bak"
#CS_JSON_FILENAME = "#{TARGET_PATH}" + "fhir/guide/resources/codesystem-usdf-DrugTierCS.json"
#CS_JSON_FILENAME_BAK = "#{TARGET_PATH}" + "fhir/guide/resources/codesystem-usdf-DrugTierCS.json.bak"

puts "Reading #{VS_JSON_FILENAME}"
VS_json = JSON.parse(File.read(VS_JSON_FILENAME))
File.write(VS_JSON_FILENAME_BAK, JSON.pretty_generate(VS_json, indent: '  '))
puts "Wrote #{VS_JSON_FILENAME_BAK}"
concept =  VS_json['compose']['include'][0]['concept']
puts concept 
newconcept = concept.map do |item|
  display = item['display']
  splitdisplay = display.split(': ')
  item.merge({
    'display'=> splitdisplay[0]
  #  'description'=> splitdisplay[1].lstrip
  })
end

VS_json['compose']['include'][0]['concept'] = newconcept
File.write(VS_JSON_FILENAME, JSON.pretty_generate(VS_json, indent: '  '))
puts "Wrote #{VS_JSON_FILENAME}"


puts "Reading #{CS_JSON_FILENAME}"
CS_json = JSON.parse(File.read(CS_JSON_FILENAME))
File.write(CS_JSON_FILENAME_BAK, JSON.pretty_generate(CS_json, indent: '  '))
puts "Wrote #{CS_JSON_FILENAME_BAK}"
concept =  CS_json['concept']
puts concept

newconcept = concept.map do |item|
  display = item['display']
  splitdisplay = display.split(': ')
  item.merge({
    'display'=> splitdisplay[0],
    'definition'=> splitdisplay[1].lstrip
  })
end

CS_json['concept'] = newconcept
File.write(CS_JSON_FILENAME, JSON.pretty_generate(CS_json, indent: '  '))
puts "Wrote #{CS_JSON_FILENAME}"
