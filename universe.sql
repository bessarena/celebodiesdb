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
-- Name: exploration; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exploration (
    exploration_id integer NOT NULL,
    has_explorated boolean NOT NULL,
    planet_id integer,
    status character varying(50),
    name character varying(25),
    discover_resources integer,
    exploration_duration_days integer
);


ALTER TABLE public.exploration OWNER TO freecodecamp;

--
-- Name: exploration_exploration_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exploration_exploration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exploration_exploration_id_seq OWNER TO freecodecamp;

--
-- Name: exploration_exploration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exploration_exploration_id_seq OWNED BY public.exploration.exploration_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    num_stars bigint,
    age_galaxy bigint,
    galaxy_types character varying(25) NOT NULL
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
    name character varying(50) NOT NULL,
    has_water boolean,
    has_atmosphere boolean,
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
    name character varying(50) NOT NULL,
    star_id integer,
    description text,
    is_spherical boolean NOT NULL
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
    galaxy_id integer,
    luminosity numeric,
    distance_from_earth numeric NOT NULL
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
-- Name: exploration exploration_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration ALTER COLUMN exploration_id SET DEFAULT nextval('public.exploration_exploration_id_seq'::regclass);


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
-- Data for Name: exploration; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exploration VALUES (1, true, 1, 'Completed', 'First Moon Landing', 1000, 7);
INSERT INTO public.exploration VALUES (2, true, 2, 'Ongoing', 'Jupiter Exploration', 500, 30);
INSERT INTO public.exploration VALUES (3, false, 3, 'Planned', 'Mars Rover Mission', 0, 0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000000, 13600000000, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000000, 13500000000, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000000, 12000000000, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 100000000000, 13200000000, 'elliptical');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 200000000000, 13800000000, 'elliptical');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 100000000000, 12500000000, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', true, false, 2);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, false, 2);
INSERT INTO public.moon VALUES (6, 'Callisto', true, false, 2);
INSERT INTO public.moon VALUES (7, 'Titan', true, true, 6);
INSERT INTO public.moon VALUES (8, 'Rhea', false, false, 6);
INSERT INTO public.moon VALUES (9, 'Dione', false, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', false, false, 6);
INSERT INTO public.moon VALUES (11, 'Triton', true, false, 8);
INSERT INTO public.moon VALUES (12, 'Proteus', false, false, 8);
INSERT INTO public.moon VALUES (13, 'Miranda', false, false, 8);
INSERT INTO public.moon VALUES (14, 'Charon', false, false, 9);
INSERT INTO public.moon VALUES (15, 'Nereid', false, false, 8);
INSERT INTO public.moon VALUES (16, 'Enceladus', true, true, 6);
INSERT INTO public.moon VALUES (17, 'Mimas', false, false, 6);
INSERT INTO public.moon VALUES (18, 'Tethys', false, false, 6);
INSERT INTO public.moon VALUES (19, 'Hyperion', false, false, 6);
INSERT INTO public.moon VALUES (20, 'Ariel', false, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Smallest planet in the Solar System', true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hottest planet in the Solar System', true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Third planet from the Sun and the only known planet to support life', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Known as the "Red Planet"', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet in the Solar System', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Known for its prominent ring system', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Seventh planet from the Sun and the third-largest in the Solar System', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Known as the "Ice Giant"', true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf planet beyond Neptune', true);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 1, 'First Earth-sized exoplanet discovered within the habitable zone of another star', true);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 1, 'First exoplanet to be detected passing in front of its parent star', true);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 1, 'Exoplanet located in the habitable zone of its star', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 0.0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 25.4, 8.6);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 1.5, 4.4);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 0.5, 4.4);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 2, 0.0035, 5.9);
INSERT INTO public.star VALUES (6, 'Wolf 359', 2, 0.001, 7.8);


--
-- Name: exploration_exploration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exploration_exploration_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: exploration exploration_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration
    ADD CONSTRAINT exploration_id UNIQUE (name);


--
-- Name: exploration exploration_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration
    ADD CONSTRAINT exploration_pkey PRIMARY KEY (exploration_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: exploration exploration_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration
    ADD CONSTRAINT exploration_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

