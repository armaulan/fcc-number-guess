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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    total_guess integer DEFAULT 0,
    is_correct boolean DEFAULT false,
    number integer NOT NULL
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
-- Name: guess_history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess_history (
    game_id integer,
    user_id integer,
    guess_number integer
);


ALTER TABLE public.guess_history OWNER TO freecodecamp;

--
-- Name: username_trace; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.username_trace (
    username character varying(100)
);


ALTER TABLE public.username_trace OWNER TO freecodecamp;

--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    username character varying(50) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: guess_history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guess_history VALUES (202, 66, 0);
INSERT INTO public.guess_history VALUES (202, 66, 1);
INSERT INTO public.guess_history VALUES (202, 66, 2);
INSERT INTO public.guess_history VALUES (202, 66, 3);
INSERT INTO public.guess_history VALUES (202, 66, 4);
INSERT INTO public.guess_history VALUES (202, 66, 5);
INSERT INTO public.guess_history VALUES (202, 66, 6);
INSERT INTO public.guess_history VALUES (202, 66, 7);
INSERT INTO public.guess_history VALUES (202, 66, 8);
INSERT INTO public.guess_history VALUES (203, 66, 0);
INSERT INTO public.guess_history VALUES (203, 66, 1);
INSERT INTO public.guess_history VALUES (203, 66, 2);
INSERT INTO public.guess_history VALUES (203, 66, 3);
INSERT INTO public.guess_history VALUES (203, 66, 4);
INSERT INTO public.guess_history VALUES (203, 66, 5);
INSERT INTO public.guess_history VALUES (203, 66, 6);
INSERT INTO public.guess_history VALUES (203, 66, 7);
INSERT INTO public.guess_history VALUES (203, 66, 8);
INSERT INTO public.guess_history VALUES (204, 67, 0);
INSERT INTO public.guess_history VALUES (204, 67, 1);
INSERT INTO public.guess_history VALUES (204, 67, 2);
INSERT INTO public.guess_history VALUES (204, 67, 3);
INSERT INTO public.guess_history VALUES (204, 67, 4);
INSERT INTO public.guess_history VALUES (204, 67, 5);
INSERT INTO public.guess_history VALUES (204, 67, 6);
INSERT INTO public.guess_history VALUES (204, 67, 7);
INSERT INTO public.guess_history VALUES (204, 67, 8);
INSERT INTO public.guess_history VALUES (205, 67, 0);
INSERT INTO public.guess_history VALUES (205, 67, 1);
INSERT INTO public.guess_history VALUES (205, 67, 2);
INSERT INTO public.guess_history VALUES (205, 67, 3);
INSERT INTO public.guess_history VALUES (205, 67, 4);
INSERT INTO public.guess_history VALUES (205, 67, 5);
INSERT INTO public.guess_history VALUES (205, 67, 6);
INSERT INTO public.guess_history VALUES (206, 66, 1001);
INSERT INTO public.guess_history VALUES (206, 66, 0);
INSERT INTO public.guess_history VALUES (206, 66, 1);
INSERT INTO public.guess_history VALUES (207, 66, 0);
INSERT INTO public.guess_history VALUES (207, 66, 1);
INSERT INTO public.guess_history VALUES (207, 66, 2);
INSERT INTO public.guess_history VALUES (207, 66, 3);
INSERT INTO public.guess_history VALUES (207, 66, 4);
INSERT INTO public.guess_history VALUES (207, 66, 5);
INSERT INTO public.guess_history VALUES (207, 66, 6);
INSERT INTO public.guess_history VALUES (208, 66, 0);
INSERT INTO public.guess_history VALUES (208, 66, 1);
INSERT INTO public.guess_history VALUES (208, 66, 2);
INSERT INTO public.guess_history VALUES (208, 66, 3);
INSERT INTO public.guess_history VALUES (208, 66, 4);
INSERT INTO public.guess_history VALUES (208, 66, 5);
INSERT INTO public.guess_history VALUES (208, 66, 6);
INSERT INTO public.guess_history VALUES (208, 66, 7);
INSERT INTO public.guess_history VALUES (208, 66, 8);
INSERT INTO public.guess_history VALUES (208, 66, 9);


