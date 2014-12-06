require 'factual'
namespace :api do
  desc "Interacts with factual API"
  task fetch_places: :environment do
    factual = Factual.new("", "")
 
    ["Accounting and Bookkeeping", "Advertising Agencies and Media Buyers", "Advertising and Marketing", "Airlines and Aviation Services", "American", "Antiques", "Apartments, Condos, and Houses", "Arcades", "Architects", "Art Dealers and Galleries", "Arts", "Arts and Crafts", "Automotive", "Banking and Finance", "Bars", "Beauty Salons and Barbers", "Beer, Wine and Spirits", "Bookstores", "Buildings and Structures", "Businesses and Services", "Cafes, Coffee and Tea Houses", "Car Dealers and Leasing", "Car Parts and Accessories", "Car Wash and Detail", "Cards and Stationery", "Carpenters", "Carpet and Flooring", "Catering", "Children", "Chiropractors", "Churches", "Clothing and Accessories", "Commercial Real Estate", "Community and Government", "Computers", "Computers and Electronics", "Construction Supplies", "Contractors", "Convenience Stores", "Counseling and Therapy", "Creative Services", "Dance and Music", "Day Care and Preschools", "Delis", "Dentists", "Department Stores", "Diners", "Discount Stores", "Doors and Windows", "Driving Schools", "Dry Cleaning, Ironing and Laundry", "Education", "Electricians", "Employment Agencies", "Entertainment", "Environmental", "Equipment Rental", "Events and Event Planning", "Fashion", "Fast Food", "Financial", "Financial Planning and Investments", "Florists", "Food and Beverage", "Food and Dining", "Furniture and Decor", "Gas Stations", "Gift and Novelty", "Hardware and Services", "Healthcare", "Heating, Ventilating and Air Conditioning", "Historic and Protected Sites", "Home Appliances", "Home Improvement", "Home Inspection Services", "Hotels and Motels", "Import and Export", "Industrial Machinery and Vehicles", "Insurance", "Interior Design", "Jewelry and Watches", "Landmarks", "Landscaping and Gardeners", "Legal", "Lighting Fixtures", "Limos and Chauffeurs", "Loans and Mortgages", "Lodging", "Maintenance and Repair", "Management", "Manicures and Pedicures", "Market Research and Consulting", "Media", "Mental Health", "Metals", "Mobile", "Movers", "Music and Show Venues", "Music, Video and DVD", "Night Clubs", "Notary", "Nurseries and Garden Centers", "Office Supplies", "Oil and Lube", "Organizations and Associations", "Party Supplies", "Pawn Shops", "Personal Care", "Pest Control", "Photography", "Physicians", "Piercing", "Pizza", "Plumbing", "Printing, Copying and Signage", "Professional Cleaning", "Property Management", "Public Relations", "Publishing", "Real Estate", "Real Estate Agents", "Religious", "Restaurants", "Retail", "Roofers", "Search Engine Marketing and Optimization", "Security and Safety", "Shipping, Freight, and Material Transportation", "Shoes", "Shopping Centers and Malls", "Social", "Sports Bars", "Sports and Recreation", "Stadiums and Arenas", "Storage", "Supermarkets and Groceries", "Swimming Pools", "Tattooing", "Taxi and Car Services", "Technology", "Telecommunication Services", "Textiles", "Ticket Sales", "Tires", "Towing", "Transportation", "Travel", "Tree Service", "Tutoring and Educational Services", "Used Cars", "Vintage and Thrift", "Water and Waste Management", "Web Design and Development", "Wedding and Bridal", "Weight Loss and Nutritionists"].each do |category|
     
      ["26th Street/Ardmore", "Adair Park", "Adams Park", "Adamsville", "Ansley Park", "Arden Habersham", "Atlanta University", "Atlantic Station", "Baker Hills", "Bankhead", "Bedford Pine", "Bellwood", "Ben Hill", "Benteen", "Berkeley Park", "Betmar Lavilla", "Blandtown", "Bolton", "Boulevard Heights", "Briarcliff", "Briers North", "Brookhaven", "Brooklyn", "Brookwood", "Brookwood Hills", "Brownwood", "Buckhead", "Buckhead Triangle", "Buckhead Village", "Butler Street", "Cabbagetown", "Campbellton Road", "Candler Park", "Capitol View", "Carey Park", "Castleberry Hill", "Centennial Place", "Chamblee", "Clifton Community", "Cobb Galleria", "Cochise", "College Park", "Collier Heights", "Collier Hills", "Copen Hill", "Cumberland", "Cumberland Bridge", "Downtown", "Downtown Atlanta", "Dunwoody", "East Atlanta", "East Atlanta Village", "East Chastain Park", "East Cobb", "East Lake", "East Lake Highlands", "East Lakes", "Eastside", "Edgewood", "Elmwood", "English Avenue", "Fairlie-Poplar", "Farmstead", "Five Points", "Five Points District", "Garden Hills", "Georgia State University", "Georgia Tech", "Glenridge", "Glenridge Close", "Glenrose Heights", "Grady", "Grant Park", "Graves", "Hammond Park", "Harland Terrace", "High Point", "Highpoint", "Hills Park", "Home Park", "Huntcliff", "Inman Park", "Intown South", "Jamestown Court", "Jefferson Park", "Lake Claire", "Lakewood Heights", "Landings", "Leila Valley", "Lenox", "Lenox Superblock", "Lindbergh", "Lindbergh - Morosgo", "Lindbergh Morosgo", "Lindridge - Martin Manor", "Linwood", "Little Five Points", "Loring Heights", "Margaret Mitchell", "Marietta", "Marietta Street Artery", "Martin Manor", "Mayfair", "McDaniel Glen", "Mechanicsville", "Merry Hills", "Midtown", "Millbrook", "Morningside", "Morningside - Lenox Park", "Morningside / Lenox Park", "North Buckhead", "North Highlands", "North Kirkwood", "North Springs", "Northeast", "Northeast Atlanta", "Northside", "Northwest Atlanta", "Oakland City", "Old Fourth Ward", "Ormewood", "Ormewood Park", "Parkview", "Peachtree Battle", "Peachtree Center", "Peachtree Heights East", "Peachtree Heights West", "Peachtree Hills", "Peachtree Park", "Perimeter Center", "Perimiter Center", "Perkerson", "Piedmont Heights", "Pine Hills", "Piney Grove", "Pittsburgh", "Poncey Highlands", "Poncey-Highland", "Prado North", "Reynoldstown", "River Chase", "Rivermeade", "Rockdale", "Sherwood Forest", "Sono", "South Atlanta", "South Downtown", "Southeast Atlanta", "Southside", "Southwest", "Southwest Atlanta", "St. Charles Greenwood", "St. Charles/ Greenwood", "Starlight Hills", "Summerhill", "Sylvan Hills", "Tara Heights", "Techwood", "Toco Hills", "Underwood Hills", "Valley View", "Vine City", "Vinings", "Virginia Highland", "Virginia-Highland", "West Atlanta", "West End", "West End/Atlanta University", "West Manor", "West Paces Ferry / Northside", "Westover Plantation", "Westside", "Westside / Home Park", "Westview", "Whitewater Creek", "Willow Glen", "Wrens Crossing", "atlanta", "downtown"].each do |neighborhood|
     
        if CategoryNeighborhoodCombination.find_by( category: category, neighborhood: neighborhood ).blank? 
          query = factual.table("places-us").filters("$and" => [{"region" => {"$eq" =>"GA"}}, {"locality" => {"$eq" => "ATLANTA"}}, {"neighborhood" => {"$eq" => neighborhood}}, {"category_labels" => {"$eq" => category}}]).sort("name")
           total_count = query.total_count
           no_of_pages = total_count/50  
           no_of_pages = + 1 if no_of_pages % 50 > 0
        
          (1 .. no_of_pages).to_a.each do |page|
            rows = query.page(page, :per => 50).rows
            rows.each do |place_attributes|
              begin
                place = Place.find_by(name: place_attributes["name"])
                if place
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
          
          CategoryNeighborhoodCombination.create(category: category, neighborhood: neighborhood, count: total_count)
        end 
      end #neighborhood array
    end #category arry
  end
end
