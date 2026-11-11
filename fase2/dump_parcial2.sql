--
-- PostgreSQL database dump
--

\restrict mzJ0jB0CHrANKGTe0ElDrbrcnyp3SQpDQ6WLm9n8WGAgxB3U5Lil16g2ndGMjQ5

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

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
-- Name: user; Type: TABLE; Schema: public; Owner: parcial2
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    lastname character varying NOT NULL,
    college_code character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO parcial2;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: parcial2
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO parcial2;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parcial2
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: parcial2
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: parcial2
--

COPY public."user" (id, name, lastname, college_code) FROM stdin;
1	Mateo	Noguera	202612345
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: parcial2
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: parcial2
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: ix_user_college_code; Type: INDEX; Schema: public; Owner: parcial2
--

CREATE INDEX ix_user_college_code ON public."user" USING btree (college_code);


--
-- PostgreSQL database dump complete
--

\unrestrict mzJ0jB0CHrANKGTe0ElDrbrcnyp3SQpDQ6WLm9n8WGAgxB3U5Lil16g2ndGMjQ5

