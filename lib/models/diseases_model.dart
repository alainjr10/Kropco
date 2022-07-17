class DiseasesModel {
  List<String> images = [];
  String diseaseName = "N/A";
  String scientificName = "N/A",
      symptoms = "N/A",
      favourableConditions = "N/A",
      remedies = "N/A",
      control = "N/A",
      lifeCycleImage = "N/A";

  // DiseasesModel({
  //   // required this.images,
  //   required this.diseaseName,
  //   // required this.scientificName,
  //   // required this.symptoms,
  //   // required this.favourableConditions,
  //   // required this.remedies,
  //   // required this.control,
  // });

  void setVariables(String diseaseName) {
    switch (diseaseName) {
      case "apple Cedar Rust":
        {
          scientificName = "Gymnosporangium juniperi-virginianae";
          images = ["4.jpg", "5.jpg", "6.jpg"];
          symptoms =
              "Early lesions on leaves are small, circular to elongate, and often occur in clusters. As lesions mature, the "
              "fungus erupts through the leaf surface (epidermis) and the lesions become more elongated. At this stage, a prominent yellow "
              "halo is usually evident. Brownish-red oblong pustules are the characteristic symptom on leaves; urediniospores that rub off on "
              "fingers are what impart the color to the lesion. Unlike Southern Rust of Corn, lesions of common rust are sparsely spread over "
              "the leaf and occur on both upper and lower leaf surfaces. Spores are wind-blown with new infections occurring every 7 to 14 days. "
              "As the season progresses, black teliospores are produced within the lesions. During this process, a single lesion may produce both "
              "brownish-red urediniospores and black teliospores. Finally, only black teliospores will be observed within the lesions .";
          favourableConditions =
              "Cool temperatures (60-80° F) and high humidity favor disease development.";
          remedies =
              "1. Choose resistant cultivars when available.\n\n2.Rake up and dispose of fallen leaves and other debris from under trees.\n\n"
              "3.Remove galls from infected junipers. In some cases, juniper plants should be removed entirely.\n\n4. Apply preventative, disease-fighting "
              "fungicides labeled for use on apples weekly, starting with bud break, to protect trees from spores being released by the juniper host. This "
              "occurs only once per year, so additional applications after this springtime spread are not necessary.\n\n5. On juniper, rust can be controlled "
              "by spraying plants with a copper solution (0.5 to 2.0 oz/ gallon of water) at least four times between late August and late October.\n\n"
              "6. Safely treat most fungal and bacterial diseases with SERENADE Garden. This broad spectrum bio-fungicide uses a patented strain of Bacillus "
              "subtilis that is registered for organic use. Best of all, SERENADE is completely non-toxic to honey bees and beneficial insects.\n\n"
              "7. Containing sulfur and pyrethrins, Bonide® Orchard Spray is a safe, one-hit concentrate for insect attacks and fungal problems. For best results, "
              "apply as a protective spray (2.5 oz/ gallon) early in the season. If disease, insects or wet weather are present, mix 5 oz in one gallon of water. "
              "Thoroughly spray all parts of the plant, especially new shoots.";
          control =
              " 1. A Mixture of Sulfur and Pyrethins ,These two classic compounds are available in a pre-mixed spray known as Bonide® Orchard Spray.This spray "
              "controls both fungi and insects and is certified organic. Beware that it can harm beneficial insects in the area along with pests.  \n\n2. Liquid CopperYou "
              "can treat them with a solution of copper at least four times. Use 0.5 to 2.0 ounces of copper per gallon of water.It’s best to start with this treatment as a "
              "preventative early in the spring before the trees are showing signs of infection, or just as they begin showing symptoms.\n\n3. Biofungicides: There is a "
              "strain of bacteria that is effective at treating cedar apple rust on apple trees. It is a special strain of Bacillus subtilis ";
        }
        break;
      case "corn maize common rust ":
        {
          scientificName = "Puccinia sorghi Schwein";
          images = ["10.jpg", "11.jpg", "12.jpg"];
          symptoms =
              "Early lesions on leaves are small, circular to elongate, and often occur in clusters. As lesions mature, the "
              "fungus erupts through the leaf surface (epidermis) and the lesions become more elongated. At this stage, a prominent yellow "
              "halo is usually evident. Brownish-red oblong pustules are the characteristic symptom on leaves; urediniospores that rub off on "
              "fingers are what impart the color to the lesion. Unlike Southern Rust of Corn, lesions of common rust are sparsely spread over "
              "the leaf and occur on both upper and lower leaf surfaces. Spores are wind-blown with new infections occurring every 7 to 14 days. "
              "As the season progresses, black teliospores are produced within the lesions. During this process, a single lesion may produce both "
              "brownish-red urediniospores and black teliospores. Finally, only black teliospores will be observed within the lesions .";
          favourableConditions =
              "Cool temperatures (60-80° F) and high humidity favor disease development.";
          lifeCycleImage = "RustDiseaseCycle.jpg";
          remedies =
              "1. Choose resistant cultivars when available.\n\n2.Rake up and dispose of fallen leaves and other debris from under trees.\n\n"
              "3.Remove galls from infected junipers. In some cases, juniper plants should be removed entirely.\n\n4. Apply preventative, disease-fighting "
              "fungicides labeled for use on apples weekly, starting with bud break, to protect trees from spores being released by the juniper host. This "
              "occurs only once per year, so additional applications after this springtime spread are not necessary.\n\n5. On juniper, rust can be controlled "
              "by spraying plants with a copper solution (0.5 to 2.0 oz/ gallon of water) at least four times between late August and late October.\n\n"
              "6. Safely treat most fungal and bacterial diseases with SERENADE Garden. This broad spectrum bio-fungicide uses a patented strain of Bacillus "
              "subtilis that is registered for organic use. Best of all, SERENADE is completely non-toxic to honey bees and beneficial insects.\n\n"
              "7. Containing sulfur and pyrethrins, Bonide® Orchard Spray is a safe, one-hit concentrate for insect attacks and fungal problems. For best results, "
              "apply as a protective spray (2.5 oz/ gallon) early in the season. If disease, insects or wet weather are present, mix 5 oz in one gallon of water. "
              "Thoroughly spray all parts of the plant, especially new shoots.";
          control =
              " 1. A Mixture of Sulfur and Pyrethins ,These two classic compounds are available in a pre-mixed spray known as Bonide® Orchard Spray.This spray "
              "controls both fungi and insects and is certified organic. Beware that it can harm beneficial insects in the area along with pests.  \n\n2. Liquid CopperYou "
              "can treat them with a solution of copper at least four times. Use 0.5 to 2.0 ounces of copper per gallon of water.It’s best to start with this treatment as a "
              "preventative early in the spring before the trees are showing signs of infection, or just as they begin showing symptoms.\n\n3. Biofungicides: There is a "
              "strain of bacteria that is effective at treating cedar apple rust on apple trees. It is a special strain of Bacillus subtilis ";
        }
        break;
      case "corn maize northern leaf blight":
        {
          scientificName = "Exserohilumturcicun";
          images = ["13.jpg", "14.jpg", "15.jpg"];
          symptoms =
              'Northern corn leaf blight lesions become pale gray to tan as they enlarge to 1 to 6 inches or longer.Distinct cigar-shaped lesions unrestricted by leaf veins make northern corn leaf blight (NCLB) one of the easiest diseases to identify.Under moist conditions, lesions produce dark gray spores, usually on the lower leaf surface, giving the lesions a "dirty" appearance.As many lesions enlarge and coalesce, entire leaves or leaf areas may be covered.Heavy blighting and lesion coalescence give leaves a gray/burned appearance..';
          lifeCycleImage = "NorthernDiseaseCycle.jpg";
          favourableConditions =
              " Spores are spread by rain splash and air currents to the leaves of new crop plants in spring and early summer. Spores may be carried long distances by the wind.\n\nInfection occurs when free water is present on the leaf surface for 6 to 18 hours and temperatures are 65 to 80 F..";
          remedies =
              '1.Crop rotation to reduce previous corn residues and disease inoculum\n\n2.Tillage to help break down crop debris and reduce inoculum load\n\n3.Fungicide application to reduce yield loss and improve harvestability\n\n4.Consider hybrid susceptibility, previous crop, tillage, field history, application cost, corn price.\n\n5.Growers should choose hybrids rated a "5" or "6" for fields at risk of NCLB infection';
          control =
              ' If disease levels were high the previous season, liquid copper fungicides can be sprayed to impede the fungal growth on the tree during the winter season. Sulfur sprays are only partially effective Maize. However, solutions containing sulfur and pyrethrins are available for organic control of the disease during the growing season. Always consider an integrated approach with preventive measures together with biological treatments if available. Protectant fungicides such as dodine, captan or dinathion can be sprayed around bud break to avoid the disease. Once it has been detected, fungicides based on difenoconazole, myclobutanil or sulphur can be used to control the development of the fungus. Ensure fungicides from different chemical groups are used to avoid the development of resistance.';
        }
        break;
      case "corn maize cercospora leaf spot gray leaf spot":
        {
          scientificName = "Cercospora zea-maydis";
          images = ["7.jpg", "8.jpg", "9.jpg"];
          symptoms =
              ' All corn hybrids and inbreds are susceptible to Gray Leaf Spot (GLS). In minimum tillage fields with a history of GLS, symptoms can occur on the lower leaves prior to tasseling. Immature GLS lesions can be easily confused with lesions caused by other pathogens; e.g., eyespot (Kabatiella), anthracnose (Colletrichum). Mature lesions on leaves are rectangular in shape and restricted by leaf veins; reverse lighting reveals a yellow halo on most hybrids. Mature lesions are diagnostic and easily distinguishable from other diseases. As lesions expand they coalesce resulting in a blighting of large portions of the leaf. When the source of primary innoculum is within the field, symptoms originate on the lower leaves and progress up the plant as infection cycles occur. When severe, the entire plant may be blighted. Stalk infections have been reported and can result in lodging if severe. Lesions on sheath or husk tissues may be be oval to ellipsoidal in shape and are not usually diagnostic. Severely affected fields can appear to be experiencing early dry-down. The time from infection to the production of more innoculum can be 14-21 days on a susceptible hybrid and 21-28 days on a tolerant hybrid. .';

          favourableConditions =
              ' Temperature: 70°-90° F/25°-32° C, Relative Humidity: >12 hours @ > 90% RH, and Leaf Wetness: >12 hours of leaf wetness (from dew, rain, or irrigation)..';
          lifeCycleImage = "CornGreyDiseaseCycle.jpg";
          remedies =
              'In order to best prevent and manage corn grey leaf spot, the overall approach is to reduce the rate of disease growth and expansion. This is done by limiting the amount of secondary disease cycles and protecting leaf area from damage until after corn grain formation. High risks for corn grey leaf spot are divided into eight factors, which require specific management strategies. \n\n1. Susceptible hybrid.\n\n2.Continuous corn.\n\n3.Late planting date.\n\n4.Minimum tillage systems .\n\n5.Field history of severe disease.\n\n6.Early disease activity (before tasseling.\n\n7.rrigation and Favorable weather forecast for disease. \n\n There are currently three different management strategies, some of which are more effective than others.\n\n1.Resistant varieties: In places where leaf spot occur, these crops can ultimately grow and still be resistant to the disease. Although the disease is not completely eliminated and resistant varieties show disease symptoms, at the end of the growing season, the disease is not as effective in reducing crop yield\n\n2.Crop rotation: The amount of initial inoculum will be reduced when a crop other than corn is planted for ≥2 years in that given area; meanwhile proper tillage methods are carried out\n\n3.Residue management: Burying the debris under the last year’s crop will help in reducing the presence of Cercospera zeae-maydis, as the fungal-infected debris can only survive above the soil surface.';
          control =
              ' 1. Under high disease pressure, timely fungicide applications can greatly minimize impact on yield. These applications are costly and usually only practical when disease pressure is high.\n\n2.Proline 480 SC: Proline 480 SC is to be applied at 420 mL per/ha. This fungicide can only be applied a maximum 1 time/year. It should be note that only ground application is acceptable.\n\n3. Tilt 250 and Bumper 418 EC: Tilt 250 is to be applied at 500 mL/ha. Bumper 418 EC is to be applied at 300 mL/ha. Both fungicides are to be applied when rust pustules first appear. If disease is prevalent after primary application, a second application 14 days later may be necessary.';
        }
        break;
      case "tomato early blight":
        {
          scientificName = "Alternaria Solani";
          images = ["30.jpg", "31.jpg", "32.jpg"];
          symptoms =
              '     Symptoms of early blight occur on older foliage, stem, and fruits. Gray to brown spots appear on leaves and gradually grow in a concentric manner around a clear center - the characteristic “bullseye” formation. These lesions are surrounded by a bright yellow halo. As the disease progresses, entire leaves may turn chlorotic and shed, leading to significant defoliation. When leaves die and fall, fruits become more vulnerable to sun scald. The same type of spots with a clear center appears on stems and fruits. Rotting of fruits and sometimes dropping follows.';
          favourableConditions =
              '     Warm temperatures (24-29°C) and high humidity (90%) favor development of the disease. A long wet period (or alternating wet/dry weather) enhances the production of spores, which may be spread via wind, splashing rain or overhead irrigation. Tubers harvested green or in wet conditions are particularly susceptible to an infection. It often strikes after a period of heavy rainfall and is particularly destructive in tropical and subtropical areas.';
          remedies =
              '1. Look for varieties that are resistant to the disease.\n\n2. Plant or transplant on raised beds to improve drainage.\n\n3. Use certified pathogen-free seeds or transplants. \n\n4. Orient rows in the direction of main winds and avoid shaded areas.\n\n5. Space plants to allow the canopy to dry quickly after rainfall or irrigation. \n\n6. Lay mulch on the soil to keep plants from touching the soil. \n\n7. Monitor fields for signs of the disease, particularly during wet weather.\n\n8. Alternatively, plow debris deep in the soil (more than 45 cm).';
          control =
              '1. Application of products based on Bacillus subtilis or copper-based fungicides registered as organic can treat this disease.  \n\n2. Always consider an integrated approach with preventive measures and biological treatments if available. There are numerous fungicides on the market for controlling early blight. Fungicides based on or combinations of azoxystrobin, pyraclostrobin, difenoconazole, boscalid, chlorothalonil, fenamidone, maneb, mancozeb, trifloxystrobin, and ziram can be used. Rotation of different chemical compounds is recommended. Apply treatments in a timely manner, taking into account weather conditions. Check carefully the preharvest interval at which you can harvest safely after the application of these products.\n\n3. Biofungicides: There is a strain of bacteria that is effective at treating cedar apple rust on apple trees. It is a special strain of Bacillus subtilis';
        }
        break;
      case "tomato late blight":
        {
          scientificName = "Phytophthora infestans";
          images = ["33.jpg", "34.jpg", "35.jpg"];
          symptoms =
              '     Brownish-green spots appear on the leaf margins and leaf tops. Later, large areas of the leaves turn brown completely. During wet weather, lesions on the lower side of the leaves may be covered with a gray to white moldy growth, making it easier to distinguish healthy from dead leaf tissue. As the disease progresses, the foliage runs brown, curls and dries. In some cases, the sharply delimited brown spots and the white covering also appear on the stems, branches, and petioles. Greyish-green to dirty-brown and wrinkled stains appear on the fruits. At these spots, the fruit flesh is hardened.';
          favourableConditions =
              '     The fungus enters the plant via wounds and rips in the skin. Temperature and moisture are the most important environmental factors affecting the development of the disease. Late blight fungi grow best in high relative humidities (around 90%) and in temperature ranges of 18 to 26°C. Warm and dry summer weather can bring the spread of the disease to a halt.';

          remedies =
              '1. Tomatoes and potatoes should not be cultivated next to each other.\n\n2. Try to keep plants dry though good drainage and ventilation of your cultures. \n\n3. Installing a simple transparent rain shelter with the help of a tarpaulin and wooden stakes might help. \n\n4. Silicate-containing fertilizers may increase the resistance to the fungus, especially in the seedling stage. \n\n5. Avoid irrigation late in the day and irrigate plants at ground level.  \n\n6. Use plant fortifier for general strengthening of the plants. \n\n7. Crop rotation of two to three years with non-host crops is recommended.\n\n8. Purchase healthy seeds from reliable retailers.';
          control =
              '1. At this point, there is no biological control of known efficacy against late blight. To avoid spreading, remove and destroy plants around the infected spot immediately and do not compost infected plant material.  \n\n2. Always consider an integrated approach with preventive measures together with biological treatments if available. Use fungicide sprays based on mandipropamid, chlorothalonil, fluazinam, mancozeb to combat late blight. Fungicides are generally needed only if the disease appears during a time of year when rain is likely or overhead irrigation is practiced. .\n\n3. Biofungicides: There is a strain of bacteria that is effective at treating cedar apple rust on apple trees. It is a special strain of Bacillus subtilis';
        }
        break;
      case "potato early blight":
        {
          scientificName = "Alternaria solani";
          images = ["16.jpg", "17.jpg", "18.jpg"];
          symptoms =
              '     Symptoms of early blight occur on older foliage, stem, and fruits. Gray to brown spots appear on leaves and gradually grow in a concentric manner around a clear center - the characteristic “bullseye” formation. These lesions are surrounded by a bright yellow halo. As the disease progresses, entire leaves may turn chlorotic and shed, leading to significant defoliation. When leaves die and fall, fruits become more vulnerable to sun scald. The same type of spots with a clear center appears on stems and fruits. Rotting of fruits and sometimes dropping follows.';
          favourableConditions =
              '     Lower leaves often get infected when in contact with contaminated soil. Warm temperatures (24-29°C) and high humidity (90%) favor development of the disease. A long wet period (or alternating wet/dry weather) enhances the production of spores, which may be spread via wind, splashing rain or overhead irrigation. Tubers harvested green or in wet conditions are particularly susceptible to an infection. It often strikes after a period of heavy rainfall and is particularly destructive in tropical and subtropical areas.';
          lifeCycleImage = "PotatoEarlyCycle.jpg";
          remedies =
              '1. Use certified pathogen-free seeds or transplants.\n\n2. Look for varieties that are resistant to the disease.\n\n3. Plant or transplant on raised beds to improve drainage.\n\n4. Orient rows in the direction of main winds and avoid shaded areas.\n\n5. Space plants to allow the canopy to dry quickly after rainfall or irrigation.\n\n6. Lay mulch on the soil to keep plants from touching the soil. \n\n7. Monitor fields for signs of the disease, particularly during wet weather. \n\n8. Remove bottom leaves that are too close to the soil.\n\n9. Remove leaves displaying symptoms and destroy them.\n\n10. Keep plants strong and vigorous with an adequate nutrition.\n\n11. Use stakes to keep plants upright.\n\n12. Use a drip irrigation system to minimize leaf wetness.\n\nn13. Water plants in the morning so plants dry during the day.\n\n14. Control susceptible weeds in and around the field.\n\n15. Avoid working in fields when plants are wet.\n\n16. After harvest, remove plant debris and burn them (do not compost).\n\n17. Alternatively, plow debris deep in the soil (more than 45 cm).\n\n18. Plan a 2- or 3-year crop rotation with non-susceptible crops.\n\n19. Store tubers at cool temperatures and in well-aerated sites.';
          control =
              '     Application of products based on Bacillus subtilis or copper-based fungicides registered as organic can treat this disease. Always consider an integrated approach with preventive measures and biological treatments if available. There are numerous fungicides on the market for controlling early blight. Fungicides based on or combinations of azoxystrobin, pyraclostrobin, difenoconazole, boscalid, chlorothalonil, fenamidone, maneb, mancozeb, trifloxystrobin, and ziram can be used. Rotation of different chemical compounds is recommended. Apply treatments in a timely manner, taking into account weather conditions. Check carefully the preharvest interval at which you can harvest safely after the application of these products. ';
        }
        break;
      case "potato late blight":
        {
          scientificName = "Alternaria solani";
          images = ["19.jpg", "20.jpg", "21.jpg"];
          symptoms =
              '     Dark brown spots develop on the leaves starting at the tip or the leaf margins. In humid climates, these spots become water-soaked lesions. A white fungal covering can be seen on the underside of the leaves. As the disease progresses, entire leaves become necrotic, turn brown and die off. Similar lesions develop on stems and petioles. The potato tubers have greyish-blue spots on their skin and their flesh also turns brown, making them inedible. The rotting of the infested fields emits a distinctive odor.';
          favourableConditions =
              '     This fungus is an obligate parasite. This means that it must overwinter in plant debris and tubers as well as on alternative hosts to survive. It enters the plant via wounds and rips in the skin. Fungal spores germinate at higher temperatures during the spring and spread through wind or water. The disease is more severe in periods of cool nights (below 18°C), warm days (18-22°C), and extended wet conditions such as rain and fog (90% relative humidity). In these conditions, a late blight epidemic can occur.';
          lifeCycleImage = "PotatoLateCycle.jpg";
          remedies =
              '1. Use healthy seeds or more tolerant plants.\n\n2. Make sure the field has good air ventilation and well-drained soil.\n\n3. Monitor fields and remove infected plants and surrounding ones.\n\n4. Use rotations of two to three years to non-host crops.\n\n5. Destroy volunteer hosts in and around the field.\n\n6. Avoid excessive fertilization with nitrogen.\n\n7. Use plant fortifiers.\n\n8. Store tubers at low temperatures and with good ventilation.\n\n9. Destroy tubers and plant debris after harvest burying them two feet deep or feeding them to animals.';
          control =
              ' Apply copper-based fungicides before dry weather. Foliar sprays of organic coating agents can also prevent the infection. Always consider an integrated approach with preventive measures together with biological treatments if available. Fungicide applications are important to control late blight, particularly in humid areas. Contact fungicides that coat leaves are effective before infections and do not trigger resistance in the fungi. Fungicides containing mandipropamid, chlorothalonil, fluazinam, or mancozeb can also be used as a preventive treatment. Seed treatment before sowing with fungicides like mancozeb also work.';
        }
        break;
      default:
        {
          scientificName = "N/A";
          images = ["nia.jpg", "nia2.jpg", "nia.jpg"];
          symptoms = 'N/A';
          favourableConditions = 'N/A';
          // lifeCycleImage = "N/A";
          remedies = 'N/A';
          control = ' N/A';
        }
        break;
    }
  }
}

