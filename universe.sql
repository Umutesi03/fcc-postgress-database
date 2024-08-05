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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    discovered_by text NOT NULL,
    orbital_period_years numeric NOT NULL,
    has_tail boolean NOT NULL,
    is_periodic boolean NOT NULL,
    brightness_magnitude integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text NOT NULL,
    diameter_km numeric NOT NULL,
    is_active boolean NOT NULL,
    is_visible boolean NOT NULL,
    num_of_stars bigint NOT NULL,
    num_of_planets integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer,
    radius_km numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_tidal_locked boolean NOT NULL,
    orbit_period_days bigint NOT NULL,
    surface_temperature integer NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer,
    radius_km numeric NOT NULL,
    has_life boolean NOT NULL,
    has_rings boolean NOT NULL,
    distance_from_star bigint NOT NULL,
    num_of_moons integer NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    is_main_sequence boolean NOT NULL,
    is_visible boolean NOT NULL,
    age_years bigint NOT NULL,
    num_of_planets integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Edmond Halley', 75.3, true, true, -1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Alan Hale & Thomas Bopp', 2521.0, true, false, -1);
INSERT INTO public.comet VALUES (3, 'Encke', 'Pierre Méchain', 3.3, true, true, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000.0, true, true, 100000000000, 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000.0, true, true, 1000000000000, 8);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000.0, true, false, 40000000000, 5);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 76000.0, false, true, 50000000000, 5);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 50000.0, false, false, 80000000000, 7);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'Spiral', 90000.0, true, true, 300000000000, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.1, false, true, 27, -20);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.1, false, true, 0, -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, false, true, 1, -50);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.6, true, true, 2, -130);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.8, true, true, 4, -160);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.1, true, true, 7, -150);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.3, false, true, 17, -140);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575.5, true, true, 16, -180);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 764.3, false, true, 5, -200);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 734.5, false, true, 79, -220);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561.4, false, true, 3, -230);
INSERT INTO public.moon VALUES (12, 'Triton', 8, 1353.4, true, true, 6, -240);
INSERT INTO public.moon VALUES (13, 'Nereid', 8, 170.0, false, true, 360, -250);
INSERT INTO public.moon VALUES (14, 'Charon', 9, 606.0, false, true, 6, -260);
INSERT INTO public.moon VALUES (15, 'Hydra', 9, 31.5, false, true, 38, -270);
INSERT INTO public.moon VALUES (16, 'Nix', 9, 23.0, false, true, 25, -280);
INSERT INTO public.moon VALUES (17, 'Styx', 9, 16.0, false, true, 20, -290);
INSERT INTO public.moon VALUES (18, 'Kerberos', 9, 19.0, false, true, 32, -300);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 235.8, false, true, 1, -310);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 578.9, false, true, 3, -320);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440.0, false, false, 57900000, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052.0, false, false, 108200000, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371.0, true, false, 149600000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3389.5, false, false, 227900000, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911.0, false, true, 778300000, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232.0, false, true, 1427000000, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362.0, false, true, 2871000000, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622.0, false, true, 4495000000, 14);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 7000.0, false, false, 7600000, 0);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 2, 9000.0, false, false, 7300000, 0);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 3, 65000.0, false, false, 560000000, 0);
INSERT INTO public.planet VALUES (12, 'Sirius b', 4, 12000.0, false, false, 2000000000, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true, true, 4600000000, 8);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 1.1, true, true, 5200000000, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 20.0, false, true, 8500000, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 3, 2.1, true, true, 240000000, 1);
INSERT INTO public.star VALUES (5, 'Vega', 4, 2.2, true, false, 450000000, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 5, 21.0, false, true, 8000000, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