--
-- Data for Name: username_trace; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.username_trace VALUES ('user_1668293523262');
INSERT INTO public.username_trace VALUES ('user_1668293523262');
INSERT INTO public.username_trace VALUES ('user_1668293523261');
INSERT INTO public.username_trace VALUES ('user_1668293523261');
INSERT INTO public.username_trace VALUES ('user_1668293523262');
INSERT INTO public.username_trace VALUES ('user_1668293523262');
INSERT INTO public.username_trace VALUES ('user_1668293523262');
INSERT INTO public.username_trace VALUES ('user_1668293577665');
INSERT INTO public.username_trace VALUES ('user_1668293577665');
INSERT INTO public.username_trace VALUES ('user_1668293577664');
INSERT INTO public.username_trace VALUES ('user_1668293577664');
INSERT INTO public.username_trace VALUES ('user_1668293577665');
INSERT INTO public.username_trace VALUES ('user_1668293577665');
INSERT INTO public.username_trace VALUES ('user_1668293577665');
INSERT INTO public.username_trace VALUES ('arya');
INSERT INTO public.username_trace VALUES ('belly');
INSERT INTO public.username_trace VALUES ('user_1668293905386');
INSERT INTO public.username_trace VALUES ('user_1668293905386');
INSERT INTO public.username_trace VALUES ('user_1668293905385');
INSERT INTO public.username_trace VALUES ('user_1668293905385');
INSERT INTO public.username_trace VALUES ('user_1668293905386');
INSERT INTO public.username_trace VALUES ('user_1668293905386');
INSERT INTO public.username_trace VALUES ('user_1668293905386');
INSERT INTO public.username_trace VALUES ('user_1668293991415');
INSERT INTO public.username_trace VALUES ('user_1668293991415');
INSERT INTO public.username_trace VALUES ('user_1668293991414');
INSERT INTO public.username_trace VALUES ('user_1668293991414');
INSERT INTO public.username_trace VALUES ('user_1668293991415');
INSERT INTO public.username_trace VALUES ('user_1668293991415');
INSERT INTO public.username_trace VALUES ('user_1668293991415');


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (146, 'user_1668298730603', 2, 12);
INSERT INTO public.users VALUES (132, 'user_1668298483243', 2, 3);
INSERT INTO public.users VALUES (145, 'user_1668298730604', 5, 6);
INSERT INTO public.users VALUES (131, 'user_1668298483244', 5, 3);
INSERT INTO public.users VALUES (148, 'user_1668298735078', 2, 3);
INSERT INTO public.users VALUES (147, 'user_1668298735080', 5, 3);
INSERT INTO public.users VALUES (134, 'user_1668298555795', 2, 2);
INSERT INTO public.users VALUES (133, 'user_1668298555796', 5, 2);
INSERT INTO public.users VALUES (150, 'user_1668298738545', 2, 6);
INSERT INTO public.users VALUES (149, 'user_1668298738546', 5, 7);
INSERT INTO public.users VALUES (136, 'user_1668298563351', 2, 2);
INSERT INTO public.users VALUES (135, 'user_1668298563352', 5, 17);
INSERT INTO public.users VALUES (138, 'user_1668298571285', 2, 9);
INSERT INTO public.users VALUES (137, 'user_1668298571286', 5, 6);
INSERT INTO public.users VALUES (140, 'user_1668298578123', 2, 6);
INSERT INTO public.users VALUES (139, 'user_1668298578124', 5, 8);
INSERT INTO public.users VALUES (142, 'user_1668298584182', 2, 10);
INSERT INTO public.users VALUES (141, 'user_1668298584183', 5, 2);
INSERT INTO public.users VALUES (144, 'user_1668298589730', 2, 3);
INSERT INTO public.users VALUES (143, 'user_1668298589731', 5, 3);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 222, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 150, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

