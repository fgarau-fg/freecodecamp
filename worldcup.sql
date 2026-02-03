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

ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS games_winner_id_fkey;
ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS games_opponent_id_fkey;
ALTER TABLE IF EXISTS ONLY public.teams DROP CONSTRAINT IF EXISTS teams_pkey;
ALTER TABLE IF EXISTS ONLY public.teams DROP CONSTRAINT IF EXISTS teams_name_key;
ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS games_pkey;
ALTER TABLE IF EXISTS public.teams ALTER COLUMN team_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.games ALTER COLUMN game_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.teams_team_id_seq;
DROP TABLE IF EXISTS public.teams;
DROP SEQUENCE IF EXISTS public.games_game_id_seq;
DROP TABLE IF EXISTS public.games;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(100) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.games (winner_id, opponent_id, game_id, year, round, winner_goals, opponent_goals) FROM stdin;
1	2	1	2018	Final	4	2
3	4	2	2018	Third Place	2	0
2	4	3	2018	Semi-Final	2	1
1	3	4	2018	Semi-Final	1	0
2	5	5	2018	Quarter-Final	3	2
4	6	6	2018	Quarter-Final	2	0
3	7	7	2018	Quarter-Final	2	1
1	8	8	2018	Quarter-Final	2	0
4	9	9	2018	Eighth-Final	2	1
6	10	10	2018	Eighth-Final	1	0
3	11	11	2018	Eighth-Final	3	2
7	12	12	2018	Eighth-Final	2	0
2	13	13	2018	Eighth-Final	2	1
5	14	14	2018	Eighth-Final	2	1
8	15	15	2018	Eighth-Final	2	1
1	16	16	2018	Eighth-Final	4	3
17	16	17	2014	Final	1	0
18	7	18	2014	Third Place	3	0
16	18	19	2014	Semi-Final	1	0
17	7	20	2014	Semi-Final	7	1
18	19	21	2014	Quarter-Final	1	0
16	3	22	2014	Quarter-Final	1	0
7	9	23	2014	Quarter-Final	2	1
17	1	24	2014	Quarter-Final	1	0
7	20	25	2014	Eighth-Final	2	1
9	8	26	2014	Eighth-Final	2	0
1	21	27	2014	Eighth-Final	2	0
17	22	28	2014	Eighth-Final	2	1
18	12	29	2014	Eighth-Final	2	1
19	23	30	2014	Eighth-Final	2	1
16	10	31	2014	Eighth-Final	1	0
3	24	32	2014	Eighth-Final	2	1
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.teams (team_id, name) FROM stdin;
1	France
2	Croatia
3	Belgium
4	England
5	Russia
6	Sweden
7	Brazil
8	Uruguay
9	Colombia
10	Switzerland
11	Japan
12	Mexico
13	Denmark
14	Spain
15	Portugal
16	Argentina
17	Germany
18	Netherlands
19	Costa Rica
20	Chile
21	Nigeria
22	Algeria
23	Greece
24	United States
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

