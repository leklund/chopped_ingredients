SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contestants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contestants (
    id bigint NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contestants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contestants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contestants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contestants_id_seq OWNED BY contestants.id;


--
-- Name: contestants_shows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contestants_shows (
    contestant_id integer NOT NULL,
    show_id integer NOT NULL,
    description character varying,
    "placing" integer
);


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ingredients (
    id bigint NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    appetizer boolean DEFAULT false NOT NULL,
    dessert boolean DEFAULT false NOT NULL,
    entree boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: ingredients_shows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ingredients_shows (
    ingredient_id integer NOT NULL,
    show_id integer NOT NULL,
    round character varying
);


--
-- Name: judges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE judges (
    id bigint NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: judges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE judges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: judges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE judges_id_seq OWNED BY judges.id;


--
-- Name: judges_shows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE judges_shows (
    judge_id integer NOT NULL,
    show_id integer NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE seasons (
    id bigint NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    number character varying,
    sort integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE seasons_id_seq OWNED BY seasons.id;


--
-- Name: shows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shows (
    id bigint NOT NULL,
    title text NOT NULL,
    date date NOT NULL,
    notes text,
    slug text NOT NULL,
    series_num character varying,
    season_num integer,
    season_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: shows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shows_id_seq OWNED BY shows.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying NOT NULL,
    encrypted_password character varying(128) NOT NULL,
    confirmation_token character varying(128),
    remember_token character varying(128) NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: contestants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contestants ALTER COLUMN id SET DEFAULT nextval('contestants_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Name: judges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judges ALTER COLUMN id SET DEFAULT nextval('judges_id_seq'::regclass);


--
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY seasons ALTER COLUMN id SET DEFAULT nextval('seasons_id_seq'::regclass);


--
-- Name: shows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shows ALTER COLUMN id SET DEFAULT nextval('shows_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: contestants contestants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contestants
    ADD CONSTRAINT contestants_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: judges judges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY judges
    ADD CONSTRAINT judges_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: shows shows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_contestants_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_contestants_on_slug ON contestants USING btree (slug);


--
-- Name: index_contestants_shows_on_show_id_and_contestant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_contestants_shows_on_show_id_and_contestant_id ON contestants_shows USING btree (show_id, contestant_id);


--
-- Name: index_ingredients_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ingredients_on_name ON ingredients USING btree (name);


--
-- Name: index_ingredients_on_name_trigram; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ingredients_on_name_trigram ON ingredients USING gin (name gin_trgm_ops);


--
-- Name: index_ingredients_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_ingredients_on_slug ON ingredients USING btree (slug);


--
-- Name: index_ingredients_shows_on_show_id_and_ingredient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ingredients_shows_on_show_id_and_ingredient_id ON ingredients_shows USING btree (show_id, ingredient_id);


--
-- Name: index_judges_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_judges_on_slug ON judges USING btree (slug);


--
-- Name: index_judges_shows_on_show_id_and_judge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_judges_shows_on_show_id_and_judge_id ON judges_shows USING btree (show_id, judge_id);


--
-- Name: index_seasons_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_seasons_on_slug ON seasons USING btree (slug);


--
-- Name: index_shows_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_shows_on_slug ON shows USING btree (slug);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170109172954'),
('20170109173059'),
('20170109173145'),
('20170109173214'),
('20170109183405'),
('20170109184534'),
('20170109185436'),
('20170120202435'),
('20170208190003'),
('20170427150459');


