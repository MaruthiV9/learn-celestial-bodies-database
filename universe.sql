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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    galaxy_size integer,
    distance_from_earth numeric(6,3)
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
    description text,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(8,3),
    moon_type character varying(20),
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_types character varying(30),
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(6,3),
    star_id integer NOT NULL
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
    description text,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    star_size integer,
    distance_from_earth numeric(6,3),
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth numeric(8,5),
    age_in_millions integer NOT NULL,
    type character varying(20)
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral galaxy nearest to the Milky Way', false, 2000, 120000, 2.537);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The galaxy containing our Solar System', true, 13000, 100000, 0.000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in the constellation Triangulum', false, 500, 50000, 3.107);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral galaxy known for its prominent spiral arms', false, 1000, 70000, 23.460);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral galaxy with a prominent bulge resembling a sombrero hat', false, 900, 90000, 28.500);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral galaxy in the constellation Ursa Major', false, 2500, 80000, 21.800);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s natural satellite', false, 4500, 0.384, 'Terrestrial', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars', false, 4500, 9377.000, 'Rocky', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', false, 4500, 23460.000, 'Rocky', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon of Jupiter', false, 4500, 1070.000, 'Ice', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Second-largest moon of Jupiter', false, 4500, 1883.000, 'Ice', 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Innermost moon of Jupiter, known for its volcanic activity', false, 4500, 421.000, 'Rocky', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Fourth-largest moon of Jupiter, known for its subsurface ocean', false, 4500, 670.000, 'Ice', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn, with a dense atmosphere', false, 4500, 1257.000, 'Ice', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Sixth-largest moon of Saturn, known for its geysers', false, 4500, 238.000, 'Ice', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Smallest moon of Saturn, known for its large crater', false, 4500, 185.000, 'Rocky', 6);
INSERT INTO public.moon VALUES (11, 'Triton', 'Largest moon of Neptune, with retrograde orbit', false, 4500, 354.000, 'Ice', 7);
INSERT INTO public.moon VALUES (12, 'Proteus', 'Second-largest moon of Neptune', false, 4500, 117.000, 'Ice', 7);
INSERT INTO public.moon VALUES (13, 'Charon', 'Largest moon of Pluto, in a binary system with Pluto', false, 4500, 19.600, 'Rocky', 8);
INSERT INTO public.moon VALUES (14, 'Nix', 'Moon of Pluto, part of its binary system', false, 4500, 48.700, 'Rocky', 8);
INSERT INTO public.moon VALUES (15, 'Hydra', 'Moon of Pluto, part of its binary system', false, 4500, 64.700, 'Rocky', 8);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Fourth-largest moon of Uranus', false, 4500, 191.000, 'Ice', 9);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Third-largest moon of Uranus', false, 4500, 266.000, 'Ice', 9);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Smallest of the five major moons of Uranus', false, 4500, 129.000, 'Ice', 9);
INSERT INTO public.moon VALUES (19, 'Dione', 'Fourth-largest moon of Saturn', false, 4500, 378.000, 'Ice', 6);
INSERT INTO public.moon VALUES (20, 'Rhea', 'Second-largest moon of Saturn', false, 4500, 527.000, 'Ice', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun', false, true, 'Terrestrial', 4500, 0.390, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun', false, true, 'Terrestrial', 4500, 0.723, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet from the Sun', true, true, 'Terrestrial', 4500, 1.000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet from the Sun', false, true, 'Terrestrial', 4500, 1.524, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Fifth planet from the Sun, largest in the Solar System', false, false, 'Gas giant', 4500, 5.203, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sixth planet from the Sun, known for its rings', false, false, 'Gas giant', 4500, 9.537, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet from the Sun, tilted on its axis', false, false, 'Ice giant', 4500, 19.191, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eighth planet from the Sun, known for its blue color', false, false, 'Ice giant', 4500, 30.069, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper belt', false, true, 'Dwarf', 4500, 39.480, 1);
INSERT INTO public.planet VALUES (10, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', true, true, 'Terrestrial', 100, 4.240, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'First Earth-sized exoplanet discovered in the habitable zone', true, true, 'Terrestrial', 500, 500.000, 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Exoplanet in the habitable zone of the TRAPPIST-1 system', true, true, 'Terrestrial', 100, 39.500, 4);
INSERT INTO public.planet VALUES (13, 'HD 40307 g', 'Super-Earth exoplanet in the habitable zone', true, true, 'Terrestrial', 500, 42.300, 5);
INSERT INTO public.planet VALUES (14, 'Gliese 581 c', 'Exoplanet in the habitable zone of the Gliese 581 system', true, true, 'Terrestrial', 1000, 20.300, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Brightest star in the night sky', false, 240, 2, 8.600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Nearest known star to the Sun', false, 6000, 0, 4.240, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Binary star system closest to the Sun', false, 6000, 1, 4.370, 2);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'Binary star system closest to the Sun', false, 6000, 1, 4.370, 2);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 'Second closest star system to the Sun', false, 8900, 0, 5.960, 2);
INSERT INTO public.star VALUES (6, 'Wolf 359', 'Red dwarf star in the constellation Leo', false, 7000, 0, 7.780, 1);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 'Red supergiant in the constellation Orion', false, 800, 1000, 643.000, 3);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'Milky Way', 'Spiral galaxy containing our Solar System', true, 0.00000, 13000, 'Spiral');
INSERT INTO public.universe VALUES (2, 'Andromeda', 'Spiral galaxy nearest to the Milky Way', false, 2.53700, 2000, 'Spiral');
INSERT INTO public.universe VALUES (3, 'Messier 87', 'Giant elliptical galaxy in the Virgo Cluster', false, 54.40000, 12000, 'Elliptical');
INSERT INTO public.universe VALUES (4, 'Triangulum', 'Small spiral galaxy in the constellation Triangulum', false, 3.10700, 500, 'Spiral');
INSERT INTO public.universe VALUES (5, 'Whirlpool', 'Spiral galaxy known for its prominent spiral arms', false, 23.46000, 1000, 'Spiral');
INSERT INTO public.universe VALUES (6, 'Sombrero', 'Spiral galaxy with a prominent bulge resembling a sombrero hat', false, 28.50000, 900, 'Spiral');
INSERT INTO public.universe VALUES (7, 'Pinwheel', 'Spiral galaxy in the constellation Ursa Major', false, 21.80000, 2500, 'Spiral');
INSERT INTO public.universe VALUES (8, 'Large Magellanic Cloud', 'Irregular galaxy orbiting the Milky Way', false, 163.00000, 16000, 'Irregular');
INSERT INTO public.universe VALUES (9, 'Small Magellanic Cloud', 'Irregular galaxy orbiting the Milky Way', false, 200.00000, 16000, 'Irregular');
INSERT INTO public.universe VALUES (10, 'Boötes Void', 'One of the largest voids in the universe', false, 330.00000, 13000, 'Void');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: galaxy n; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT n UNIQUE (name);


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
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


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

