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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(20),
    constellation_id integer,
    distance_in_light_years integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    family character varying(30),
    hemisphere character varying(20),
    stars_with_planets integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    magnitude numeric(4,2),
    constellation_id integer,
    ngc integer
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
    distance_from_planet integer,
    magnitude numeric(4,2),
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
    description text,
    moons integer,
    has_life boolean DEFAULT false,
    has_rings boolean DEFAULT false,
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
    name character varying(30),
    magnitude numeric(3,2) NOT NULL,
    spectral_class character varying(20),
    constellation_id integer,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'KV UMa', 'stellar', 3, NULL);
INSERT INTO public.black_hole VALUES (2, 'M82 X-1', 'intermediate', 3, NULL);
INSERT INTO public.black_hole VALUES (3, 'Great Annihilator', 'intermediate', 21, NULL);
INSERT INTO public.black_hole VALUES (4, 'HLX-1', 'intermediate', 18, NULL);
INSERT INTO public.black_hole VALUES (5, 'Messier 15', 'intermediate', 17, NULL);
INSERT INTO public.black_hole VALUES (6, 'GRO J0422+32', 'stellar', 11, NULL);
INSERT INTO public.black_hole VALUES (7, 'M87*', 'SMB', 6, NULL);
INSERT INTO public.black_hole VALUES (8, 'PKS 1302-102', 'double', 6, NULL);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Perseus', 'Northern', 19);
INSERT INTO public.constellation VALUES (2, 'Antlia', 'LaCaille', 'Southern', 2);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'Ursa Major', 'Northern', 21);
INSERT INTO public.constellation VALUES (4, 'Aquila', 'Hercules', 'Northern', 9);
INSERT INTO public.constellation VALUES (5, 'Cassiopeia', 'Perseus', 'Northern', 14);
INSERT INTO public.constellation VALUES (6, 'Virgo', 'Zodiacal', 'Southern', 32);
INSERT INTO public.constellation VALUES (7, 'Leo', 'Zodiacal', 'Northern', 19);
INSERT INTO public.constellation VALUES (8, 'Aquarius', 'Zodiacal', 'Southern', 17);
INSERT INTO public.constellation VALUES (9, 'Canis Major', 'Orion', 'Southern', 9);
INSERT INTO public.constellation VALUES (10, 'Dorado', 'Bayer', 'Southern', 5);
INSERT INTO public.constellation VALUES (11, 'Perseus', 'Perseus', 'Northern', 7);
INSERT INTO public.constellation VALUES (12, 'Auriga', 'Perseus', 'Northern', 8);
INSERT INTO public.constellation VALUES (13, 'Columba', 'Heavenly Waters', 'Southern', 3);
INSERT INTO public.constellation VALUES (14, 'Tucana', 'Bayer', 'Southern', 9);
INSERT INTO public.constellation VALUES (15, 'Cepheus', 'Perseus', 'Northern', 3);
INSERT INTO public.constellation VALUES (16, 'Grus', 'Bayer', 'Southern', 6);
INSERT INTO public.constellation VALUES (17, 'Pegasus', 'Perseus', 'Northern', 19);
INSERT INTO public.constellation VALUES (18, 'Pheonix', 'Bayer', 'Southern', 11);
INSERT INTO public.constellation VALUES (19, 'Ursa Minor', 'Ursa Major', 'Northern', 6);
INSERT INTO public.constellation VALUES (20, 'Draco', 'Ursa Major', 'Northern', 22);
INSERT INTO public.constellation VALUES (21, 'Ophiuchus', 'Hercules', 'Southern', 19);
INSERT INTO public.constellation VALUES (22, 'Scorpius', 'Zodiacal', 'Southern', 17);
INSERT INTO public.constellation VALUES (23, 'Hercules', 'Hercules', 'Northern', 23);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Bodes Galaxy', 'spiral', 6.94, 3, 3031);
INSERT INTO public.galaxy VALUES (2, 'Cigar Galaxy', 'starburst', 8.41, 3, NULL);
INSERT INTO public.galaxy VALUES (3, 'Aquarius Dwarf', 'irregular dwarf', 14.00, 8, NULL);
INSERT INTO public.galaxy VALUES (4, 'Atoms-for-Peace', 'peculiar', 12.70, 8, 7252);
INSERT INTO public.galaxy VALUES (5, 'Butterfly', 'unbarred spiral', 10.90, 6, NULL);
INSERT INTO public.galaxy VALUES (6, 'Draco Dwarf', 'spheroidal', 10.90, 20, NULL);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 'lenticular', 8.98, 6, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400, -12.74, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9380, 11.30, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 12.40, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1070000, 4.61, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 670900, 5.29, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 181300, 14.10, 5);
INSERT INTO public.moon VALUES (7, 'Elara', 11737000, 16.77, 5);
INSERT INTO public.moon VALUES (8, 'Metis', 127969, 17.50, 5);
INSERT INTO public.moon VALUES (9, 'Leda', 11094000, 20.20, 5);
INSERT INTO public.moon VALUES (10, 'Sinope', 23700000, 18.30, 5);
INSERT INTO public.moon VALUES (11, 'Ananke', 21200000, 18.90, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 1221850, 8.28, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 294660, 10.20, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 527040, 9.70, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 377400, 10.40, 6);
INSERT INTO public.moon VALUES (16, 'Hyperion', 1481000, 14.19, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 191240, 14.16, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 435840, 13.73, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 582600, 13.94, 7);
INSERT INTO public.moon VALUES (20, 'Thalassa', 50000, 23.80, 8);
INSERT INTO public.moon VALUES (21, 'Naiad:', 48000, 24.70, 8);
INSERT INTO public.moon VALUES (22, 'Triton', 354800, 13.47, 8);
INSERT INTO public.moon VALUES (23, 'Charon', NULL, 22.90, 9);
INSERT INTO public.moon VALUES (24, 'Nix', NULL, 23.38, 9);
INSERT INTO public.moon VALUES (25, 'Styx', NULL, 27.00, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 'Iron Planet', 0, false, false, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 'Pressure Cooker Planet', 0, false, false, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 'Desert Rust Planet', 2, false, false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Hydrogen Gas Giant', 67, false, true, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ring Gas Planet', 62, false, true, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Sideways Planet', 27, false, true, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue Methane Planet', 14, false, true, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Former 9th Planet', 5, false, false, 9);
INSERT INTO public.planet VALUES (10, 'Eris', 'Trans-neptunian Dwarf Planet', 1, false, false, 10);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Trans-neptunian Dwarf Planet', 2, false, false, 11);
INSERT INTO public.planet VALUES (12, 'Ceres', 'Ice Dwarf', 0, false, false, 12);
INSERT INTO public.planet VALUES (1, 'Earth', 'Goldilocks Planet', 1, true, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Epsilon Ursa Majoris', 1.81, 'A0p', 3, 1);
INSERT INTO public.star VALUES (2, 'Alpha Ursa Majoris', 1.81, 'F7V comp', 3, 1);
INSERT INTO public.star VALUES (3, 'Alpha Ursa Minoris', 1.97, 'F7:Ib-IIv SB', 19, 1);
INSERT INTO public.star VALUES (4, 'Epsilon Ursa Minoris', 4.21, 'G5IIIvar', 19, 1);
INSERT INTO public.star VALUES (5, 'Alpha Cassiopeiae', 2.24, 'K0II-IIIvar', 5, 2);
INSERT INTO public.star VALUES (6, 'Beta Cassiopeiae', 2.28, 'F2III-IV', 5, 2);
INSERT INTO public.star VALUES (7, 'Alpha Virginis', 0.98, 'B1V', 6, 2);
INSERT INTO public.star VALUES (8, 'Gamma Virginis', 2.74, 'F0V+', 6, 2);
INSERT INTO public.star VALUES (9, 'Virginis', 3.73, 'A0V', 6, 3);
INSERT INTO public.star VALUES (10, 'Alpha Leonis ', 1.36, 'B7V', 7, 3);
INSERT INTO public.star VALUES (11, 'Beta Leonis', 2.14, 'A3Vvar', 7, 3);
INSERT INTO public.star VALUES (12, 'Beta Aquarii', 2.90, 'G0Ib', 8, 3);
INSERT INTO public.star VALUES (13, 'Alpha Aquarii', 2.95, 'G2Ib', 8, 4);
INSERT INTO public.star VALUES (14, 'Zeta Canis Majoris', 3.02, 'B2.5V', 9, 4);
INSERT INTO public.star VALUES (15, 'Delta Herculis ', 3.12, NULL, 23, 4);
INSERT INTO public.star VALUES (16, 'Alpha Doradus', 3.30, 'A0IIIp (Si)', 10, 4);
INSERT INTO public.star VALUES (17, 'Alpha Persei', 1.79, 'F5Ib', 11, 5);
INSERT INTO public.star VALUES (18, 'Alpha Aurigae', 0.08, 'G8III / G0III', 12, 5);
INSERT INTO public.star VALUES (19, 'Alpha Columbae', 2.65, 'B7IV', 13, 5);
INSERT INTO public.star VALUES (20, 'Alpha Tucanae', 2.87, NULL, 14, 5);
INSERT INTO public.star VALUES (21, 'Alpha Cepheus ', 2.45, NULL, 15, 6);
INSERT INTO public.star VALUES (22, 'Alpha Gruis ', 1.73, NULL, 16, 6);
INSERT INTO public.star VALUES (23, 'Epsilon Pegasi ', 2.38, NULL, 17, 6);
INSERT INTO public.star VALUES (24, 'Alpha Phoenicis ', 2.40, NULL, 18, 6);
INSERT INTO public.star VALUES (25, 'Gamma Draconis', 2.24, NULL, 20, 7);
INSERT INTO public.star VALUES (27, 'Alpha Ophiuchi', 2.08, 'A5III', 21, 7);
INSERT INTO public.star VALUES (28, 'Alpha Scorpii', 0.91, NULL, 22, 7);
INSERT INTO public.star VALUES (29, 'Beta Herculis', 2.78, 'G8III', 23, 7);
INSERT INTO public.star VALUES (30, 'Gamma Herculis', 3.74, 'A9III', 23, 7);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 2, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 2, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 2, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: black_hole black_hole_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

