--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category_neighborhood_combinations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE category_neighborhood_combinations (
    id integer NOT NULL,
    category character varying(255),
    neighborhood character varying(255),
    result_count integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: category_neighborhood_combinations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE category_neighborhood_combinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_neighborhood_combinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE category_neighborhood_combinations_id_seq OWNED BY category_neighborhood_combinations.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE places (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    address_extended character varying(255),
    po_box character varying(255),
    locality character varying(255),
    region character varying(255),
    postcode character varying(255),
    website character varying(255),
    country character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    factual_id character varying(255),
    tel character varying(255),
    fax character varying(255),
    email character varying(255),
    chain_id character varying(255),
    chain_name character varying(255),
    neighborhood character varying(255)[] DEFAULT '{}'::character varying[],
    admin_region character varying(255),
    category_ids character varying(255)[] DEFAULT '{}'::character varying[],
    category_labels character varying(255)[] DEFAULT '{}'::character varying[],
    hours hstore,
    hours_display text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE places_id_seq OWNED BY places.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY category_neighborhood_combinations ALTER COLUMN id SET DEFAULT nextval('category_neighborhood_combinations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Name: category_neighborhood_combinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY category_neighborhood_combinations
    ADD CONSTRAINT category_neighborhood_combinations_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141123143833');

INSERT INTO schema_migrations (version) VALUES ('20141206161245');

