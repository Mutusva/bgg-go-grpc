select "Creating bgg database" as "";

drop database if exists bgg;

create database bgg;

use bgg;

create table game (
	gid int primary key,
	name varchar(256) not null,
	year int not null,
	ranking int not null,
	users_rated int not null,
	url varchar(512),
	image varchar(512)
);

create table comment (
	c_id char(8) primary key,
	user varchar(64) not null,
	rating int,
	c_text text,
	gid int not null,

	constraint fk_gid foreign key (gid)
		references game(gid)
);

select "Inserting data into game table" as "";

insert into game(gid, name, year, ranking, users_rated, url, image) values
(174430, "Gloomhaven", 2017, 1, 24574, "https://www.boardgamegeek.com/boardgame/174430/gloomhaven", "https://cf.geekdo-images.com/micro/img/8JYMPXdcBg_UHddwzq64H4NBduY=/fit-in/64x64/pic2437871.jpg") 
,
(161936, "Pandemic Legacy: Season 1", 2015, 2, 30921, "https://www.boardgamegeek.com/boardgame/161936/pandemic-legacy-season-1", "https://cf.geekdo-images.com/micro/img/KbAKyhbG4qab4r-A_pBjUGvgal0=/fit-in/64x64/pic2452831.png") 
,
(182028, "Through the Ages: A New Story of Civilization", 2015, 3, 15551, "https://www.boardgamegeek.com/boardgame/182028/through-ages-new-story-civilization", "https://cf.geekdo-images.com/micro/img/APvZ_BYOt4ElpIXVl7i6wUp2BvM=/fit-in/64x64/pic2663291.jpg") 
,
(167791, "Terraforming Mars", 2016, 4, 38331, "https://www.boardgamegeek.com/boardgame/167791/terraforming-mars", "https://cf.geekdo-images.com/micro/img/71v8jF5vZFBqE64QJ7S3UYtDAng=/fit-in/64x64/pic3536616.jpg") 
,
(12333, "Twilight Struggle", 2005, 5, 34268, "https://www.boardgamegeek.com/boardgame/12333/twilight-struggle", "https://cf.geekdo-images.com/micro/img/uStZr7_8Tbthswp3sya1c2o1cs0=/fit-in/64x64/pic361592.jpg") 
,
(187645, "Star Wars: Rebellion", 2016, 6, 16474, "https://www.boardgamegeek.com/boardgame/187645/star-wars-rebellion", "https://cf.geekdo-images.com/micro/img/AgmwMDLQBFrLlV7aLvkjfWjzLIY=/fit-in/64x64/pic4325841.jpg") 
,
(220308, "Gaia Project", 2017, 7, 9104, "https://www.boardgamegeek.com/boardgame/220308/gaia-project", "https://cf.geekdo-images.com/micro/img/Ifks_R9_4ObVmyHgN2j9lks-_8M=/fit-in/64x64/pic3763556.jpg") 
,
(169786, "Scythe", 2016, 8, 39173, "https://www.boardgamegeek.com/boardgame/169786/scythe", "https://cf.geekdo-images.com/micro/img/Gqqd5c-C33zrLpoeb92cMxIF98s=/fit-in/64x64/pic3163924.jpg") 
,
(193738, "Great Western Trail", 2016, 9, 19000, "https://www.boardgamegeek.com/boardgame/193738/great-western-trail", "https://cf.geekdo-images.com/micro/img/NxP_qsKxBHNXSN11Zt75nv2oW_U=/fit-in/64x64/pic3113247.jpg") 
,
(233078, "Twilight Imperium (Fourth Edition)", 2017, 10, 6534, "https://www.boardgamegeek.com/boardgame/233078/twilight-imperium-fourth-edition", "https://cf.geekdo-images.com/micro/img/D_wkWC_xeBStqd2Y4xXuUrDYpso=/fit-in/64x64/pic3727516.jpg") 
,
(120677, "Terra Mystica", 2012, 11, 32471, "https://www.boardgamegeek.com/boardgame/120677/terra-mystica", "https://cf.geekdo-images.com/micro/img/0jr3gj1GDwfhwW97jEGHzgQJsz4=/fit-in/64x64/pic1356616.jpg") 
,
(115746, "War of the Ring (Second Edition)", 2012, 12, 9746, "https://www.boardgamegeek.com/boardgame/115746/war-ring-second-edition", "https://cf.geekdo-images.com/micro/img/U_mWJ-Rwf-VaZ9DRvJMb4TvV7hM=/fit-in/64x64/pic1215633.jpg") 
,
(84876, "The Castles of Burgundy", 2011, 13, 36476, "https://www.boardgamegeek.com/boardgame/84876/castles-burgundy", "https://cf.geekdo-images.com/micro/img/Qw22L5Wwe2q5BbvEct9dWws7MP4=/fit-in/64x64/pic1176894.jpg") 
,
(162886, "Spirit Island", 2017, 14, 10675, "https://www.boardgamegeek.com/boardgame/162886/spirit-island", "https://cf.geekdo-images.com/micro/img/Q5Pf_6hKlCXkfbha60l68FUpX_4=/fit-in/64x64/pic3615739.png") 
,
(224517, "Brass: Birmingham", 2018, 15, 5397, "https://www.boardgamegeek.com/boardgame/224517/brass-birmingham", "https://cf.geekdo-images.com/micro/img/9f34JRDD1AhxnD62n5aX0rIW_g0=/fit-in/64x64/pic3490053.jpg") 
,
(173346, "7 Wonders Duel", 2015, 16, 40305, "https://www.boardgamegeek.com/boardgame/173346/7-wonders-duel", "https://cf.geekdo-images.com/micro/img/Qbt8Cjwt_skp-UKi5bDGxYTg45w=/fit-in/64x64/pic3376065.jpg") 
,
(180263, "The 7th Continent", 2017, 17, 8841, "https://www.boardgamegeek.com/boardgame/180263/7th-continent", "https://cf.geekdo-images.com/micro/img/rHiQi_I26LD9shMiJH92q6VxcNY=/fit-in/64x64/pic2648303.jpg") 
,
(183394, "Viticulture Essential Edition", 2015, 18, 17334, "https://www.boardgamegeek.com/boardgame/183394/viticulture-essential-edition", "https://cf.geekdo-images.com/micro/img/L5giS2YYwyYZhAchWHSELlJ7U2U=/fit-in/64x64/pic2649952.jpg") 
,
(124361, "Concordia", 2013, 19, 19697, "https://www.boardgamegeek.com/boardgame/124361/concordia", "https://cf.geekdo-images.com/micro/img/-o5nMvz9MGbYVnDDGh1_Xq7P84w=/fit-in/64x64/pic3453267.jpg") 
,
(205637, "Arkham Horror: The Card Game", 2016, 20, 17266, "https://www.boardgamegeek.com/boardgame/205637/arkham-horror-card-game", "https://cf.geekdo-images.com/micro/img/PDfjVra2DLzQpFj7dnATf81lSik=/fit-in/64x64/pic3122349.jpg") 
,
(3076, "Puerto Rico", 2002, 21, 56238, "https://www.boardgamegeek.com/boardgame/3076/puerto-rico", "https://cf.geekdo-images.com/micro/img/ti5gCF_R-aSfg3uzg31b3lMUP9A=/fit-in/64x64/pic158548.jpg") 
,
(28720, "Brass: Lancashire", 2007, 22, 14931, "https://www.boardgamegeek.com/boardgame/28720/brass-lancashire", "https://cf.geekdo-images.com/micro/img/a-g2zj9lYhcXPnh0Ebq3QFwMRU0=/fit-in/64x64/pic3469216.jpg") 
,
(102794, "Caverna: The Cave Farmers", 2013, 23, 23540, "https://www.boardgamegeek.com/boardgame/102794/caverna-cave-farmers", "https://cf.geekdo-images.com/micro/img/xrKeGLQ8OhvUiaZ2ctC4829RQzs=/fit-in/64x64/pic1790789.jpg") 
,
(96848, "Mage Knight Board Game", 2011, 24, 23403, "https://www.boardgamegeek.com/boardgame/96848/mage-knight-board-game", "https://cf.geekdo-images.com/micro/img/6jDMTog_WxQPbEqRCyj6KtpIQ3w=/fit-in/64x64/pic1083380.jpg") 
,
(31260, "Agricola", 2007, 25, 56793, "https://www.boardgamegeek.com/boardgame/31260/agricola", "https://cf.geekdo-images.com/micro/img/Snnyt1cOfe1N0_KKyMBHSpd6Xms=/fit-in/64x64/pic259085.jpg") 
,
(205059, "Mansions of Madness: Second Edition", 2016, 26, 16398, "https://www.boardgamegeek.com/boardgame/205059/mansions-madness-second-edition", "https://cf.geekdo-images.com/micro/img/_CpxsrtrFi4YLVvlgHkQG4OkU2I=/fit-in/64x64/pic3118622.jpg") 
,
(164928, "Orléans", 2014, 27, 15768, "https://www.boardgamegeek.com/boardgame/164928/orleans", "https://cf.geekdo-images.com/micro/img/EFMKhgiJOEON4d5NLvLDLnS2VyY=/fit-in/64x64/pic2578828.png") 
,
(177736, "A Feast for Odin", 2016, 28, 11040, "https://www.boardgamegeek.com/boardgame/177736/feast-odin", "https://cf.geekdo-images.com/micro/img/1V5da2Inidd8GOONuNsjDxj6Epw=/fit-in/64x64/pic3146943.png") 
,
(175914, "Food Chain Magnate", 2015, 29, 9579, "https://www.boardgamegeek.com/boardgame/175914/food-chain-magnate", "https://cf.geekdo-images.com/micro/img/CCu3tT9vVgKLM2AdF-CC-Vie9e8=/fit-in/64x64/pic2649434.png") 
,
(170216, "Blood Rage", 2015, 30, 25382, "https://www.boardgamegeek.com/boardgame/170216/blood-rage", "https://cf.geekdo-images.com/micro/img/P2Hw9b5BDQNLRtNcqgr1zNYW-cw=/fit-in/64x64/pic2439223.jpg") 
,
(209010, "Mechs vs. Minions", 2016, 31, 11076, "https://www.boardgamegeek.com/boardgame/209010/mechs-vs-minions", "https://cf.geekdo-images.com/micro/img/PluLJId7M-9urByCb_VMyuiIh8o=/fit-in/64x64/pic3184103.jpg") 
,
(55690, "Kingdom Death: Monster", 2015, 32, 5806, "https://www.boardgamegeek.com/boardgame/55690/kingdom-death-monster", "https://cf.geekdo-images.com/micro/img/0LbC6Oka8Lv0FZ0DQflCPLhJzNw=/fit-in/64x64/pic2931007.jpg") 
,
(221107, "Pandemic Legacy: Season 2", 2017, 33, 7101, "https://www.boardgamegeek.com/boardgame/221107/pandemic-legacy-season-2", "https://cf.geekdo-images.com/micro/img/1ET3ss7uiX8VumffL32Z76YWgx8=/fit-in/64x64/pic3763549.jpg") 
,
(164153, "Star Wars: Imperial Assault", 2014, 34, 16491, "https://www.boardgamegeek.com/boardgame/164153/star-wars-imperial-assault", "https://cf.geekdo-images.com/micro/img/63Sh2j1jrcw1Igy5AkZdL8CAGD4=/fit-in/64x64/pic2247647.jpg") 
,
(2651, "Power Grid", 2004, 35, 49762, "https://www.boardgamegeek.com/boardgame/2651/power-grid", "https://cf.geekdo-images.com/micro/img/DKm2IiurnYUTVIf1QpIB5KtYO50=/fit-in/64x64/pic4459753.jpg") 
;