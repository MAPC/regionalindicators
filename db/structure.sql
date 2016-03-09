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
-- Name: regionalindicators; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA regionalindicators;


--
-- Name: SCHEMA regionalindicators; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA regionalindicators IS 'Regional Indicators';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: listings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE listings (
    id integer NOT NULL,
    location geometry(Point,4326),
    ask integer,
    bedrooms integer,
    title character varying,
    address character varying,
    posting_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    source_id integer,
    survey_id integer,
    payload json
);


--
-- Name: listings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE listings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE listings_id_seq OWNED BY listings.id;


--
-- Name: listings_weighted; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE listings_weighted (
    id integer NOT NULL,
    geom geometry(MultiPolygon,4326),
    geoid character varying(254),
    name character varying(254),
    b25003001 numeric,
    b2500300_1 numeric,
    b25003002 numeric,
    b2500300_2 numeric,
    b25003003 numeric,
    b2500300_3 numeric,
    acs2013_5y numeric,
    acs2013__1 numeric,
    renter_sha numeric,
    vacancy_ra numeric,
    listings integer,
    ask_mean numeric
);


--
-- Name: listings_weighted_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE listings_weighted_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listings_weighted_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE listings_weighted_id_seq OWNED BY listings_weighted.id;


--
-- Name: municipalities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE municipalities (
    id integer NOT NULL,
    geom geometry(MultiPolygon,4326),
    town_id integer,
    town character varying(21),
    subregion character varying(19)
);


--
-- Name: municipalities_backup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE municipalities_backup (
    id integer NOT NULL,
    geom geometry(MultiPolygon,4326),
    geoid character varying,
    name character varying,
    "B25003001 - Total:" double precision,
    "B25003001 - Total:, Error" double precision,
    "B25003002 - Owner occupied" double precision,
    "B25003002 - Owner occupied, Error" double precision,
    "B25003003 - Renter occupied" double precision,
    "B25003003 - Renter occupied, Error" double precision
);


--
-- Name: municipalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE municipalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: municipalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE municipalities_id_seq OWNED BY municipalities_backup.id;


--
-- Name: municipalities_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE municipalities_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: municipalities_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE municipalities_id_seq1 OWNED BY municipalities.id;


--
-- Name: parcels_ma_poly; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parcels_ma_poly (
    ogc_fid integer NOT NULL,
    wkb_geometry geometry(MultiPolygon,26986),
    mapc_id integer,
    muni_id integer,
    muni character varying,
    parloc_id character varying,
    poly_typ character varying,
    map_num character varying,
    mappar_id character varying,
    loc_id_cnt integer,
    land_value double precision,
    bldg_value double precision,
    othr_value double precision,
    total_value double precision,
    ls_price double precision,
    ls_date character varying,
    bldg_area double precision,
    res_area double precision,
    luc_1 character varying,
    luc_2 character varying,
    luc_adj_1 character varying,
    luc_adj_2 character varying,
    num_units double precision,
    units_est double precision,
    units_src character varying,
    num_rooms double precision,
    yr_built integer,
    site_addr character varying,
    addr_str character varying,
    addr_num character varying,
    addr_zip character varying,
    owner_name character varying,
    owner_addr character varying,
    owner_city character varying,
    owner_stat character varying,
    owner_zip character varying,
    fy integer,
    lot_areaft double precision,
    far double precision,
    pct_imperv double precision,
    pct_bldg double precision,
    pct_pave double precision,
    landv_pac double precision,
    bldgv_psf double precision,
    totv_pac double precision,
    bldlnd_rat double precision,
    sqm_imperv double precision,
    sqm_bldg double precision,
    sqm_pave double precision,
    realesttyp character varying,
    shape_length double precision,
    shape_area double precision,
    size integer,
    cum_size integer
);


