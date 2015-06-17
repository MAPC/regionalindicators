--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: explanations_indicators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE explanations_indicators (
    explanation_id integer,
    indicator_id integer
);


--
-- Name: explanations_subjects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE explanations_subjects (
    explanation_id integer,
    subject_id integer
);


--
-- Name: goals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE goals (
    id integer NOT NULL,
    number integer,
    title character varying(255),
    topic_area_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying(255)
);


--
-- Name: goals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE goals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE goals_id_seq OWNED BY goals.id;


--
-- Name: indicators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicators (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    units character varying(255),
    number integer,
    objective_id integer,
    subject_id integer,
    threshhold numeric,
    higher_value_is_better boolean DEFAULT true,
    lower_rank_is_better boolean DEFAULT true,
    indicator_group_id integer,
    value_delta integer,
    rank_delta integer
);


--
-- Name: indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE indicators_id_seq OWNED BY indicators.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: searches; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW searches AS
 SELECT goals.id AS searchable_id,
    'Goal'::text AS searchable_type,
    goals.title AS term
   FROM goals
UNION
 SELECT goals.id AS searchable_id,
    'Goal'::text AS searchable_type,
    goals.description AS term
   FROM goals
UNION
 SELECT indicators.id AS searchable_id,
    'Indicator'::text AS searchable_type,
    indicators.title AS term
   FROM indicators;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY goals ALTER COLUMN id SET DEFAULT nextval('goals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicators ALTER COLUMN id SET DEFAULT nextval('indicators_id_seq'::regclass);


--
-- Name: goals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicators
    ADD CONSTRAINT indicators_pkey PRIMARY KEY (id);


--
-- Name: index_goals_on_description; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_goals_on_description ON goals USING gin (to_tsvector('english'::regconfig, (description)::text));


--
-- Name: index_goals_on_title; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_goals_on_title ON goals USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: index_goals_on_topic_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_goals_on_topic_area_id ON goals USING btree (topic_area_id);


--
-- Name: index_indicators_on_indicator_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_indicator_group_id ON indicators USING btree (indicator_group_id);


--
-- Name: index_indicators_on_objective_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_objective_id ON indicators USING btree (objective_id);


--
-- Name: index_indicators_on_subject_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_subject_id ON indicators USING btree (subject_id);


--
-- Name: index_indicators_on_title; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_title ON indicators USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20140131181958');

INSERT INTO schema_migrations (version) VALUES ('20140131182159');

INSERT INTO schema_migrations (version) VALUES ('20140131191119');

INSERT INTO schema_migrations (version) VALUES ('20140131205404');

INSERT INTO schema_migrations (version) VALUES ('20140131232301');

INSERT INTO schema_migrations (version) VALUES ('20140131232940');

INSERT INTO schema_migrations (version) VALUES ('20140201001350');

INSERT INTO schema_migrations (version) VALUES ('20140201001642');

INSERT INTO schema_migrations (version) VALUES ('20140201001754');

INSERT INTO schema_migrations (version) VALUES ('20140201005526');

INSERT INTO schema_migrations (version) VALUES ('20140201010427');

INSERT INTO schema_migrations (version) VALUES ('20140201024924');

INSERT INTO schema_migrations (version) VALUES ('20140201024940');

INSERT INTO schema_migrations (version) VALUES ('20140203191516');

INSERT INTO schema_migrations (version) VALUES ('20140203192115');

INSERT INTO schema_migrations (version) VALUES ('20140203195419');

INSERT INTO schema_migrations (version) VALUES ('20140203195626');

INSERT INTO schema_migrations (version) VALUES ('20140204144851');

INSERT INTO schema_migrations (version) VALUES ('20140204185048');

INSERT INTO schema_migrations (version) VALUES ('20140204214208');

INSERT INTO schema_migrations (version) VALUES ('20140204215839');

INSERT INTO schema_migrations (version) VALUES ('20140205165916');

INSERT INTO schema_migrations (version) VALUES ('20140205175616');

INSERT INTO schema_migrations (version) VALUES ('20140205181254');

INSERT INTO schema_migrations (version) VALUES ('20140205181940');

INSERT INTO schema_migrations (version) VALUES ('20140205230038');

INSERT INTO schema_migrations (version) VALUES ('20140205230039');

INSERT INTO schema_migrations (version) VALUES ('20140205235026');

INSERT INTO schema_migrations (version) VALUES ('20140206151303');

INSERT INTO schema_migrations (version) VALUES ('20140206212421');

INSERT INTO schema_migrations (version) VALUES ('20140207202841');

INSERT INTO schema_migrations (version) VALUES ('20140207225956');

INSERT INTO schema_migrations (version) VALUES ('20140210200951');

INSERT INTO schema_migrations (version) VALUES ('20140212193922');

INSERT INTO schema_migrations (version) VALUES ('20140212204349');

INSERT INTO schema_migrations (version) VALUES ('20140212230701');

INSERT INTO schema_migrations (version) VALUES ('20140326201251');

INSERT INTO schema_migrations (version) VALUES ('20140416204919');

INSERT INTO schema_migrations (version) VALUES ('20140417221951');

INSERT INTO schema_migrations (version) VALUES ('20140422163343');

INSERT INTO schema_migrations (version) VALUES ('20140508161852');

INSERT INTO schema_migrations (version) VALUES ('20140508192416');

INSERT INTO schema_migrations (version) VALUES ('20140511221108');

INSERT INTO schema_migrations (version) VALUES ('20140522232352');

INSERT INTO schema_migrations (version) VALUES ('20140523000507');

INSERT INTO schema_migrations (version) VALUES ('20140529202751');

INSERT INTO schema_migrations (version) VALUES ('20150323193123');

INSERT INTO schema_migrations (version) VALUES ('20150528182101');

INSERT INTO schema_migrations (version) VALUES ('20150528182124');