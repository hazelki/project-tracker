--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: grade; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE grade (
    id integer NOT NULL,
    student_github character varying(30),
    project_title character varying(30),
    grade integer
);


ALTER TABLE public.grade OWNER TO "user";

--
-- Name: grade_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE grade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grade_id_seq OWNER TO "user";

--
-- Name: grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE grade_id_seq OWNED BY grade.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    title character varying(30),
    description text,
    max_grade integer
);


ALTER TABLE public.projects OWNER TO "user";

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO "user";

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE students (
    first_name character varying(30),
    last_name character varying(30),
    github character varying(30)
);


ALTER TABLE public.students OWNER TO "user";

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY grade ALTER COLUMN id SET DEFAULT nextval('grade_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: user
--

COPY grade (id, student_github, project_title, grade) FROM stdin;
1	jhacks	Markov	10
2	jhacks	Blocky	2
3	sdevelops	Markov	50
4	sdevelops	Blocky	100
\.


--
-- Name: grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('grade_id_seq', 4, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: user
--

COPY projects (id, title, description, max_grade) FROM stdin;
1	Markov	Tweets generated from Markov chains	50
2	Blocky	Programmatic Logic Puzzle Game	10
3	Hazel	Memory Game	20
4	Tara	Adventure Game	40
5	Hazra	Combined Game	80
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('projects_id_seq', 5, true);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: user
--

COPY students (first_name, last_name, github) FROM stdin;
Jane	Hacker	jhacks
Sarah	Devoloper	sdevelops
\.


--
-- Name: grade_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

