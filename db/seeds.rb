# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.where(name: "Finance",                  primary_color: 5789398).first_or_create   #5856D6
Category.where(name: "Science & Education",      primary_color: 31487).first_or_create     #007AFF
Category.where(name: "Technology",               primary_color: 3451612).first_or_create   #34AADC
Category.where(name: "Open data / source",       primary_color: 5949690).first_or_create   #5AC8FA
Category.where(name: "Travel & Transportation",  primary_color: 5036388).first_or_create   #4CD964
Category.where(name: "Fun & Entertainment",      primary_color: 16763904).first_or_create  #FFCC00
Category.where(name: "Health & Fitness",         primary_color: 16749824).first_or_create  #FF9500
Category.where(name: "Without Topic",            primary_color: 16726832).first_or_create  #FF3B30
Category.where(name: "Specific Interest",        primary_color: 16723285).first_or_create  #FF2D55
Category.where(name: "Unknown",                  primary_color: 9342611).first_or_create   #8E8E93

Sponsor.where(twitter_handle: "Adobe", twitter_image_url: "https://pbs.twimg.com/profile_images/618106877700739072/MewPPbPl.png", twitter_name: "Adobe", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Airbnb", twitter_image_url: "https://pbs.twimg.com/profile_images/616666619994112001/WrhqHnk2.jpg", twitter_name: "Airbnb", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Allianz", twitter_image_url: "https://pbs.twimg.com/profile_images/583522103896444928/VvziFieh.png", twitter_name: "Allianz", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "amazon", twitter_image_url: "https://pbs.twimg.com/profile_images/621575919430275072/KGPsQBx3.jpg", twitter_name: "Amazon", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "angellist", twitter_image_url: "https://pbs.twimg.com/profile_images/1825079270/icon_al_twitter_02__1_.png", twitter_name: "AngelList", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Audi", twitter_image_url: "https://pbs.twimg.com/profile_images/372278038/Rings_RGB_025_Audi.jpg", twitter_name: "Audi", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "autobild", twitter_image_url: "https://pbs.twimg.com/profile_images/82696229/Auto-Bild-Logo.jpg", twitter_name: "AUTO BILD", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "autodesk", twitter_image_url: "https://pbs.twimg.com/profile_images/613776059356459008/I_FhBDnm.jpg", twitter_name: "Autodesk", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "awscloud", twitter_image_url: "https://pbs.twimg.com/profile_images/2900345382/16ffae8c667bdbc6a4969f6f02090652.png", twitter_name: "Amazon Web Services", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "axel_springer", twitter_image_url: "https://pbs.twimg.com/profile_images/441537533780848640/n-FE0hJy.png", twitter_name: "Axel Springer SE", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "beatsbydre", twitter_image_url: "https://pbs.twimg.com/profile_images/618191194485493760/lkLpDifH.jpg", twitter_name: "Beats by Dre", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "BILD", twitter_image_url: "https://pbs.twimg.com/profile_images/581217823067885569/h57YmPKm.png", twitter_name: "BILD", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "bloomberg", twitter_image_url: "https://pbs.twimg.com/profile_images/615624605567287296/TrPA7XtD.png", twitter_name: "Bloomberg LP", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "BMW", twitter_image_url: "https://pbs.twimg.com/profile_images/458898945339432961/DejX49rF.jpeg", twitter_name: "BMW", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "BoschGlobal", twitter_image_url: "https://pbs.twimg.com/profile_images/1521890851/logo.jpg", twitter_name: "BoschGlobal", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "BoxHQ", twitter_image_url: "https://pbs.twimg.com/profile_images/615586063902355456/zzU2CKHn.png", twitter_name: "Box", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "burdahackday", twitter_image_url: "https://pbs.twimg.com/profile_images/527779622050463744/nNXLbstr.png", twitter_name: "Burda Hackday", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "BuzzFeed", twitter_image_url: "https://pbs.twimg.com/profile_images/615558459845513216/b5UsgLhc.png", twitter_name: "BuzzFeed", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Capgemini", twitter_image_url: "https://pbs.twimg.com/profile_images/466602416482164736/Qsnr1Ewr.jpeg", twitter_name: "Capgemini", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "CERN", twitter_image_url: "https://pbs.twimg.com/profile_images/464336727562141696/RPiEyveo.jpeg", twitter_name: "CERN", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "cisco", twitter_image_url: "https://pbs.twimg.com/profile_images/2957932606/540e0c9c2416478d78164c680086b087.png", twitter_name: "Cisco", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "CreditSuisse", twitter_image_url: "https://pbs.twimg.com/profile_images/459302791563857920/HPOUncG2.jpeg", twitter_name: "Credit Suisse", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Dell", twitter_image_url: "https://pbs.twimg.com/profile_images/378800000224971897/802aa3d0cd422af6e3922c364d2a410f.png", twitter_name: "Dell", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "DeutscheBank", twitter_image_url: "https://pbs.twimg.com/profile_images/472463469556416513/KlKUMZtb.jpeg", twitter_name: "Deutsche Bank", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "deutschetelekom", twitter_image_url: "https://pbs.twimg.com/profile_images/378800000533064974/7d8663cf1f29b30be10381174152bca2.png", twitter_name: "Deutsche Telekom", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "docker", twitter_image_url: "https://pbs.twimg.com/profile_images/378800000124779041/fbbb494a7eef5f9278c6967b6072ca3e.png", twitter_name: "Docker", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Dropbox", twitter_image_url: "https://pbs.twimg.com/profile_images/623296448063365121/p_kYW-Wo.png", twitter_name: "Dropbox", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "DStartups", twitter_image_url: "https://pbs.twimg.com/profile_images/378800000823754042/6c83007eefe2ab62c5da1214ad99ee27.jpeg", twitter_name: "deutsche-startups.de", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Elance", twitter_image_url: "https://pbs.twimg.com/profile_images/583397275067551745/x8M-uY8x.png", twitter_name: "Elance", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "EpsonAmerica", twitter_image_url: "https://pbs.twimg.com/profile_images/571483555998363648/f3Kg2VCl.jpeg", twitter_name: "Epson", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "ericsson", twitter_image_url: "https://pbs.twimg.com/profile_images/470810791164145665/tXiIGSh9.jpeg", twitter_name: "Ericsson", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "ethereumproject", twitter_image_url: "https://pbs.twimg.com/profile_images/626149701189042177/LWpxKEv3.png", twitter_name: "Ethereum", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Evernote", twitter_image_url: "https://pbs.twimg.com/profile_images/540211048209330177/LsTpX7ng.jpeg", twitter_name: "Evernote", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "EYnews", twitter_image_url: "https://pbs.twimg.com/profile_images/591172891120664576/9fB2CYUX.png", twitter_name: "EY", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "facebook", twitter_image_url: "https://pbs.twimg.com/profile_images/3513354941/24aaffa670e634a7da9a087bfa83abe6.png", twitter_name: "Facebook", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Finanzen100", twitter_image_url: "https://pbs.twimg.com/profile_images/555749074016546816/bGQ15DRE.png", twitter_name: "Finanzen100", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Fraunhofer", twitter_image_url: "https://pbs.twimg.com/profile_images/578538983602417665/OKEpeUFp.png", twitter_name: "Fraunhofer Institut", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "GettyImages", twitter_image_url: "https://pbs.twimg.com/profile_images/464799474947080192/Sf27OYfv.jpeg", twitter_name: "Getty Images", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Gini", twitter_image_url: "https://pbs.twimg.com/profile_images/378800000045586013/acdb1b0e708e52a6e0ce0be0ef8cc33c.png", twitter_name: "Gini", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "github", twitter_image_url: "https://pbs.twimg.com/profile_images/616309728688238592/pBeeJQDQ.png", twitter_name: "GitHub", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "GoldmanSachs", twitter_image_url: "https://pbs.twimg.com/profile_images/465954359583322112/mvHVOgH8.jpeg", twitter_name: "Goldman Sachs", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "google", twitter_image_url: "https://pbs.twimg.com/profile_images/522909800191901697/FHCGSQg0.png", twitter_name: "Google", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "gruenderszene", twitter_image_url: "https://pbs.twimg.com/profile_images/484605733606916097/x3FS5E4q.png", twitter_name: "GrÃ¼nderszene", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "HP", twitter_image_url: "https://pbs.twimg.com/profile_images/614447038319570944/h_z507OY.jpg", twitter_name: "HP", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "IBM", twitter_image_url: "https://pbs.twimg.com/profile_images/614802024832610304/_CZY2puL.jpg", twitter_name: "IBM", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "IBMBluemix", twitter_image_url: "https://pbs.twimg.com/profile_images/619232153524531200/dcJZ67oy.png", twitter_name: "IBM Bluemix", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "instagram", twitter_image_url: "https://pbs.twimg.com/profile_images/1550954462/instagramIcon.png", twitter_name: "Instagram", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Intel", twitter_image_url: "https://pbs.twimg.com/profile_images/580435922514214914/Q6pJp-ZW.png", twitter_name: "Intel", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "KPMG", twitter_image_url: "https://pbs.twimg.com/profile_images/1533087404/kpmg_global_twitter_logo.png", twitter_name: "KPMG", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "LeapMotion", twitter_image_url: "https://pbs.twimg.com/profile_images/623840109666955264/lGnl_m3H.png", twitter_name: "LeapMotion", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "LGUS", twitter_image_url: "https://pbs.twimg.com/profile_images/551071256615743488/xCPCV_pV.jpeg", twitter_name: "LG Electronics", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "lufthansa", twitter_image_url: "https://pbs.twimg.com/profile_images/600544217547599872/Zs-xdtrZ.png", twitter_name: "Lufthansa", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "mesosphere", twitter_image_url: "https://pbs.twimg.com/profile_images/605861926472544256/BbiLFf5O.png", twitter_name: "Mesosphere", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "microsoft", twitter_image_url: "https://pbs.twimg.com/profile_images/543484284716077057/EfWdfyI3.jpeg", twitter_name: "Microsoft", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "mimacom", twitter_image_url: "https://pbs.twimg.com/profile_images/1304168458/mimacom_rgb_twitter.png", twitter_name: "mimacom", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "N24", twitter_image_url: "https://pbs.twimg.com/profile_images/2455474765/oo5ltd4p48q2xo3svj04.png", twitter_name: "N24", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "namecheap", twitter_image_url: "https://pbs.twimg.com/profile_images/496317028408365060/sSwMqqsH.png", twitter_name: "Namecheap.com", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Nokia", twitter_image_url: "https://pbs.twimg.com/profile_images/598429372589170688/FHwprO-R.png", twitter_name: "Nokia", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "oculus", twitter_image_url: "https://pbs.twimg.com/profile_images/608286388828520449/azseHbND.png", twitter_name: "Oculus", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Oracle", twitter_image_url: "https://pbs.twimg.com/profile_images/535165913054445568/jT-HJYJg.png", twitter_name: "Oracle", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "OReillyMedia", twitter_image_url: "https://pbs.twimg.com/profile_images/465950147369639936/EMnyIlO2.png", twitter_name: "O'Reilly Media", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "otto_de", twitter_image_url: "https://pbs.twimg.com/profile_images/572316581649059840/kkLQ3q1X.png", twitter_name: "Otto (GmbH & Co KG)", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Parrot", twitter_image_url: "https://pbs.twimg.com/profile_images/623104366124355584/XNeqta2N.jpg", twitter_name: "Parrot", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "paypal", twitter_image_url: "https://pbs.twimg.com/profile_images/615564498410156032/voZWCZGc.jpg", twitter_name: "Paypal", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Pebble", twitter_image_url: "https://pbs.twimg.com/profile_images/615606738515918849/hUMjH3vZ.png", twitter_name: "Pebble", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "periscopeco", twitter_image_url: "https://pbs.twimg.com/profile_images/576529332580982785/pfta069p.png", twitter_name: "Periscope", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "PostFinance", twitter_image_url: "https://pbs.twimg.com/profile_images/2219946673/Profil_pic_180x180px_72dpi.png", twitter_name: "PostFinance", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "ProcterGamble", twitter_image_url: "https://pbs.twimg.com/profile_images/568037687160889344/kYrPoJnL.jpeg", twitter_name: "Procter Gamble", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "ProductHunt", twitter_image_url: "https://pbs.twimg.com/profile_images/621517137710940160/MM6VPRYC.png", twitter_name: "ProductHunt", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "ProSieben", twitter_image_url: "https://pbs.twimg.com/profile_images/563479641386930176/wezbbzpj.jpeg", twitter_name: "ProSieben", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "PubNub", twitter_image_url: "https://pbs.twimg.com/profile_images/615554231404134400/ooDJwFbr.png", twitter_name: "PubNub", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "PwC_LLP", twitter_image_url: "https://pbs.twimg.com/profile_images/1274288957/pwc_icon_twitter_128x128.gif", twitter_name: "PwC LLP", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Rackspace", twitter_image_url: "https://pbs.twimg.com/profile_images/2820164575/0226f9ef1173d90417e5113e25e0cc17.png", twitter_name: "Rackspace", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "relayr_cloud", twitter_image_url: "https://pbs.twimg.com/profile_images/502368384890048512/8FtHUcrZ.png", twitter_name: "relayr", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "salesforce", twitter_image_url: "https://pbs.twimg.com/profile_images/529742486948675584/lGZFUPOW.png", twitter_name: "Salesforce", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "samsung", twitter_image_url: "https://pbs.twimg.com/profile_images/3634463255/cae9abda4f05d4a0ae67bc07805d56cc.jpeg", twitter_name: "samsung", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "SAP", twitter_image_url: "https://pbs.twimg.com/profile_images/616595894410948608/81dhin-0.jpg", twitter_name: "SAP", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Scout24_DE", twitter_image_url: "https://pbs.twimg.com/profile_images/3722204037/d9c6094e6dd77b8aea990e7a25c82dbc.png", twitter_name: "Scout24", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "SendGrid", twitter_image_url: "https://pbs.twimg.com/profile_images/622068631644442624/9NFvUAYV.png", twitter_name: "SendGrid", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Shutterstock", twitter_image_url: "https://pbs.twimg.com/profile_images/528547133025042432/RC9k-6fp.png", twitter_name: "Shutterstock", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "SkyUK", twitter_image_url: "https://pbs.twimg.com/profile_images/576054176414715904/yT0Se2bS.png", twitter_name: "Sky", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "slackhq", twitter_image_url: "https://pbs.twimg.com/profile_images/378800000271328329/349dc6f270e53cbe09cd05f6c032fc67.png", twitter_name: "Slack", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Sony", twitter_image_url: "https://pbs.twimg.com/profile_images/418161175642128384/u24Glc4J.png", twitter_name: "Sony", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "SoundCloud", twitter_image_url: "https://pbs.twimg.com/profile_images/616214839669620740/cC1PH2Hg.png", twitter_name: "SoundCloud", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Spotify", twitter_image_url: "https://pbs.twimg.com/profile_images/618102621971202049/Q1hGL463.png", twitter_name: "Spotify", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "swisscom_de", twitter_image_url: "https://pbs.twimg.com/profile_images/466554229859946496/k-QW4MsM.png", twitter_name: "Swisscom AG", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "TamediaDigital", twitter_image_url: "https://pbs.twimg.com/profile_images/473441269641789440/ecOnDKug.png", twitter_name: "Tamedia Digital", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "TeslaMotors", twitter_image_url: "https://pbs.twimg.com/profile_images/489192650474414080/4RxZxsud.png", twitter_name: "Tesla", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "trivago", twitter_image_url: "https://pbs.twimg.com/profile_images/529931234562953216/tHMqGfsl.jpeg", twitter_name: "trivago", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "twilio", twitter_image_url: "https://pbs.twimg.com/profile_images/489167768579608576/oSy-fCEF.png", twitter_name: "twilio", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "twitter", twitter_image_url: "https://pbs.twimg.com/profile_images/615680132565504000/EIpgSD2K.png", twitter_name: "Twitter", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Uber", twitter_image_url: "https://pbs.twimg.com/profile_images/616424605218025472/qISsGgP9.png", twitter_name: "Uber", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "UBS", twitter_image_url: "https://pbs.twimg.com/profile_images/463961659552194560/GJz60zCa.jpeg", twitter_name: "UBS", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "VodafoneUK", twitter_image_url: "https://pbs.twimg.com/profile_images/1294419096/Twitter-800x800px.jpg", twitter_name: "Vodafone", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "volkswagen", twitter_image_url: "https://pbs.twimg.com/profile_images/607940250581770240/1K6lrBkV.jpg", twitter_name: "Volkswagen", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Wikimedia", twitter_image_url: "https://pbs.twimg.com/profile_images/378800000700562074/dab3a1414f622ce963bb91a24b3eea53.png", twitter_name: "Wikimedia", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Wunderlist", twitter_image_url: "https://pbs.twimg.com/profile_images/494884573428207616/BjPVVsRm.png", twitter_name: "Wunderlist", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Yahoo", twitter_image_url: "https://pbs.twimg.com/profile_images/615626753373945856/lCKj53DE.jpg", twitter_name: "Yahoo", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "YouTube", twitter_image_url: "https://pbs.twimg.com/profile_images/616266035423940608/lWPZNDw8.png", twitter_name: "YouTube", alt_name: "").first_or_create
Sponsor.where(twitter_handle: "Zalando", twitter_image_url: "https://pbs.twimg.com/profile_images/3112123462/ce7694ca8436ddea3980ac8e554b5eb9.png", twitter_name: "Zalando", alt_name: "").first_or_create


