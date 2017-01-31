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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE api_keys (
    id integer NOT NULL,
    user_id integer,
    token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- Name: broadcasts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE broadcasts (
    id integer NOT NULL,
    subject character varying,
    body character varying,
    scope character varying,
    scheduled_for timestamp without time zone,
    state character varying,
    creator_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: broadcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE broadcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: broadcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE broadcasts_id_seq OWNED BY broadcasts.id;


--
-- Name: claims; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE claims (
    id integer NOT NULL,
    claimant_id integer,
    development_id integer,
    moderator_id integer,
    role character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reason character varying,
    state character varying
);


--
-- Name: claims_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE claims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: claims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE claims_id_seq OWNED BY claims.id;


--
-- Name: configs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE configs (
    id integer NOT NULL,
    possible_min integer,
    possible_max integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: configs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE configs_id_seq OWNED BY configs.id;


--
-- Name: crosswalks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE crosswalks (
    id integer NOT NULL,
    organization_id integer,
    development_id integer,
    internal_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crosswalks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE crosswalks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crosswalks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE crosswalks_id_seq OWNED BY crosswalks.id;


--
-- Name: development_team_memberships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE development_team_memberships (
    id integer NOT NULL,
    role character varying,
    development_id integer,
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: development_team_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE development_team_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: development_team_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE development_team_memberships_id_seq OWNED BY development_team_memberships.id;


--
-- Name: developments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE developments (
    id integer NOT NULL,
    creator_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rdv boolean,
    asofright boolean,
    ovr55 boolean,
    clusteros boolean,
    phased boolean,
    stalled boolean,
    name character varying(140),
    status character varying(20),
    "desc" text,
    project_url character varying(140),
    mapc_notes character varying,
    tagline character varying,
    address character varying(140),
    state character varying(2) DEFAULT 'MA'::character varying,
    zip_code character varying(9),
    height integer,
    stories integer,
    year_compl integer,
    prjarea integer,
    singfamhu integer,
    twnhsmmult integer,
    lgmultifam integer,
    tothu integer,
    gqpop integer,
    rptdemp integer,
    emploss integer,
    estemp integer,
    commsf integer,
    hotelrms integer,
    onsitepark integer,
    total_cost integer,
    team_membership_count integer,
    cancelled boolean DEFAULT false,
    private boolean DEFAULT false,
    fa_ret double precision,
    fa_ofcmd double precision,
    fa_indmf double precision,
    fa_whs double precision,
    fa_rnd double precision,
    fa_edinst double precision,
    fa_other double precision,
    fa_hotel double precision,
    other_rate double precision,
    affordable double precision,
    latitude numeric(12,9),
    longitude numeric(12,9),
    place_id integer,
    street_view_heading integer DEFAULT 0,
    street_view_pitch smallint DEFAULT 35,
    street_view_latitude numeric(12,9),
    street_view_longitude numeric(12,9),
    street_view_image bytea,
    parcel_id character varying(25),
    walkscore json DEFAULT '{}'::json NOT NULL,
    mixed_use boolean
);


--
-- Name: developments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE developments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: developments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE developments_id_seq OWNED BY developments.id;


--
-- Name: developments_programs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE developments_programs (
    id integer NOT NULL,
    development_id integer,
    program_id integer
);


--
-- Name: developments_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE developments_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: developments_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE developments_programs_id_seq OWNED BY developments_programs.id;


--
-- Name: dictionary_entries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dictionary_entries (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description text,
    importance text,
    interpretation text,
    technical_notes text,
    "order" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: dictionary_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dictionary_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dictionary_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dictionary_entries_id_seq OWNED BY dictionary_entries.id;


--
-- Name: edits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE edits (
    id integer NOT NULL,
    editor_id integer,
    moderator_id integer,
    development_id integer,
    state character varying,
    fields json,
    applied_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ignore_conflicts boolean DEFAULT false,
    moderated_at timestamp without time zone,
    applied boolean DEFAULT false NOT NULL
);


--
-- Name: edits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: edits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE edits_id_seq OWNED BY edits.id;


--
-- Name: field_edits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE field_edits (
    id integer NOT NULL,
    edit_id integer,
    name character varying,
    change json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: field_edits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE field_edits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: field_edits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE field_edits_id_seq OWNED BY field_edits.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE flags (
    id integer NOT NULL,
    flagger_id integer,
    development_id integer,
    reason text,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    resolver_id integer
);


--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE flags_id_seq OWNED BY flags.id;


--
-- Name: forecasts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE forecasts (
    id integer NOT NULL,
    report_id integer,
    date date,
    high_temp integer,
    peak_hour integer,
    peak_load integer,
    humidity integer,
    heat_index integer,
    temperature numeric,
    actual_peak_hour integer,
    actual_peak_load integer,
    risk character varying,
    projection boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: forecasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forecasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forecasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forecasts_id_seq OWNED BY forecasts.id;


--
-- Name: inbox_notices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE inbox_notices (
    id integer NOT NULL,
    subject character varying,
    body character varying,
    state character varying,
    level character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: inbox_notices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inbox_notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inbox_notices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inbox_notices_id_seq OWNED BY inbox_notices.id;


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
-- Name: listings_id_seq_backup; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE listings_id_seq_backup
    START WITH 1371264
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listings_backup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE listings_backup (
    id integer DEFAULT nextval('listings_id_seq_backup'::regclass) NOT NULL,
    location geometry,
    ask integer,
    bedrooms integer,
    title character varying,
    address character varying,
    posting_date timestamp(6) without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
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
-- Name: listings_weighted_id_seq_backup; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE listings_weighted_id_seq_backup
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: memberships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE memberships (
    id integer NOT NULL,
    user_id integer,
    organization_id integer,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE memberships_id_seq OWNED BY memberships.id;


--
-- Name: municipalities_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE municipalities_id_seq1
    START WITH 102
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: municipalities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE municipalities (
    id integer DEFAULT nextval('municipalities_id_seq1'::regclass) NOT NULL,
    geom geometry,
    town_id integer,
    town character varying(21),
    subregion character varying(19)
);


--
-- Name: municipalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE municipalities_id_seq
    START WITH 352
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    creator_id integer,
    name character varying,
    website character varying,
    url_template character varying,
    location character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    abbv character varying,
    short_name character varying,
    gravatar_email character varying,
    hashed_email character varying,
    municipal boolean,
    phone character varying(20),
    address character varying,
    place_id integer
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: parcels_ma_poly_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parcels_ma_poly_ogc_fid_seq
    START WITH 2174523
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: place_profiles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE place_profiles (
    id integer NOT NULL,
    latitude numeric,
    longitude numeric,
    radius numeric,
    polygon json,
    response json,
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: place_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE place_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: place_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE place_profiles_id_seq OWNED BY place_profiles.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE places (
    id integer NOT NULL,
    name character varying,
    type character varying,
    place_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    geom geography(Geometry,4326)
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
-- Name: programs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description character varying,
    url character varying,
    sort_order integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reports (
    id integer NOT NULL,
    "current_date" date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


--
-- Name: searches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE searches (
    id integer NOT NULL,
    query json,
    user_id integer,
    saved boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying(140)
);


--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE searches_id_seq OWNED BY searches.id;


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
-- Name: station_areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE station_areas (
    id integer NOT NULL,
    name character varying(255),
    muni_name character varying(255),
    muni_id integer,
    latitude numeric,
    longitude numeric,
    community_type_id integer,
    community_type_description character varying(255),
    subcommunity_type_id integer,
    subcommunity_type_description character varying(255),
    station_class character varying(255),
    ov_area numeric,
    ex_area numeric,
    ex_aval numeric,
    ov_aval numeric,
    ov_comac numeric,
    ex_comac numeric,
    ov_compc numeric,
    ov_comprk numeric,
    ex_comprk numeric,
    ov_dvothac numeric,
    ex_dvothac numeric,
    ov_dvothpc numeric,
    ov_dvotprk numeric,
    ex_dvotprk numeric,
    ov_ed_att numeric,
    ov_emp10 integer,
    ex_emp10 integer,
    ov_empcons numeric,
    ex_empcons numeric,
    ov_empden numeric,
    ov_empplan numeric,
    ex_empplan numeric,
    ov_est_10 integer,
    ex_est_10 integer,
    ov_far numeric,
    ov_ghg numeric,
    ex_ghg numeric,
    ov_hh10 integer,
    ex_hh10 numeric,
    ov_hhnocar numeric,
    ov_hhinc numeric,
    ov_hresac numeric,
    ex_hresac numeric,
    ov_hrespc numeric,
    ov_hrspkac numeric,
    ex_hrspkac numeric,
    ov_hu10 numeric,
    ex_hu10 numeric,
    ov_hu_0010 numeric,
    ex_hu_0010 numeric,
    ov_hucons integer,
    ex_hucons numeric,
    ov_hupac numeric,
    ov_huplan numeric,
    ex_huplan numeric,
    ov_intnpac numeric,
    ov_intntot numeric,
    ov_jobacc numeric,
    ov_lresac numeric,
    ex_lresac numeric,
    ov_lrespc numeric,
    ov_mix numeric,
    ov_pct_abc numeric,
    ov_pcttran numeric,
    ov_pop_0010 numeric,
    ex_pop_0010 numeric,
    ov_pop10 numeric,
    ex_pop10 numeric,
    ex_prkac numeric,
    ov_prkac numeric,
    ov_prkpc numeric,
    ov_rentocc numeric,
    ov_respc numeric,
    ov_taxrev numeric,
    ex_taxrev numeric,
    ov_trnpcmi numeric,
    ov_vacdvac numeric,
    ex_vacdvac numeric,
    ov_vacdvpc numeric,
    ov_vacunac numeric,
    ov_vacunpc numeric,
    ov_vehphh numeric,
    ov_vmthday numeric,
    phase character varying(255),
    mapc boolean,
    walkscore numeric,
    etod_q0car integer,
    etod_q25k integer,
    etod_qabc integer,
    etod_qaff integer,
    etod_qdens integer,
    etod_qgrav integer,
    etod_qrent integer,
    etod_qtas integer,
    etod_qtci integer,
    etod_qwalk integer,
    etod_sub1t integer,
    etod_sub2o integer,
    etod_sub3d integer,
    etod_total integer,
    etod_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    line_descr character varying(255),
    ov_emppipe numeric,
    ex_emppipe numeric,
    ov_hupipe numeric,
    ex_hupipe numeric
);


--
-- Name: station_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE station_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: station_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE station_areas_id_seq OWNED BY station_areas.id;


--
-- Name: station_areas_transit_lines; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE station_areas_transit_lines (
    id integer NOT NULL,
    station_area_id integer,
    transit_line_id integer
);


--
-- Name: station_areas_transit_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE station_areas_transit_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: station_areas_transit_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE station_areas_transit_lines_id_seq OWNED BY station_areas_transit_lines.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    user_id integer,
    subscribable_id integer,
    subscribable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: surveys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE surveys (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: surveys_id_seq_backup; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE surveys_id_seq_backup
    START WITH 92
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: surveys_backup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE surveys_backup (
    id integer DEFAULT nextval('surveys_id_seq_backup'::regclass) NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
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
-- Name: tenure_vacancy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tenure_vacancy_id_seq
    START WITH 1478
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tracts_id_seq
    START WITH 1478
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transit_lines; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transit_lines (
    id integer NOT NULL,
    name character varying(255),
    service_type character varying(255),
    mapc_code character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transit_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transit_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transit_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transit_lines_id_seq OWNED BY transit_lines.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    hashed_email character varying,
    last_checked_subscriptions timestamp without time zone DEFAULT '2016-03-17 17:30:20.368817'::timestamp without time zone NOT NULL,
    mail_frequency character varying(8) DEFAULT 'weekly'::character varying
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
-- Name: verifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE verifications (
    id integer NOT NULL,
    user_id integer,
    verifier_id integer,
    reason text,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE verifications_id_seq OWNED BY verifications.id;


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
-- Name: explanations_indicators; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE explanations_indicators (
    explanation_id integer,
    indicator_id integer
);


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
-- Name: explanations_subjects; Type: TABLE; Schema: regionalindicators; Owner: -; Tablespace: 
--

CREATE TABLE explanations_subjects (
    explanation_id integer,
    subject_id integer
);


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
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
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
    value_delta numeric,
    rank_delta integer,
    visible boolean DEFAULT true,
    "position" integer DEFAULT 0
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
    value numeric,
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
    dashboard_framing text,
    rankable boolean DEFAULT true
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

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY broadcasts ALTER COLUMN id SET DEFAULT nextval('broadcasts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY claims ALTER COLUMN id SET DEFAULT nextval('claims_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY configs ALTER COLUMN id SET DEFAULT nextval('configs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY crosswalks ALTER COLUMN id SET DEFAULT nextval('crosswalks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY development_team_memberships ALTER COLUMN id SET DEFAULT nextval('development_team_memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY developments ALTER COLUMN id SET DEFAULT nextval('developments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY developments_programs ALTER COLUMN id SET DEFAULT nextval('developments_programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dictionary_entries ALTER COLUMN id SET DEFAULT nextval('dictionary_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY edits ALTER COLUMN id SET DEFAULT nextval('edits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY field_edits ALTER COLUMN id SET DEFAULT nextval('field_edits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY flags ALTER COLUMN id SET DEFAULT nextval('flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forecasts ALTER COLUMN id SET DEFAULT nextval('forecasts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY inbox_notices ALTER COLUMN id SET DEFAULT nextval('inbox_notices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY listings ALTER COLUMN id SET DEFAULT nextval('listings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY memberships ALTER COLUMN id SET DEFAULT nextval('memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY place_profiles ALTER COLUMN id SET DEFAULT nextval('place_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY searches ALTER COLUMN id SET DEFAULT nextval('searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_areas ALTER COLUMN id SET DEFAULT nextval('station_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY station_areas_transit_lines ALTER COLUMN id SET DEFAULT nextval('station_areas_transit_lines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY surveys ALTER COLUMN id SET DEFAULT nextval('surveys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transit_lines ALTER COLUMN id SET DEFAULT nextval('transit_lines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY verifications ALTER COLUMN id SET DEFAULT nextval('verifications_id_seq'::regclass);


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
-- Name: api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: broadcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY broadcasts
    ADD CONSTRAINT broadcasts_pkey PRIMARY KEY (id);


--
-- Name: claims_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY claims
    ADD CONSTRAINT claims_pkey PRIMARY KEY (id);


--
-- Name: configs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY configs
    ADD CONSTRAINT configs_pkey PRIMARY KEY (id);


--
-- Name: crosswalks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY crosswalks
    ADD CONSTRAINT crosswalks_pkey PRIMARY KEY (id);


--
-- Name: development_team_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY development_team_memberships
    ADD CONSTRAINT development_team_memberships_pkey PRIMARY KEY (id);


--
-- Name: developments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY developments
    ADD CONSTRAINT developments_pkey PRIMARY KEY (id);


--
-- Name: developments_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY developments_programs
    ADD CONSTRAINT developments_programs_pkey PRIMARY KEY (id);


--
-- Name: dictionary_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dictionary_entries
    ADD CONSTRAINT dictionary_entries_pkey PRIMARY KEY (id);


--
-- Name: edits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edits
    ADD CONSTRAINT edits_pkey PRIMARY KEY (id);


--
-- Name: field_edits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY field_edits
    ADD CONSTRAINT field_edits_pkey PRIMARY KEY (id);


--
-- Name: flags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY forecasts
    ADD CONSTRAINT forecasts_pkey PRIMARY KEY (id);


--
-- Name: inbox_notices_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inbox_notices
    ADD CONSTRAINT inbox_notices_pkey PRIMARY KEY (id);


--
-- Name: listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY listings
    ADD CONSTRAINT listings_pkey PRIMARY KEY (id);


--
-- Name: memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: place_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY place_profiles
    ADD CONSTRAINT place_profiles_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_pkey PRIMARY KEY (id);


--
-- Name: sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: station_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY station_areas
    ADD CONSTRAINT station_areas_pkey PRIMARY KEY (id);


--
-- Name: station_areas_transit_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY station_areas_transit_lines
    ADD CONSTRAINT station_areas_transit_lines_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- Name: transit_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transit_lines
    ADD CONSTRAINT transit_lines_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY verifications
    ADD CONSTRAINT verifications_pkey PRIMARY KEY (id);


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
-- Name: index_api_keys_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_api_keys_on_user_id ON api_keys USING btree (user_id);


--
-- Name: index_broadcasts_on_creator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_broadcasts_on_creator_id ON broadcasts USING btree (creator_id);


--
-- Name: index_claims_on_claimant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_claims_on_claimant_id ON claims USING btree (claimant_id);


--
-- Name: index_claims_on_development_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_claims_on_development_id ON claims USING btree (development_id);


--
-- Name: index_claims_on_moderator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_claims_on_moderator_id ON claims USING btree (moderator_id);


--
-- Name: index_crosswalks_on_development_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_crosswalks_on_development_id ON crosswalks USING btree (development_id);


--
-- Name: index_crosswalks_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_crosswalks_on_organization_id ON crosswalks USING btree (organization_id);


--
-- Name: index_development_team_memberships_on_development_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_development_team_memberships_on_development_id ON development_team_memberships USING btree (development_id);


--
-- Name: index_development_team_memberships_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_development_team_memberships_on_organization_id ON development_team_memberships USING btree (organization_id);


--
-- Name: index_developments_on_creator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_developments_on_creator_id ON developments USING btree (creator_id);


--
-- Name: index_developments_on_place_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_developments_on_place_id ON developments USING btree (place_id);


--
-- Name: index_developments_programs_on_development_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_developments_programs_on_development_id ON developments_programs USING btree (development_id);


--
-- Name: index_developments_programs_on_program_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_developments_programs_on_program_id ON developments_programs USING btree (program_id);


--
-- Name: index_edits_on_development_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_edits_on_development_id ON edits USING btree (development_id);


--
-- Name: index_edits_on_editor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_edits_on_editor_id ON edits USING btree (editor_id);


--
-- Name: index_edits_on_moderator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_edits_on_moderator_id ON edits USING btree (moderator_id);


--
-- Name: index_field_edits_on_edit_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_field_edits_on_edit_id ON field_edits USING btree (edit_id);


--
-- Name: index_flags_on_development_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_flags_on_development_id ON flags USING btree (development_id);


--
-- Name: index_flags_on_flagger_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_flags_on_flagger_id ON flags USING btree (flagger_id);


--
-- Name: index_listings_on_source_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_listings_on_source_id ON listings USING btree (source_id);


--
-- Name: index_listings_on_survey_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_listings_on_survey_id ON listings USING btree (survey_id);


--
-- Name: index_memberships_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_organization_id ON memberships USING btree (organization_id);


--
-- Name: index_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_user_id ON memberships USING btree (user_id);


--
-- Name: index_organizations_on_creator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_creator_id ON organizations USING btree (creator_id);


--
-- Name: index_organizations_on_place_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_place_id ON organizations USING btree (place_id);


--
-- Name: index_places_on_place_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_places_on_place_id ON places USING btree (place_id);


--
-- Name: index_searches_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_searches_on_user_id ON searches USING btree (user_id);


--
-- Name: index_subscriptions_on_subscribable_type_and_subscribable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_subscribable_type_and_subscribable_id ON subscriptions USING btree (subscribable_type, subscribable_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_user_id ON subscriptions USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_verifications_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_verifications_on_user_id ON verifications USING btree (user_id);


--
-- Name: index_verifications_on_verifier_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_verifications_on_verifier_id ON verifications USING btree (verifier_id);


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


SET search_path = public, pg_catalog;

--
-- Name: fk_rails_10c668431f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY developments_programs
    ADD CONSTRAINT fk_rails_10c668431f FOREIGN KEY (program_id) REFERENCES programs(id);


--
-- Name: fk_rails_32c28d0dc2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT fk_rails_32c28d0dc2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_4ba831b3b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY crosswalks
    ADD CONSTRAINT fk_rails_4ba831b3b1 FOREIGN KEY (development_id) REFERENCES developments(id);


--
-- Name: fk_rails_64267aab58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY memberships
    ADD CONSTRAINT fk_rails_64267aab58 FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_6b0105280e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY crosswalks
    ADD CONSTRAINT fk_rails_6b0105280e FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_8a6232040f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY development_team_memberships
    ADD CONSTRAINT fk_rails_8a6232040f FOREIGN KEY (development_id) REFERENCES developments(id);


--
-- Name: fk_rails_8ce2d558c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT fk_rails_8ce2d558c3 FOREIGN KEY (development_id) REFERENCES developments(id);


--
-- Name: fk_rails_933bdff476; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_933bdff476 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_99326fb65d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY memberships
    ADD CONSTRAINT fk_rails_99326fb65d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_9dafeeb28b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY field_edits
    ADD CONSTRAINT fk_rails_9dafeeb28b FOREIGN KEY (edit_id) REFERENCES edits(id);


--
-- Name: fk_rails_9dc9c035a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_rails_9dc9c035a3 FOREIGN KEY (place_id) REFERENCES places(id);


--
-- Name: fk_rails_ab0bf7bd2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY places
    ADD CONSTRAINT fk_rails_ab0bf7bd2c FOREIGN KEY (place_id) REFERENCES places(id);


--
-- Name: fk_rails_b0da45c949; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY developments_programs
    ADD CONSTRAINT fk_rails_b0da45c949 FOREIGN KEY (development_id) REFERENCES developments(id);


--
-- Name: fk_rails_b2bbf7151d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY development_team_memberships
    ADD CONSTRAINT fk_rails_b2bbf7151d FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_bbb862ca66; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY claims
    ADD CONSTRAINT fk_rails_bbb862ca66 FOREIGN KEY (development_id) REFERENCES developments(id);


--
-- Name: fk_rails_d95949fd60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY developments
    ADD CONSTRAINT fk_rails_d95949fd60 FOREIGN KEY (place_id) REFERENCES places(id);


--
-- Name: fk_rails_e192b86393; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT fk_rails_e192b86393 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_f184078eb4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY verifications
    ADD CONSTRAINT fk_rails_f184078eb4 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_f2673df165; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edits
    ADD CONSTRAINT fk_rails_f2673df165 FOREIGN KEY (development_id) REFERENCES developments(id);


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

INSERT INTO schema_migrations (version) VALUES ('20150618171502');

INSERT INTO schema_migrations (version) VALUES ('20170131162704');

INSERT INTO schema_migrations (version) VALUES ('20170131163842');