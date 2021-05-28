/* 
** This code accompanies the blog
** Easy Management of Categorical Variables
** release 3/19/2021
*/

// Step one: load data
melb_data = loadd(__FILE_DIR $+ "melb_data.csv", "cat(Suburb) + str(Address) + Rooms + cat(Type) + Price + cat(Method) + str(SellerG) + date($Date) + Distance + Postcode + Bedroom2 + Bathroom + Car + Landsize + BuildingArea + YearBuilt + cat(CouncilArea) + Lattitude + Longtitude + cat(Regionname) + Propertycount");

// Changing labels
melb_data = setcollabels(move(melb_data), "House"$|"Townhouse"$|"Duplex unit", 0|1|2, "Type");
melb_data = setcollabels(move(melb_data), "Passed in"$|"Sold"$|"Sold after auction"$|"Sold prior auction"$|"Vendor bid", 0|1|2|3|4, "Method");

// Changing the base case
melb_data[., "Suburb"] = reclassify(melb_data[., "Suburb"], 72|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71, 0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72);
melb_data = setcollabels(move(melb_data), "Chelsea"$|"Abbotsford"$|"Aberfeldie"$|"Airport West"$|"Albanvale"$|"Albert Park"$|"Albion"$|"Alphington"$|"Altona"$|"Altona Meadows"$|"Altona North"$|"Ardeer"$|"Armadale"$|"Ascot Vale"$|"Ashburton"$|"Ashwood"$|"Aspendale"$|"Aspendale Gardens"$|"Attwood"$|"Avondale Heights"$|"Bacchus Marsh"$|"Balaclava"$|"Balwyn"$|"Balwyn North"$|"Bayswater"$|"Bayswater North"$|"Beaconsfield"$|"Beaconsfield Upper"$|"Beaumaris"$|"Bellfield"$|"Bentleigh"$|"Bentleigh East"$|"Berwick"$|"Black Rock"$|"Blackburn"$|"Blackburn North"$|"Blackburn South"$|"Bonbeach"$|"Boronia"$|"Box Hill"$|"Braybrook"$|"Briar Hill"$|"Brighton"$|"Brighton East"$|"Broadmeadows"$|"Brookfield"$|"Brooklyn"$|"Brunswick"$|"Brunswick East"$|"Brunswick West"$|"Bulleen"$|"Bullengarook"$|"Bundoora"$|"Burnley"$|"Burnside"$|"Burnside Heights"$|"Burwood"$|"Burwood East"$|"Cairnlea"$|"Camberwell"$|"Campbellfield"$|"Canterbury"$|"Carlton"$|"Carlton North"$|"Carnegie"$|"Caroline Springs"$|"Carrum"$|"Carrum Downs"$|"Caulfield"$|"Caulfield East"$|"Caulfield North"$|"Caulfield South"$|"Chadstone"$|"Chelsea Heights"$|"Cheltenham"$|"Chirnside Park"$|"Clarinda"$|"Clayton"$|"Clayton South"$|"Clifton Hill"$|"Coburg"$|"Coburg North"$|"Collingwood"$|"Coolaroo"$|"Craigieburn"$|"Cranbourne"$|"Cranbourne North"$|"Cremorne"$|"Croydon"$|"Croydon Hills"$|"Croydon North"$|"Croydon South"$|"Dallas"$|"Dandenong"$|"Dandenong North"$|"Deepdene"$|"Deer Park"$|"Delahey"$|"Derrimut"$|"Diamond Creek"$|"Diggers Rest"$|"Dingley Village"$|"Docklands"$|"Doncaster"$|"Doncaster East"$|"Donvale"$|"Doreen"$|"Doveton"$|"Eaglemont"$|"East Melbourne"$|"Edithvale"$|"Elsternwick"$|"Eltham"$|"Eltham North"$|"Elwood"$|"Emerald"$|"Endeavour Hills"$|"Epping"$|"Essendon"$|"Essendon North"$|"Essendon West"$|"Fairfield"$|"Fawkner"$|"Ferntree Gully"$|"Fitzroy"$|"Fitzroy North"$|"Flemington"$|"Footscray"$|"Forest Hill"$|"Frankston"$|"Frankston North"$|"Frankston South"$|"Gardenvale"$|"Gisborne"$|"Gladstone Park"$|"Glen Huntly"$|"Glen Iris"$|"Glen Waverley"$|"Glenroy"$|"Gowanbrae"$|"Greensborough"$|"Greenvale"$|"Hadfield"$|"Hallam"$|"Hampton"$|"Hampton East"$|"Hampton Park"$|"Hawthorn"$|"Hawthorn East"$|"Healesville"$|"Heathmont"$|"Heidelberg"$|"Heidelberg Heights"$|"Heidelberg West"$|"Highett"$|"Hillside"$|"Hoppers Crossing"$|"Hughesdale"$|"Huntingdale"$|"Hurstbridge"$|"Ivanhoe"$|"Ivanhoe East"$|"Jacana"$|"Kealba"$|"Keilor"$|"Keilor Downs"$|"Keilor East"$|"Keilor Lodge"$|"Keilor Park"$|"Kensington"$|"Kew"$|"Kew East"$|"Keysborough"$|"Kilsyth"$|"Kings Park"$|"Kingsbury"$|"Kingsville"$|"Knoxfield"$|"Kooyong"$|"Kurunjang"$|"Lalor"$|"Langwarrin"$|"Lower Plenty"$|"Maidstone"$|"Malvern"$|"Malvern East"$|"Maribyrnong"$|"McKinnon"$|"Meadow Heights"$|"Melbourne"$|"Melton"$|"Melton South"$|"Melton West"$|"Mentone"$|"Mernda"$|"Middle Park"$|"Mill Park"$|"Mitcham"$|"Monbulk"$|"Mont Albert"$|"Montmorency"$|"Montrose"$|"Moonee Ponds"$|"Moorabbin"$|"Mooroolbark"$|"Mordialloc"$|"Mount Evelyn"$|"Mount Waverley"$|"Mulgrave"$|"Murrumbeena"$|"Narre Warren"$|"New Gisborne"$|"Newport"$|"Niddrie"$|"Noble Park"$|"North Melbourne"$|"North Warrandyte"$|"Northcote"$|"Notting Hill"$|"Nunawading"$|"Oak Park"$|"Oakleigh"$|"Oakleigh East"$|"Oakleigh South"$|"Officer"$|"Ormond"$|"Pakenham"$|"Parkdale"$|"Parkville"$|"Pascoe Vale"$|"Plumpton"$|"Point Cook"$|"Port Melbourne"$|"Prahran"$|"Preston"$|"Princes Hill"$|"Reservoir"$|"Richmond"$|"Riddells Creek"$|"Ringwood"$|"Ringwood East"$|"Ringwood North"$|"Ripponlea"$|"Rockbank"$|"Rosanna"$|"Rowville"$|"Roxburgh Park"$|"Sandhurst"$|"Sandringham"$|"Scoresby"$|"Seabrook"$|"Seaford"$|"Seaholme"$|"Seddon"$|"Silvan"$|"Skye"$|"South Kingsville"$|"South Melbourne"$|"South Morang"$|"South Yarra"$|"Southbank"$|"Spotswood"$|"Springvale"$|"Springvale South"$|"St Albans"$|"St Helena"$|"St Kilda"$|"Strathmore"$|"Strathmore Heights"$|"Sunbury"$|"Sunshine"$|"Sunshine North"$|"Sunshine West"$|"Surrey Hills"$|"Sydenham"$|"Tarneit"$|"Taylors Hill"$|"Taylors Lakes"$|"Templestowe"$|"Templestowe Lower"$|"The Basin"$|"Thomastown"$|"Thornbury"$|"Toorak"$|"Travancore"$|"Truganina"$|"Tullamarine"$|"Upwey"$|"Vermont"$|"Vermont South"$|"Viewbank"$|"Wallan"$|"Wantirna"$|"Wantirna South"$|"Warrandyte"$|"Waterways"$|"Watsonia"$|"Watsonia North"$|"Werribee"$|"West Footscray"$|"West Melbourne"$|"Westmeadows"$|"Wheelers Hill"$|"Whittlesea"$|"Williams Landing"$|"Williamstown"$|"Williamstown North"$|"Windsor"$|"Wollert"$|"Wonga Park"$|"Wyndham Vale"$|"Yallambie"$|"Yarra Glen"$|"Yarraville", 0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|78|79|80|81|82|83|84|85|86|87|88|89|90|91|92|93|94|95|96|97|98|99|100|101|102|103|104|105|106|107|108|109|110|111|112|113|114|115|116|117|118|119|120|121|122|123|124|125|126|127|128|129|130|131|132|133|134|135|136|137|138|139|140|141|142|143|144|145|146|147|148|149|150|151|152|153|154|155|156|157|158|159|160|161|162|163|164|165|166|167|168|169|170|171|172|173|174|175|176|177|178|179|180|181|182|183|184|185|186|187|188|189|190|191|192|193|194|195|196|197|198|199|200|201|202|203|204|205|206|207|208|209|210|211|212|213|214|215|216|217|218|219|220|221|222|223|224|225|226|227|228|229|230|231|232|233|234|235|236|237|238|239|240|241|242|243|244|245|246|247|248|249|250|251|252|253|254|255|256|257|258|259|260|261|262|263|264|265|266|267|268|269|270|271|272|273|274|275|276|277|278|279|280|281|282|283|284|285|286|287|288|289|290|291|292|293|294|295|296|297|298|299|300|301|302|303|304|305|306|307|308|309|310|311|312|313, "Suburb");

// Summary statistics
dstatmt(melb_data);

// Frequency table
frequency(melb_data, "Type + Method");

// Frequency plot
plotClearLayout;
plotCanvasSize("px", 1600|1200);

// Set up format of plot
struct plotControl myPlot;
myPlot = plotGetDefaults("bar");

// Set up title
plotSetTitle(&myPlot, "Melbourne home sale methods", "Calibri", 24);

// Set up axis size
plotSetTicLabelFont(&myPlot, "Calibri", 20);

plotFreq(myPlot, melb_data, "Method");
