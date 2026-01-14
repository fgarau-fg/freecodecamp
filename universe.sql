--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: atmosfera; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.atmosfera (
    atmosfera_id integer NOT NULL,
    composition text,
    pressure numeric(8,2),
    temperature numeric(5,2),
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.atmosfera OWNER TO freecodecamp;

--
-- Name: atmosfera_atmosphere_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.atmosfera_atmosphere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atmosfera_atmosphere_id_seq OWNER TO freecodecamp;

--
-- Name: atmosfera_atmosphere_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.atmosfera_atmosphere_id_seq OWNED BY public.atmosfera.atmosfera_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    numero_di_stelle integer NOT NULL,
    name_in_hex text NOT NULL,
    main_color character varying(30),
    nome_italiano character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    peso numeric(10,2),
    name_in_hex text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    numero_di_lune integer NOT NULL,
    peso numeric(10,2),
    name_in_hex text NOT NULL,
    is_in_milkyway boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    peso numeric(10,2),
    name_in_hex text NOT NULL,
    is_in_milkyway boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: atmosfera atmosfera_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosfera ALTER COLUMN atmosfera_id SET DEFAULT nextval('public.atmosfera_atmosphere_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: atmosfera; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.atmosfera (atmosfera_id, composition, pressure, temperature, planet_id, name) FROM stdin;
1	Nitrogen, Oxygen	101.30	15.00	1	Earth Atmosphere
2	CO2, Nitrogen	0.60	-63.00	2	Mars Atmosphere
3	CO2, H2O	20.00	50.00	3	Proxima b Atmosphere
4	Nitrogen, Methane	150.00	-50.00	4	Alpha Centauri Ab Atmosphere
5	Hydrogen, Helium	1000.00	-100.00	5	Planet X Atmosphere
6	Nitrogen, Oxygen	110.00	25.00	6	Planet Y Atmosphere
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, numero_di_stelle, name_in_hex, main_color, nome_italiano) FROM stdin;
1	Milky Way	1000	4D696C6B7920576179	\N	\N
2	Andromeda	100000	416E64726F6D656461	\N	\N
5	Triangulum	40000000	547269616E67756C756D	\N	\N
6	Whirlpool	10000000	57686972706C6F6F6C	\N	\N
7	Sombrero	8000000	536F6D627265726F	\N	\N
8	Messier 81	25000000	4D657373696572203831	\N	\N
3	Milky Way 2	100000000	4D696C6B7920576179	\N	\N
4	Andromeda II	253000000	416E64726F6D656461	\N	\N
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, peso, name_in_hex, planet_id) FROM stdin;
1	Moon	7347.00	4D6F6F6E	1
2	Phobos	107.00	50686F626F73	2
3	Deimos	10.00	4465696D6F73	2
4	Proxima b I	5.00	50726F78696D6120622049	3
8	Venus I	50.00	56656E75732049	3
9	Mercury I	20.00	4D6572637572792049	4
11	Proxima c I	7.00	50726F78696D6120632049	6
12	Proxima c II	6.00	50726F78696D6120632049	6
13	Alpha Centauri Ab I	12.00	416C7068612043656E74617572692041622049	7
14	Alpha Centauri Ab II	15.00	416C7068612043656E74617572692041622049	7
15	Alpha Centauri Ab III	10.00	416C7068612043656E74617572692041622049	7
16	Alpha Centauri Ac I	8.00	416C7068612043656E74617572692041632049	8
17	Alpha Centauri Ac II	9.00	416C7068612043656E74617572692041632049	8
18	Planet X I	25.00	506C616E657420585249	9
19	Planet Y I	30.00	506C616E657420595249	10
20	Planet Y II	28.00	506C616E657420595249	10
21	Planet Z I	35.00	506C616E6574205A2049	11
22	Planet Q I	40.00	506C616E657420512049	12
23	Planet Q II	38.00	506C616E657420512049	12
24	Planet Q III	42.00	506C616E657420512049	12
5	Moon 2	7347.00	4D6F6F6E	1
7	Deimos 2	10.00	4465696D6F73	2
6	Phobos 2	107.00	50686F626F73	2
10	Proxima b I 2	5.00	50726F78696D6120622049	5
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, numero_di_lune, peso, name_in_hex, is_in_milkyway, star_id) FROM stdin;
1	Earth	1	5972.00	4561727468	t	1
2	Mars	2	641.00	4D617273	t	1
3	Proxima b	0	1350.00	50726F78696D612062	t	2
6	Venus	0	4868.00	56656E7573	t	1
7	Mercury	0	330.00	4D657263757279	t	1
9	Proxima c	1	2000.00	50726F78696D612063	t	2
10	Alpha Centauri Ab	3	4000.00	416C7068612043656E7461757269204162	t	3
11	Alpha Centauri Ac	2	3200.00	416C7068612043656E7461757269204163	t	3
12	Planet X	0	5000.00	506C616E65742058	f	4
13	Planet Y	2	3000.00	506C616E65742059	f	5
14	Planet Z	1	4500.00	506C616E6574205A	f	6
15	Planet Q	0	6000.00	506C616E65742051	f	6
4	Earth 2	1	5972.00	4561727468	t	1
5	Mars 2	2	641.00	4D617273	t	1
8	Proxima b 2	0	1350.00	50726F78696D612062	t	2
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, peso, name_in_hex, is_in_milkyway, galaxy_id) FROM stdin;
1	Sun	1989000.00	53756E	t	1
2	Proxima Centauri	244600.00	50726F78696D612043656E7461757269	t	1
3	Star X	5000000.00	537461722058	f	2
6	Alpha Centauri A	2200000.00	416C7068612043656E7461757269	t	1
8	Star Y	3000000.00	537461722059	f	2
9	Star Z	2500000.00	53746172205A	f	2
12	Alpha Centauri A 2	2200000.00	416C7068612043656E7461757269	t	1
5	Proxima Centauri 2	244600.00	50726F78696D612043656E7461757269	t	1
11	Proxima Centauri 3	244600.00	50726F78696D612043656E7461757269	t	1
7	Star X 2	5000000.00	537461722058	f	2
13	Star X 3	5000000.00	537461722058	f	2
14	Star Y 2	3000000.00	537461722059	f	2
15	Star Z 2	2500000.00	53746172205A	f	2
4	Sun 2	1989000.00	53756E	t	1
10	Sun 3	1989000.00	53756E	t	1
\.


--
-- Name: atmosfera_atmosphere_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.atmosfera_atmosphere_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: atmosfera atmosfera_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosfera
    ADD CONSTRAINT atmosfera_name_unique UNIQUE (name);


--
-- Name: atmosfera atmosfera_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosfera
    ADD CONSTRAINT atmosfera_pkey PRIMARY KEY (atmosfera_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: atmosfera atmosfera_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosfera
    ADD CONSTRAINT atmosfera_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