--
-- Name: parcels_ma_poly_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parcels_ma_poly_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parcels_ma_poly_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parcels_ma_poly_ogc_fid_seq OWNED BY parcels_ma_poly.ogc_fid;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sources (
    id integer NOT NULL,
    title character varying,
    website character varying,
    script character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sources_id_seq OWNED BY sources.id;


--
-- Name: surveys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE surveys (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE surveys_id_seq OWNED BY surveys.id;


--
-- Name: tenure_vacancy; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tenure_vacancy (
    id integer NOT NULL,
    geom geometry(MultiPolygon,4326),
    geoid character varying,
    name character varying,
    "B25003001 - Total:" double precision,
    "B25003001 - Total:, Error" double precision,
    "B25003002 - Owner occupied" double precision,
    "B25003002 - Owner occupied, Error" double precision,
    "B25003003 - Renter occupied" double precision,
    "B25003003 - Renter occupied, Error" double precision,
    "acs2013_5yr_B25004_14000US25023530400_B25004002 - For rent" double precision,
    "acs2013_5yr_B25001_14000US25023530400_B25001001 - Total" double precision,
    renter_share double precision,
    vacancy_rate double precision
);


--
-- Name: tenure_vacancy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tenure_vacancy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tenure_vacancy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tenure_vacancy_id_seq OWNED BY tenure_vacancy.id;


SET search_path = regionalindicators, pg_catalog;

--
-- Name: explanations; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE explanations (
    id integer NOT NULL,
    narrative text,
    explainable_id integer,
    explainable_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: explanations_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE explanations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: explanations_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE explanations_id_seq OWNED BY explanations.id;


--
-- Name: explanations_sources; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE explanations_sources (
    id integer NOT NULL,
    explanation_id integer,
    source_id integer
);


--
-- Name: explanations_sources_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE explanations_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: explanations_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE explanations_sources_id_seq OWNED BY explanations_sources.id;


--
-- Name: goals; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
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
-- Name: goals_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE goals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE goals_id_seq OWNED BY goals.id;


--
-- Name: indicator_groups; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE indicator_groups (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: indicator_groups_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE indicator_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: indicator_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE indicator_groups_id_seq OWNED BY indicator_groups.id;


--
-- Name: indicators; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
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
    rank_delta integer,
    visible boolean DEFAULT true
);


--
-- Name: indicators_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE indicators_id_seq OWNED BY indicators.id;


--
-- Name: indicators_issue_areas; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE indicators_issue_areas (
    id integer NOT NULL,
    indicator_id integer,
    issue_area_id integer
);


--
-- Name: indicators_issue_areas_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE indicators_issue_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: indicators_issue_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE indicators_issue_areas_id_seq OWNED BY indicators_issue_areas.id;


--
-- Name: issue_areas; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE issue_areas (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    datacommon_url character varying(255),
    sort_order integer
);


--
-- Name: issue_areas_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE issue_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: issue_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE issue_areas_id_seq OWNED BY issue_areas.id;


--
-- Name: objectives; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE objectives (
    id integer NOT NULL,
    title character varying(255),
    goal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying(255)
);


--
-- Name: objectives_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE objectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: objectives_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE objectives_id_seq OWNED BY objectives.id;


--
-- Name: rails_admin_histories; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE rails_admin_histories (
    id integer NOT NULL,
    message text,
    username character varying(255),
    item integer,
    "table" character varying(255),
    month smallint,
    year bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE rails_admin_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE rails_admin_histories_id_seq OWNED BY rails_admin_histories.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: searches; Type: VIEW; Schema: regionalindicators; Owner: -
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
-- Name: snapshots; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE snapshots (
    id integer NOT NULL,
    date timestamp without time zone,
    value integer,
    rank integer,
    indicator_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: snapshots_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE snapshots_id_seq OWNED BY snapshots.id;


--
-- Name: sources; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE sources (
    id integer NOT NULL,
    title character varying(255),
    url character varying(255),
    date timestamp without time zone,
    comment text,
    author character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE sources_id_seq OWNED BY sources.id;


--
-- Name: static_pages; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE static_pages (
    id integer NOT NULL,
    title character varying(255),
    content text,
    slug_id character varying(255),
    top boolean,
    sort_order integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: static_pages_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE static_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: static_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE static_pages_id_seq OWNED BY static_pages.id;


--
-- Name: subjects; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE subjects (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    topic_area_id integer,
    sort_order integer
);


--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: topic_areas; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE topic_areas (
    id integer NOT NULL,
    abbr character varying(255),
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subtitle character varying(255),
    explanation_id integer,
    visible boolean,
    featured boolean,
    dashboard_framing text
);


--
-- Name: topic_areas_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE topic_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topic_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE topic_areas_id_seq OWNED BY topic_areas.id;


--
-- Name: users; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: visualizations; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE visualizations (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    explanation_id integer,
    data_file_name character varying(255),
    data_content_type character varying(255),
    data_file_size integer,
    data_updated_at timestamp without time zone,
    d3_file_name character varying(255),
    d3_content_type character varying(255),
    d3_file_size integer,
    d3_updated_at timestamp without time zone
);


--
-- Name: visualizations_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: -
--

CREATE SEQUENCE visualizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visualizations_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: -
--

ALTER SEQUENCE visualizations_id_seq OWNED BY visualizations.id;


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY listings ALTER COLUMN id SET DEFAULT nextval('listings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY listings_weighted ALTER COLUMN id SET DEFAULT nextval('listings_weighted_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY municipalities ALTER COLUMN id SET DEFAULT nextval('municipalities_id_seq1'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY municipalities_backup ALTER COLUMN id SET DEFAULT nextval('municipalities_id_seq'::regclass);


--
-- Name: ogc_fid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcels_ma_poly ALTER COLUMN ogc_fid SET DEFAULT nextval('parcels_ma_poly_ogc_fid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY surveys ALTER COLUMN id SET DEFAULT nextval('surveys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tenure_vacancy ALTER COLUMN id SET DEFAULT nextval('tenure_vacancy_id_seq'::regclass);


SET search_path = regionalindicators, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY explanations ALTER COLUMN id SET DEFAULT nextval('explanations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY explanations_sources ALTER COLUMN id SET DEFAULT nextval('explanations_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY goals ALTER COLUMN id SET DEFAULT nextval('goals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY indicator_groups ALTER COLUMN id SET DEFAULT nextval('indicator_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY indicators ALTER COLUMN id SET DEFAULT nextval('indicators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY indicators_issue_areas ALTER COLUMN id SET DEFAULT nextval('indicators_issue_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY issue_areas ALTER COLUMN id SET DEFAULT nextval('issue_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY objectives ALTER COLUMN id SET DEFAULT nextval('objectives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY rails_admin_histories ALTER COLUMN id SET DEFAULT nextval('rails_admin_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY snapshots ALTER COLUMN id SET DEFAULT nextval('snapshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY static_pages ALTER COLUMN id SET DEFAULT nextval('static_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY topic_areas ALTER COLUMN id SET DEFAULT nextval('topic_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: -
--

ALTER TABLE ONLY visualizations ALTER COLUMN id SET DEFAULT nextval('visualizations_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY listings
    ADD CONSTRAINT listings_pkey PRIMARY KEY (id);


--
-- Name: listings_weighted_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY listings_weighted
    ADD CONSTRAINT listings_weighted_pkey PRIMARY KEY (id);


--
-- Name: municipalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY municipalities_backup
    ADD CONSTRAINT municipalities_pkey PRIMARY KEY (id);


--
-- Name: municipalities_pkey1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY municipalities
    ADD CONSTRAINT municipalities_pkey1 PRIMARY KEY (id);


--
-- Name: parcels_ma_poly_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parcels_ma_poly
    ADD CONSTRAINT parcels_ma_poly_pkey PRIMARY KEY (ogc_fid);


--
-- Name: sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- Name: tenure_vacancy_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tenure_vacancy
    ADD CONSTRAINT tenure_vacancy_pkey PRIMARY KEY (id);


SET search_path = regionalindicators, pg_catalog;

--
-- Name: explanations_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY explanations
    ADD CONSTRAINT explanations_pkey PRIMARY KEY (id);


--
-- Name: explanations_sources_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY explanations_sources
    ADD CONSTRAINT explanations_sources_pkey PRIMARY KEY (id);


--
-- Name: goals_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: indicator_groups_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicator_groups
    ADD CONSTRAINT indicator_groups_pkey PRIMARY KEY (id);


--
-- Name: indicators_issue_areas_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicators_issue_areas
    ADD CONSTRAINT indicators_issue_areas_pkey PRIMARY KEY (id);


--
-- Name: indicators_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicators
    ADD CONSTRAINT indicators_pkey PRIMARY KEY (id);


--
-- Name: issue_areas_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY issue_areas
    ADD CONSTRAINT issue_areas_pkey PRIMARY KEY (id);


--
-- Name: objectives_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY objectives
    ADD CONSTRAINT objectives_pkey PRIMARY KEY (id);


--
-- Name: rails_admin_histories_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rails_admin_histories
    ADD CONSTRAINT rails_admin_histories_pkey PRIMARY KEY (id);


--
-- Name: snapshots_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY snapshots
    ADD CONSTRAINT snapshots_pkey PRIMARY KEY (id);


--
-- Name: sources_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: static_pages_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: topic_areas_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY topic_areas
    ADD CONSTRAINT topic_areas_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visualizations_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: -; Tablespace: 
--

ALTER TABLE ONLY visualizations
    ADD CONSTRAINT visualizations_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: index_listings_on_source_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_listings_on_source_id ON listings USING btree (source_id);


--
-- Name: index_listings_on_survey_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_listings_on_survey_id ON listings USING btree (survey_id);


--
-- Name: parcels_ma_poly_wkb_geometry_geom_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX parcels_ma_poly_wkb_geometry_geom_idx ON parcels_ma_poly USING gist (wkb_geometry);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


SET search_path = regionalindicators, pg_catalog;

--
-- Name: index_explanations_sources_on_explanation_id_and_source_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_explanations_sources_on_explanation_id_and_source_id ON explanations_sources USING btree (explanation_id, source_id);


--
-- Name: index_goals_on_description; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_goals_on_description ON goals USING gin (to_tsvector('english'::regconfig, (description)::text));


--
-- Name: index_goals_on_title; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_goals_on_title ON goals USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: index_goals_on_topic_area_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_goals_on_topic_area_id ON goals USING btree (topic_area_id);


--
-- Name: index_indicators_issue_areas_on_indicator_id_and_issue_area_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_indicators_issue_areas_on_indicator_id_and_issue_area_id ON indicators_issue_areas USING btree (indicator_id, issue_area_id);


--
-- Name: index_indicators_on_indicator_group_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_indicator_group_id ON indicators USING btree (indicator_group_id);


--
-- Name: index_indicators_on_objective_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_objective_id ON indicators USING btree (objective_id);


--
-- Name: index_indicators_on_subject_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_subject_id ON indicators USING btree (subject_id);


--
-- Name: index_indicators_on_title; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_indicators_on_title ON indicators USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: index_objectives_on_goal_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_objectives_on_goal_id ON objectives USING btree (goal_id);


--
-- Name: index_rails_admin_histories; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_rails_admin_histories ON rails_admin_histories USING btree (item, "table", month, year);


--
-- Name: index_snapshots_on_indicator_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_snapshots_on_indicator_id ON snapshots USING btree (indicator_id);


--
-- Name: index_subjects_on_topic_area_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_subjects_on_topic_area_id ON subjects USING btree (topic_area_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_visualizations_on_explanation_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE INDEX index_visualizations_on_explanation_id ON visualizations USING btree (explanation_id);


--
-- Name: index_visualizations_on_title_and_explanation_id; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_visualizations_on_title_and_explanation_id ON visualizations USING btree (title, explanation_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: regionalindicators; Owner: -; Tablespace: 
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

INSERT INTO schema_migrations (version) VALUES ('20150618171502');