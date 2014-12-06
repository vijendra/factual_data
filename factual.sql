--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: places; Type: TABLE; Schema: public; Owner: pc; Tablespace: 
--

CREATE TABLE places (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    address_extended character varying(255),
    po_box character varying(255),
    locality character varying(255),
    region character varying(255),
    postcode character varying(255),
    website character varying(255),
    country character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    factual_id character varying(255),
    tel character varying(255),
    fax character varying(255),
    email character varying(255),
    chain_id character varying(255),
    chain_name character varying(255),
    neighborhood character varying(255)[] DEFAULT '{}'::character varying[],
    admin_region character varying(255),
    category_ids character varying(255)[] DEFAULT '{}'::character varying[],
    category_labels character varying(255)[] DEFAULT '{}'::character varying[],
    hours hstore,
    hours_display text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.places OWNER TO pc;

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: pc
--

CREATE SEQUENCE places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.places_id_seq OWNER TO pc;

--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pc
--

ALTER SEQUENCE places_id_seq OWNED BY places.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: pc; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO pc;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pc
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: pc
--

COPY places (id, name, address, address_extended, po_box, locality, region, postcode, website, country, latitude, longitude, factual_id, tel, fax, email, chain_id, chain_name, neighborhood, admin_region, category_ids, category_labels, hours, hours_display, created_at, updated_at) FROM stdin;
1	''The Texas''	Bldg Grant Park	\N	\N	Atlanta	GA	30315	\N	us	33.733903	-84.370913	ca5e936c-6fea-4147-a4fc-efe3c33e5e1e	\N	\N	\N	\N	\N	{"Boulevard Heights","Grant Park"}	\N	{110}	{{Landmarks,"Historic and Protected Sites"}}	\N	\N	2014-11-30 14:32:14.846472	2014-11-30 14:32:14.846472
2	(IM) Interactive Marketing	235 Peachtree St NE	Ste 400Z	\N	Atlanta	GA	30303	http://www.interactivemarketing.net	us	33.760556	-84.387579	f5ed1f34-64e1-4ee0-a1ab-cb1706e82289	(678) 820-6604	\N	sem@interactivemarketing.net	\N	\N	{Downtown}	\N	{306}	{{"Businesses and Services",Technology,"Web Design and Development"}}	"friday"=>"[[\\"8:00\\", \\"18:00\\"]]", "monday"=>"[[\\"8:00\\", \\"18:00\\"]]", "tuesday"=>"[[\\"8:00\\", \\"18:00\\"]]", "thursday"=>"[[\\"8:00\\", \\"18:00\\"]]", "wednesday"=>"[[\\"8:00\\", \\"18:00\\"]]"	Mon-Fri 8:00 AM-6:00 PM	2014-11-30 14:32:14.881343	2014-11-30 14:32:14.881343
3	1 11 Dui School	5143 Old National Hwy	\N	\N	Atlanta	GA	30349	http://111duischool.com	us	33.614942	-84.472742	757fb3e1-b09a-435c-aaf5-110ffc01c5de	(404) 669-0231	\N	\N	\N	\N	{}	\N	{35}	{{"Community and Government",Education,"Tutoring and Educational Services"}}	\N	\N	2014-11-30 14:32:14.90313	2014-11-30 14:32:14.90313
4	1 2 Restaurant	5110 Old National Hwy	\N	\N	Atlanta	GA	30349	\N	us	33.615982	-84.472252	caa7bcb1-2d15-4a3a-b4ec-f1ec5d90d815	(678) 974-8112	\N	\N	\N	\N	{}	\N	{347}	{{Social,"Food and Dining",Restaurants}}	\N	\N	2014-11-30 14:32:14.92491	2014-11-30 14:32:14.92491
5	1 866 U Moving	3593 Clearview Pkwy	\N	\N	Atlanta	GA	30340	\N	us	33.898902	-84.270874	410e2f7a-558b-4c1b-8ef0-72c5ea452094	(866) 866-8464	\N	\N	\N	\N	{Briarcliff}	\N	{}	{}	\N	\N	2014-11-30 14:32:14.935636	2014-11-30 14:32:14.935636
6	1 ACT DUI and DEFENSIVE DRIVING	325 Hammond Dr	\N	\N	Atlanta	GA	30328	\N	us	33.918582	-84.376227	86f9f8e9-9df1-4eb4-b3d4-fca0deab3316	(678) 973-0200	\N	\N	\N	\N	{Downtown}	\N	{32}	{{"Community and Government",Education,"Driving Schools"}}	\N	\N	2014-11-30 14:32:14.946238	2014-11-30 14:32:14.946238
7	1 Addison Heating and Air	1010 N Virginia Ave NE	\N	\N	Atlanta	GA	30306	\N	us	33.781974	-84.349682	006ea668-8ac3-401d-bab7-76599c9c282c	(678) 341-5663	\N	\N	\N	\N	{"Virginia Highland",Northeast}	\N	{247}	{{"Businesses and Services","Home Improvement","Heating, Ventilating and Air Conditioning"}}	\N	\N	2014-11-30 14:32:14.957927	2014-11-30 14:32:14.957927
8	1 Dollar Max	5544 Peachtree Industrial Blvd	\N	\N	Atlanta	GA	30341	\N	us	33.89479	-84.296646	bd5c3c98-34ca-4907-ab20-ef39d2a3b5d7	(678) 530-0333	\N	\N	\N	\N	{}	\N	{442}	{{Retail,"Discount Stores"}}	\N	\N	2014-11-30 14:32:14.968296	2014-11-30 14:32:14.968296
9	1 Force	5887 Glenridge Dr	\N	\N	Atlanta	GA	30328	http://www.1forcegov.com/	us	33.917026	-84.362662	309870a0-53c2-460e-99a9-901078951572	(678) 974-8243	\N	careers@1force.com	\N	\N	{}	\N	{188}	{{"Businesses and Services","Security and Safety"}}	\N	\N	2014-11-30 14:32:14.978948	2014-11-30 14:32:14.978948
10	1 Man 1 Army	2701 Crest Ridge Dr	\N	\N	Atlanta	GA	30344	http://www.1man1army.com/	us	33.66232	-84.500858	186cf150-db88-4ae1-ad74-4a2435184a73	(404) 543-1624	\N	t-one@1man1army.com	\N	\N	{}	\N	{}	{}	\N	\N	2014-11-30 14:32:14.989505	2014-11-30 14:32:14.989505
11	1 Nails	925 Garrett St SE	\N	\N	Atlanta	GA	30316	http://www.no1nailsatlanta.com	us	33.740546	-84.357956	8623ff20-8011-4199-8f28-99fc9d1003d8	(678) 705-8312	\N	\N	\N	\N	{"Ormewood Park",Eastside,Reynoldstown,Brownwood,Ormewood}	\N	{281}	{{"Businesses and Services","Personal Care","Manicures and Pedicures"}}	"friday"=>"[[\\"9:00\\", \\"19:00\\"]]", "monday"=>"[[\\"10:00\\", \\"11:00\\"], [\\"14:00\\", \\"18:00\\"]]", "sunday"=>"[[\\"10:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"17:00\\", \\"18:00\\"]]", "saturday"=>"[[\\"9:00\\", \\"18:00\\"]]", "thursday"=>"[[\\"12:00\\", \\"13:00\\"], [\\"16:00\\", \\"19:00\\"]]", "wednesday"=>"[[\\"16:00\\", \\"19:00\\"]]"	Mon 10:00 AM-11:00 AM, 2:00 PM-6:00 PM; Tue 5:00 PM-6:00 PM; Wed 4:00 PM-7:00 PM; Thu 12:00 PM-1:00 PM, 4:00 PM-7:00 PM; Fri 9:00 AM-7:00 PM; Sat 9:00 AM-6:00 PM; Sun 10:00 AM-5:00 PM	2014-11-30 14:32:15.002836	2014-11-30 14:32:15.002836
12	1 Stop Cd Rplication	1579 Monroe Dr NE	\N	\N	Atlanta	GA	30324	http://onestopmediashop.com	us	33.797481	-84.369096	8f8d6e67-4e4b-4e80-add9-40c892250880	(404) 921-0161	\N	\N	\N	\N	{"Piedmont Heights",Morningside}	\N	{}	{}	\N	\N	2014-11-30 14:32:15.024674	2014-11-30 14:32:15.024674
13	1 Stop General Insurance Agency	3045 Washington Rd	\N	\N	Atlanta	GA	30344	\N	us	33.672541	-84.457385	0e094209-0db7-4860-a9c8-13bfd15d36fc	(404) 766-1234	\N	\N	\N	\N	{}	\N	{272}	{{"Businesses and Services",Insurance}}	\N	\N	2014-11-30 14:32:15.035579	2014-11-30 14:32:15.035579
14	1 Stop Granite	4600 Frederick Dr SW	Ste F	\N	Atlanta	GA	30336	http://www.lstopgranite.com	us	33.766338	-84.537714	657fb88a-89a7-4cb5-9aee-eb3720ed9771	(404) 472-3525	\N	\N	\N	\N	{}	\N	{239}	{{"Businesses and Services","Home Improvement",Contractors}}	\N	\N	2014-11-30 14:32:15.045996	2014-11-30 14:32:15.045996
15	1 Tenant, Finders - South Oaks Management	3595F Cascade Rd SW	Ste 2286	\N	Atlanta	GA	30331	http://www.southoaksproperties.com	us	33.723152	-84.505651	072cdd64-88a8-428b-ab16-4d26b17d0891	(678) 418-1870	(866) 595-7582	southoaksmanagement@yahoo.com	\N	\N	{"Southwest Atlanta"}	\N	{291}	{{"Businesses and Services","Real Estate"}}	"friday"=>"[[\\"9:00\\", \\"17:00\\"]]", "monday"=>"[[\\"9:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"9:00\\", \\"17:00\\"]]", "saturday"=>"[[\\"12:00\\", \\"17:00\\"]]", "thursday"=>"[[\\"9:00\\", \\"17:00\\"]]", "wednesday"=>"[[\\"9:00\\", \\"17:00\\"]]"	Mon-Fri 9:00 AM-5:00 PM; Sat 12:00 PM-5:00 PM	2014-11-30 14:32:15.056507	2014-11-30 14:32:15.056507
16	1 True Talent	165 N River Dr	\N	\N	Atlanta	GA	30350	\N	us	33.99513	-84.346336	e23d2bee-1414-41e3-b19f-9193b2404f0d	(404) 993-0789	\N	\N	\N	\N	{}	\N	{214}	{{"Businesses and Services",Entertainment}}	\N	\N	2014-11-30 14:32:15.068571	2014-11-30 14:32:15.068571
17	1-800-Flowers	3450 Riverwood Pkwy SE	\N	\N	Atlanta	GA	30339	http://www.1800flowers.com/	us	33.879201	-84.458299	39eda1a8-63b2-403f-864a-745d08f19c0e	(770) 952-7524	\N	\N	\N	\N	{Cumberland}	\N	{148}	{{Retail,Florists}}	\N	\N	2014-11-30 14:32:15.079709	2014-11-30 14:32:15.079709
18	1-800-Flowers	120 Interstate North Pkwy SE	Ste 300	\N	Atlanta	GA	30339	\N	us	33.898596	-84.467847	5a9acce4-bf30-4eaa-90fc-b558a4a818a2	(770) 988-0755	\N	\N	\N	\N	{Farmstead}	\N	{148}	{{Retail,Florists}}	"friday"=>"[[\\"8:00\\", \\"16:30\\"]]", "monday"=>"[[\\"8:00\\", \\"16:30\\"]]", "sunday"=>"[[\\"8:00\\", \\"12:00\\"]]", "tuesday"=>"[[\\"8:00\\", \\"16:30\\"]]", "saturday"=>"[[\\"8:00\\", \\"14:00\\"]]", "thursday"=>"[[\\"8:00\\", \\"16:30\\"]]", "wednesday"=>"[[\\"8:00\\", \\"16:30\\"]]"	Mon-Fri 8:00 AM-4:30 PM; Sat 8:00 AM-2:00 PM; Sun 8:00 AM-12:00 PM	2014-11-30 14:32:15.090803	2014-11-30 14:32:15.090803
47	11th St Men's Consignment	674 11th St NW	\N	\N	Atlanta	GA	30318	\N	us	33.7829	-84.409234	b30449be-3e86-47ee-a7fb-e3ab9d332312	(678) 733-8908	\N	gturnips@cs.com	\N	\N	{"Home Park","Northeast Atlanta",Bellwood,Midtown}	\N	{143}	{{Retail,Fashion,"Clothing and Accessories"}}	"friday"=>"[[\\"11:00\\", \\"19:00\\"]]", "sunday"=>"[[\\"11:00\\", \\"15:00\\"]]", "saturday"=>"[[\\"11:00\\", \\"19:00\\"]]", "thursday"=>"[[\\"11:00\\", \\"19:00\\"]]", "wednesday"=>"[[\\"11:00\\", \\"19:00\\"]]"	Wed-Sat 11:00 AM-7:00 PM; Sun 11:00 AM-3:00 PM	2014-11-30 14:32:15.510188	2014-11-30 14:32:15.510188
19	1-800-Got-Junk	2259 Lawson Way	\N	\N	Atlanta	GA	30341	http://www.1800gotjunk.com/us_en/locations/junk-removal-atlanta/?utm_source=yahoo&utm_medium=organic&utm_campaign=localmaps	us	33.90182	-84.297602	a138f834-0844-4801-b9b9-33b431b65fee	(678) 530-0495	(678) 530-0496	rob.harris@1800gotjunk.com	\N	\N	{}	\N	{191}	{{"Businesses and Services","Water and Waste Management"}}	"friday"=>"[[\\"8:00\\", \\"17:30\\"]]", "monday"=>"[[\\"8:00\\", \\"17:30\\"]]", "tuesday"=>"[[\\"8:00\\", \\"17:30\\"]]", "saturday"=>"[[\\"8:00\\", \\"17:30\\"]]", "thursday"=>"[[\\"8:00\\", \\"17:30\\"]]", "wednesday"=>"[[\\"8:00\\", \\"17:30\\"]]"	Mon-Sat 8:00 AM-5:30 PM	2014-11-30 14:32:15.101673	2014-11-30 14:32:15.101673
20	1-800-Got-Junk	1457 Carroll Dr NW	\N	\N	Atlanta	GA	30318	http://www.1800gotjunk.com/us_en/locations/junk-removal-atlanta/	us	33.802177	-84.435533	3f4905ff-165b-4f54-8704-4d327c8045cb	(404) 367-5500	(404) 367-8600	atlantanw@1800gotjunk.com	\N	\N	{Northside,"Westover Plantation","Underwood Hills","Hills Park"}	\N	{191}	{{"Businesses and Services","Water and Waste Management"}}	"friday"=>"[[\\"8:00\\", \\"17:00\\"]]", "monday"=>"[[\\"8:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"8:00\\", \\"17:00\\"]]", "saturday"=>"[[\\"8:00\\", \\"17:00\\"]]", "thursday"=>"[[\\"8:00\\", \\"17:00\\"]]", "wednesday"=>"[[\\"8:00\\", \\"17:00\\"]]"	Mon-Sat 8:00 AM-5:00 PM	2014-11-30 14:32:15.111424	2014-11-30 14:32:15.111424
21	1-800-Radiator	2080 Peachtree Industrial Ct	\N	\N	Atlanta	GA	30341	\N	us	33.89949	-84.2986	a2547639-294f-4044-b7c7-c46ed3898d7b	(770) 936-8195	\N	\N	\N	\N	{}	\N	{}	{}	\N	\N	2014-11-30 14:32:15.122218	2014-11-30 14:32:15.122218
22	1-800-Radiator Franchise	256 Memorial Dr SW	\N	\N	Atlanta	GA	30303	http://www.radiator.com	us	33.746989	-84.396073	2087c9b6-0703-44d5-bb23-8cc0220c6d1c	(404) 688-6568	\N	\N	\N	\N	{"Castleberry Hill",Downtown}	\N	{6}	{{Automotive,"Car Parts and Accessories"}}	"friday"=>"[[\\"9:00\\", \\"17:00\\"]]", "monday"=>"[[\\"9:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"9:00\\", \\"17:00\\"]]", "thursday"=>"[[\\"9:00\\", \\"17:00\\"]]", "wednesday"=>"[[\\"9:00\\", \\"17:00\\"]]"	Mon-Fri 9:00 AM-5:00 PM	2014-11-30 14:32:15.134291	2014-11-30 14:32:15.134291
23	1-800-Tv-Crews	2135 Defoor Hills Rd NW	\N	\N	Atlanta	GA	30318	http://www.tvcrews.com/	us	33.813901	-84.432462	1a90c20f-4599-41d1-8e45-5f765698680f	(404) 351-8898	\N	james@tvcrews.com	\N	\N	{"Underwood Hills","Northwest Atlanta","Westover Plantation"}	\N	{215}	{{"Businesses and Services",Entertainment,Media}}	"friday"=>"[[\\"8:00\\", \\"17:00\\"]]", "monday"=>"[[\\"8:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"8:00\\", \\"17:00\\"]]", "thursday"=>"[[\\"8:00\\", \\"17:00\\"]]", "wednesday"=>"[[\\"8:00\\", \\"17:00\\"]]"	Mon-Fri 8:00 AM-5:00 PM	2014-11-30 14:32:15.144625	2014-11-30 14:32:15.144625
24	1-800Courier	1450 W Peachtree St NW	Ste 200	\N	Atlanta	GA	30309	http://www.1-800courier.com	us	33.794224	-84.388214	05ccc757-0e86-4c63-9013-dadcd8abd7dd	(800) 268-7437	\N	mark@1-800courier.com	\N	\N	{Brookwood,Midtown}	\N	{177}	{{"Businesses and Services"}}	"friday"=>"[[\\"8:00\\", \\"17:00\\"]]", "monday"=>"[[\\"8:00\\", \\"17:00\\"]]", "sunday"=>"[[\\"8:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"8:00\\", \\"17:00\\"]]", "saturday"=>"[[\\"8:00\\", \\"17:00\\"]]", "thursday"=>"[[\\"8:00\\", \\"17:00\\"]]", "wednesday"=>"[[\\"8:00\\", \\"17:00\\"]]"	Open Daily 8:00 AM-5:00 PM	2014-11-30 14:32:15.156742	2014-11-30 14:32:15.156742
25	10 10 Horology	9 Dunwoody Park	\N	\N	Atlanta	GA	30338	\N	us	33.92436	-84.313755	e2101adb-482a-4464-9ff1-0270e54c29e2	(770) 393-3332	\N	\N	\N	\N	{}	\N	{144}	{{Retail,Fashion,"Jewelry and Watches"}}	\N	\N	2014-11-30 14:32:15.227162	2014-11-30 14:32:15.227162
26	10 Degrees South	4183 Roswell Rd NE	\N	\N	Atlanta	GA	30342	http://www.10degreessouth.com	us	33.868894	-84.380801	08df0fff-9a8b-4285-8d99-bf34ce77c813	(404) 705-8870	\N	info@10degreessouth.com	\N	\N	{Buckhead,Northside,"North Buckhead","East Chastain Park",Highpoint}	\N	{347}	{{Social,"Food and Dining",Restaurants}}	"friday"=>"[[\\"17:30\\", \\"22:30\\"]]", "monday"=>"[[\\"17:30\\", \\"22:30\\"]]", "tuesday"=>"[[\\"17:30\\", \\"22:30\\"]]", "saturday"=>"[[\\"17:30\\", \\"22:30\\"]]", "thursday"=>"[[\\"17:30\\", \\"22:30\\"]]", "wednesday"=>"[[\\"17:30\\", \\"22:30\\"]]"	Mon-Sat 5:30 PM-10:30 PM	2014-11-30 14:32:15.245057	2014-11-30 14:32:15.245057
27	10 High	816 N Highland Ave NE	\N	\N	Atlanta	GA	30306	http://www.tenhighclub.com	us	33.7769	-84.352641	770e49e8-ba54-46d4-95fe-354b79222fc1	(404) 873-3607	\N	\N	\N	\N	{Virginia-Highland}	\N	{312}	{{Social,Bars}}	\N	\N	2014-11-30 14:32:15.255274	2014-11-30 14:32:15.255274
28	10 Ten	1401 N Highland Ave NE	\N	\N	Atlanta	GA	30306	http://www.10tennailbar.com	us	33.792895	-84.351953	4f665710-ebee-4c7e-9d52-a4b2931e255a	(404) 815-6690	\N	\N	\N	\N	{"Northeast Atlanta","Morningside - Lenox Park","Virginia Highland","North Highlands"}	\N	{281}	{{"Businesses and Services","Personal Care","Manicures and Pedicures"}}	"sunday"=>"[[\\"12:00\\", \\"18:00\\"]]"	Sun 12:00 PM-6:00 PM	2014-11-30 14:32:15.267086	2014-11-30 14:32:15.267086
29	100 Black Men of America Dekalb County Chapter Dekalb County CHA	1804 Bouldercrest Rd SE	\N	\N	Atlanta	GA	30316	\N	us	33.705182	-84.32414	16a00b65-07c1-48a8-975c-c9195ccd5c38	(404) 288-2772	\N	\N	\N	\N	{}	\N	{47}	{{"Community and Government","Organizations and Associations"}}	\N	\N	2014-11-30 14:32:15.277272	2014-11-30 14:32:15.277272
30	100 Black Men of American Inc.	141 Auburn Ave NE	\N	\N	Atlanta	GA	30303	\N	us	33.75548	-84.383082	0a23e05f-f3cc-4825-add7-8ad3eca5f2da	(404) 688-3154	\N	\N	\N	\N	{Downtown}	\N	{47}	{{"Community and Government","Organizations and Associations"}}	\N	\N	2014-11-30 14:32:15.288377	2014-11-30 14:32:15.288377
31	100 Black Men Of Atlanta	100 Auburn Ave NE	\N	\N	Atlanta	GA	30303	http://www.100blackmen-atlanta.org	us	33.755719	-84.383822	a2dc2a14-2dc8-4e9e-94ed-e4778e1fd4bd	(404) 525-6220	\N	\N	\N	\N	{"Five Points",Downtown}	\N	{}	{}	\N	\N	2014-11-30 14:32:15.300477	2014-11-30 14:32:15.300477
32	100 Blackmen of Atlanta	241 Peachtree St NE	Ste 300	\N	Atlanta	GA	30303	\N	us	33.761354	-84.387421	ee6e33f6-83dc-4a6a-a449-e8e748033ca9	(678) 495-5761	\N	\N	\N	\N	{"Downtown Atlanta","Peachtree Center",Downtown}	\N	{47}	{{"Community and Government","Organizations and Associations"}}	\N	\N	2014-11-30 14:32:15.310618	2014-11-30 14:32:15.310618
33	100 Fold Music Group	6807 Mancha St	\N	\N	Atlanta	GA	30349	\N	us	33.57196	-84.46685	7dbd8a20-1e18-012f-0643-0030487f54d8	(404) 604-0350	\N	\N	\N	\N	{}	\N	{}	{}	\N	\N	2014-11-30 14:32:15.321477	2014-11-30 14:32:15.321477
48	11th Street Studios	699 11th St NW	\N	\N	Atlanta	GA	30318	http://11thstreetstudios.com/	us	33.782998	-84.410368	c51a7749-ef96-4d51-8618-38159ce9ca52	(404) 249-8511	\N	\N	\N	\N	{"Home Park",Midtown,Bellwood,"Westside / Home Park"}	\N	{162}	{{Retail,"Music, Video and DVD"}}	"friday"=>"[[\\"9:00\\", \\"23:59\\"]]", "monday"=>"[[\\"9:00\\", \\"23:59\\"]]", "sunday"=>"[[\\"9:00\\", \\"23:59\\"]]", "tuesday"=>"[[\\"9:00\\", \\"23:59\\"]]", "saturday"=>"[[\\"9:00\\", \\"23:59\\"]]", "thursday"=>"[[\\"9:00\\", \\"23:59\\"]]", "wednesday"=>"[[\\"9:00\\", \\"23:59\\"]]"	Open Daily 9:00 AM-11:59 PM	2014-11-30 14:32:15.522649	2014-11-30 14:32:15.522649
49	120 Tavern and Music Hall	Roswell Rd	\N	\N	Atlanta	GA	30350	http://www.120tavern.com/musichall.html	us	33.966162	-84.363008	e62dadff-5f9f-47f3-955b-beb1c73bce26	(770) 509-3320	\N	\N	\N	\N	{Marietta}	\N	{347}	{{Social,"Food and Dining",Restaurants}}	\N	\N	2014-11-30 14:32:15.532172	2014-11-30 14:32:15.532172
34	100 Midtown	100 10th St NW	\N	\N	Atlanta	GA	30309	http://www.100midtown.com	us	33.781105	-84.390168	7d47abea-c09e-4547-869d-e13dbedecf1d	(404) 961-7130	\N	\N	\N	\N	{Midtown}	\N	{291}	{{"Businesses and Services","Real Estate"}}	"friday"=>"[[\\"8:00\\", \\"10:00\\"], [\\"15:00\\", \\"23:59\\"]]", "monday"=>"[[\\"9:00\\", \\"23:59\\"]]", "sunday"=>"[[\\"2:00\\", \\"3:00\\"]]", "tuesday"=>"[[\\"8:00\\", \\"9:00\\"], [\\"14:00\\", \\"23:00\\"]]", "saturday"=>"[[\\"00:00\\", \\"2:00\\"], [\\"9:00\\", \\"23:59\\"]]", "thursday"=>"[[\\"8:00\\", \\"9:00\\"], [\\"11:00\\", \\"12:00\\"], [\\"14:00\\", \\"17:00\\"], [\\"19:00\\", \\"23:59\\"]]", "wednesday"=>"[[\\"6:00\\", \\"7:00\\"], [\\"9:00\\", \\"10:00\\"], [\\"15:00\\", \\"18:00\\"], [\\"20:00\\", \\"22:00\\"]]"	Mon 9:00 AM-11:59 PM; Tue 8:00 AM-9:00 AM, 2:00 PM-11:00 PM; Wed 6:00 AM-7:00 AM, 9:00 AM-10:00 AM, 3:00 PM-6:00 PM, 8:00 PM-10:00 PM; Thu 8:00 AM-9:00 AM, 11:00 AM-12:00 PM, 2:00 PM-5:00 PM, 7:00 PM-11:59 PM; Fri 8:00 AM-10:00 AM, 3:00 PM-11:59 PM; Sat 12:00 AM-2:00 AM, 9:00 AM-11:59 PM; Sun 2:00 AM-3:00 AM	2014-11-30 14:32:15.333563	2014-11-30 14:32:15.333563
35	100% Natural	2798 Lakewood Ave SW	Ste B	\N	Atlanta	GA	30315	http://www.allnaturalway.net/	us	33.697023	-84.409661	4c26cc4d-12f0-4996-a923-67084170fa79	(404) 246-9992	(404) 761-2271	100percentnaturalway@gmail.com	\N	\N	{"Sylvan Hills"}	\N	{106}	{{Healthcare,"Weight Loss and Nutritionists"}}	"friday"=>"[[\\"9:00\\", \\"17:00\\"]]", "monday"=>"[[\\"9:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"9:00\\", \\"17:00\\"]]", "saturday"=>"[[\\"9:00\\", \\"12:00\\"]]", "thursday"=>"[[\\"9:00\\", \\"17:00\\"]]", "wednesday"=>"[[\\"9:00\\", \\"17:00\\"]]"	Mon-Fri 9:00 AM-5:00 PM; Sat 9:00 AM-12:00 PM	2014-11-30 14:32:15.343923	2014-11-30 14:32:15.343923
36	101 Concepts	4840 Roswell Rd	\N	\N	Atlanta	GA	30342	\N	us	33.897487	-84.381046	39952105-9458-432e-a327-6009946c1fdb	(404) 250-0947	\N	\N	\N	\N	{Millbrook}	\N	{347}	{{Social,"Food and Dining",Restaurants}}	\N	\N	2014-11-30 14:32:15.354965	2014-11-30 14:32:15.354965
37	1010 Midtown	1080 Peachtree St NE	\N	\N	Atlanta	GA	30309	http://www.1010midtown.com	us	33.783636	-84.383728	14811025-7131-47fc-9924-9146e562ed59	(404) 815-4622	\N	\N	\N	\N	{Midtown}	\N	{291}	{{"Businesses and Services","Real Estate"}}	"friday"=>"[[\\"8:00\\", \\"9:00\\"], [\\"15:00\\", \\"23:00\\"]]", "monday"=>"[[\\"7:00\\", \\"9:00\\"], [\\"14:00\\", \\"15:00\\"], [\\"17:00\\", \\"21:00\\"]]", "sunday"=>"[[\\"11:00\\", \\"20:00\\"]]", "tuesday"=>"[[\\"5:00\\", \\"9:00\\"], [\\"15:00\\", \\"21:00\\"]]", "saturday"=>"[[\\"10:00\\", \\"23:00\\"]]", "thursday"=>"[[\\"8:00\\", \\"9:00\\"], [\\"14:00\\", \\"22:00\\"]]", "wednesday"=>"[[\\"7:00\\", \\"9:00\\"], [\\"16:00\\", \\"22:00\\"]]"	Mon 7:00 AM-9:00 AM, 2:00 PM-3:00 PM, 5:00 PM-9:00 PM; Tue 5:00 AM-9:00 AM, 3:00 PM-9:00 PM; Wed 7:00 AM-9:00 AM, 4:00 PM-10:00 PM; Thu 8:00 AM-9:00 AM, 2:00 PM-10:00 PM; Fri 8:00 AM-9:00 AM, 3:00 PM-11:00 PM; Sat 10:00 AM-11:00 PM; Sun 11:00 AM-8:00 PM	2014-11-30 14:32:15.366961	2014-11-30 14:32:15.366961
38	1016 Lofts	1016 Howell Mill Rd NW	\N	\N	Atlanta	GA	30318	http://www.1016lofts.com/	us	33.782233	-84.411976	f8b10270-bba4-41c3-9712-3d3b756b020c	(404) 815-8877	\N	lincolnheatherw@gmail.com	\N	\N	{"Home Park","Northeast Atlanta",Bellwood,Midtown,"Westside / Home Park"}	\N	{296}	{{"Businesses and Services","Real Estate","Apartments, Condos, and Houses"}}	"friday"=>"[[\\"9:00\\", \\"17:00\\"]]", "monday"=>"[[\\"9:00\\", \\"17:00\\"]]", "tuesday"=>"[[\\"9:00\\", \\"17:00\\"]]", "thursday"=>"[[\\"9:00\\", \\"17:00\\"]]", "wednesday"=>"[[\\"9:00\\", \\"17:00\\"]]"	Mon-Fri 9:00 AM-5:00 PM	2014-11-30 14:32:15.377236	2014-11-30 14:32:15.377236
39	1027 Church	774 Virginia Ave NE	\N	\N	Atlanta	GA	30306	\N	us	33.781886	-84.363198	f90736e0-c359-450b-a122-032f73d3afe4	(404) 226-7382	\N	\N	\N	\N	{"Virginia Highland"}	\N	{55}	{{"Community and Government",Religious,Churches}}	\N	\N	2014-11-30 14:32:15.421668	2014-11-30 14:32:15.421668
40	1047 FM Business Office	2970 Peachtree Rd NW	\N	\N	Atlanta	GA	30305	http://wniv.com	us	33.835758	-84.382024	1c013484-f0dd-420b-96df-52cf24ff604d	(404) 995-7300	\N	\N	\N	\N	{"Garden Hills",Buckhead,Mayfair}	\N	{215}	{{"Businesses and Services",Entertainment,Media}}	\N	\N	2014-11-30 14:32:15.432446	2014-11-30 14:32:15.432446
41	10ten Nail Bar	1432 Dresden Dr NE	\N	\N	Atlanta	GA	30319	http://www.10tennailbar.com	us	33.861122	-84.330409	78b40790-1e18-012f-0643-0030487f54d8	(404) 816-8801	\N	\N	\N	\N	{Brookhaven,Briarcliff}	\N	{281}	{{"Businesses and Services","Personal Care","Manicures and Pedicures"}}	\N	\N	2014-11-30 14:32:15.443591	2014-11-30 14:32:15.443591
42	10th and Home	251 10th St NW	\N	\N	Atlanta	GA	30318	http://10thandhome.housing.gatech.edu	us	33.782331	-84.39601	20b70043-5e43-4a1e-919a-126dc934abf3	(404) 385-6683	\N	\N	\N	\N	{Bellwood,Midtown}	\N	{291}	{{"Businesses and Services","Real Estate"}}	"friday"=>"[[\\"16:00\\", \\"19:00\\"], [\\"22:00\\", \\"23:59\\"]]", "monday"=>"[[\\"9:00\\", \\"11:00\\"], [\\"13:00\\", \\"22:00\\"]]", "sunday"=>"[[\\"8:00\\", \\"20:00\\"], [\\"22:00\\", \\"23:59\\"]]", "tuesday"=>"[[\\"10:00\\", \\"12:00\\"], [\\"16:00\\", \\"23:59\\"]]", "saturday"=>"[[\\"6:00\\", \\"8:00\\"], [\\"11:00\\", \\"12:00\\"], [\\"14:00\\", \\"21:00\\"]]", "thursday"=>"[[\\"11:00\\", \\"13:00\\"]]", "wednesday"=>"[[\\"6:00\\", \\"7:00\\"], [\\"11:00\\", \\"15:00\\"], [\\"17:00\\", \\"23:59\\"]]"	Mon 9:00 AM-11:00 AM, 1:00 PM-10:00 PM; Tue 10:00 AM-12:00 PM, 4:00 PM-11:59 PM; Wed 6:00 AM-7:00 AM, 11:00 AM-3:00 PM, 5:00 PM-11:59 PM; Thu 11:00 AM-1:00 PM; Fri 4:00 PM-7:00 PM, 10:00 PM-11:59 PM; Sat 6:00 AM-8:00 AM, 11:00 AM-12:00 PM, 2:00 PM-9:00 PM; Sun 8:00 AM-8:00 PM, 10:00 PM-11:59 PM	2014-11-30 14:32:15.456285	2014-11-30 14:32:15.456285
43	10th and Piedmont	991 Piedmont Ave NE	\N	\N	Atlanta	GA	30309	http://www.communitashospitality.com/	us	33.781666	-84.380374	1952e92c-e8e1-488c-9481-4bca49cbdd6a	(404) 602-5510	\N	nygcafe@gmail.com	\N	\N	{Midtown,atlanta}	\N	{348}	{{Social,"Food and Dining",Restaurants,American}}	"friday"=>"[[\\"17:00\\", \\"23:00\\"]]", "monday"=>"[[\\"17:00\\", \\"22:00\\"]]", "sunday"=>"[[\\"11:00\\", \\"16:00\\"]]", "tuesday"=>"[[\\"17:00\\", \\"22:00\\"]]", "saturday"=>"[[\\"11:00\\", \\"16:00\\"], [\\"17:00\\", \\"23:00\\"]]", "wednesday"=>"[[\\"17:00\\", \\"22:00\\"]]"	Mon-Wed 5:00 PM-10:00 PM; Fri 5:00 PM-11:00 PM; Sat 11:00 AM-4:00 PM, 5:00 PM-11:00 PM; Sun 11:00 AM-4:00 PM	2014-11-30 14:32:15.465857	2014-11-30 14:32:15.465857
44	10TH Degree Consulting	5391 Boreal Way SW	\N	\N	Atlanta	GA	30331	\N	us	33.689521	-84.562269	f8259945-93ff-4874-a063-2ee15175ebcf	(678) 298-9642	\N	\N	\N	\N	{}	\N	{225}	{{"Businesses and Services",Financial,"Financial Planning and Investments"}}	"friday"=>"[[\\"8:00\\", \\"20:00\\"]]", "monday"=>"[[\\"8:00\\", \\"20:00\\"]]", "tuesday"=>"[[\\"8:00\\", \\"20:00\\"]]", "thursday"=>"[[\\"8:00\\", \\"20:00\\"]]", "wednesday"=>"[[\\"8:00\\", \\"20:00\\"]]"	Mon-Fri 8:00 AM-8:00 PM	2014-11-30 14:32:15.476817	2014-11-30 14:32:15.476817
45	1190 Huff	3270 Cochise Dr SE	\N	\N	Atlanta	GA	30339	\N	us	33.865601	-84.461418	07d47c8e-87a4-4e2f-855d-575039e560f5	(770) 434-8061	\N	\N	\N	\N	{Cochise}	\N	{169}	{{Retail,"Shopping Centers and Malls"}}	\N	\N	2014-11-30 14:32:15.488098	2014-11-30 14:32:15.488098
46	11Alive CIA	1 Monroe Pl NE	\N	\N	Atlanta	GA	30324	http://www.11alive.com	us	33.809672	-84.371601	494adb0c-1cfa-42f0-b88f-14a26b993470	(404) 892-1611	\N	\N	\N	\N	{Mayfair}	\N	{215}	{{"Businesses and Services",Entertainment,Media}}	\N	\N	2014-11-30 14:32:15.499028	2014-11-30 14:32:15.499028
50	123 Discount Fabric and Uphlstry	279 Candler Rd SE	\N	\N	Atlanta	GA	30317	\N	us	33.745191	-84.291336	0e1e9e02-847a-4840-953a-df6b8a66a7e7	(404) 963-1075	\N	\N	\N	\N	{Eastside,"East Lake Highlands","East Lakes"}	\N	{190}	{{"Businesses and Services",Textiles}}	\N	\N	2014-11-30 14:32:15.543299	2014-11-30 14:32:15.543299
\.


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pc
--

SELECT pg_catalog.setval('places_id_seq', 50, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: pc
--

COPY schema_migrations (version) FROM stdin;
20141123143833
\.


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: pc; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: pc; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

