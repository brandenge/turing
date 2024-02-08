require 'awesome_print'

class Nytimes
  DATA = {
  "status": "OK",
  "copyright": "Copyright (c) 2018 The New York Times Company. All Rights Reserved.",
  "section": "home",
  "last_updated": "2018-09-08T12:37:17-04:00",
  "num_results": 44,
  "results": [
    {
      "section": "U.S.",
      "subsection": "Politics",
      "title": "Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight",
      "abstract": "This week has illustrated why Republicans put up with the chaos: As President Trump raged, his party moved toward an ideological shift in the Supreme Court that will last for decades.",
      "url": "https://www.nytimes.com/2018/09/07/us/politics/trump-republicans.html",
      "byline": "By NICHOLAS FANDOS",
      "item_type": "Article",
      "updated_date": "2018-09-07T19:24:23-04:00",
      "created_date": "2018-09-07T15:44:00-04:00",
      "published_date": "2018-09-07T15:44:00-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "United States Politics and Government",
        "Elections, House of Representatives",
        "Appointments and Executive Changes"
      ],
      "org_facet": [
        "Republican Party"
      ],
      "per_facet": [
        "Trump, Donald J"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-repubs-print/08dc-repubs-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "&ldquo;You don&rsquo;t run the country as a soap opera,&rdquo; said Senator Ben Sasse, Republican of Nebraska, lamenting that the White House had become a &ldquo;three-ring circus.&rdquo;",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-repubs-print/08dc-repubs-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "&ldquo;You don&rsquo;t run the country as a soap opera,&rdquo; said Senator Ben Sasse, Republican of Nebraska, lamenting that the White House had become a &ldquo;three-ring circus.&rdquo;",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-repubs-print/08dc-repubs-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "&ldquo;You don&rsquo;t run the country as a soap opera,&rdquo; said Senator Ben Sasse, Republican of Nebraska, lamenting that the White House had become a &ldquo;three-ring circus.&rdquo;",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-repubs-print/08dc-repubs-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "&ldquo;You don&rsquo;t run the country as a soap opera,&rdquo; said Senator Ben Sasse, Republican of Nebraska, lamenting that the White House had become a &ldquo;three-ring circus.&rdquo;",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-repubs-print/08dc-repubs-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "&ldquo;You don&rsquo;t run the country as a soap opera,&rdquo; said Senator Ben Sasse, Republican of Nebraska, lamenting that the White House had become a &ldquo;three-ring circus.&rdquo;",
          "copyright": "Erin Schaff for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2M8YpUL"
    },
    {
      "section": "U.S.",
      "subsection": "Politics",
      "title": "Obama Lashes Trump in Debut 2018 Speech. President’s Response: ‘I Fell Asleep.’",
      "abstract": "The former president offered a stinging indictment of his successor, sometimes by name, accusing him and his Republican supporters of practicing a “politics of fear and resentment.”",
      "url": "https://www.nytimes.com/2018/09/07/us/politics/obama-2018-campaign-trump.html",
      "byline": "By PETER BAKER",
      "item_type": "Article",
      "updated_date": "2018-09-07T21:17:56-04:00",
      "created_date": "2018-09-07T13:49:45-04:00",
      "published_date": "2018-09-07T13:49:45-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Midterm Elections (2018)",
        "United States Politics and Government",
        "Presidential Election of 2016"
      ],
      "org_facet": [],
      "per_facet": [
        "Obama, Barack",
        "Trump, Donald J"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08obama_xp/08obama_xp-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Former President Barack Obama spoke to students at the University of Illinois at Urbana-Champaign on Friday.",
          "copyright": "Daniel Acker for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08obama_xp/08obama_xp-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Former President Barack Obama spoke to students at the University of Illinois at Urbana-Champaign on Friday.",
          "copyright": "Daniel Acker for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08obama_xp/08obama_xp-articleInline-v2.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Former President Barack Obama spoke to students at the University of Illinois at Urbana-Champaign on Friday.",
          "copyright": "Daniel Acker for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08obama_xp/08obama_xp-mediumThreeByTwo210-v2.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Former President Barack Obama spoke to students at the University of Illinois at Urbana-Champaign on Friday.",
          "copyright": "Daniel Acker for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08obama_xp/08obama_xp-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Former President Barack Obama spoke to students at the University of Illinois at Urbana-Champaign on Friday.",
          "copyright": "Daniel Acker for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2NsEYeb"
    },
    {
      "section": "U.S.",
      "subsection": "Politics",
      "title": "Democrats Embrace Liberal Insurgents, Demanding New Face for Party",
      "abstract": "Progressive women and racial minorities have toppled Democratic incumbents and eroded party machines in key states, with implications for the next Congress and the 2020 presidential race.",
      "url": "https://www.nytimes.com/2018/09/08/us/politics/democratic-party-midterms.html",
      "byline": "By ALEXANDER BURNS",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:18:18-04:00",
      "created_date": "2018-09-08T05:00:08-04:00",
      "published_date": "2018-09-08T05:00:08-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Midterm Elections (2018)",
        "Elections, House of Representatives",
        "Presidential Election of 2020",
        "Primaries and Caucuses"
      ],
      "org_facet": [
        "Democratic Party"
      ],
      "per_facet": [
        "Ocasio-Cortez, Alexandria",
        "Pressley, Ayanna",
        "Trump, Donald J"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/politics/09dems-1-print/09dems-2-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Ayanna Pressley celebrated her victory in the Democratic primary over Rep. Michael Capuano in Dorchester, Mass., on Tuesday.",
          "copyright": "Sarah Rice for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/politics/09dems-1-print/09dems-2-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Ayanna Pressley celebrated her victory in the Democratic primary over Rep. Michael Capuano in Dorchester, Mass., on Tuesday.",
          "copyright": "Sarah Rice for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/politics/09dems-1-print/09dems-2-articleInline.jpg",
          "format": "Normal",
          "height": 116,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Ayanna Pressley celebrated her victory in the Democratic primary over Rep. Michael Capuano in Dorchester, Mass., on Tuesday.",
          "copyright": "Sarah Rice for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/politics/09dems-1-print/09dems-2-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Ayanna Pressley celebrated her victory in the Democratic primary over Rep. Michael Capuano in Dorchester, Mass., on Tuesday.",
          "copyright": "Sarah Rice for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/politics/09dems-1-print/09dems-2-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1252,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Ayanna Pressley celebrated her victory in the Democratic primary over Rep. Michael Capuano in Dorchester, Mass., on Tuesday.",
          "copyright": "Sarah Rice for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2NZcnKH"
    },
    {
      "section": "World",
      "subsection": "Americas",
      "title": "Trump Administration Discussed Coup Plans With Rebel Venezuelan Officers",
      "abstract": "Venezuelan military officers seeking to overthrow President Nicolás Maduro sought help from the Trump administration, which met with them several times.",
      "url": "https://www.nytimes.com/2018/09/08/world/americas/donald-trump-venezuela-military-coup.html",
      "byline": "By ERNESTO LONDOÑO and NICHOLAS CASEY",
      "item_type": "Article",
      "updated_date": "2018-09-08T05:00:08-04:00",
      "created_date": "2018-09-08T05:00:08-04:00",
      "published_date": "2018-09-08T05:00:08-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Defense and Military Forces",
        "United States International Relations",
        "Coups D'Etat and Attempted Coups D'Etat",
        "United States Politics and Government"
      ],
      "org_facet": [],
      "per_facet": [
        "Maduro, Nicolas"
      ],
      "geo_facet": [
        "Venezuela",
        "Latin America"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/06/world/00venezuelamilitary1/00venezuelamilitary1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "A military ceremony in Caracas, Venezuela, this month. The White House declined to answer detailed questions about talks with rebellious officers.",
          "copyright": "Juan Barreto/Agence France-Presse &mdash; Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/world/00venezuelamilitary1/00venezuelamilitary1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "A military ceremony in Caracas, Venezuela, this month. The White House declined to answer detailed questions about talks with rebellious officers.",
          "copyright": "Juan Barreto/Agence France-Presse &mdash; Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/world/00venezuelamilitary1/merlin_142029489_4985abe2-ffd6-45c1-a530-2139d52b3592-articleInline.jpg",
          "format": "Normal",
          "height": 126,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "A military ceremony in Caracas, Venezuela, this month. The White House declined to answer detailed questions about talks with rebellious officers.",
          "copyright": "Juan Barreto/Agence France-Presse &mdash; Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/world/00venezuelamilitary1/00venezuelamilitary1-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "A military ceremony in Caracas, Venezuela, this month. The White House declined to answer detailed questions about talks with rebellious officers.",
          "copyright": "Juan Barreto/Agence France-Presse &mdash; Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/world/00venezuelamilitary1/merlin_142029489_4985abe2-ffd6-45c1-a530-2139d52b3592-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1363,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "A military ceremony in Caracas, Venezuela, this month. The White House declined to answer detailed questions about talks with rebellious officers.",
          "copyright": "Juan Barreto/Agence France-Presse &mdash; Getty Images"
        }
      ],
      "short_url": "https://nyti.ms/2O36Xyk"
    },
    {
      "section": "U.S.",
      "subsection": "Politics",
      "title": "Brett Kavanaugh’s Expert Evasions, Learned From Past Masters",
      "abstract": "Over more than 20 hours of questioning, Judge Brett M. Kavanaugh used well-honed techniques to avoid answering senators’ questions, with some updates for the Trump era.",
      "url": "https://www.nytimes.com/2018/09/08/us/politics/brett-kavanaugh-confirmation-hearings.html",
      "byline": "By ADAM LIPTAK",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:43:08-04:00",
      "created_date": "2018-09-08T11:43:08-04:00",
      "published_date": "2018-09-08T11:43:08-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Appointments and Executive Changes",
        "United States Politics and Government",
        "Federal Courts (US)",
        "Gun Control",
        "Courts and the Judiciary",
        "Abortion"
      ],
      "org_facet": [],
      "per_facet": [
        "Kavanaugh, Brett M"
      ],
      "geo_facet": [],
      "multimedia": [],
      "short_url": "https://nyti.ms/2MZ4kB4"
    },
    {
      "section": "U.S.",
      "subsection": "Politics",
      "title": "As Hearings End, Democrats Accuse Supreme Court Nominee of Dissembling",
      "abstract": "Four days of Supreme Court confirmation hearings ended Friday the way they began: With fierce partisan divisions over Judge Brett M. Kavanaugh.",
      "url": "https://www.nytimes.com/2018/09/07/us/politics/brett-kavanaugh-confirmation-hearings.html",
      "byline": "By CHARLIE SAVAGE and SHERYL GAY STOLBERG",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:51:08-04:00",
      "created_date": "2018-09-07T19:48:59-04:00",
      "published_date": "2018-09-07T19:48:59-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "United States Politics and Government",
        "Appointments and Executive Changes",
        "Courts and the Judiciary",
        "Abortion"
      ],
      "org_facet": [
        "Kasowitz Benson Torres LLP"
      ],
      "per_facet": [
        "Kavanaugh, Brett M"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-kavanaugh-print/08dc-kavanaugh1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Judge Brett M. Kavanaugh during his Supreme Court confirmation hearing before the Senate Judiciary Committee.",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-kavanaugh-print/08dc-kavanaugh1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Judge Brett M. Kavanaugh during his Supreme Court confirmation hearing before the Senate Judiciary Committee.",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-kavanaugh-print/merlin_143381079_497106f0-0b12-4c36-8bad-e8ff1ce2fae3-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Judge Brett M. Kavanaugh during his Supreme Court confirmation hearing before the Senate Judiciary Committee.",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-kavanaugh-print/merlin_143381079_497106f0-0b12-4c36-8bad-e8ff1ce2fae3-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Judge Brett M. Kavanaugh during his Supreme Court confirmation hearing before the Senate Judiciary Committee.",
          "copyright": "Erin Schaff for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/politics/08dc-kavanaugh-print/merlin_143381079_497106f0-0b12-4c36-8bad-e8ff1ce2fae3-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1366,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Judge Brett M. Kavanaugh during his Supreme Court confirmation hearing before the Senate Judiciary Committee.",
          "copyright": "Erin Schaff for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2NTFH4V"
    },
    {
      "section": "Technology",
      "subsection": "",
      "title": "Amazon’s Antitrust Antagonist Has a Breakthrough Idea",
      "abstract": "With a single scholarly article, Lina Khan, 29, has reframed decades of monopoly law.",
      "url": "https://www.nytimes.com/2018/09/07/technology/monopoly-antitrust-lina-khan-amazon.html",
      "byline": "By DAVID STREITFELD",
      "item_type": "Article",
      "updated_date": "2018-09-07T16:05:02-04:00",
      "created_date": "2018-09-07T11:48:13-04:00",
      "published_date": "2018-09-07T11:48:13-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Antitrust Laws and Competition Issues",
        "E-Commerce",
        "Law and Legislation",
        "Colleges and Universities",
        "Corporations"
      ],
      "org_facet": [
        "Amazon.com Inc"
      ],
      "per_facet": [
        "Lina Khan",
        "Bezos, Jeffrey P"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09Khan1.print/09Khan1.print-thumbStandard-v2.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Lina Khan’s writing has rocked the antitrust establishment — and made her an unlikely celebrity in Washington policy circles.",
          "copyright": "Brandon Thibodeaux for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09Khan1.print/09Khan1.print-thumbLarge-v2.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Lina Khan’s writing has rocked the antitrust establishment — and made her an unlikely celebrity in Washington policy circles.",
          "copyright": "Brandon Thibodeaux for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09Khan1.print/09Khan1.print-articleInline-v2.jpg",
          "format": "Normal",
          "height": 285,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Lina Khan’s writing has rocked the antitrust establishment — and made her an unlikely celebrity in Washington policy circles.",
          "copyright": "Brandon Thibodeaux for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09Khan1.print/09Khan1.print-mediumThreeByTwo210-v2.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Lina Khan’s writing has rocked the antitrust establishment — and made her an unlikely celebrity in Washington policy circles.",
          "copyright": "Brandon Thibodeaux for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09Khan1.print/09Khan1.print-superJumbo-v2.jpg",
          "format": "superJumbo",
          "height": 2048,
          "width": 1367,
          "type": "image",
          "subtype": "photo",
          "caption": "Lina Khan’s writing has rocked the antitrust establishment — and made her an unlikely celebrity in Washington policy circles.",
          "copyright": "Brandon Thibodeaux for The New York Times"
        }
      ]
    },
    {
      "section": "Business Day",
      "subsection": "",
      "title": "Tesla Shaken by a Departure and What Elon Musk Was Smoking",
      "abstract": "The head of accounting departed weeks after he arrived, and the company’s chief held forth in a webcast punctuated by his apparent puffs on a joint.",
      "url": "https://www.nytimes.com/2018/09/07/business/tesla-stock-elon-musk.html",
      "byline": "By NEAL E. BOUDETTE",
      "item_type": "Article",
      "updated_date": "2018-09-07T21:08:24-04:00",
      "created_date": "2018-09-07T10:26:10-04:00",
      "published_date": "2018-09-07T10:26:10-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Electric and Hybrid Vehicles",
        "Appointments and Executive Changes",
        "Stocks and Bonds",
        "Hiring and Promotion",
        "Marijuana",
        "Video Recordings, Downloads and Streaming"
      ],
      "org_facet": [
        "Tesla Motors Inc"
      ],
      "per_facet": [
        "Musk, Elon",
        "Rogan, Joe"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08mushpot-promo/08mushpot-promo-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08mushpot-promo/08mushpot-promo-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08mushpot-promo/08mushpot-promo-articleInline.jpg",
          "format": "Normal",
          "height": 99,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08mushpot-promo/08mushpot-promo-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08mushpot-promo/08mushpot-promo-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1066,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        }
      ],
      "short_url": "https://nyti.ms/2NjmrkD"
    },
    {
      "section": "Technology",
      "subsection": "",
      "title": "Alibaba’s Jack Ma, China’s Richest Man, to Retire From Company He Co-Founded",
      "abstract": "In an interview, Mr. Ma said it was “the beginning of an era” for him and that he planned to focus on philanthropy in education.",
      "url": "https://www.nytimes.com/2018/09/07/technology/alibaba-jack-ma-retiring.html",
      "byline": "By LI YUAN",
      "item_type": "Article",
      "updated_date": "2018-09-07T23:21:23-04:00",
      "created_date": "2018-09-07T18:48:34-04:00",
      "published_date": "2018-09-07T18:48:34-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "E-Commerce",
        "Computers and the Internet",
        "Appointments and Executive Changes",
        "Economic Conditions and Trends",
        "Retirement",
        "Philanthropy",
        "Education"
      ],
      "org_facet": [
        "Alibaba Group Holding Ltd",
        "Alipay",
        "Ant Financial Services Group",
        "Taobao",
        "Weibo Corporation"
      ],
      "per_facet": [
        "Ma, Jack"
      ],
      "geo_facet": [
        "China"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08alibaba-print-dress/08alibaba1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Jack Ma, co-founder and executive chairman of Alibaba, is stepping down at a time when the Chinese business environment has soured.",
          "copyright": "Amir Cohen/Reuters"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08alibaba-print-dress/08alibaba1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Jack Ma, co-founder and executive chairman of Alibaba, is stepping down at a time when the Chinese business environment has soured.",
          "copyright": "Amir Cohen/Reuters"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08alibaba-print-dress/merlin_137647791_fe403004-eb35-494c-b9c9-07a676c3ebd7-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Jack Ma, co-founder and executive chairman of Alibaba, is stepping down at a time when the Chinese business environment has soured.",
          "copyright": "Amir Cohen/Reuters"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08alibaba-print-dress/merlin_137647791_fe403004-eb35-494c-b9c9-07a676c3ebd7-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Jack Ma, co-founder and executive chairman of Alibaba, is stepping down at a time when the Chinese business environment has soured.",
          "copyright": "Amir Cohen/Reuters"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/business/08alibaba-print-dress/merlin_137647791_fe403004-eb35-494c-b9c9-07a676c3ebd7-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1366,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Jack Ma, co-founder and executive chairman of Alibaba, is stepping down at a time when the Chinese business environment has soured.",
          "copyright": "Amir Cohen/Reuters"
        }
      ],
      "short_url": "https://nyti.ms/2NY71iu"
    },
    {
      "section": "Sports",
      "subsection": "Tennis",
      "title": "Serena Williams vs. Naomi Osaka: Clash of Generations With Common Threads",
      "abstract": "The career paths of Naomi Osaka, 20, and Serena Williams, 36, are about to cross at the summit on Saturday in the United States Open final.",
      "url": "https://www.nytimes.com/2018/09/08/sports/tennis/us-open-serena-williams-naomi-osaka.html",
      "byline": "By CHRISTOPHER CLAREY",
      "item_type": "Article",
      "updated_date": "2018-09-08T00:01:05-04:00",
      "created_date": "2018-09-08T00:01:06-04:00",
      "published_date": "2018-09-08T00:01:06-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "United States Open (Tennis)",
        "Tennis",
        "Coaches and Managers"
      ],
      "org_facet": [],
      "per_facet": [
        "Williams, Serena",
        "Osaka, Naomi (1997- )",
        "Bajin, Sascha"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08clarey-print1/merlin_143377512_93beff3b-41a7-4126-b3fd-a1226e19514d-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Naomi Osaka, 20, will play in her first Grand Slam final on Saturday against Serena Williams at the United States Open.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08clarey-print1/merlin_143377512_93beff3b-41a7-4126-b3fd-a1226e19514d-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Naomi Osaka, 20, will play in her first Grand Slam final on Saturday against Serena Williams at the United States Open.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08clarey-print1/merlin_143377512_93beff3b-41a7-4126-b3fd-a1226e19514d-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Naomi Osaka, 20, will play in her first Grand Slam final on Saturday against Serena Williams at the United States Open.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08clarey-print1/merlin_143377512_93beff3b-41a7-4126-b3fd-a1226e19514d-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Naomi Osaka, 20, will play in her first Grand Slam final on Saturday against Serena Williams at the United States Open.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08clarey-print1/merlin_143377512_93beff3b-41a7-4126-b3fd-a1226e19514d-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Naomi Osaka, 20, will play in her first Grand Slam final on Saturday against Serena Williams at the United States Open.",
          "copyright": "Chang W. Lee/The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2oOxMLx"
    },
    {
      "section": "Sports",
      "subsection": "",
      "title": "Serena Williams. New Mom. Elite Athlete. Extraordinary and Ordinary All at Once.",
      "abstract": "Williams’s success has the sports world buzzing about new mothers and great performances. It has happened before, and it will happen again.",
      "url": "https://www.nytimes.com/2018/08/31/sports/serena-williams-new-mom.html",
      "byline": "By TALYA MINSBERG",
      "item_type": "Article",
      "updated_date": "2018-09-01T00:17:47-04:00",
      "created_date": "2018-08-31T15:05:06-04:00",
      "published_date": "2018-08-31T15:05:06-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Tennis",
        "United States Open (Tennis)",
        "Pregnancy and Childbirth",
        "Athletics and Sports"
      ],
      "org_facet": [],
      "per_facet": [
        "Williams, Serena",
        "Walsh Jennings, Kerri",
        "Dibaba, Tirunesh",
        "Fawcett, Joy",
        "Torres, Dara",
        "Anderson, Lisa (1969- )",
        "Radcliffe, Paula"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/02/sports/02MOMS-serena-print/02MOMS-serena-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Demetrius Freeman for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/02/sports/02MOMS-serena-print/02MOMS-serena-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Demetrius Freeman for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/02/sports/02MOMS-serena-print/02MOMS-serena-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Demetrius Freeman for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/02/sports/02MOMS-serena-print/02MOMS-serena-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Demetrius Freeman for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/02/sports/02MOMS-serena-print/02MOMS-serena-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Demetrius Freeman for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2PpWf5a"
    },
    {
      "section": "Arts",
      "subsection": "",
      "title": "11 of Our Best Weekend Reads",
      "abstract": "Alex Jones faces his reckoning. Cher loves being Cher. Anonymous resistance in Trump administration. We try to make you love classical music. And more.",
      "url": "https://www.nytimes.com/2018/09/08/arts/11-of-our-best-weekend-reads.html",
      "byline": "By KALY SOTO",
      "item_type": "Article",
      "updated_date": "2018-09-08T05:00:02-04:00",
      "created_date": "2018-09-08T05:00:02-04:00",
      "published_date": "2018-09-08T05:00:02-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Diplomatic Service, Embassies and Consulates"
      ],
      "org_facet": [],
      "per_facet": [
        "Cher (1946- )",
        "Woodward, Bob"
      ],
      "geo_facet": [
        "Genoa (Italy)"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/briefing/08weekend-reads/08weekend-reads-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/briefing/08weekend-reads/08weekend-reads-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/briefing/08weekend-reads/08weekend-reads-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/briefing/08weekend-reads/08weekend-reads-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/briefing/08weekend-reads/08weekend-reads-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1334,
          "width": 2000,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        }
      ],
      "short_url": "https://nyti.ms/2NZcl5x"
    },
    {
      "section": "Briefing",
      "subsection": "",
      "title": "The Week in Good News: Environmentally Friendly Lego, Dorothy’s Ruby Slippers, Digital Braille",
      "abstract": "Sometimes it seems as if we’re living under a constant barrage of heavy news. But it isn’t all bad out there.",
      "url": "https://www.nytimes.com/2018/09/06/briefing/week-in-good-news-legos-ruby-slippers.html",
      "byline": "By DES SHOE",
      "item_type": "Article",
      "updated_date": "2018-09-06T11:37:10-04:00",
      "created_date": "2018-09-06T11:37:10-04:00",
      "published_date": "2018-09-06T11:37:10-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/08/29/business/00plasticlego-1-goodnews/00plasticlego-1-goodnews-thumbStandard-v3.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "The pieces making up these (very cool) dinosaurs have barely changed in more than 50 years.",
          "copyright": "Carsten Snejbjerg for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/business/00plasticlego-1-goodnews/00plasticlego-1-goodnews-thumbLarge-v3.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "The pieces making up these (very cool) dinosaurs have barely changed in more than 50 years.",
          "copyright": "Carsten Snejbjerg for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/business/00plasticlego-1-goodnews/merlin_137674470_486eb273-ba3b-4808-857f-956b9cb7f533-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "The pieces making up these (very cool) dinosaurs have barely changed in more than 50 years.",
          "copyright": "Carsten Snejbjerg for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/business/00plasticlego-1-goodnews/merlin_137674470_486eb273-ba3b-4808-857f-956b9cb7f533-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "The pieces making up these (very cool) dinosaurs have barely changed in more than 50 years.",
          "copyright": "Carsten Snejbjerg for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/business/00plasticlego-1-goodnews/merlin_137674470_486eb273-ba3b-4808-857f-956b9cb7f533-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1368,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "The pieces making up these (very cool) dinosaurs have barely changed in more than 50 years.",
          "copyright": "Carsten Snejbjerg for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2MS2OQV"
    },
    {
      "section": "Opinion",
      "subsection": "Sunday Review",
      "title": "The Kids Who Still Need Football",
      "abstract": "America is moving away from this dangerous sport. But some families will decide the risks are worth it.",
      "url": "https://www.nytimes.com/2018/09/08/opinion/sunday/football-kids-brain-damage.html",
      "byline": "By ALBERT SAMAHA",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:31:44-04:00",
      "created_date": "2018-09-08T11:31:44-04:00",
      "published_date": "2018-09-08T11:31:44-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Football",
        "Education (K-12)",
        "Chronic Traumatic Encephalopathy",
        "Colleges and Universities",
        "Football (College)"
      ],
      "org_facet": [
        "Poly Prep Country Day School"
      ],
      "per_facet": [],
      "geo_facet": [
        "Brooklyn (NYC)"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/opinion/sunday/09Samaha4/09Samaha4-thumbStandard-v2.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Andrew Hart is a sophomore at Country Day Poly Prep High School in Brooklyn, where he plays football. He hopes his talent on the field will lead to a college athletic scholarship.",
          "copyright": "Damon Winter/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/opinion/sunday/09Samaha4/09Samaha4-thumbLarge-v2.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Andrew Hart is a sophomore at Country Day Poly Prep High School in Brooklyn, where he plays football. He hopes his talent on the field will lead to a college athletic scholarship.",
          "copyright": "Damon Winter/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/opinion/sunday/09Samaha4/merlin_143376285_1627e23e-8c5d-4347-82e2-8df34cc76b16-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Andrew Hart is a sophomore at Country Day Poly Prep High School in Brooklyn, where he plays football. He hopes his talent on the field will lead to a college athletic scholarship.",
          "copyright": "Damon Winter/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/opinion/sunday/09Samaha4/09Samaha4-mediumThreeByTwo210-v2.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Andrew Hart is a sophomore at Country Day Poly Prep High School in Brooklyn, where he plays football. He hopes his talent on the field will lead to a college athletic scholarship.",
          "copyright": "Damon Winter/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/opinion/sunday/09Samaha4/merlin_143376285_1627e23e-8c5d-4347-82e2-8df34cc76b16-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Andrew Hart is a sophomore at Country Day Poly Prep High School in Brooklyn, where he plays football. He hopes his talent on the field will lead to a college athletic scholarship.",
          "copyright": "Damon Winter/The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2N18Rmo"
    },
    {
      "section": "Opinion",
      "subsection": "",
      "title": "Requiem for a Mustache",
      "abstract": "There was more to Burt Reynolds than his hypermasculinity, but he was a man for a cultural moment.",
      "url": "https://www.nytimes.com/2018/09/08/opinion/daphne-merkin-burt-reynolds.html",
      "byline": "By DAPHNE MERKIN",
      "item_type": "Article",
      "updated_date": "2018-09-08T12:12:18-04:00",
      "created_date": "2018-09-08T11:00:06-04:00",
      "published_date": "2018-09-08T11:00:06-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Beauty (Concept)",
        "Movies",
        "Deliverance (Movie)",
        "Boogie Nights (Movie)",
        "In Pieces (Book)",
        "The End (Movie)"
      ],
      "org_facet": [],
      "per_facet": [
        "Affleck, Casey",
        "Brando, Marlon",
        "Cruise, Tom",
        "Damon, Matt",
        "Gosling, Ryan",
        "Grant, Cary",
        "Hoffman, Dustin",
        "Kael, Pauline",
        "Mailer, Norman",
        "Monroe, Marilyn",
        "Pacino, Al",
        "Pitt, Brad",
        "Redford, Robert",
        "Reynolds, Burt",
        "Streisand, Barbra",
        "Yeats, William Butler"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/opinion/08Merkin1/08Merkin1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Burt Reynolds surrenders his trademark mustache to Dinah Shore for a 1973 television special. The variety show hostess was nearly 20 years older than Reynolds, her boyfriend.",
          "copyright": "Nbcu Photo Bank"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/opinion/08Merkin1/08Merkin1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Burt Reynolds surrenders his trademark mustache to Dinah Shore for a 1973 television special. The variety show hostess was nearly 20 years older than Reynolds, her boyfriend.",
          "copyright": "Nbcu Photo Bank"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/opinion/08Merkin1/08Merkin1-articleInline.jpg",
          "format": "Normal",
          "height": 243,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Burt Reynolds surrenders his trademark mustache to Dinah Shore for a 1973 television special. The variety show hostess was nearly 20 years older than Reynolds, her boyfriend.",
          "copyright": "Nbcu Photo Bank"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/opinion/08Merkin1/08Merkin1-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Burt Reynolds surrenders his trademark mustache to Dinah Shore for a 1973 television special. The variety show hostess was nearly 20 years older than Reynolds, her boyfriend.",
          "copyright": "Nbcu Photo Bank"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/opinion/08Merkin1/08Merkin1-superJumbo.jpg",
          "format": "superJumbo",
          "height": 2048,
          "width": 1599,
          "type": "image",
          "subtype": "photo",
          "caption": "Burt Reynolds surrenders his trademark mustache to Dinah Shore for a 1973 television special. The variety show hostess was nearly 20 years older than Reynolds, her boyfriend.",
          "copyright": "Nbcu Photo Bank"
        }
      ],
      "short_url": "https://nyti.ms/2N0Nn98"
    },
    {
      "section": "Opinion",
      "subsection": "Editorials",
      "title": "Confirmed: Brett Kavanaugh Can’t Be Trusted",
      "abstract": "A perfect nominee for a president with no clear relation to the truth.",
      "url": "https://www.nytimes.com/2018/09/07/opinion/editorials/brett-kavanaugh-confirmation-hearings.html",
      "byline": "By THE EDITORIAL BOARD",
      "item_type": "Article",
      "updated_date": "2018-09-07T19:56:02-04:00",
      "created_date": "2018-09-07T19:56:02-04:00",
      "published_date": "2018-09-07T19:56:02-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "United States Politics and Government",
        "Appointments and Executive Changes"
      ],
      "org_facet": [
        "Supreme Court (US)",
        "Senate Committee on the Judiciary"
      ],
      "per_facet": [
        "Kavanaugh, Brett M"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07kavanaugh/07kavanaugh-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Sam Alden"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07kavanaugh/07kavanaugh-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Sam Alden"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07kavanaugh/merlin_143423172_ba667746-4fe5-414c-9258-aea84b05c0dc-articleInline.jpg",
          "format": "Normal",
          "height": 108,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Sam Alden"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07kavanaugh/07kavanaugh-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Sam Alden"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07kavanaugh/merlin_143423172_ba667746-4fe5-414c-9258-aea84b05c0dc-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1166,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Sam Alden"
        }
      ],
      "short_url": "https://nyti.ms/2NVgYNW"
    },
    {
      "section": "Opinion",
      "subsection": "",
      "title": "I Had Alzheimer’s. But I Wasn’t Ready to Retire.",
      "abstract": "Employers shouldn’t push out people with early-onset dementia. We still have a lot to offer.",
      "url": "https://www.nytimes.com/2018/09/07/opinion/early-onset-alzheimers-work.html",
      "byline": "By WENDY MITCHELL",
      "item_type": "Article",
      "updated_date": "2018-09-07T21:51:15-04:00",
      "created_date": "2018-09-07T20:08:51-04:00",
      "published_date": "2018-09-07T20:08:51-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Alzheimer's Disease",
        "Dementia",
        "Labor and Jobs"
      ],
      "org_facet": [
        "National Health Service"
      ],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07mitchell/07mitchell-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Celia Jacobs"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07mitchell/07mitchell-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Celia Jacobs"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07mitchell/merlin_143420529_de5a9d6a-8dfc-4825-b492-5092ee3cfa7d-articleInline.jpg",
          "format": "Normal",
          "height": 190,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Celia Jacobs"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07mitchell/07mitchell-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Celia Jacobs"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07mitchell/merlin_143420529_de5a9d6a-8dfc-4825-b492-5092ee3cfa7d-superJumbo.jpg",
          "format": "superJumbo",
          "height": 2048,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Celia Jacobs"
        }
      ],
      "short_url": "https://nyti.ms/2MXXrzJ"
    },
    {
      "section": "Opinion",
      "subsection": "",
      "title": "Trump’s Truly Terrible Time",
      "abstract": "While Honest Abe rolls in his grave …",
      "url": "https://www.nytimes.com/2018/09/07/opinion/trump-anonymous-oped-woodward.html",
      "byline": "By GAIL COLLINS",
      "item_type": "Article",
      "updated_date": "2018-09-07T19:15:12-04:00",
      "created_date": "2018-09-07T19:15:12-04:00",
      "published_date": "2018-09-07T19:15:12-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "United States Politics and Government",
        "Speeches and Statements",
        "Fear: Trump in the White House (Book)"
      ],
      "org_facet": [],
      "per_facet": [
        "Musk, Elon",
        "Trump, Donald J",
        "Jackson, Ronny L"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07collinsWeb/07collinsWeb-thumbStandard-v2.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "President Trump at a fund-raiser on Friday in North Dakota.",
          "copyright": "Doug Mills/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07collinsWeb/07collinsWeb-thumbLarge-v2.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "President Trump at a fund-raiser on Friday in North Dakota.",
          "copyright": "Doug Mills/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07collinsWeb/07collinsWeb-articleInline.jpg",
          "format": "Normal",
          "height": 123,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "President Trump at a fund-raiser on Friday in North Dakota.",
          "copyright": "Doug Mills/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07collinsWeb/07collinsWeb-mediumThreeByTwo210-v2.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "President Trump at a fund-raiser on Friday in North Dakota.",
          "copyright": "Doug Mills/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/opinion/07collinsWeb/07collinsWeb-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1327,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "President Trump at a fund-raiser on Friday in North Dakota.",
          "copyright": "Doug Mills/The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2N0QPks"
    },
    {
      "section": "World",
      "subsection": "Americas",
      "title": "Women Move From Samba’s Sidelines to the Center of the Circle",
      "abstract": "Over time, the Brazilian samba circle turned into a predominantly male realm. Now female musicians are pushing back.",
      "url": "https://www.nytimes.com/2018/09/08/world/americas/women-samba-musicians.html",
      "byline": "By SHANNON SIMS",
      "item_type": "Article",
      "updated_date": "2018-09-08T08:43:50-04:00",
      "created_date": "2018-09-08T05:00:09-04:00",
      "published_date": "2018-09-08T05:00:09-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Surfacing 2018",
        "Women and Girls",
        "Music"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [
        "Brazil"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/fashion/08-FEMALE-SAMBA1/08-FEMALE-SAMBA1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "The women of Samba Que Elas Querem at a rehearsal at a member's home in Rio. From left, Bárbara Fernandes, Mariana Solis, Júlia Ribeiro, Cecília Cruz, Isabella Ciavatta and Sylvia Duffrayer.",
          "copyright": "Maria Magdalena Arrellaga for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/fashion/08-FEMALE-SAMBA1/08-FEMALE-SAMBA1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "The women of Samba Que Elas Querem at a rehearsal at a member's home in Rio. From left, Bárbara Fernandes, Mariana Solis, Júlia Ribeiro, Cecília Cruz, Isabella Ciavatta and Sylvia Duffrayer.",
          "copyright": "Maria Magdalena Arrellaga for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/fashion/08-FEMALE-SAMBA1/merlin_131421271_cf50c447-8210-4a7f-bfa2-40f731bbe3f7-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "The women of Samba Que Elas Querem at a rehearsal at a member's home in Rio. From left, Bárbara Fernandes, Mariana Solis, Júlia Ribeiro, Cecília Cruz, Isabella Ciavatta and Sylvia Duffrayer.",
          "copyright": "Maria Magdalena Arrellaga for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/fashion/08-FEMALE-SAMBA1/08-FEMALE-SAMBA1-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "The women of Samba Que Elas Querem at a rehearsal at a member's home in Rio. From left, Bárbara Fernandes, Mariana Solis, Júlia Ribeiro, Cecília Cruz, Isabella Ciavatta and Sylvia Duffrayer.",
          "copyright": "Maria Magdalena Arrellaga for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/fashion/08-FEMALE-SAMBA1/merlin_131421271_cf50c447-8210-4a7f-bfa2-40f731bbe3f7-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1366,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "The women of Samba Que Elas Querem at a rehearsal at a member's home in Rio. From left, Bárbara Fernandes, Mariana Solis, Júlia Ribeiro, Cecília Cruz, Isabella Ciavatta and Sylvia Duffrayer.",
          "copyright": "Maria Magdalena Arrellaga for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2NZchCP"
    },
    {
      "section": "Style",
      "subsection": "",
      "title": "License to Not Drive",
      "abstract": "As the daughter of protective Somali parents, I was sheltered and, eventually, indifferent to learning to drive. But in one exhilarating moment behind the wheel, I began my journey into adulthood.",
      "url": "https://www.nytimes.com/2018/09/06/style/learning-to-drive.html",
      "byline": "By SAFY-HALLAN FARAH",
      "item_type": "Article",
      "updated_date": "2018-09-07T20:18:50-04:00",
      "created_date": "2018-09-06T08:20:33-04:00",
      "published_date": "2018-09-06T08:20:33-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Women and Girls",
        "Drivers Licenses",
        "Somali-Americans",
        "Children and Childhood"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [
        "Somalia"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/style/09RITES-DRIVING-1/06RITES-DRIVING-1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Illustration by Ana Benaroya"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/style/09RITES-DRIVING-1/06RITES-DRIVING-1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Illustration by Ana Benaroya"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/style/09RITES-DRIVING-1/06RITES-DRIVING-1-articleInline.jpg",
          "format": "Normal",
          "height": 70,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Illustration by Ana Benaroya"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/style/09RITES-DRIVING-1/06RITES-DRIVING-1-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Illustration by Ana Benaroya"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/style/09RITES-DRIVING-1/06RITES-DRIVING-1-superJumbo.jpg",
          "format": "superJumbo",
          "height": 756,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Illustration by Ana Benaroya"
        }
      ],
      "short_url": "https://nyti.ms/2MQ0rOG"
    },
    {
      "section": "Sports",
      "subsection": "",
      "title": "College Football’s Craziest Weekend Arrives",
      "abstract": "Championships won’t get locked up for another three months, but Week 2 is college football’s nuttiest.",
      "url": "https://www.nytimes.com/2018/09/07/sports/college-football-week-2-upsets.html",
      "byline": "By MARC TRACY",
      "item_type": "Article",
      "updated_date": "2018-09-07T18:58:57-04:00",
      "created_date": "2018-09-07T05:00:18-04:00",
      "published_date": "2018-09-07T05:00:18-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Football (College)"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08week2/08week2-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Members of the Middle Tennessee Blue Raiders celebrated during their victory over Syracuse in Week 2 last season.",
          "copyright": "Brett Carlsen/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08week2/08week2-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Members of the Middle Tennessee Blue Raiders celebrated during their victory over Syracuse in Week 2 last season.",
          "copyright": "Brett Carlsen/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08week2/merlin_143368272_9194fbe6-09de-4221-8357-2dee09d50ca8-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Members of the Middle Tennessee Blue Raiders celebrated during their victory over Syracuse in Week 2 last season.",
          "copyright": "Brett Carlsen/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08week2/merlin_143368272_9194fbe6-09de-4221-8357-2dee09d50ca8-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Members of the Middle Tennessee Blue Raiders celebrated during their victory over Syracuse in Week 2 last season.",
          "copyright": "Brett Carlsen/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/sports/08week2/merlin_143368272_9194fbe6-09de-4221-8357-2dee09d50ca8-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Members of the Middle Tennessee Blue Raiders celebrated during their victory over Syracuse in Week 2 last season.",
          "copyright": "Brett Carlsen/Getty Images"
        }
      ],
      "short_url": "https://nyti.ms/2O01eJC"
    },
    {
      "section": "New York",
      "subsection": "",
      "title": "Michael Cohen Offers to Rip Up Hush-Money Deal With Stormy Daniels",
      "abstract": "The motives behind the abrupt move remain unclear, but one effect could be to spare President Trump from being deposed in a lawsuit related to the case.",
      "url": "https://www.nytimes.com/2018/09/08/nyregion/michael-cohen-stormy-daniels-nda.html",
      "byline": "By ALAN FEUER",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:34:28-04:00",
      "created_date": "2018-09-08T11:04:29-04:00",
      "published_date": "2018-09-08T11:04:29-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Campaign Finance",
        "Adultery",
        "United States Politics and Government",
        "Suits and Litigation (Civil)",
        "Nondisclosure agreements",
        "Presidential Election of 2016"
      ],
      "org_facet": [],
      "per_facet": [
        "Clifford, Stephanie (1979- )",
        "Trump, Donald J",
        "Cohen, Michael D (1966- )",
        "Avenatti, Michael"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/09STORMY-1/09STORMY-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Stephanie Clifford, better known as Stormy Daniels, with her lawyer, Michael Avenatti, this year in New York.",
          "copyright": "Drew Angerer/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/09STORMY-1/09STORMY-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Stephanie Clifford, better known as Stormy Daniels, with her lawyer, Michael Avenatti, this year in New York.",
          "copyright": "Drew Angerer/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/09STORMY-1/09STORMY-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Stephanie Clifford, better known as Stormy Daniels, with her lawyer, Michael Avenatti, this year in New York.",
          "copyright": "Drew Angerer/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/09STORMY-1/09STORMY-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Stephanie Clifford, better known as Stormy Daniels, with her lawyer, Michael Avenatti, this year in New York.",
          "copyright": "Drew Angerer/Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/us/09STORMY-1/09STORMY-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Stephanie Clifford, better known as Stormy Daniels, with her lawyer, Michael Avenatti, this year in New York.",
          "copyright": "Drew Angerer/Getty Images"
        }
      ],
      "short_url": "https://nyti.ms/2NWoFDm"
    },
    {
      "section": "U.S.",
      "subsection": "",
      "title": "Dallas Police Officer Kills Her Neighbor in His Apartment, Saying She Mistook It for Her Own",
      "abstract": "The officer told the police that she shot Botham Shem Jean, 26, after mistaking his apartment for her own and believing he was an intruder.",
      "url": "https://www.nytimes.com/2018/09/07/us/dallas-police-shooting-botham-shem-jean.html",
      "byline": "By MATTHEW HAAG",
      "item_type": "Article",
      "updated_date": "2018-09-07T15:06:58-04:00",
      "created_date": "2018-09-07T15:06:58-04:00",
      "published_date": "2018-09-07T15:06:58-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Police Brutality, Misconduct and Shootings",
        "Murders, Attempted Murders and Homicides"
      ],
      "org_facet": [],
      "per_facet": [
        "Jean, Botham Shem"
      ],
      "geo_facet": [
        "Dallas (Tex)"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08xp-dallas/08xp-dallas-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Botham Shem Jean was fatally shot inside his Dallas apartment by a police officer on Thursday night.",
          "copyright": "Jeff Montgomery/Harding University"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08xp-dallas/08xp-dallas-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Botham Shem Jean was fatally shot inside his Dallas apartment by a police officer on Thursday night.",
          "copyright": "Jeff Montgomery/Harding University"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08xp-dallas/merlin_143402535_9d7e79b6-f952-44d0-b59c-f6d8096f1b09-articleInline.jpg",
          "format": "Normal",
          "height": 126,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Botham Shem Jean was fatally shot inside his Dallas apartment by a police officer on Thursday night.",
          "copyright": "Jeff Montgomery/Harding University"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08xp-dallas/08xp-dallas-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Botham Shem Jean was fatally shot inside his Dallas apartment by a police officer on Thursday night.",
          "copyright": "Jeff Montgomery/Harding University"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/us/08xp-dallas/merlin_143402535_9d7e79b6-f952-44d0-b59c-f6d8096f1b09-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1359,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Botham Shem Jean was fatally shot inside his Dallas apartment by a police officer on Thursday night.",
          "copyright": "Jeff Montgomery/Harding University"
        }
      ],
      "short_url": "https://nyti.ms/2NYub8K"
    },
    {
      "section": "World",
      "subsection": "Middle East",
      "title": "Egypt Court Sentences 75 to Death Over Deadly 2013 Protests",
      "abstract": "A sit-in was staged by supporters of former President Mohammed Morsi, who was ousted by the military. At least 600 people were killed when security forces broke up the gathering.",
      "url": "https://www.nytimes.com/2018/09/08/world/middleeast/egypt-protest-sentences.html",
      "byline": "By MOHAMED EZZ",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:46:25-04:00",
      "created_date": "2018-09-08T08:41:38-04:00",
      "published_date": "2018-09-08T08:41:38-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Demonstrations, Protests and Riots",
        "Defense and Military Forces",
        "Politics and Government",
        "Human Rights and Human Rights Violations"
      ],
      "org_facet": [
        "Muslim Brotherhood (Egypt)"
      ],
      "per_facet": [
        "Abou Zeid, Mahmoud (1987- )"
      ],
      "geo_facet": [
        "Egypt",
        "Rabaa al-Adawiya (Cario, Egypt)"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/09egypt/09egypt-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Wounded supporters of Mohammed Morsi, the ousted Egyptian president, lying on the floor of a makeshift hospital in Cairo after a sit-in in August 2013.",
          "copyright": "Manu Brabo/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/09egypt/09egypt-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Wounded supporters of Mohammed Morsi, the ousted Egyptian president, lying on the floor of a makeshift hospital in Cairo after a sit-in in August 2013.",
          "copyright": "Manu Brabo/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/09egypt/merlin_142318014_f8b8b359-fa79-42d7-b788-c83cf7acb6eb-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Wounded supporters of Mohammed Morsi, the ousted Egyptian president, lying on the floor of a makeshift hospital in Cairo after a sit-in in August 2013.",
          "copyright": "Manu Brabo/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/09egypt/merlin_142318014_f8b8b359-fa79-42d7-b788-c83cf7acb6eb-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Wounded supporters of Mohammed Morsi, the ousted Egyptian president, lying on the floor of a makeshift hospital in Cairo after a sit-in in August 2013.",
          "copyright": "Manu Brabo/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/09egypt/merlin_142318014_f8b8b359-fa79-42d7-b788-c83cf7acb6eb-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1366,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Wounded supporters of Mohammed Morsi, the ousted Egyptian president, lying on the floor of a makeshift hospital in Cairo after a sit-in in August 2013.",
          "copyright": "Manu Brabo/Associated Press"
        }
      ],
      "short_url": "https://nyti.ms/2oSsz5u"
    },
    {
      "section": "New York",
      "subsection": "",
      "title": "In Immigration Courts, It Is Judges vs. Justice Department",
      "abstract": "The Trump administration has instituted policies it says will speed up backlogged immigration cases, but critics see them as an attempt to control how judges rule.",
      "url": "https://www.nytimes.com/2018/09/07/nyregion/nyc-immigration-judges-courts.html",
      "byline": "By LIZ ROBBINS",
      "item_type": "Article",
      "updated_date": "2018-09-07T23:35:11-04:00",
      "created_date": "2018-09-07T15:44:29-04:00",
      "published_date": "2018-09-07T15:44:29-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Immigration and Emigration",
        "Courts and the Judiciary",
        "Illegal Immigration",
        "Asylum, Right of"
      ],
      "org_facet": [
        "Justice Department",
        "Citizenship and Immigration Services (US)"
      ],
      "per_facet": [
        "Sessions, Jefferson B III",
        "Trump, Donald J"
      ],
      "geo_facet": [
        "New York City"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/nyregion/08immigjudges/08immigjudges-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "George Chew, left, and Peggy McManus are part of an unusually large group of New York immigration judges who have retired over the last 15 months.",
          "copyright": "Kholood Eid for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/nyregion/08immigjudges/08immigjudges-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "George Chew, left, and Peggy McManus are part of an unusually large group of New York immigration judges who have retired over the last 15 months.",
          "copyright": "Kholood Eid for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/nyregion/08immigjudges/merlin_143350248_29ed32a3-f9ec-4141-962e-e9c72ab10506-articleInline.jpg",
          "format": "Normal",
          "height": 126,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "George Chew, left, and Peggy McManus are part of an unusually large group of New York immigration judges who have retired over the last 15 months.",
          "copyright": "Kholood Eid for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/nyregion/08immigjudges/08immigjudges-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "George Chew, left, and Peggy McManus are part of an unusually large group of New York immigration judges who have retired over the last 15 months.",
          "copyright": "Kholood Eid for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/nyregion/08immigjudges/merlin_143350248_29ed32a3-f9ec-4141-962e-e9c72ab10506-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1363,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "George Chew, left, and Peggy McManus are part of an unusually large group of New York immigration judges who have retired over the last 15 months.",
          "copyright": "Kholood Eid for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2M7Yhox"
    },
    {
      "section": "New York",
      "subsection": "",
      "title": "‘Potentially Dangerous Situation’ on Tappan Zee Delays Opening of New Cuomo Bridge Span",
      "abstract": "Gov. Andrew A. Cuomo said contractors on Friday discovered a damaged and rusted piece of the old bridge that could pose a threat to the new span.",
      "url": "https://www.nytimes.com/2018/09/08/nyregion/old-tappan-zee-bridge-collapse.html",
      "byline": "By MIHIR ZAVERI",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:46:26-04:00",
      "created_date": "2018-09-08T11:32:06-04:00",
      "published_date": "2018-09-08T11:32:06-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Bridges and Tunnels",
        "Mario M. Cuomo Bridge"
      ],
      "org_facet": [
        "New York State Thruway Authority"
      ],
      "per_facet": [
        "Cuomo, Andrew M"
      ],
      "geo_facet": [
        "Hudson River",
        "New York State",
        "Tappan Zee Bridge"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09xp-bridge-sub/09xp-bridge-sub-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "The first segment of the new Mario M. Cuomo Bridge was opened last year. The opening of the second was delayed over concerns that a piece of its predecessor, the Tappan Zee Bridge, far left, had become destabilized.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09xp-bridge-sub/09xp-bridge-sub-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "The first segment of the new Mario M. Cuomo Bridge was opened last year. The opening of the second was delayed over concerns that a piece of its predecessor, the Tappan Zee Bridge, far left, had become destabilized.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09xp-bridge-sub/merlin_143449437_12d109fe-3e0d-4687-a4b2-5fedb7f7e96a-articleInline.jpg",
          "format": "Normal",
          "height": 118,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "The first segment of the new Mario M. Cuomo Bridge was opened last year. The opening of the second was delayed over concerns that a piece of its predecessor, the Tappan Zee Bridge, far left, had become destabilized.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09xp-bridge-sub/09xp-bridge-sub-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "The first segment of the new Mario M. Cuomo Bridge was opened last year. The opening of the second was delayed over concerns that a piece of its predecessor, the Tappan Zee Bridge, far left, had become destabilized.",
          "copyright": "Chang W. Lee/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09xp-bridge-sub/merlin_143449437_12d109fe-3e0d-4687-a4b2-5fedb7f7e96a-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1273,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "The first segment of the new Mario M. Cuomo Bridge was opened last year. The opening of the second was delayed over concerns that a piece of its predecessor, the Tappan Zee Bridge, far left, had become destabilized.",
          "copyright": "Chang W. Lee/The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2NZEwkD"
    },
    {
      "section": "New York",
      "subsection": "",
      "title": "Cortlandt Street Station, Damaged on Sept. 11, Reopens 17 Years Later",
      "abstract": "Nearly 17 years after the Cortlandt Street subway stop was destroyed on Sept. 11, a new station is opening in Lower Manhattan.",
      "url": "https://www.nytimes.com/2018/09/08/nyregion/cortlandt-street-subway-station-911.html",
      "byline": "By EMMA G. FITZSIMMONS",
      "item_type": "Article",
      "updated_date": "2018-09-08T05:00:01-04:00",
      "created_date": "2018-09-08T05:00:01-04:00",
      "published_date": "2018-09-08T05:00:01-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Subways",
        "September 11 (2001)"
      ],
      "org_facet": [
        "Metropolitan Transportation Authority"
      ],
      "per_facet": [
        "Moss, Mitchell L"
      ],
      "geo_facet": [
        "Manhattan (NYC)"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09cortland-p1alt/09cortland-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Rubble covered the tracks inside the Cortlandt Street subway station under the World Trade Center following the collapse of the twin towers on Sept. 11, 2001.",
          "copyright": "New York City Transit"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09cortland-p1alt/09cortland-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Rubble covered the tracks inside the Cortlandt Street subway station under the World Trade Center following the collapse of the twin towers on Sept. 11, 2001.",
          "copyright": "New York City Transit"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09cortland-p1alt/09cortland-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Rubble covered the tracks inside the Cortlandt Street subway station under the World Trade Center following the collapse of the twin towers on Sept. 11, 2001.",
          "copyright": "New York City Transit"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09cortland-p1alt/09cortland-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Rubble covered the tracks inside the Cortlandt Street subway station under the World Trade Center following the collapse of the twin towers on Sept. 11, 2001.",
          "copyright": "New York City Transit"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09cortland-p1alt/09cortland-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1333,
          "width": 2000,
          "type": "image",
          "subtype": "photo",
          "caption": "Rubble covered the tracks inside the Cortlandt Street subway station under the World Trade Center following the collapse of the twin towers on Sept. 11, 2001.",
          "copyright": "New York City Transit"
        }
      ],
      "short_url": "https://nyti.ms/2NZdKJ0"
    },
    {
      "section": "Business Day",
      "subsection": "Economy",
      "title": "Harvard Is Vaulting Workers Into the Middle Class With High Pay. Can Anyone Else Follow Its Lead?",
      "abstract": "Students forced the university to shield campus workers from outsourcing’s impact on pay. But as a model, the policy challenges some economic axioms.",
      "url": "https://www.nytimes.com/2018/09/08/business/economy/harvard-living-wage.html",
      "byline": "By EDUARDO PORTER",
      "item_type": "Article",
      "updated_date": "2018-09-08T05:00:08-04:00",
      "created_date": "2018-09-08T05:00:08-04:00",
      "published_date": "2018-09-08T05:00:08-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Labor and Jobs",
        "Wages and Salaries",
        "Collective Bargaining",
        "Outsourcing",
        "Income Inequality",
        "Service Industries",
        "Employee Fringe Benefits",
        "Economics (Theory and Philosophy)"
      ],
      "org_facet": [
        "Harvard University"
      ],
      "per_facet": [
        "Summers, Lawrence H",
        "Katz, Lawrence F"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09pay1/merlin_143006796_91cb25d6-f349-40d5-a35a-3d55fd0302c5-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Martha Bonilla, 44, works in a kitchen. But a Harvard policy ensures that her hourly wage is more than $25. Most weeks, she clears over $1,500.",
          "copyright": "Kayana Szymczak for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09pay1/merlin_143006796_91cb25d6-f349-40d5-a35a-3d55fd0302c5-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Martha Bonilla, 44, works in a kitchen. But a Harvard policy ensures that her hourly wage is more than $25. Most weeks, she clears over $1,500.",
          "copyright": "Kayana Szymczak for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09pay1/merlin_143006796_91cb25d6-f349-40d5-a35a-3d55fd0302c5-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Martha Bonilla, 44, works in a kitchen. But a Harvard policy ensures that her hourly wage is more than $25. Most weeks, she clears over $1,500.",
          "copyright": "Kayana Szymczak for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09pay1/merlin_143006796_91cb25d6-f349-40d5-a35a-3d55fd0302c5-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Martha Bonilla, 44, works in a kitchen. But a Harvard policy ensures that her hourly wage is more than $25. Most weeks, she clears over $1,500.",
          "copyright": "Kayana Szymczak for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/business/09pay1/merlin_143006796_91cb25d6-f349-40d5-a35a-3d55fd0302c5-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Martha Bonilla, 44, works in a kitchen. But a Harvard policy ensures that her hourly wage is more than $25. Most weeks, she clears over $1,500.",
          "copyright": "Kayana Szymczak for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2NZci9R"
    },
    {
      "section": "U.S.",
      "subsection": "Politics",
      "title": "Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.",
      "abstract": "The Infowars founder and Trump backer is as much marketer as ideological warrior, selling products to assuage the fears he is so expert at stoking.",
      "url": "https://www.nytimes.com/2018/09/07/us/politics/alex-jones-business-infowars-conspiracy.html",
      "byline": "By ELIZABETH WILLIAMSON and EMILY STEEL",
      "item_type": "Article",
      "updated_date": "2018-09-08T09:17:23-04:00",
      "created_date": "2018-09-07T14:14:21-04:00",
      "published_date": "2018-09-07T14:14:21-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Rumors and Misinformation",
        "Censorship",
        "Fringe Groups and Movements",
        "Social Media",
        "Newtown, Conn, Shooting (2012)",
        "Freedom of Speech and Expression",
        "Discrimination"
      ],
      "org_facet": [
        "Infowars"
      ],
      "per_facet": [
        "Jones, Alex (1974- )"
      ],
      "geo_facet": [],
      "multimedia": [],
      "short_url": "https://nyti.ms/2Np87qx"
    },
    {
      "section": "World",
      "subsection": "Asia Pacific",
      "title": "India Hunts Man-Eating Tiger Blamed for 13 Deaths",
      "abstract": "In a way, India’s effort to protect tigers has become a victim of its own success. Their numbers are growing, and they’re coming into contact with people more often.",
      "url": "https://www.nytimes.com/2018/09/08/world/asia/india-tiger-hunt.html",
      "byline": "By JEFFREY GETTLEMAN and HARI KUMAR",
      "item_type": "Article",
      "updated_date": "2018-09-08T11:31:08-04:00",
      "created_date": "2018-09-08T06:50:17-04:00",
      "published_date": "2018-09-08T06:50:17-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Endangered and Extinct Species",
        "Tigers",
        "Conservation of Resources"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [
        "India"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/asia/09India-Tiger1/Tiger-slide-H0DD-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "A 10-month-old cub in a tiger reserve in the Indian state of Maharashtra. Tigers are emerging from their reserves onto roads and farmland, searching for territory, mates and prey.",
          "copyright": "Bryan Denton for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/asia/09India-Tiger1/Tiger-slide-H0DD-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "A 10-month-old cub in a tiger reserve in the Indian state of Maharashtra. Tigers are emerging from their reserves onto roads and farmland, searching for territory, mates and prey.",
          "copyright": "Bryan Denton for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/asia/09India-Tiger1/Tiger-slide-H0DD-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "A 10-month-old cub in a tiger reserve in the Indian state of Maharashtra. Tigers are emerging from their reserves onto roads and farmland, searching for territory, mates and prey.",
          "copyright": "Bryan Denton for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/asia/09India-Tiger1/09India-Tiger1-mediumThreeByTwo210-v2.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "A 10-month-old cub in a tiger reserve in the Indian state of Maharashtra. Tigers are emerging from their reserves onto roads and farmland, searching for territory, mates and prey.",
          "copyright": "Bryan Denton for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/world/asia/09India-Tiger1/Tiger-slide-H0DD-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "A 10-month-old cub in a tiger reserve in the Indian state of Maharashtra. Tigers are emerging from their reserves onto roads and farmland, searching for territory, mates and prey.",
          "copyright": "Bryan Denton for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2MYmHGk"
    },
    {
      "section": "Arts",
      "subsection": "Music",
      "title": "The Playlist: Thom Yorke’s Chilling Ballad, and 13 More New Songs",
      "abstract": "Hear tracks from Charles Bradley, Paul Simon, Yves Tumor, Dawn and others.",
      "url": "https://www.nytimes.com/2018/09/07/arts/music/playlist-thom-yorke-kanye-west-lil-pump-dua-lipa.html",
      "byline": "By JON PARELES, JON CARAMANICA and GIOVANNI RUSSONELLO",
      "item_type": "Article",
      "updated_date": "2018-09-07T17:46:16-04:00",
      "created_date": "2018-09-07T12:48:08-04:00",
      "published_date": "2018-09-07T12:48:08-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Pop and Rock Music",
        "Rap and Hip-Hop",
        "Jazz"
      ],
      "org_facet": [
        "Silk City (Music Group)"
      ],
      "per_facet": [
        "Bradley, Charles (1948- )",
        "Halvorson, Mary",
        "Hozier-Byrne, Andrew (Hozier)",
        "Lil Pump (Rapper)",
        "Lipa, Dua",
        "Pentz, Thomas (Diplo)",
        "Richard, Dawn (1983- )",
        "Ronson, Mark",
        "Simon, Paul",
        "Staples, Mavis",
        "West, Kanye",
        "Yorke, Thom"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/08/arts/08playlist/08playlist-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Radiohead’s Thom Yorke released the first song from his score for Luca Guadagnino’s remake of “Suspira.”",
          "copyright": "Greg Allen/Invision, via Greg Allen, via Invision, via Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/arts/08playlist/08playlist-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Radiohead’s Thom Yorke released the first song from his score for Luca Guadagnino’s remake of “Suspira.”",
          "copyright": "Greg Allen/Invision, via Greg Allen, via Invision, via Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/arts/08playlist/merlin_141076701_ab33bfea-f699-4b7b-984d-e07124a9f738-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Radiohead’s Thom Yorke released the first song from his score for Luca Guadagnino’s remake of “Suspira.”",
          "copyright": "Greg Allen/Invision, via Greg Allen, via Invision, via Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/arts/08playlist/merlin_141076701_ab33bfea-f699-4b7b-984d-e07124a9f738-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Radiohead’s Thom Yorke released the first song from his score for Luca Guadagnino’s remake of “Suspira.”",
          "copyright": "Greg Allen/Invision, via Greg Allen, via Invision, via Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/08/arts/08playlist/merlin_141076701_ab33bfea-f699-4b7b-984d-e07124a9f738-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Radiohead’s Thom Yorke released the first song from his score for Luca Guadagnino’s remake of “Suspira.”",
          "copyright": "Greg Allen/Invision, via Greg Allen, via Invision, via Associated Press"
        }
      ],
      "short_url": "https://nyti.ms/2NTvF3R"
    },
    {
      "section": "Well",
      "subsection": "Eat",
      "title": "The Case for a Breakfast Feast",
      "abstract": "A new review provides the latest evidence to suggest we should front-load our calories early in the day to jump-start our metabolisms and prevent obesity.",
      "url": "https://www.nytimes.com/2017/08/21/well/eat/the-case-for-a-breakfast-feast.html",
      "byline": "By RONI CARYN RABIN",
      "item_type": "Article",
      "updated_date": "2017-08-21T11:17:24-04:00",
      "created_date": "2017-08-21T11:17:28-04:00",
      "published_date": "2017-08-21T11:17:28-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Food",
        "Fasting",
        "Obesity",
        "Diet and Nutrition",
        "Weight",
        "Diabetes",
        "Insulin",
        "Biorhythms"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2017/08/22/science/22BREAKFAST/22BREAKFAST-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Natalya Balnova"
        },
        {
          "url": "https://static01.nyt.com/images/2017/08/22/science/22BREAKFAST/22BREAKFAST-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Natalya Balnova"
        },
        {
          "url": "https://static01.nyt.com/images/2017/08/22/science/22BREAKFAST/22BREAKFAST-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Natalya Balnova"
        },
        {
          "url": "https://static01.nyt.com/images/2017/08/22/science/22BREAKFAST/22BREAKFAST-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Natalya Balnova"
        },
        {
          "url": "https://static01.nyt.com/images/2017/08/22/science/22BREAKFAST/22BREAKFAST-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Natalya Balnova"
        }
      ],
      "short_url": "https://nyti.ms/2vhVX5R"
    },
    {
      "section": "Books",
      "subsection": "Book Review",
      "title": "11 New Books We Recommend This Week",
      "abstract": "Suggested reading from critics and editors at The New York Times.",
      "url": "https://www.nytimes.com/2018/09/06/books/review/11-new-books-we-recommend-this-week.html",
      "byline": "",
      "item_type": "Article",
      "updated_date": "2018-09-06T18:51:33-04:00",
      "created_date": "2018-09-06T18:01:14-04:00",
      "published_date": "2018-09-06T18:01:14-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Books and Literature"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/books/review/09ed-covers/09ed-covers-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/books/review/09ed-covers/09ed-covers-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/books/review/09ed-covers/09ed-covers-articleInline.jpg",
          "format": "Normal",
          "height": 94,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/books/review/09ed-covers/09ed-covers-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/books/review/09ed-covers/09ed-covers-superJumbo.jpg",
          "format": "superJumbo",
          "height": 408,
          "width": 828,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": ""
        }
      ],
      "short_url": "https://nyti.ms/2NSoWal"
    },
    {
      "section": "Smarter Living",
      "subsection": "",
      "title": "What to Do When Your Phone or Tablet Won’t Charge",
      "abstract": "If your phone just stops charging, even when it’s plugged in, it doesn’t mean it’s time to shop for a new one. Here are a few simple steps you can take before calling the pros or opening your wallet.",
      "url": "https://www.nytimes.com/2018/09/05/smarter-living/what-to-do-phone-tablet-wont-charge.html",
      "byline": "By WHITSON GORDON",
      "item_type": "Article",
      "updated_date": "2018-09-05T16:30:00-04:00",
      "created_date": "2018-09-05T16:30:00-04:00",
      "published_date": "2018-09-05T16:30:00-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Batteries",
        "Computers and the Internet"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/06/smarter-living/06sl_nocharge/06sl_nocharge-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Pablo Rochat"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/smarter-living/06sl_nocharge/06sl_nocharge-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Pablo Rochat"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/smarter-living/06sl_nocharge/06sl_nocharge-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Pablo Rochat"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/smarter-living/06sl_nocharge/06sl_nocharge-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Pablo Rochat"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/06/smarter-living/06sl_nocharge/06sl_nocharge-superJumbo-v2.gif",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Pablo Rochat"
        }
      ],
      "short_url": "https://nyti.ms/2MTc2wz"
    },
    {
      "section": "The Upshot",
      "subsection": "",
      "title": "Study Causes Splash, but Here’s Why You Should Stay Calm on Alcohol’s Risks",
      "abstract": "Harms increase with each additional drink per day, yet they are much smaller than many other risks in our lives.",
      "url": "https://www.nytimes.com/2018/08/28/upshot/alcohol-health-risks-study-worry.html",
      "byline": "By AARON E. CARROLL",
      "item_type": "Article",
      "updated_date": "2018-08-29T13:20:35-04:00",
      "created_date": "2018-08-28T05:00:02-04:00",
      "published_date": "2018-08-28T05:00:02-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Alcoholic Beverages",
        "Research",
        "Medicine and Health"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/08/29/upshot/29up-healthalcohol1/merlin_119299172_328952f3-c7da-49f4-a9e6-0b8f2af7940e-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Tony Cenicola/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/upshot/29up-healthalcohol1/merlin_119299172_328952f3-c7da-49f4-a9e6-0b8f2af7940e-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Tony Cenicola/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/upshot/29up-healthalcohol1/merlin_119299172_328952f3-c7da-49f4-a9e6-0b8f2af7940e-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Tony Cenicola/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/upshot/29up-healthalcohol1/29up-healthalcohol1-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Tony Cenicola/The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/29/upshot/29up-healthalcohol1/merlin_119299172_328952f3-c7da-49f4-a9e6-0b8f2af7940e-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1370,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Tony Cenicola/The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2ofKgvd"
    },
    {
      "section": "Theater",
      "subsection": "",
      "title": "It May Be Home, but It’s No Sanctuary",
      "abstract": "In the most promising plays opening this fall, the family drama opens its living room to an invasion of political anxieties.",
      "url": "https://www.nytimes.com/2018/09/07/theater/new-plays-politics.html",
      "byline": "By BEN BRANTLEY",
      "item_type": "Article",
      "updated_date": "2018-09-07T04:00:04-04:00",
      "created_date": "2018-09-07T04:00:04-04:00",
      "published_date": "2018-09-07T04:00:04-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Theater",
        "American Son (Play)",
        "Fireflies (Play)",
        "I Was Most Alive With You (Play)",
        "The Ferryman (Play)",
        "Wild Goose Dreams (Play)",
        "Eve's Song (Play)"
      ],
      "org_facet": [
        "Atlantic Theater Co",
        "Playwrights Horizons",
        "Public Theater"
      ],
      "per_facet": [
        "Ali, Saheem",
        "Bonney, Jo",
        "Butterworth, Jez",
        "Demos-Brown, Christopher",
        "Leon, Kenny",
        "Love, Donja R",
        "Lucas, Craig",
        "Silverman, Leigh",
        "Mendes, Sam",
        "Jung, Hansol",
        "Lloyd, Patricia Ione"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/08/16/arts/16season-brantley1/16season-brantley1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Paddy Considine and Genevieve O’Reilly as Quinn and Mary Carney, the parents of a large and boisterous brood, in “The Ferryman.”",
          "copyright": "Johan Persson"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/16/arts/16season-brantley1/16season-brantley1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Paddy Considine and Genevieve O’Reilly as Quinn and Mary Carney, the parents of a large and boisterous brood, in “The Ferryman.”",
          "copyright": "Johan Persson"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/16/arts/16season-brantley1/merlin_141376977_665b5142-f758-4533-b8d8-8bf012268c16-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Paddy Considine and Genevieve O’Reilly as Quinn and Mary Carney, the parents of a large and boisterous brood, in “The Ferryman.”",
          "copyright": "Johan Persson"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/16/arts/16season-brantley1/merlin_141376977_665b5142-f758-4533-b8d8-8bf012268c16-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Paddy Considine and Genevieve O’Reilly as Quinn and Mary Carney, the parents of a large and boisterous brood, in “The Ferryman.”",
          "copyright": "Johan Persson"
        },
        {
          "url": "https://static01.nyt.com/images/2018/08/16/arts/16season-brantley1/merlin_141376977_665b5142-f758-4533-b8d8-8bf012268c16-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Paddy Considine and Genevieve O’Reilly as Quinn and Mary Carney, the parents of a large and boisterous brood, in “The Ferryman.”",
          "copyright": "Johan Persson"
        }
      ],
      "short_url": "https://nyti.ms/2NUN2l3"
    },
    {
      "section": "Food",
      "subsection": "",
      "title": "Brilliant Recipes for the Busy",
      "abstract": "Welcome to our first official newsletter! We promise we’ll only send you the food we want to cook, and hope you’ll want to, too.",
      "url": "https://www.nytimes.com/2018/09/07/dining/brilliant-recipes-for-the-busy.html",
      "byline": "By EMILY WEINSTEIN",
      "item_type": "Article",
      "updated_date": "2018-09-07T11:08:19-04:00",
      "created_date": "2018-09-07T07:15:01-04:00",
      "published_date": "2018-09-07T07:15:01-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Cooking and Cookbooks",
        "Recipes"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/07/25/dining/25romanrex/25romanrex-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Michael Graydon &amp; Nikole Herriott for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/07/25/dining/25romanrex/25romanrex-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Michael Graydon &amp; Nikole Herriott for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/07/25/dining/25romanrex/merlin_139511823_c20b749f-9bee-410c-b159-3bb4d9071e20-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Michael Graydon &amp; Nikole Herriott for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/07/25/dining/25romanrex/merlin_139511823_c20b749f-9bee-410c-b159-3bb4d9071e20-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Michael Graydon &amp; Nikole Herriott for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/07/25/dining/25romanrex/merlin_139511823_c20b749f-9bee-410c-b159-3bb4d9071e20-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1366,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Michael Graydon &amp; Nikole Herriott for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2MY6uAU"
    },
    {
      "section": "New York",
      "subsection": "",
      "title": "Professor Roller Coaster",
      "abstract": "For Martin Lewison, life is one wild ride after another, and his affinity for roller coasters extends into his college classroom.",
      "url": "https://www.nytimes.com/2018/09/06/nyregion/professor-roller-coaster.html",
      "byline": "By COREY KILGANNON",
      "item_type": "Article",
      "updated_date": "2018-09-06T22:44:18-04:00",
      "created_date": "2018-09-06T12:39:11-04:00",
      "published_date": "2018-09-06T12:39:11-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Amusement and Theme Parks",
        "Roller Coasters"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [
        "Farmingdale (NY)"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09character/09character-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Martin Lewison said that he has ridden over 1,800 different roller coasters in more than 33 different countries over the last dozen years.",
          "copyright": "Johnny Milano for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09character/09character-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Martin Lewison said that he has ridden over 1,800 different roller coasters in more than 33 different countries over the last dozen years.",
          "copyright": "Johnny Milano for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09character/merlin_143317428_9f043848-8cb6-417d-9483-1a73c28d0ec3-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Martin Lewison said that he has ridden over 1,800 different roller coasters in more than 33 different countries over the last dozen years.",
          "copyright": "Johnny Milano for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09character/09character-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Martin Lewison said that he has ridden over 1,800 different roller coasters in more than 33 different countries over the last dozen years.",
          "copyright": "Johnny Milano for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/nyregion/09character/merlin_143317428_9f043848-8cb6-417d-9483-1a73c28d0ec3-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1367,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Martin Lewison said that he has ridden over 1,800 different roller coasters in more than 33 different countries over the last dozen years.",
          "copyright": "Johnny Milano for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2MW8Y2R"
    },
    {
      "section": "Business Day",
      "subsection": "",
      "title": "Jaguar’s Electric E-Type Marries ’60s Sex Appeal and Tomorrow’s Tech",
      "abstract": "Not content to merely revive E-Types to their former glory, Jaguar will retrofit them as fully electric machines, but it will be costly: $375,000 or more if you don’t supply the car.",
      "url": "https://www.nytimes.com/2018/09/06/business/jaguar-electric-e-type.html",
      "byline": "By JAMIE LINCOLN KITMAN",
      "item_type": "Article",
      "updated_date": "2018-09-06T16:09:21-04:00",
      "created_date": "2018-09-06T14:18:04-04:00",
      "published_date": "2018-09-06T14:18:04-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Automobiles",
        "Electric and Hybrid Vehicles",
        "High Net Worth Individuals",
        "Luxury Goods and Services"
      ],
      "org_facet": [
        "Jaguar Land Rover"
      ],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/07/business/07wheels-print-1/07wheels-1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Jaguar will make fully electric conversions of its classic E-Type available to new buyers or current owners who want to swap their gasoline powertrain for an electric version.",
          "copyright": "Jim McAuley for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/business/07wheels-print-1/07wheels-1-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Jaguar will make fully electric conversions of its classic E-Type available to new buyers or current owners who want to swap their gasoline powertrain for an electric version.",
          "copyright": "Jim McAuley for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/business/07wheels-print-1/07wheels-1-articleInline.jpg",
          "format": "Normal",
          "height": 131,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Jaguar will make fully electric conversions of its classic E-Type available to new buyers or current owners who want to swap their gasoline powertrain for an electric version.",
          "copyright": "Jim McAuley for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/business/07wheels-print-1/07wheels-1-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Jaguar will make fully electric conversions of its classic E-Type available to new buyers or current owners who want to swap their gasoline powertrain for an electric version.",
          "copyright": "Jim McAuley for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/07/business/07wheels-print-1/07wheels-1-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1408,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Jaguar will make fully electric conversions of its classic E-Type available to new buyers or current owners who want to swap their gasoline powertrain for an electric version.",
          "copyright": "Jim McAuley for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2MWm28p"
    },
    {
      "section": "Arts",
      "subsection": "Music",
      "title": "After Two Hit Operas, a Composer Takes on the Bleak Prairie",
      "abstract": "In “Proving Up,” Missy Mazzoli tries to meet the high expectations set by her seething adaptation of the film “Breaking the Waves.”",
      "url": "https://www.nytimes.com/2018/09/07/arts/music/missy-mazzoli-proving-up-opera.html",
      "byline": "By ZACHARY WOOLFE",
      "item_type": "Article",
      "updated_date": "2018-09-07T10:46:22-04:00",
      "created_date": "2018-09-07T06:00:11-04:00",
      "published_date": "2018-09-07T06:00:11-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Opera",
        "Proving Up (Opera)",
        "Breaking the Waves (Opera)",
        "Song From the Uproar (Opera)",
        "Swamplandia (Book)"
      ],
      "org_facet": [
        "Miller Theater at Columbia University",
        "International Contemporary Ensemble",
        "Opera Philadelphia"
      ],
      "per_facet": [
        "Mazzoli, Missy"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/09/arts/09MISSYCOMPOSER4web/09MISSYCOMPOSER4web-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "“I had the idea in 2008 or 2009, during the recession, to write an opera about the American dream,” says Missy Mazzoli, the composer of “Proving Up.”",
          "copyright": "Daniel Dorsa for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/arts/09MISSYCOMPOSER4web/09MISSYCOMPOSER4web-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "“I had the idea in 2008 or 2009, during the recession, to write an opera about the American dream,” says Missy Mazzoli, the composer of “Proving Up.”",
          "copyright": "Daniel Dorsa for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/arts/09MISSYCOMPOSER4web/merlin_143013168_0e6415a2-383f-450b-8af6-1c5a223f0a7c-articleInline.jpg",
          "format": "Normal",
          "height": 253,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "“I had the idea in 2008 or 2009, during the recession, to write an opera about the American dream,” says Missy Mazzoli, the composer of “Proving Up.”",
          "copyright": "Daniel Dorsa for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/arts/09MISSYCOMPOSER4web/09MISSYCOMPOSER4web-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "“I had the idea in 2008 or 2009, during the recession, to write an opera about the American dream,” says Missy Mazzoli, the composer of “Proving Up.”",
          "copyright": "Daniel Dorsa for The New York Times"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/09/arts/09MISSYCOMPOSER4web/merlin_143013168_0e6415a2-383f-450b-8af6-1c5a223f0a7c-superJumbo.jpg",
          "format": "superJumbo",
          "height": 2048,
          "width": 1536,
          "type": "image",
          "subtype": "photo",
          "caption": "“I had the idea in 2008 or 2009, during the recession, to write an opera about the American dream,” says Missy Mazzoli, the composer of “Proving Up.”",
          "copyright": "Daniel Dorsa for The New York Times"
        }
      ],
      "short_url": "https://nyti.ms/2O0bdi4"
    },
    {
      "section": "Well",
      "subsection": "Live",
      "title": "Preventing Muscle Loss as We Age",
      "abstract": "Sarcopenia, a decline in skeletal muscle in older people, contributes to loss of independence.",
      "url": "https://www.nytimes.com/2018/09/03/well/live/preventing-muscle-loss-among-the-elderly.html",
      "byline": "By JANE E. BRODY",
      "item_type": "Article",
      "updated_date": "2018-09-05T16:39:02-04:00",
      "created_date": "2018-09-03T05:00:01-04:00",
      "published_date": "2018-09-03T05:00:01-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Muscles",
        "Exercise",
        "Elderly",
        "Falls",
        "Physical Therapy",
        "Nursing Homes",
        "Diet and Nutrition"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/04/well/04brody/04brody-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Gracia Lam"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/04/well/04brody/04brody-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Gracia Lam"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/04/well/04brody/merlin_142891602_36cadd12-ac0b-47e2-b31d-25950f2e8984-articleInline.jpg",
          "format": "Normal",
          "height": 126,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Gracia Lam"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/04/well/04brody/04brody-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Gracia Lam"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/04/well/04brody/merlin_142891602_36cadd12-ac0b-47e2-b31d-25950f2e8984-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1302,
          "width": 1965,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Gracia Lam"
        }
      ],
      "short_url": "https://nyti.ms/2CdChJ8"
    },
    {
      "section": "World",
      "subsection": "Europe",
      "title": "Airport Security Trays Carry More Cold Germs Than Toilets, Study Finds",
      "abstract": "Scientists who tested surfaces at Helsinki Airport found the viruses responsible for colds and influenza on the trays used at security checkpoints.",
      "url": "https://www.nytimes.com/2018/09/05/world/europe/airport-security-trays-virus.html",
      "byline": "By PALKO KARASZ",
      "item_type": "Article",
      "updated_date": "2018-09-05T09:09:32-04:00",
      "created_date": "2018-09-05T08:49:39-04:00",
      "published_date": "2018-09-05T08:49:39-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Airports",
        "Hygiene and Cleanliness",
        "Viruses",
        "Colds",
        "Research",
        "Airport Security",
        "Microbiology"
      ],
      "org_facet": [
        "University of Nottingham"
      ],
      "per_facet": [],
      "geo_facet": [
        "Helsinki (Finland)"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/12/world/12REYBURN-CUL-INYT/06Airport-security-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Scientists working to prevent the spread of diseases through public transportation tested surfaces at Helsinki Airport, and found viral traces on half the security trays they looked at.",
          "copyright": "Wilfredo Lee/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/12/world/12REYBURN-CUL-INYT/06Airport-security-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "Scientists working to prevent the spread of diseases through public transportation tested surfaces at Helsinki Airport, and found viral traces on half the security trays they looked at.",
          "copyright": "Wilfredo Lee/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/12/world/12REYBURN-CUL-INYT/merlin_102769980_8e96618b-c411-4dc0-98da-001165134041-articleInline.jpg",
          "format": "Normal",
          "height": 131,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "Scientists working to prevent the spread of diseases through public transportation tested surfaces at Helsinki Airport, and found viral traces on half the security trays they looked at.",
          "copyright": "Wilfredo Lee/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/12/world/12REYBURN-CUL-INYT/06Airport-security-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "Scientists working to prevent the spread of diseases through public transportation tested surfaces at Helsinki Airport, and found viral traces on half the security trays they looked at.",
          "copyright": "Wilfredo Lee/Associated Press"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/12/world/12REYBURN-CUL-INYT/merlin_102769980_8e96618b-c411-4dc0-98da-001165134041-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1417,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "Scientists working to prevent the spread of diseases through public transportation tested surfaces at Helsinki Airport, and found viral traces on half the security trays they looked at.",
          "copyright": "Wilfredo Lee/Associated Press"
        }
      ],
      "short_url": "https://nyti.ms/2Cte41k"
    },
    {
      "section": "Science",
      "subsection": "",
      "title": "The Omnivorous Sharks That Eat Grass",
      "abstract": "Diminutive bonnethead sharks are the first omnivorous sharks known to science, which could change our understanding of what some sharks eat.",
      "url": "https://www.nytimes.com/2018/09/06/science/omnivorous-sharks-seagrass.html",
      "byline": "By VERONIQUE GREENWOOD",
      "item_type": "Article",
      "updated_date": "2018-09-07T13:36:18-04:00",
      "created_date": "2018-09-06T09:02:53-04:00",
      "published_date": "2018-09-06T09:02:53-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Sharks",
        "Flowers and Plants",
        "omnivores"
      ],
      "org_facet": [
        "Proceedings of the Royal Society B (Journal)"
      ],
      "per_facet": [],
      "geo_facet": [
        "Gulf of Mexico"
      ],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/11/science/07tb-sharks/07tb-sharks-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "A bonnethead shark in the shallows of Florida's Pine Island Sound.",
          "copyright": "Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/11/science/07tb-sharks/07tb-sharks-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "A bonnethead shark in the shallows of Florida's Pine Island Sound.",
          "copyright": "Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/11/science/07tb-sharks/07tb-sharks-articleInline.jpg",
          "format": "Normal",
          "height": 127,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "A bonnethead shark in the shallows of Florida's Pine Island Sound.",
          "copyright": "Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/11/science/07tb-sharks/07tb-sharks-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "A bonnethead shark in the shallows of Florida's Pine Island Sound.",
          "copyright": "Getty Images"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/11/science/07tb-sharks/07tb-sharks-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1365,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "A bonnethead shark in the shallows of Florida's Pine Island Sound.",
          "copyright": "Getty Images"
        }
      ],
      "short_url": "https://nyti.ms/2NnLjaP"
    },
    {
      "section": "Well",
      "subsection": "Live",
      "title": "The Menopausal Vagina Monologues",
      "abstract": "About half of menopausal women suffer from vaginal dryness and painful intercourse. Yet less than half of those women seek help.",
      "url": "https://www.nytimes.com/2018/09/03/well/live/menopause-sex-vagina-vaginal-dryness-pain-treatment-estrogen-hormones.html",
      "byline": "By RANDI HUTTER EPSTEIN, M.D.",
      "item_type": "Article",
      "updated_date": "2018-09-03T23:00:01-04:00",
      "created_date": "2018-09-03T23:00:01-04:00",
      "published_date": "2018-09-03T23:00:01-04:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Estrogen",
        "Menopause",
        "Hormones",
        "Women and Girls",
        "Vagina"
      ],
      "org_facet": [],
      "per_facet": [],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/09/03/well/family/well-fruitbowl/well-fruitbowl-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Juliette Borda"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/03/well/family/well-fruitbowl/well-fruitbowl-thumbLarge.jpg",
          "format": "thumbLarge",
          "height": 150,
          "width": 150,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Juliette Borda"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/03/well/family/well-fruitbowl/well-fruitbowl-articleInline.jpg",
          "format": "Normal",
          "height": 129,
          "width": 190,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Juliette Borda"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/03/well/family/well-fruitbowl/well-fruitbowl-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Juliette Borda"
        },
        {
          "url": "https://static01.nyt.com/images/2018/09/03/well/family/well-fruitbowl/well-fruitbowl-superJumbo.jpg",
          "format": "superJumbo",
          "height": 1387,
          "width": 2048,
          "type": "image",
          "subtype": "photo",
          "caption": "",
          "copyright": "Juliette Borda"
        }
      ],
      "short_url": "https://nyti.ms/2PC07Ab"
    }
  ]
}
end
