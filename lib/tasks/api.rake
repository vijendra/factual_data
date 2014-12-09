require 'factual'

namespace :api do
  desc "Interacts with factual API"
  task fetch_places: :environment do
 
    [["BUSINESSES AND SERVICES","LEGAL"],
  ["HEALTHCARE","PHYSICIANS","INTERNAL MEDICINE"],
  ["SOCIAL","FOOD AND DINING","RESTAURANTS"],
  ["HEALTHCARE"],
  ["HEALTHCARE","NURSES"],
  ["HEALTHCARE","PHYSICIANS"],
  ["RETAIL","FASHION","CLOTHING AND ACCESSORIES"],
  ["COMMUNITY AND GOVERNMENT"],
  ["COMMUNITY AND GOVERNMENT","GOVERNMENT DEPARTMENTS AND AGENCIES"],
  ["SOCIAL","FOOD AND DINING","RESTAURANTS","AMERICAN"],
  ["RETAIL","FASHION","JEWELRY AND WATCHES"],
  ["SOCIAL","BARS"],
  ["BUSINESSES AND SERVICES","PERSONAL CARE","BEAUTY SALONS AND BARBERS"],
  ["HEALTHCARE","PHYSICIANS","OBSTETRICIANS AND GYNECOLOGISTS"],
  ["BUSINESSES AND SERVICES","HOME IMPROVEMENT","CONTRACTORS"],
  ["BUSINESSES AND SERVICES","REAL ESTATE"],
  ["HEALTHCARE","PHYSICIANS","PEDIATRICIANS"],
  ["BUSINESSES AND SERVICES"],
  ["SOCIAL","FOOD AND DINING","RESTAURANTS","FAST FOOD"],
  ["COMMUNITY AND GOVERNMENT","ORGANIZATIONS AND ASSOCIATIONS"],
  ["COMMUNITY AND GOVERNMENT","PUBLIC AND SOCIAL SERVICES"],
  ["HEALTHCARE","DENTISTS"],
  ["HEALTHCARE","HOSPITALS, CLINICS AND MEDICAL CENTERS"],
  ["BUSINESSES AND SERVICES","FINANCIAL","BANKING AND FINANCE"],
  ["BUSINESSES AND SERVICES","EMPLOYMENT AGENCIES"],
  ["SOCIAL","FOOD AND DINING","CAFES, COFFEE AND TEA HOUSES"],
  ["BUSINESSES AND SERVICES","FINANCIAL","ACCOUNTING AND BOOKKEEPING"],
  ["TRAVEL","LODGING","HOTELS AND MOTELS"],
  ["BUSINESSES AND SERVICES","TELECOMMUNICATION SERVICES"],
  ["TRANSPORTATION","PARKING"],
  ["SOCIAL","FOOD AND DINING","RESTAURANTS","PIZZA"],
  ["BUSINESSES AND SERVICES","PRINTING, COPYING AND SIGNAGE"],
  ["HEALTHCARE","PHYSICAL THERAPY AND REHABILITATION"],
  ["BUSINESSES AND SERVICES","FINANCIAL","FINANCIAL PLANNING AND INVESTMENTS"],
  ["HEALTHCARE","PHYSICIANS","GENERAL SURGERY"],
  ["COMMUNITY AND GOVERNMENT","EDUCATION","PRIMARY AND SECONDARY SCHOOLS"],
  ["HEALTHCARE","PHYSICIANS","ANESTHESIOLOGISTS"],
  ["BUSINESSES AND SERVICES","HOME IMPROVEMENT","ARCHITECTS"],
  ["BUSINESSES AND SERVICES","INSURANCE"],
  ["COMMUNITY AND GOVERNMENT","RELIGIOUS","CHURCHES"],
  ["BUSINESSES AND SERVICES","ENTERTAINMENT","MEDIA"],
  ["BUSINESSES AND SERVICES","COMPUTERS"],
  ["RETAIL","GIFT AND NOVELTY"],
  ["BUSINESSES AND SERVICES","REAL ESTATE","APARTMENTS, CONDOS, AND HOUSES"],
  ["SOCIAL","FOOD AND DINING","RESTAURANTS","INTERNATIONAL"],
  ["HEALTHCARE","PHARMACIES"],
  ["RETAIL","SUPERMARKETS AND GROCERIES"],
  ["BUSINESSES AND SERVICES","HOME IMPROVEMENT","CARPET AND FLOORING"],
  ["HEALTHCARE","CHIROPRACTORS"],
  ["HEALTHCARE","MENTAL HEALTH"]].each do |category|
  
     ["26th Street/Ardmore", "Adair Park", "Adams Park", "Adamsville", "Ansley Park", "Arden Habersham", "Atlanta University", "Atlantic Station", "Baker Hills", "Bankhead", "Bedford Pine", "Bellwood", "Ben Hill", "Benteen", "Berkeley Park", "Betmar Lavilla", "Blandtown", "Bolton", "Boulevard Heights", "Briarcliff", "Briers North", "Brookhaven", "Brooklyn", "Brookwood", "Brookwood Hills", "Brownwood", "Buckhead", "Buckhead Triangle", "Buckhead Village", "Butler Street", "Cabbagetown", "Campbellton Road", "Candler Park", "Capitol View", "Carey Park", "Castleberry Hill", "Centennial Place", "Chamblee", "Clifton Community", "Cobb Galleria", "Cochise", "College Park", "Collier Heights", "Collier Hills", "Copen Hill", "Cumberland", "Cumberland Bridge", "Downtown", "Downtown Atlanta", "Dunwoody", "East Atlanta", "East Atlanta Village", "East Chastain Park", "East Cobb", "East Lake", "East Lake Highlands", "East Lakes", "Eastside", "Edgewood", "Elmwood", "English Avenue", "Fairlie-Poplar", "Farmstead", "Five Points", "Five Points District", "Garden Hills", "Georgia State University", "Georgia Tech", "Glenridge", "Glenridge Close", "Glenrose Heights", "Grady", "Grant Park", "Graves", "Hammond Park", "Harland Terrace", "High Point", "Highpoint", "Hills Park", "Home Park", "Huntcliff", "Inman Park", "Intown South", "Jamestown Court", "Jefferson Park", "Lake Claire", "Lakewood Heights", "Landings", "Leila Valley", "Lenox", "Lenox Superblock", "Lindbergh", "Lindbergh - Morosgo", "Lindbergh Morosgo", "Lindridge - Martin Manor", "Linwood", "Little Five Points", "Loring Heights", "Margaret Mitchell", "Marietta", "Marietta Street Artery", "Martin Manor", "Mayfair", "McDaniel Glen", "Mechanicsville", "Merry Hills", "Midtown", "Millbrook", "Morningside", "Morningside - Lenox Park", "Morningside / Lenox Park", "North Buckhead", "North Highlands", "North Kirkwood", "North Springs", "Northeast", "Northeast Atlanta", "Northside", "Northwest Atlanta", "Oakland City", "Old Fourth Ward", "Ormewood", "Ormewood Park", "Parkview", "Peachtree Battle", "Peachtree Center", "Peachtree Heights East", "Peachtree Heights West", "Peachtree Hills", "Peachtree Park", "Perimeter Center", "Perimiter Center", "Perkerson", "Piedmont Heights", "Pine Hills", "Piney Grove", "Pittsburgh", "Poncey Highlands", "Poncey-Highland", "Prado North", "Reynoldstown", "River Chase", "Rivermeade", "Rockdale", "Sherwood Forest", "Sono", "South Atlanta", "South Downtown", "Southeast Atlanta", "Southside", "Southwest", "Southwest Atlanta", "St. Charles Greenwood", "St. Charles/ Greenwood", "Starlight Hills", "Summerhill", "Sylvan Hills", "Tara Heights", "Techwood", "Toco Hills", "Underwood Hills", "Valley View", "Vine City", "Vinings", "Virginia Highland", "Virginia-Highland", "West Atlanta", "West End", "West End/Atlanta University", "West Manor", "West Paces Ferry / Northside", "Westover Plantation", "Westside", "Westside / Home Park", "Westview", "Whitewater Creek", "Willow Glen", "Wrens Crossing", "atlanta", "downtown"].each do |neighborhood|
        
        combination = CategoryNeighborhoodCombination.find_by( category: category.to_json , neighborhood: neighborhood ) 
        if combination.blank?
          save_places(category, neighborhood)
          CategoryNeighborhoodCombination.create(category: category.to_json, neighborhood: neighborhood, result_count: total_count)
        elsif combination.result_count < 50
          save_places(category, neighborhood)
        end 
      end #neighborhood array
    end #category array
  end
  
  def save_places(category, neighborhood)
    query = factual.table("places-us").filters("$and" => [{"region" => {"$eq" =>"GA"}}, {"locality" => {"$eq" => "ATLANTA"}}, {"neighborhood" => {"$eq" => neighborhood}}, {"category_labels" => {"$eq" => category.to_json}}])
    total_count = query.total_count
    no_of_pages = total_count/50  
    no_of_pages = + 1 if total_count % 50 > 0
        
    (1 .. no_of_pages).to_a.each do |page|
      rows = query.sort("name").page(page, :per => 50).rows
      rows.each do |place_attributes|
        begin
          place = Place.find_by(factual_id: place_attributes["factual_id"])
          unless place
            place = Place.new
            place_attributes.each do |key, value|
              place.send("#{key}=", value) 
            end
            place.save
          end
        rescue ActiveRecord::StatementInvalid #To avoid error due to long data
          next
        end
        
      end
    end
  end
  
  def factual
    Factual.new("", "")
  end
end
