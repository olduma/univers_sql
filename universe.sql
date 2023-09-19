--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    type character varying(20),
    size_ly integer NOT NULL,
    unique_identifier integer,
    has_black_hole boolean
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
    name character varying(20) NOT NULL,
    distance_from_planet_km integer NOT NULL,
    orbital_period_days numeric,
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
    name character varying(20) NOT NULL,
    distance_from_star_km bigint NOT NULL,
    diameter_km integer,
    mass_comparison numeric,
    atmospheric_composition text,
    number_of_moons integer NOT NULL,
    has_ring_system boolean,
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
    name character varying(20),
    distance_ly numeric NOT NULL,
    star_type_id integer,
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
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer DEFAULT nextval('public.star_type_star_type_id_seq'::regclass) NOT NULL,
    name character varying(20) NOT NULL,
    temperature_kelvin integer NOT NULL,
    radius_comparison numeric,
    mass_comparison numeric,
    luminosity numeric
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 87400, 1, NULL);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'irregular', 32200, 291, NULL);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'irregular', 18900, 292, NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'spiral', 152000, 224, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'spiral', 61100, 598, NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus', 'spiral', 60000, 5128, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384000, 27.3, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9377, 0.319, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23458, 1.262, 4);
INSERT INTO public.moon VALUES (4, 'Io', 421800, 1.769, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 671100, 3.551, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, 7.155, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, 16.689, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1221870, 15.95, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 238020, 1.37, 6);
INSERT INTO public.moon VALUES (10, 'Titania', 436300, 8.71, 7);
INSERT INTO public.moon VALUES (11, 'Oberon', 583520, 13.46, 7);
INSERT INTO public.moon VALUES (12, 'Triton', 354800, 5.88, 8);
INSERT INTO public.moon VALUES (13, 'Charon', 19591, 6.39, 9);
INSERT INTO public.moon VALUES (14, 'Dysnomia', 375, 15.77, 10);
INSERT INTO public.moon VALUES (15, 'Hiaka', 49980, 49.12, 11);
INSERT INTO public.moon VALUES (16, 'Namaka', 25657, 18.28, 11);
INSERT INTO public.moon VALUES (17, 'MK2', 21102, 12.4, 12);
INSERT INTO public.moon VALUES (18, 'Styx', 42240, 20.16, 12);
INSERT INTO public.moon VALUES (19, 'Nix', 48600, 5, 12);
INSERT INTO public.moon VALUES (20, 'Hydra', 64000, 38.2, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 57910000, 4880, 0.055, 'Mostly thin atmosphere', 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108200000, 12104, 0.815, 'Thick CO2 atmosphere', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 149000000, 12742, 1.0, 'Nitrogen and Oxygen', 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 227900000, 6779, 0.107, 'Thin CO2 atmosphere', 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778300000, 139822, 318.00, 'Hydrogen and Helium', 79, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1427000000, 116464, 95.2, 'Hydrogen and Helium', 83, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2870000000, 50724, 14.6, 'Hydrogen and Helium', 27, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4498000000, 49244, 17.2, 'Hydrogen and Helium', 14, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5906380000, 2377, 0.0022, 'Thin Nitrogen', 5, false, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 10100000000, 2326, 0.0028, 'Thin Nitrogen', 1, false, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 6452000000, 1960, 0.0007, 'Thin Nitrigen', 2, false, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 6850000000, 1430, 0.0007, 'Thin Nitrogen', 1, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 5, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 8.6, 3, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 4.37, 5, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4.24, 7, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 642.5, 7, 1);
INSERT INTO public.star VALUES (6, 'Aldebaran', 65, 6, 1);
INSERT INTO public.star VALUES (7, 'Vega', 25.3, 3, 1);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'O', 40000, 10, 50, 100000);
INSERT INTO public.star_type VALUES (2, 'B', 20000, 5, 10, 1000);
INSERT INTO public.star_type VALUES (3, 'A', 8500, 1.7, 2.0, 20);
INSERT INTO public.star_type VALUES (4, 'F', 6500, 1.3, 1.5, 4);
INSERT INTO public.star_type VALUES (5, 'G', 5700, 1.0, 1.0, 1.0);
INSERT INTO public.star_type VALUES (6, 'K', 4500, 0.8, 0.7, 0.2);
INSERT INTO public.star_type VALUES (7, 'M', 3200, 0.3, 0.2, 0.01);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 1, false);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_name_key UNIQUE (name);


--
-- Name: star_type star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_type_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


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