class DiseaseMap {
  final Map<String, DiseaseSubDetails> diseasesMap = {
    "corn maize common rust ": DiseaseSubDetails(
      diseaseName: "corn maize common rust ",
      scientificName: "Puccinia sorghi Schwein",
      coverImgUrl: "10.jpg",
    ),
    "corn maize northern leaf blight": DiseaseSubDetails(
      diseaseName: "corn maize northern leaf blight",
      scientificName: "Exserohilumturcicun",
      coverImgUrl: "13.jpg",
    ),
    "corn maize cercospora leaf spot gray leaf spot": DiseaseSubDetails(
      diseaseName: "corn maize cercospora leaf spot gray leaf spot",
      scientificName: "Cercospora zea-maydis",
      coverImgUrl: "7.jpg",
    ),
    "corn maize healthy": DiseaseSubDetails(
      diseaseName: "corn maize cercospora leaf spot gray leaf spot",
      scientificName: "Cercospora zea-maydis",
      coverImgUrl: "7.jpg",
    ),
    "tomato early blight": DiseaseSubDetails(
      diseaseName: "tomato early blight",
      scientificName: "Alternaria Solani",
      coverImgUrl: "30.jpg",
    ),
    "tomato late blight": DiseaseSubDetails(
      diseaseName: "tomato late blight",
      scientificName: "Phytophthora infestans",
      coverImgUrl: "33.jpg",
    ),
    "potato early blight": DiseaseSubDetails(
      diseaseName: "potato early blight",
      scientificName: "Alternaria solani",
      coverImgUrl: "16.jpg",
    ),
    "potato late blight": DiseaseSubDetails(
      diseaseName: "potato late blight",
      scientificName: "Alternaria solani",
      coverImgUrl: "19.jpg",
    ),
    "peach bacterial spot": DiseaseSubDetails(
      diseaseName: "peach bacterial spot",
      scientificName: "N/A",
      coverImgUrl: "nia.jpg",
    ),
  };
}

class DiseaseSubDetails {
  final String diseaseName;
  final String scientificName;
  final String coverImgUrl;

  DiseaseSubDetails(
      {required this.diseaseName,
      required this.scientificName,
      required this.coverImgUrl});
}
