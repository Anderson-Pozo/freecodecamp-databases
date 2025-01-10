--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance numeric(10,2) NOT NULL,
    type character varying(30) NOT NULL,
    description text
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
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer NOT NULL,
    description text,
    has_satellites boolean
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    size integer NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    radius integer NOT NULL,
    distance_from_star numeric(10,2),
    has_moons boolean NOT NULL
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age integer,
    mass numeric(10,2),
    has_planets boolean NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, 'Spiral', 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.54, 'Spiral', 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3.00, 'Spiral', 'Third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 29.30, 'Spiral', 'Bright and unusual appearance');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23.16, 'Spiral', 'Famous for its grand-design structure');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 0.16, 'Irregular', 'Satellite galaxy of the Milky Way');


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 'Meteor1', 100, 'Meteor1 description', false);
INSERT INTO public.meteor VALUES (2, 'Meteor2', 200, 'Meteor2 description', true);
INSERT INTO public.meteor VALUES (3, 'Meteor3', 300, 'Meteor3 description', false);
INSERT INTO public.meteor VALUES (4, 'Meteor4', 400, 'Meteor4 description', true);
INSERT INTO public.meteor VALUES (5, 'Meteor5', 500, 'Meteor5 description', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 11, 'Largest of Mars moons');
INSERT INTO public.moon VALUES (3, 'Europa', 2, 1561, 'One of Jupiter');
INSERT INTO public.moon VALUES (4, 'Titan', 3, 2575, 'Largest of Saturn moons');
INSERT INTO public.moon VALUES (5, 'Charon', 4, 606, 'Largest of Plutos moons');
INSERT INTO public.moon VALUES (6, 'Deimos', 1, 6, 'Smallest of Mars moons');
INSERT INTO public.moon VALUES (7, 'Ganymede', 2, 2634, 'Largest of Jupiter moons');
INSERT INTO public.moon VALUES (8, 'Callisto', 2, 2410, 'Second largest of Jupiter moons');
INSERT INTO public.moon VALUES (9, 'Io', 2, 1822, 'Third largest of Jupiter moons');
INSERT INTO public.moon VALUES (10, 'Rhea', 3, 1528, 'Second largest of Saturn moons');
INSERT INTO public.moon VALUES (11, 'Iapetus', 3, 1469, 'Third largest of Saturn moons');
INSERT INTO public.moon VALUES (12, 'Dione', 3, 1123, 'Fourth largest of Saturn moons');
INSERT INTO public.moon VALUES (13, 'Tethys', 3, 1063, 'Fifth largest of Saturn moons');
INSERT INTO public.moon VALUES (14, 'Enceladus', 3, 252, 'Sixth largest of Saturn moons');
INSERT INTO public.moon VALUES (15, 'Mimas', 3, 396, 'Seventh largest of Saturn moons');
INSERT INTO public.moon VALUES (16, 'Hyperion', 3, 270, 'Eighth largest of Saturn moons');
INSERT INTO public.moon VALUES (17, 'Phoebe', 3, 107, 'Ninth largest of Saturn moons');
INSERT INTO public.moon VALUES (18, 'Janus', 3, 90, 'Tenth largest of Saturn moons');
INSERT INTO public.moon VALUES (19, 'Epimetheus', 3, 59, 'Eleventh largest of Saturn moons');
INSERT INTO public.moon VALUES (20, 'Helene', 3, 16, 'Twelfth largest of Saturn moons');
INSERT INTO public.moon VALUES (21, 'Telesto', 3, 25, 'Thirteenth largest of Saturn moons');
INSERT INTO public.moon VALUES (22, 'Calypso', 3, 19, 'Fourteenth largest of Saturn moons');
INSERT INTO public.moon VALUES (23, 'Atlas', 3, 19, 'Fifteenth largest of Saturn moons');
INSERT INTO public.moon VALUES (24, 'Prometheus', 3, 54, 'Sixteenth largest of Saturn moons');
INSERT INTO public.moon VALUES (25, 'Pandora', 3, 41, 'Seventeenth largest of Saturn moons');
INSERT INTO public.moon VALUES (26, 'Pan', 3, 14, 'Eighteenth largest of Saturn moons');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 1.00, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 1.50, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911, 5.20, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 58232, 9.50, true);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 25362, 19.20, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 24622, 30.10, true);
INSERT INTO public.planet VALUES (7, 'Pluto', 1, 1188, 39.50, true);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 2439, 0.40, false);
INSERT INTO public.planet VALUES (9, 'Venus', 1, 6052, 0.70, false);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 473, 2.80, false);
INSERT INTO public.planet VALUES (11, 'Eris', 1, 1163, 67.70, false);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, 816, 43.10, false);
INSERT INTO public.planet VALUES (13, 'Makemake', 1, 1434, 45.80, false);
INSERT INTO public.planet VALUES (14, 'Sedna', 1, 498, 525.00, false);
INSERT INTO public.planet VALUES (15, 'Orcus', 1, 917, 39.40, false);
INSERT INTO public.planet VALUES (16, 'Quaoar', 1, 560, 43.60, false);
INSERT INTO public.planet VALUES (17, 'Salacia', 1, 423, 42.00, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.00, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 5000, 1.10, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10000, 20.00, false);
INSERT INTO public.star VALUES (4, 'Sirius', 2, 300, 2.10, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 2.20, true);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 7000, 5.40, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: meteor meteor_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_name_key UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

