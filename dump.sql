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
-- Name: regionalindicators; Type: SCHEMA; Schema: -; Owner: editor
--

CREATE SCHEMA regionalindicators;


ALTER SCHEMA regionalindicators OWNER TO editor;

--
-- Name: SCHEMA regionalindicators; Type: COMMENT; Schema: -; Owner: editor
--

COMMENT ON SCHEMA regionalindicators IS 'Regional Indicators';


SET search_path = regionalindicators, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: explanations; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE explanations (
    id integer NOT NULL,
    narrative text,
    explainable_id integer,
    explainable_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE explanations OWNER TO editor;

--
-- Name: explanations_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE explanations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE explanations_id_seq OWNER TO editor;

--
-- Name: explanations_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE explanations_id_seq OWNED BY explanations.id;


--
-- Name: explanations_sources; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE explanations_sources (
    id integer NOT NULL,
    explanation_id integer,
    source_id integer
);


ALTER TABLE explanations_sources OWNER TO editor;

--
-- Name: explanations_sources_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE explanations_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE explanations_sources_id_seq OWNER TO editor;

--
-- Name: explanations_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE explanations_sources_id_seq OWNED BY explanations_sources.id;


--
-- Name: goals; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE goals OWNER TO editor;

--
-- Name: goals_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE goals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goals_id_seq OWNER TO editor;

--
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE goals_id_seq OWNED BY goals.id;


--
-- Name: indicator_groups; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE indicator_groups (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE indicator_groups OWNER TO editor;

--
-- Name: indicator_groups_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE indicator_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indicator_groups_id_seq OWNER TO editor;

--
-- Name: indicator_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE indicator_groups_id_seq OWNED BY indicator_groups.id;


--
-- Name: indicators; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE indicators OWNER TO editor;

--
-- Name: indicators_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indicators_id_seq OWNER TO editor;

--
-- Name: indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE indicators_id_seq OWNED BY indicators.id;


--
-- Name: indicators_issue_areas; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE indicators_issue_areas (
    id integer NOT NULL,
    indicator_id integer,
    issue_area_id integer
);


ALTER TABLE indicators_issue_areas OWNER TO editor;

--
-- Name: indicators_issue_areas_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE indicators_issue_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indicators_issue_areas_id_seq OWNER TO editor;

--
-- Name: indicators_issue_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE indicators_issue_areas_id_seq OWNED BY indicators_issue_areas.id;


--
-- Name: issue_areas; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE issue_areas (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    datacommon_url character varying(255),
    sort_order integer
);


ALTER TABLE issue_areas OWNER TO editor;

--
-- Name: issue_areas_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE issue_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_areas_id_seq OWNER TO editor;

--
-- Name: issue_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE issue_areas_id_seq OWNED BY issue_areas.id;


--
-- Name: objectives; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE objectives (
    id integer NOT NULL,
    title character varying(255),
    goal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying(255)
);


ALTER TABLE objectives OWNER TO editor;

--
-- Name: objectives_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE objectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE objectives_id_seq OWNER TO editor;

--
-- Name: objectives_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE objectives_id_seq OWNED BY objectives.id;


--
-- Name: rails_admin_histories; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE rails_admin_histories OWNER TO editor;

--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE rails_admin_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rails_admin_histories_id_seq OWNER TO editor;

--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE rails_admin_histories_id_seq OWNED BY rails_admin_histories.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO editor;

--
-- Name: searches; Type: VIEW; Schema: regionalindicators; Owner: editor
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


ALTER TABLE searches OWNER TO editor;

--
-- Name: snapshots; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE snapshots OWNER TO editor;

--
-- Name: snapshots_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snapshots_id_seq OWNER TO editor;

--
-- Name: snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE snapshots_id_seq OWNED BY snapshots.id;


--
-- Name: sources; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE sources OWNER TO editor;

--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sources_id_seq OWNER TO editor;

--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE sources_id_seq OWNED BY sources.id;


--
-- Name: static_pages; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE static_pages OWNER TO editor;

--
-- Name: static_pages_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE static_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE static_pages_id_seq OWNER TO editor;

--
-- Name: static_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE static_pages_id_seq OWNED BY static_pages.id;


--
-- Name: subjects; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE TABLE subjects (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    topic_area_id integer,
    sort_order integer
);


ALTER TABLE subjects OWNER TO editor;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjects_id_seq OWNER TO editor;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: topic_areas; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE topic_areas OWNER TO editor;

--
-- Name: topic_areas_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE topic_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_areas_id_seq OWNER TO editor;

--
-- Name: topic_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE topic_areas_id_seq OWNED BY topic_areas.id;


--
-- Name: users; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE users OWNER TO editor;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO editor;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: visualizations; Type: TABLE; Schema: regionalindicators; Owner: editor; Tablespace: 
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


ALTER TABLE visualizations OWNER TO editor;

--
-- Name: visualizations_id_seq; Type: SEQUENCE; Schema: regionalindicators; Owner: editor
--

CREATE SEQUENCE visualizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visualizations_id_seq OWNER TO editor;

--
-- Name: visualizations_id_seq; Type: SEQUENCE OWNED BY; Schema: regionalindicators; Owner: editor
--

ALTER SEQUENCE visualizations_id_seq OWNED BY visualizations.id;


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY explanations ALTER COLUMN id SET DEFAULT nextval('explanations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY explanations_sources ALTER COLUMN id SET DEFAULT nextval('explanations_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY goals ALTER COLUMN id SET DEFAULT nextval('goals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY indicator_groups ALTER COLUMN id SET DEFAULT nextval('indicator_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY indicators ALTER COLUMN id SET DEFAULT nextval('indicators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY indicators_issue_areas ALTER COLUMN id SET DEFAULT nextval('indicators_issue_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY issue_areas ALTER COLUMN id SET DEFAULT nextval('issue_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY objectives ALTER COLUMN id SET DEFAULT nextval('objectives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY rails_admin_histories ALTER COLUMN id SET DEFAULT nextval('rails_admin_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY snapshots ALTER COLUMN id SET DEFAULT nextval('snapshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY static_pages ALTER COLUMN id SET DEFAULT nextval('static_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY topic_areas ALTER COLUMN id SET DEFAULT nextval('topic_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: regionalindicators; Owner: editor
--

ALTER TABLE ONLY visualizations ALTER COLUMN id SET DEFAULT nextval('visualizations_id_seq'::regclass);


--
-- Data for Name: explanations; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY explanations (id, narrative, explainable_id, explainable_type, created_at, updated_at) FROM stdin;
3	While college attainment rates have improved for all racial and ethnic groups over the past decade, stubborn gaps in education attainment persist and have worsened since the year 2000. The college attainment gap (the percentage point difference in working age adults with a 2- or 4-year college degree) between Black and White adults is 23 points, up from 21 points in 2000; between Latinos and Whites the gap is 33 points, up from 30 points in 2000. Within racial and ethnic groups, attainment varies depending on spatial location. For example, educational attainment for Asians is, on average, higher than that of Whites by 7 points regionally, but Asians living in Regional Urban Centers have a college attainment rate 36 percentage points below Asians living in Suburbs. The gap in educational attainment between Regional Urban Centers and the regional average is 16 points. Generally, residents of suburban communities have the highest rates of college degree attainment, although for Whites, the rate is highest in Inner Core communities. \nSeparating 2-year associate’s degrees, 4-year bachelor’s degrees, and graduate or professional degrees, there are some clear differences in patterns of attainment. Though associate’s degrees make up only 14% of total degrees, they are more prevalent in Regional Urban Center communities than in Inner Core communities by 3 percentage points (8% compared to 5%), and the associate’s degree attainment rate for Black adults in the region is higher than any other race or ethnicity (9%). Bachelor’s degrees make up the largest share of total degrees, at 49%, and the largest portion of the racial attainment gap – 12% of Latinos, 17% of Blacks, and 29% of Whites have a bachelor’s degree. However there has been no change since 2000 in the racial attainment gap at the bachelor’s degree level. The largest change in the racial attainment gap is for adults with a graduate or professional degree, which make up 37% of total degrees. In 2000, Black adults had a graduate degree attainment rate of 8%, compared to 18% for Whites; in 2007-11, Black attainment was 9%, compared to 21% for Whites.\nMetro Boston’s educational attainment gap by race is greater than the national average across all races, although for Asians, college attainment exceeds that of Whites in Metro Boston and the nation. Metro Boston has the 3rd largest college attainment gap of the top 25 U.S. metro areas for Blacks, 7th highest for Latinos, and 7th highest for those who identify as another race or multiracial. Adults of all races and ethnicities in Metro Boston have rates of college attainment greater than the national average, but the comparatively large gaps are driven by the region’s disproportionately higher share of Whites with a bachelor’s degree or higher. The share of White, non-Hispanic adults in Metro Boston with a bachelor’s degree or higher is 15 percentage points higher than the national average, whereas the share for adults of color is 5 to 7 percentage points higher.\nCollege attainment gaps have long-term implications for economic equity and prosperity in our region. While the data does show increased college attainment across community types, races and ethnicities, we still must strive to close these gaps to ensure that our increasingly diverse Metro Boston residents are prepared for the knowledge-based jobs that are expanding in the region, and to be sure that businesses looking to locate in our region consider Regional Urban Centers as viable places to set up shop.	211	Indicator	2014-04-23 16:56:20.838834	2014-05-23 00:18:02.902568
4	While college attainment rates have improved for all racial and ethnic groups over the past decade, stubborn gaps in education attainment persist and have worsened since the year 2000. The college attainment gap (the percentage point difference in working age adults with a 2- or 4-year college degree) between Black and White adults is 23 points, up from 21 points in 2000; between Latinos and Whites the gap is 33 points, up from 30 points in 2000. Within racial and ethnic groups, attainment varies depending on spatial location. For example, educational attainment for Asians is, on average, higher than that of Whites by 7 points regionally, but Asians living in Regional Urban Centers have a college attainment rate 36 percentage points below Asians living in Suburbs. The gap in educational attainment between Regional Urban Centers and the regional average is 16 points. Generally, residents of suburban communities have the highest rates of college degree attainment, although for Whites, the rate is highest in Inner Core communities. \nSeparating 2-year associate’s degrees, 4-year bachelor’s degrees, and graduate or professional degrees, there are some clear differences in patterns of attainment. Though associate’s degrees make up only 14% of total degrees, they are more prevalent in Regional Urban Center communities than in Inner Core communities by 3 percentage points (8% compared to 5%), and the associate’s degree attainment rate for Black adults in the region is higher than any other race or ethnicity (9%). Bachelor’s degrees make up the largest share of total degrees, at 49%, and the largest portion of the racial attainment gap – 12% of Latinos, 17% of Blacks, and 29% of Whites have a bachelor’s degree. However there has been no change since 2000 in the racial attainment gap at the bachelor’s degree level. The largest change in the racial attainment gap is for adults with a graduate or professional degree, which make up 37% of total degrees. In 2000, Black adults had a graduate degree attainment rate of 8%, compared to 18% for Whites; in 2007-11, Black attainment was 9%, compared to 21% for Whites.\nMetro Boston’s educational attainment gap by race is greater than the national average across all races, although for Asians, college attainment exceeds that of Whites in Metro Boston and the nation. Metro Boston has the 3rd largest college attainment gap of the top 25 U.S. metro areas for Blacks, 7th highest for Latinos, and 7th highest for those who identify as another race or multiracial. Adults of all races and ethnicities in Metro Boston have rates of college attainment greater than the national average, but the comparatively large gaps are driven by the region’s disproportionately higher share of Whites with a bachelor’s degree or higher. The share of White, non-Hispanic adults in Metro Boston with a bachelor’s degree or higher is 15 percentage points higher than the national average, whereas the share for adults of color is 5 to 7 percentage points higher.\nCollege attainment gaps have long-term implications for economic equity and prosperity in our region. While the data does show increased college attainment across community types, races and ethnicities, we still must strive to close these gaps to ensure that our increasingly diverse Metro Boston residents are prepared for the knowledge-based jobs that are expanding in the region, and to be sure that businesses looking to locate in our region consider Regional Urban Centers as viable places to set up shop.	212	Indicator	2014-04-23 16:56:20.852562	2014-05-23 00:18:02.988186
6	Metro Boston is making great strides in increasing its college graduation rate, but an undergraduate degree comes at a cost. In today’s economy, unemployment is up across all educational attainment groups, so even workers with a college degree are more than twice as likely to be unemployed today as they were in 2000. There are also students who enroll in college and take on debt, but are unable to graduate for any number of reasons. Without the advantage of having a degree, the cost of debt becomes an even greater effective burden. Dropping out of a degree program, or taking longer than is standard to graduate, commonly leads to increased debt, lower-wage employment and higher likelihood of defaulting on loans [8].\nThere are roughly 100 colleges and universities in the Metro Boston region. In 2012, students from these institutions received nearly 49,000 undergraduate degrees and incurred more than $736 million in federal student loan debt—a debt-to-degree ratio of $15,000, slightly higher than the national average of $14,300. \nThis high debt-to-degree ratio is a problem across all higher education sectors—private non-profit, private for-profit, public, two-year and four-year institutions—but there are differing trends among sectors. Overall, the highest federal loan debts are accrued at four-year for-profit schools: an average of $35,000 per degree for the years 2010 to 2012. The largest increase, however, in debt-to-degree ratio from 2007-2009 to 2010-2012 occurred in the state’s public colleges and universities, at 30%. The debt-to-degree ratio for Massachusetts four-year public undergraduate institutions is now $24,000, for years 2010 to 2012, and exceeds that of four-year private non-profit undergraduate colleges and universities. In contrast, the debt-to-degree ratios for private for-profit and private non-profit institutions have dropped over the same interval, by 5% and 20% respectively.  The factors influencing the debt-to-degree ratio are complex—tuition, scholarships, enrollment, dropout, and graduation rates all influence the final debt-load metric. Metro Boston institutions must work to keep tuition costs in check while making scholarships available to those in need, and simultaneously increase student retention for our schools to adequately serve the region’s students.  \nUltimately, since more students are relying on our state’s public colleges and universities, where enrollment is up 24% since 2007, for their higher education, keeping those degrees affordable for all Massachusetts students will be a crucial component of the region’s prosperity in years to come. Already many institutions are working to keep costs in check while providing the necessary tools and supports to overcome barriers to timely graduation. Public funding for public universities plays a large roll in tuition rates. At Massachusetts state universities, tuition rates rose 116% between fiscal years 2002 and 2013, while higher education appropriations from the state budget fell 25% [9]. Funding for public higher education did increase in the 2013 and 2014 state budgets, giving much needed support to state universities, community colleges and the UMass system, and also important scholarship and grant programs [10] [11]. For the region’s young adults to be prosperous now and into the future, they must not only be able to attain a high-quality post-secondary education, but they must be able to afford to pay off their student loans throughout the 10+ year loan repayment period.\n[8] Lawrence Gladieux and Laura Perna, “Borrowers Who Drop Out: A Neglected Aspect if the College Student Loan Trend.” The National Center for Public Policy and Higher Education, National Center Report #05-2, May, 2005. http://files.eric.ed.gov/fulltext/ED508094.pdf\n[9] Chris Gustafson, “Public Higher Education in Massachusetts and the Governor's FY 2014 Budget,” Massachusetts Budget and Policy Center, March 29, 2013. http://www.massbudget.org/report_window.php?loc=higher_ed_gov_14.html\n[10] Chris Gustafson, “Public Higher Education in Massachusetts and the Governor's FY 2014 Budget,” Massachusetts Budget and Policy Center, March 29, 2013. http://www.massbudget.org/report_window.php?loc=higher_ed_gov_14.html\n[11] Massachusetts Budget and Policy Center, Budget Browser http://massbudget.org/browser/subcat.php?c1=13&c2=14&id=Higher+Education&inflation=cpi&budgets=315b115b14b13b12b11b10b9b8b7b6b5b4b3b2b1#comparisons	218	Indicator	2014-04-23 16:56:20.878216	2014-05-23 00:18:03.584872
1	Metro Boston will never have the cheapest energy or the biggest port—an educated workforce is our competitive edge. Metro Boston is known for our world-class workforce with a strong supply of skilled and educated workers. Among the 100 most populous metropolitan areas in the U.S., Metro Boston ranks 7th in share of adults over 25 years of age with a 2- or 4-year college degree. Businesses, especially those in high-skill industries, such as education and health services, finance, information, and professional and business services, are thriving in our region, where employment in those sectors is 47% of regional employment – 11 percentage points above the national average [1] [2].\nYet the region must work to maintain this competitive edge. According to MAPC’s 2014 population projections [3], one million workers now over the age of 40—nearly 40% of the workforce—will leave the region’s labor force by 2030, and skilled, educated workers must be available to fill those jobs, or those jobs may leave the region. The innovative industries driving the region’s growth thrive with a steady supply of college graduates. Unfortunately, the region is losing these workers to other parts of the country. From 2000 to 2010, there was a net loss of 65,000 residents who were between the ages of 25 and 40 at the beginning of the decade, a net loss of 6%.  Greater retention of skilled workers is a critical pathway to a more robust workforce. Another critical pathway to a more competitive workforce is eliminating stubborn gaps in educational attainment across race and ethnicity that limit opportunities for Metro Boston’s residents of color to fully participate in the region’s labor market. A prosperous region is one where all young people have access to a high quality education and are able to achieve a level of educational attainment that leads to gainful employment and a livable wage. Workers of all ages should have the opportunity and flexibility to be lifelong learners – upgrading skills and advancing career paths is more important now than it ever was, in order to adapt to Metro Boston’s increasingly knowledge-based economy.\nTo maintain its economic edge and advance opportunities for more equitable prosperity, the region must work to continue advancing higher educational attainment rates while keeping the relative cost of that education in check. It is especially important to refocus investment in public universities, which have traditionally offered Massachusetts residents an accessible and affordable track to a college degree. Enrollment in the region’s public undergraduate institutions is up 24% since 2007, yet public investment in state universities is down 25%, adjusted for inflation since 2002 [4].\nAs residents of Metro Boston become more educated, it is important to track the cost of getting a higher education. There is no doubt about the life-long advantages that come along with a college degree – higher labor force participation, lower unemployment, higher income, better ability to build wealth – but student debt can eat into those advantages, especially when the average Metro Boston undergraduate student takes on $15,000 of debt to gain a degree. \n[1] Gittell and Lemos, Executive Summary: Universal Economics? Boston’s Role in the Regional Economic Network, New England Economic Outlook Conference, New England Economic Partnership, Boston, MA, November 14, 2013.\n[2] MAPC analysis\n[3] www.mapc.org/projections \n[4] Chris Gustafson, “Public Higher Education in Massachusetts and the Governor's FY 2014 Budget,” Massachusetts Budget and Policy Center, March 29, 2013. http://www.massbudget.org/report_window.php?loc=higher_ed_gov_14.html	1	Subject	2014-04-23 16:56:20.728639	2014-05-23 00:35:28.839617
8	In addition to the official unemployment rate, the Bureau of Labor Statistics calculates alternative measures of labor underutilization, including the rate of unemployed plus all marginally attached workers, and workers employed part time for economic reasons [9]. These labor underutilization rates are important to gauge the magnitude of adults who are unemployed or underemployed but are not considered in the official unemployment rate, either because they are not counted as part of the labor force, as in the case of marginally attached workers, or are counted as employed even if they would prefer full time work, as in the case of part time workers for economic reasons. In 2013 this underutilization rate (U-6) was 13.2% - 6.2 percentage points higher than the official unemployment rate. In 2003, it was 3.2 points higher than the official rate. The increase in the gap of underutilization to unemployment indicates that today more people are discouraged about finding a job and are dropping out of the labor force, or are working reduced hours when they’d prefer to work full time, relative to the population, than they were in 2003, even as the official unemployment rate is up over that same time.\nThe underutilization gap held relatively steady between 2003 and 2007, then jumped up between 2008 and 2009, during the Great Recession, when the official unemployment rate (U-3) went up by 3 percentage points and the underutilization rate (U-6) went up by 5.5 percentage points. The gap has remained up around 6 points since 2009, indicating that there are potentially still a lot of workers working fewer hours due to economic reasons. Of course, the gap would decrease if the underutilization rate held steady and the unemployment rate went up, so it is important to watch the trends of all three indicators – official unemployment rate, underutilization rate, and the gap between the two. Relative to the rest of the 50 U.S. states and the District of Columbia, Massachusetts ranks around the middle for all three of these measures.\n[9] For more detailed definitions of marginally attached workers and workers employed part time for economic reasons, see the Bureau of Labor Statistics’ definitions: http://www.bls.gov/lau/stalt.htm	237	Indicator	2014-04-23 16:56:20.906793	2014-05-23 00:18:05.133647
10	In addition to ensuring that the region’s residents have low unemployment overall, it is important that workers be employed in jobs that fit their educational qualifications. As residents of Metro Boston continue to raise their levels of educational attainment and invest in getting college and graduate degrees, the region must work to attract jobs that can employ these highly educated workers. Currently, although the proportion of high skill jobs is increasing as a share of total employment, the region still cannot support the number of workers with bachelor’s and advanced degrees in jobs that require that level of education. In the high skill job category, there are over 383,000 more qualified workers than there are jobs that require a bachelor’s degree or higher. Yet the unemployment rate for workers with a bachelor’s degree or higher is low, at 4%. On the other hand, there are more workers employed in jobs requiring some college or an associate’s degree than there are workers with that level of education. Middle skill jobs make up 38% of the region’s employment, yet middle skill workers make up only 25% of its labor force. This surplus of mid-skill jobs, combined with the relatively low unemployment rate of highly educated workers, could indicate that a certain number higher skill workers are employed in jobs that require a lower level of education than they possess. In the low skill job category, those requiring a high school diploma or less, there is a surplus of 2,000 jobs, which is within the margin of error and indicates a relative balance of workers to jobs. Low skill employment makes up 31% of total employment and low skill workers make up 30% of the labor force. Yet, the unemployment rate for low skill workers it is triple that of high-skill workers, and one-and-a-half times greater than that of middle-skill workers. In light of this, it is evident that overqualified workers are filling low-skill jobs as well. This is consistent with analysis of the New England skill match by the Federal Reserve Bank of Boston’s New England Public Policy Center, which shows that within comparable occupations, New England employs a higher share of college educated workers than the nation [10].\nOverall job market recovery and continued growth of high-skill jobs would help close the high-skill employment gap by opening up more high-education employment opportunities for Metro Boston workers with college degrees. A focus on providing quality post-secondary education to the region’s workers would also help build qualifications for middle-education jobs that make up a relatively stable (though still declining) portion of the region’s employment. There are state programs established to facilitate communication between colleges, training programs, employers and workers, such as the Workforce Competitiveness Trust Fund, and the Workforce Investment Board. These programs should continue to help establish balance between employment needs and workers. Resources such as Crittenton Women’s Union’s Hot Jobs report, which identifies high-demand jobs with middle-educational attainment requirements that pay livable wages and provide employee benefits, can help guide workers seeking to advance their educations and career paths [11].\n[10] Alicia Sasser Modestino, “Mismatch in the Labor Market: Measuring the Supply of and Demand for Skilled Labor in New England”, New England Public Policy Center, Federal Reserve Bank of Boston, Research Report 10-2, November 2010. http://www.bostonfed.org/economic/neppc/conferences/2010/mismatch/\n[11] Deborah Connolly Youngblood, PhD; Kelly Dowd, MPP; Melissa Martin Morgera, MBA; Mark Melnik, PhD; Ruth J. Liberman, MPA, “Hot Jobs 2013: Promoting Economic Independence Through Informed Career Decisions,” Crittenton Women’s Union, March 2013. http://www.liveworkthrive.org/research_and_tools/reports_and_publications/Hot_Jobs_2013_Report	238	Indicator	2014-04-23 16:56:20.929477	2014-05-23 00:18:05.221342
11	In addition to ensuring that the region’s residents have low unemployment overall, it is important that workers be employed in jobs that fit their educational qualifications. As residents of Metro Boston continue to raise their levels of educational attainment and invest in getting college and graduate degrees, the region must work to attract jobs that can employ these highly educated workers. Currently, although the proportion of high skill jobs is increasing as a share of total employment, the region still cannot support the number of workers with bachelor’s and advanced degrees in jobs that require that level of education. In the high skill job category, there are over 383,000 more qualified workers than there are jobs that require a bachelor’s degree or higher. Yet the unemployment rate for workers with a bachelor’s degree or higher is low, at 4%. On the other hand, there are more workers employed in jobs requiring some college or an associate’s degree than there are workers with that level of education. Middle skill jobs make up 38% of the region’s employment, yet middle skill workers make up only 25% of its labor force. This surplus of mid-skill jobs, combined with the relatively low unemployment rate of highly educated workers, could indicate that a certain number higher skill workers are employed in jobs that require a lower level of education than they possess. In the low skill job category, those requiring a high school diploma or less, there is a surplus of 2,000 jobs, which is within the margin of error and indicates a relative balance of workers to jobs. Low skill employment makes up 31% of total employment and low skill workers make up 30% of the labor force. Yet, the unemployment rate for low skill workers it is triple that of high-skill workers, and one-and-a-half times greater than that of middle-skill workers. In light of this, it is evident that overqualified workers are filling low-skill jobs as well. This is consistent with analysis of the New England skill match by the Federal Reserve Bank of Boston’s New England Public Policy Center, which shows that within comparable occupations, New England employs a higher share of college educated workers than the nation [10].\nOverall job market recovery and continued growth of high-skill jobs would help close the high-skill employment gap by opening up more high-education employment opportunities for Metro Boston workers with college degrees. A focus on providing quality post-secondary education to the region’s workers would also help build qualifications for middle-education jobs that make up a relatively stable (though still declining) portion of the region’s employment. There are state programs established to facilitate communication between colleges, training programs, employers and workers, such as the Workforce Competitiveness Trust Fund, and the Workforce Investment Board. These programs should continue to help establish balance between employment needs and workers. Resources such as Crittenton Women’s Union’s Hot Jobs report, which identifies high-demand jobs with middle-educational attainment requirements that pay livable wages and provide employee benefits, can help guide workers seeking to advance their educations and career paths [11].\n[10] Alicia Sasser Modestino, “Mismatch in the Labor Market: Measuring the Supply of and Demand for Skilled Labor in New England”, New England Public Policy Center, Federal Reserve Bank of Boston, Research Report 10-2, November 2010. http://www.bostonfed.org/economic/neppc/conferences/2010/mismatch/\n[11] Deborah Connolly Youngblood, PhD; Kelly Dowd, MPP; Melissa Martin Morgera, MBA; Mark Melnik, PhD; Ruth J. Liberman, MPA, “Hot Jobs 2013: Promoting Economic Independence Through Informed Career Decisions,” Crittenton Women’s Union, March 2013. http://www.liveworkthrive.org/research_and_tools/reports_and_publications/Hot_Jobs_2013_Report	239	Indicator	2014-04-23 16:56:20.944089	2014-05-23 00:18:05.265607
9	In addition to ensuring that the region’s residents have low unemployment overall, it is important that workers be employed in jobs that fit their educational qualifications. As residents of Metro Boston continue to raise their levels of educational attainment and invest in getting college and graduate degrees, the region must work to attract jobs that can employ these highly educated workers. Currently, although the proportion of high skill jobs is increasing as a share of total employment, the region still cannot support the number of workers with bachelor’s and advanced degrees in jobs that require that level of education. In the high skill job category, there are over 383,000 more qualified workers than there are jobs that require a bachelor’s degree or higher. Yet the unemployment rate for workers with a bachelor’s degree or higher is low, at 4%. On the other hand, there are more workers employed in jobs requiring some college or an associate’s degree than there are workers with that level of education. Middle skill jobs make up 38% of the region’s employment, yet middle skill workers make up only 25% of its labor force. This surplus of mid-skill jobs, combined with the relatively low unemployment rate of highly educated workers, could indicate that a certain number higher skill workers are employed in jobs that require a lower level of education than they possess. In the low skill job category, those requiring a high school diploma or less, there is a surplus of 2,000 jobs, which is within the margin of error and indicates a relative balance of workers to jobs. Low skill employment makes up 31% of total employment and low skill workers make up 30% of the labor force. Yet, the unemployment rate for low skill workers it is triple that of high-skill workers, and one-and-a-half times greater than that of middle-skill workers. In light of this, it is evident that overqualified workers are filling low-skill jobs as well. This is consistent with analysis of the New England skill match by the Federal Reserve Bank of Boston’s New England Public Policy Center, which shows that within comparable occupations, New England employs a higher share of college educated workers than the nation [10].\nOverall job market recovery and continued growth of high-skill jobs would help close the high-skill employment gap by opening up more high-education employment opportunities for Metro Boston workers with college degrees. A focus on providing quality post-secondary education to the region’s workers would also help build qualifications for middle-education jobs that make up a relatively stable (though still declining) portion of the region’s employment. There are state programs established to facilitate communication between colleges, training programs, employers and workers, such as the Workforce Competitiveness Trust Fund, and the Workforce Investment Board. These programs should continue to help establish balance between employment needs and workers. Resources such as Crittenton Women’s Union’s Hot Jobs report, which identifies high-demand jobs with middle-educational attainment requirements that pay livable wages and provide employee benefits, can help guide workers seeking to advance their educations and career paths [11].\n[10] Alicia Sasser Modestino, “Mismatch in the Labor Market: Measuring the Supply of and Demand for Skilled Labor in New England”, New England Public Policy Center, Federal Reserve Bank of Boston, Research Report 10-2, November 2010. http://www.bostonfed.org/economic/neppc/conferences/2010/mismatch/\n[11] Deborah Connolly Youngblood, PhD; Kelly Dowd, MPP; Melissa Martin Morgera, MBA; Mark Melnik, PhD; Ruth J. Liberman, MPA, “Hot Jobs 2013: Promoting Economic Independence Through Informed Career Decisions,” Crittenton Women’s Union, March 2013. http://www.liveworkthrive.org/research_and_tools/reports_and_publications/Hot_Jobs_2013_Report	240	Indicator	2014-04-23 16:56:20.91768	2014-05-23 00:18:05.348631
13	When considering families with children, married couple families in Metro Boston have a median income 2.4 times higher than single father families, and 3.9 times higher than single mother families. While it may be intuitive that married couple families should make roughly double the income of single parent families, the fact that married couple families with children in Metro Boston have a median income nearly 4 times greater than that of single mother families indicates that there is more at play than simply number of earners.	259	Indicator	2014-04-23 16:56:20.972369	2014-05-23 00:18:08.363219
14	When considering families with children, married couple families in Metro Boston have a median income 2.4 times higher than single father families, and 3.9 times higher than single mother families. While it may be intuitive that married couple families should make roughly double the income of single parent families, the fact that married couple families with children in Metro Boston have a median income nearly 4 times greater than that of single mother families indicates that there is more at play than simply number of earners.	260	Indicator	2014-04-23 16:56:20.990799	2014-05-23 00:18:08.448361
12	When considering families with children, married couple families in Metro Boston have a median income 2.4 times higher than single father families, and 3.9 times higher than single mother families. While it may be intuitive that married couple families should make roughly double the income of single parent families, the fact that married couple families with children in Metro Boston have a median income nearly 4 times greater than that of single mother families indicates that there is more at play than simply number of earners.	261	Indicator	2014-04-23 16:56:20.958579	2014-05-23 00:18:08.625636
7	Metro Boston is making great strides in increasing its college graduation rate, but an undergraduate degree comes at a cost. In today’s economy, unemployment is up across all educational attainment groups, so even workers with a college degree are more than twice as likely to be unemployed today as they were in 2000. There are also students who enroll in college and take on debt, but are unable to graduate for any number of reasons. Without the advantage of having a degree, the cost of debt becomes an even greater effective burden. Dropping out of a degree program, or taking longer than is standard to graduate, commonly leads to increased debt, lower-wage employment and higher likelihood of defaulting on loans. <sup> 1</sup>\n\nThere are roughly 100 colleges and universities in the Metro Boston region. In 2012, students from these institutions received nearly 49,000 undergraduate degrees and incurred more than $736 million in federal student loan debt—a debt-to-degree ratio of $15,000, slightly higher than the national average of $14,300. This high debt-to-degree ratio is a problem across all higher education sectors—private non-profit, private for-profit, public, two-year and four-year institutions—but there are differing trends among sectors. Overall, the highest federal loan debts are accrued at four-year for-profit schools: an average of $35,000 per degree for the years 2010 to 2012. The largest increase, however, in debt-to-degree ratio from 2007-2009 to 2010-2012 occurred in the state’s public colleges and universities, at 30%. The debt-to-degree ratio for Massachusetts four-year public undergraduate institutions is now $24,000, for years 2010 to 2012, and exceeds that of four-year private non-profit undergraduate colleges and universities. In contrast, the debt-to-degree ratios for private for-profit and private non-profit institutions have dropped over the same interval, by 5% and 20% respectively.  The factors influencing the debt-to-degree ratio are complex—tuition, scholarships, enrollment, dropout, and graduation rates all influence the final debt-load metric. Metro Boston institutions must work to keep tuition costs in check while making scholarships available to those in need, and simultaneously increase student retention for our schools to adequately serve the region’s students.  \n\nUltimately, since more students are relying on our state’s public colleges and universities, where enrollment is up 24% since 2007, for their higher education, keeping those degrees affordable for all Massachusetts students will be a crucial component of the region’s prosperity in years to come. Already many institutions are working to keep costs in check while providing the necessary tools and supports to overcome barriers to timely graduation. Public funding for public universities plays a large roll in tuition rates. At Massachusetts state universities, tuition rates rose 116% between fiscal years 2002 and 2013, while higher education appropriations from the state budget fell 25%.<sup>2</sup> Funding for public higher education did increase in the 2013 and 2014 state budgets, giving much needed support to state universities, community colleges and the UMass system, and also important scholarship and grant programs.<sup>3, 4</sup> For the region’s young adults to be prosperous now and into the future, they must not only be able to attain a high-quality post-secondary education, but they must be able to afford to pay off their student loans throughout the 10+ year loan repayment period.\n<ol>\n<li>Lawrence Gladieux and Laura Perna, “Borrowers Who Drop Out: A Neglected Aspect if the College Student Loan Trend.” The National Center for Public Policy and Higher Education, National Center Report #05-2, May, 2005. \n<a href="http://files.eric.ed.gov/fulltext/ED508094.pdf" target="_blank">http://files.eric.ed.gov/fulltext/ED508094.pdf</a></li>\n<li>Chris Gustafson, “Public Higher Education in Massachusetts and the Governor's FY 2014 Budget,” Massachusetts Budget and Policy Center, March 29, 2013. <a href="http://www.massbudget.org/report_window.php?loc=higher_ed_gov_14.html" target="_blank">Massbudget.org</a></li>\n<li>Chris Gustafson, “Public Higher Education in Massachusetts and the Governor's FY 2014 Budget,” Massachusetts Budget and Policy Center, March 29, 2013. <a href="http://www.massbudget.org/report_window.php?loc=higher_ed_gov_14.html" target="_blank">Massbudget.org</a></li>\n<li>Massachusetts Budget and Policy Center, Budget Browser<a href="http://massbudget.org/browser/subcat.php?c1=13&c2=14&id=Higher+Education&inflation=cpi&budgets=315b115b14b13b12b11b10b9b8b7b6b5b4b3b2b1#comparisons" target="_blank"> Massbudget.org</a></li>\n</ol>	219	Indicator	2014-04-23 16:56:20.893449	2014-05-23 00:38:39.373899
15	When considering families with children, married couple families in Metro Boston have a median income 2.4 times higher than single father families, and 3.9 times higher than single mother families. While it may be intuitive that married couple families should make roughly double the income of single parent families, the fact that married couple families with children in Metro Boston have a median income nearly 4 times greater than that of single mother families indicates that there is more at play than simply number of earners.	257	Indicator	2014-04-23 16:56:21.009986	2014-04-23 16:56:21.009986
16	When considering families with children, married couple families in Metro Boston have a median income 2.4 times higher than single father families, and 3.9 times higher than single mother families. While it may be intuitive that married couple families should make roughly double the income of single parent families, the fact that married couple families with children in Metro Boston have a median income nearly 4 times greater than that of single mother families indicates that there is more at play than simply number of earners.	258	Indicator	2014-04-23 16:56:21.073557	2014-04-23 16:56:21.073557
17	The Gini Index of Household Income Inequality, published by the U.S. Census Bureau, measures income distribution among households for a given geography. Gini index values range from 0.0, when all households have equal shares of income, to 1.0, when one household has all the income and the rest none. Of the 100 most populous U.S. metro areas, Metro Boston has the 12th highest Gini Index of Household Income Inequality, and has a Gini Index value higher than that of the nation overall. This high position fits the story that our prosperity indicators tell – we are a region with a lot of wealth, growing poverty, and a shrinking middle class. And, along with the nation overall, income inequality in our region is moving in the wrong direction. Other than a slight drop in 2009, the region has shown a near steady increase in its Gini Index value since 2006, and has had a Gini Index value greater than the nation every year since 2007.	252	Indicator	2014-04-23 16:56:21.086294	2014-04-23 16:56:21.086294
20	High school diploma attainment gaps by community type, race and ethnicity have improved in Metro Boston since 2000. The percentage point difference in working age adults without a high school diploma is down 3 points since 2000 for Black adults compared to White adults, and down 6 points for Latino adults compared to White adults. In Metro Boston’s Regional Urban Centers, the gap compared to the regional average is down 2 points. There are still some significant differences, however, between groups. Although the most significant gains have been among Latinos in the region, especially those in Regional Urban Centers, where the percentage of working age Latino adults without a high school diploma has decreased 13 points from 48% in 2000 to 35%, overall in the region, Latinos still have the highest rate of no-diploma attainment, at 31%. \nCompared to other community types, Regional Urban Centers have the highest share of residents without a high school diploma, bringing particular economic challenges to these communities. For Latinos and Asians, there is a large gap in high school diploma attainment between those living in Regional Urban Centers and those living in Suburbs. \nWhile the Latino to White high school diploma gap is the largest gap in Metro Boston, it is actually the only racial gap that is smaller for the region than it is for the nation. For Blacks and Asians, the Metro Boston gap is larger than that of the nation. Blacks in Metro Boston have roughly the same share of adults without a high school diploma as they do nationally, and Asians in Metro Boston have a higher share by 2 percentage points. Whites and Latinos, on the other hand, have 3 and 4 percentage points fewer adults without a high school diploma, respectively, than they do nationally.	217	Indicator	2014-04-23 16:56:21.127976	2014-05-23 00:18:03.45658
22	The labor force patterns that teenagers and young adults take on early in life are strong predictors of their labor force patterns as adults, and are correlated with lifetime earnings[12] and upward mobility [13]. Working age youth tend to have lower rates of labor force participation than adults, mostly because they are enrolled in school, but still 61% of Metro Boston’s 16-24 year olds work or are looking for work. The region has the 5th highest youth participation rate, among the top 25 most populous U.S. metro areas. Metro Boston teenagers (ages 16-19), 90% of whom are enrolled in school, have a labor force participation rate of only 44%, but still participate at the second highest rate of the top 25 metro areas. Metro Boston young adults ages 20-24, 51% of whom are enrolled in school, have a higher participation rate, at 75%, but actually come in lower among the top 25 metro areas, ranking 13th. Participation rates are down for teens and young adults since 2008 in Metro Boston and across the nation, though in recent years rates have leveled out and started to turn around. \nUnemployment among Metro Boston youth is more than double that of adults, but again, compared to the nation, the region’s 15% youth unemployment rate is low, ranking 23rd among the 25 most populous U.S. metro areas. The unemployment rate for Metro Boston teens is more than double that of young adults, and this is true nationally as well. Metro Boston ranks 22nd and 24th, for teen and young adult unemployment, respectively, among the top 25 metro areas.\nThere are significant gaps in unemployment between youth of color in the region and white youth. The rate of unemployment for Black youth is double that of White youth, and for Latino youth it is nearly double. The gap is most stark in the Inner Core, where Black youth have the highest unemployment rate in the region at 30.5%, and White youth have the lowest in the region, at 9.4%. Despite the large gap in unemployment between Black youth and White youth, Metro Boston has one of the smaller Black-to-White unemployment gaps of the 25 most populous MSAs, ranking 21st. The gap in Metro Boston’s Latino-to-White youth unemployment rate, however, is the largest of the top 25 metro areas.\nBecause youth participation in the labor force varies greatly depending on school enrollment, a useful indicator is a measurement of youth who are neither in school nor in employment, often called NEET, for Not in Education, Employment or Training. In Metro Boston, 9% of youth (5% of teenagers and 12% of young adults) are neither in school nor employed.\n[12] Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm\n[13] Raj Chetty, Nathaniel Hendren, Patrick Kline, and Emmanuel Saez, “Where is the Land of Opportunity? The Geography of Intergenerational Mobility in the United States,” The Equality of Opportunity Project, Harvard University, January 2014, p 43. http://obs.rc.fas.harvard.edu/chetty/mobility_geo.pdf	242	Indicator	2014-04-23 16:56:21.161858	2014-05-23 00:38:41.467532
47	Metro Boston’s labor force grew 3% between 2000 and 2010, at a slightly slower pace than the population, which grew 3.5% during that time. In the years since 2009, after the Great Recession, growth of the labor force has picked up to a slow but relatively stable pace, and the trends for employed and unemployed populations have generally moved in the right direction since that time, though the unemployed population remains 2.6 times higher in 2013 than it was at its nadir in 2000, and increased slightly between 2012 and 2013. In order to grow its economy, the region must continue to grow the employed population at a faster pace.	220	Indicator	2014-04-23 16:56:21.596829	2014-04-23 16:56:21.596829
28	Metro Boston family households have the 3rd highest median income in the nation, among the top 25 most populous metro areas. Since 2005, family median income in the region has increased 4%, adjusted to 2012 dollars, 6 points more than that of the US, which actually decreased 2% over that time. The region’s wealth is not consistent across family types, however. Among the 25 most populous metro areas, Metro Boston married couple families with children have the 2nd highest median income; single father families also rank 2nd highest, and single mother families rank 7th highest. \nMarried couple families with children in Metro Boston have fared better than average U.S. married couple families with children. Since 2005, median income for married couple families with children has increased 7%, compared to 1% for the full U.S. Single father families in Metro Boston have also fared better than average single father families in the U.S. by nearly 10 points. Median income for single father families has increased 1% in Metro Boston, compared to a 9% decrease in the full U.S. Single father families across the full U.S. saw large declines during the Great Recession, but in Metro Boston they have been able to jump back to pre-recession growth, while their counterparts across the U.S. have not. Single mothers in Metro Boston, on the other hand, have fared worse than single mother families across the full U.S. Median income for single mother families in Metro Boston has decreased 11% since 2005, a larger decrease than the 8% decrease for the full U.S.	254	Indicator	2014-04-23 16:56:21.246362	2014-05-23 00:18:08.08595
48	The labor force patterns that teenagers and young adults take on early in life are strong predictors of their labor force patterns as adults, and are correlated with lifetime earnings[12] and upward mobility [13]. Working age youth tend to have lower rates of labor force participation than adults, mostly because they are enrolled in school, but still 61% of Metro Boston’s 16-24 year olds work or are looking for work. The region has the 5th highest youth participation rate, among the top 25 most populous U.S. metro areas. Metro Boston teenagers (ages 16-19), 90% of whom are enrolled in school, have a labor force participation rate of only 44%, but still participate at the second highest rate of the top 25 metro areas. Metro Boston young adults ages 20-24, 51% of whom are enrolled in school, have a higher participation rate, at 75%, but actually come in lower among the top 25 metro areas, ranking 13th. Participation rates are down for teens and young adults since 2008 in Metro Boston and across the nation, though in recent years rates have leveled out and started to turn around. \nUnemployment among Metro Boston youth is more than double that of adults, but again, compared to the nation, the region’s 15% youth unemployment rate is low, ranking 23rd among the 25 most populous U.S. metro areas. The unemployment rate for Metro Boston teens is more than double that of young adults, and this is true nationally as well. Metro Boston ranks 22nd and 24th, for teen and young adult unemployment, respectively, among the top 25 metro areas.\nThere are significant gaps in unemployment between youth of color in the region and white youth. The rate of unemployment for Black youth is double that of White youth, and for Latino youth it is nearly double. The gap is most stark in the Inner Core, where Black youth have the highest unemployment rate in the region at 30.5%, and White youth have the lowest in the region, at 9.4%. Despite the large gap in unemployment between Black youth and White youth, Metro Boston has one of the smaller Black-to-White unemployment gaps of the 25 most populous MSAs, ranking 21st. The gap in Metro Boston’s Latino-to-White youth unemployment rate, however, is the largest of the top 25 metro areas.\nBecause youth participation in the labor force varies greatly depending on school enrollment, a useful indicator is a measurement of youth who are neither in school nor in employment, often called NEET, for Not in Education, Employment or Training. In Metro Boston, 9% of youth (5% of teenagers and 12% of young adults) are neither in school nor employed.\n[12] Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm\n[13] Raj Chetty, Nathaniel Hendren, Patrick Kline, and Emmanuel Saez, “Where is the Land of Opportunity? The Geography of Intergenerational Mobility in the United States,” The Equality of Opportunity Project, Harvard University, January 2014, p 43. http://obs.rc.fas.harvard.edu/chetty/mobility_geo.pdf	244	Indicator	2014-04-23 16:56:21.611636	2014-05-23 00:38:41.656242
35	Gaps in labor force participation by educational attainment, race and ethnicity, and community type have improved since 2000. Blacks and Latinos have closed the labor force participation gap by roughly 10 points since 2000, due to rapidly increasing participation rates among minorities and not much change among Whites. While labor force participation is still 23 points lower among adults without a high school diploma than adults with a 2- or 4-year college degree, the gap is smaller than the 27 point gap in 2000. In Regional Urban Centers, where fewer adults have a high school diploma or college degree, and where struggling local economies may provide few local jobs, labor force participation is lower than in other community types, and the participation gap relative to the regional average shrank by a marginal 1 point. the participation gap between working age adults in the Inner Core compared to the regional average shrank by 3 points to 0 between 2000 and 2007-11. \nFuture demographic changes would lead to a more diverse labor force for the region. Closing the labor force participation gap across races by closing the educational attainment gap and making sure Regional Urban Centers have good jobs for their residents will be essential to not only retain the skills in the labor force, but also for the employers in the region.	226	Indicator	2014-04-23 16:56:21.35641	2014-04-23 16:56:21.35641
32	Labor market shifts since 2001 reinforce the increasing importance of education and advanced training. Job losses in manufacturing and construction, two sectors that traditionally offered a path to the middle class for workers without college degrees, correspond to stagnating real wages, increasing unemployment rates, and decreasing labor force participation among less-educated workers. This is especially true in the Boston region. The Boston region ranks in the top four among the 25 largest MSAs in participation rates for workers with a high school degree, some college, or a college degree or higher.  But participation rates for workers without a high school degree are 17th.\n[5] In 2008 the American Community Survey changed the way it measures employment, resulting in systematically higher employment estimates. As a result, we cannot directly compare pre- and post-2008 rates.	223	Indicator	2014-04-23 16:56:21.313261	2014-05-23 00:18:03.874738
30	Metro Boston family households have the 3rd highest median income in the nation, among the top 25 most populous metro areas. Since 2005, family median income in the region has increased 4%, adjusted to 2012 dollars, 6 points more than that of the US, which actually decreased 2% over that time. The region’s wealth is not consistent across family types, however. Among the 25 most populous metro areas, Metro Boston married couple families with children have the 2nd highest median income; single father families also rank 2nd highest, and single mother families rank 7th highest. \nMarried couple families with children in Metro Boston have fared better than average U.S. married couple families with children. Since 2005, median income for married couple families with children has increased 7%, compared to 1% for the full U.S. Single father families in Metro Boston have also fared better than average single father families in the U.S. by nearly 10 points. Median income for single father families has increased 1% in Metro Boston, compared to a 9% decrease in the full U.S. Single father families across the full U.S. saw large declines during the Great Recession, but in Metro Boston they have been able to jump back to pre-recession growth, while their counterparts across the U.S. have not. Single mothers in Metro Boston, on the other hand, have fared worse than single mother families across the full U.S. Median income for single mother families in Metro Boston has decreased 11% since 2005, a larger decrease than the 8% decrease for the full U.S.	256	Indicator	2014-04-23 16:56:21.281033	2014-05-23 00:18:08.198427
31	Labor market shifts since 2001 reinforce the increasing importance of education and advanced training. Job losses in manufacturing and construction, two sectors that traditionally offered a path to the middle class for workers without college degrees, correspond to stagnating real wages, increasing unemployment rates, and decreasing labor force participation among less-educated workers. This is especially true in the Boston region. The Boston region ranks in the top four among the 25 largest MSAs in participation rates for workers with a high school degree, some college, or a college degree or higher.  But participation rates for workers without a high school degree are 17th<sup>1 </sup>.\n<ol>\n<li> \nIn 2008 the American Community Survey changed the way it measures employment, resulting in systematically higher employment estimates. As a result, we cannot directly compare pre- and post-2008 rates.</li>\n</ol>	225	Indicator	2014-04-23 16:56:21.298648	2014-05-23 00:38:39.96264
66	One way to measure the wealth of Metro Boston residents is to calculate the ratio of unearned income (interest, dividends, and capital gains) to earned income (salaries and wages) using tax return data from the Internal Revenue Service, which is available at the zip code level. In 2011, Metro Boston tax payers had a median ratio of unearned to earned income of 0.06; that is for every $100 of earned income, half of tax payers had $6 dollars or more of unearned income. There are clear racial disparities in the distribution of this wealth. In 2011, 81% of Black and Latino Metro Boston tax payers lived in zip codes with unearned to earned ratios below the median, compared to 52% of White tax payers. The below map shows that communities with the largest ratios of unearned to earned income have mostly White residents, and that communities with large populations of color have lower unearned to earned income ratios.	270	Indicator	2014-05-08 16:50:23.159111	2014-05-23 00:38:43.891566
36	Gaps in labor force participation by educational attainment, race and ethnicity, and community type have improved since 2000. Blacks and Latinos have closed the labor force participation gap by roughly 10 points since 2000, due to rapidly increasing participation rates among minorities and not much change among Whites. While labor force participation is still 23 points lower among adults without a high school diploma than adults with a 2- or 4-year college degree, the gap is smaller than the 27 point gap in 2000. In Regional Urban Centers, where fewer adults have a high school diploma or college degree, and where struggling local economies may provide few local jobs, labor force participation is lower than in other community types, and the participation gap relative to the regional average shrank by a marginal 1 point. the participation gap between working age adults in the Inner Core compared to the regional average shrank by 3 points to 0 between 2000 and 2007-11. \nFuture demographic changes would lead to a more diverse labor force for the region. Closing the labor force participation gap across races by closing the educational attainment gap and making sure Regional Urban Centers have good jobs for their residents will be essential to not only retain the skills in the labor force, but also for the employers in the region.	230	Indicator	2014-04-23 16:56:21.375623	2014-04-23 16:56:21.375623
37	Gaps in labor force participation by educational attainment, race and ethnicity, and community type have improved since 2000. Blacks and Latinos have closed the labor force participation gap by roughly 10 points since 2000, due to rapidly increasing participation rates among minorities and not much change among Whites. While labor force participation is still 23 points lower among adults without a high school diploma than adults with a 2- or 4-year college degree, the gap is smaller than the 27 point gap in 2000. In Regional Urban Centers, where fewer adults have a high school diploma or college degree, and where struggling local economies may provide few local jobs, labor force participation is lower than in other community types, and the participation gap relative to the regional average shrank by a marginal 1 point. the participation gap between working age adults in the Inner Core compared to the regional average shrank by 3 points to 0 between 2000 and 2007-11. \nFuture demographic changes would lead to a more diverse labor force for the region. Closing the labor force participation gap across races by closing the educational attainment gap and making sure Regional Urban Centers have good jobs for their residents will be essential to not only retain the skills in the labor force, but also for the employers in the region.	227	Indicator	2014-04-23 16:56:21.390733	2014-04-23 16:56:21.390733
38	Gaps in labor force participation by educational attainment, race and ethnicity, and community type have improved since 2000. Blacks and Latinos have closed the labor force participation gap by roughly 10 points since 2000, due to rapidly increasing participation rates among minorities and not much change among Whites. While labor force participation is still 23 points lower among adults without a high school diploma than adults with a 2- or 4-year college degree, the gap is smaller than the 27 point gap in 2000. In Regional Urban Centers, where fewer adults have a high school diploma or college degree, and where struggling local economies may provide few local jobs, labor force participation is lower than in other community types, and the participation gap relative to the regional average shrank by a marginal 1 point. the participation gap between working age adults in the Inner Core compared to the regional average shrank by 3 points to 0 between 2000 and 2007-11. \nFuture demographic changes would lead to a more diverse labor force for the region. Closing the labor force participation gap across races by closing the educational attainment gap and making sure Regional Urban Centers have good jobs for their residents will be essential to not only retain the skills in the labor force, but also for the employers in the region.	228	Indicator	2014-04-23 16:56:21.405737	2014-04-23 16:56:21.405737
39	Gaps in labor force participation by educational attainment, race and ethnicity, and community type have improved since 2000. Blacks and Latinos have closed the labor force participation gap by roughly 10 points since 2000, due to rapidly increasing participation rates among minorities and not much change among Whites. While labor force participation is still 23 points lower among adults without a high school diploma than adults with a 2- or 4-year college degree, the gap is smaller than the 27 point gap in 2000. In Regional Urban Centers, where fewer adults have a high school diploma or college degree, and where struggling local economies may provide few local jobs, labor force participation is lower than in other community types, and the participation gap relative to the regional average shrank by a marginal 1 point. the participation gap between working age adults in the Inner Core compared to the regional average shrank by 3 points to 0 between 2000 and 2007-11. \nFuture demographic changes would lead to a more diverse labor force for the region. Closing the labor force participation gap across races by closing the educational attainment gap and making sure Regional Urban Centers have good jobs for their residents will be essential to not only retain the skills in the labor force, but also for the employers in the region.	229	Indicator	2014-04-23 16:56:21.424684	2014-04-23 16:56:21.424684
45	Part of maintaining a prosperous region is retaining and attracting young adults who will participate in the labor force and contribute to the regional economy. Except for the marginal in-migration during the recession of 2008-09, the Metro Boston region has historically seen net-out migration to other states. International migration has been critical to help keep the region’s net migration positive for several years. A lot of people move into the region to attend college and graduate institutions, but following graduation there is net out-migration for all age groups. \nThe region competes with all metro areas for this highly mobile generation of young people who enter the labor force after graduation, and except for the most recent period of economic recovery, has not been able to retain enough of the young graduates to capitalize on their skills and add to the labor force significantly. Currently, over 60% of the labor force is comprised of people between the ages of 35-54 years, and the 25-34 year olds comprise of 15% of the labor force. Moving forward, this trend would lead to a stagnating or declining labor force with the older workers retiring and fewer younger people coming in to fill those positions.\nThe demographic profile of the population moving into the region varies from that of the population leaving the region. In-migrants are slightly younger and much more racially diverse than those who leave, and the overall regional population. While the total numbers of in-migrants versus out-migrants may not show significant changes, the shares do show the changing demographics of the region and how important migration is to build the region’s labor force. In terms of educational attainment, the profile of the out-migrants and in-migrants is almost identical. However, given the higher unemployment rate for the minority races irrespective of educational attainment, it is worth noting that closing the unemployment rate gap would be of significance in attracting skilled and diverse workers to the region.	248	Indicator	2014-04-23 16:56:21.569609	2014-05-23 00:18:06.113569
70	The number of patents is one measure of the intellectual productivity of the region’s R&D community. More importantly, each patent represents an opportunity to profit from the development, manufacturing, and sale of new inventions. In 2011, innovators in Metro Boston were issued over 4,500 patents, making the Boston area a national leader in innovation. Metro Boston ranks 5th among U.S. metro areas for number of patents issued. The number of patents is often expressed as ratio of patents to businesses. In 2011, 459 patents were issued per 10,000 businesses in Metro Boston, up 40% from 2003. The region now ranks 17th in the nation for number of patents issued per business, up from 29th in 2003. While it is not possible to determine how many patented inventions came to the market or were manufactured in the region, the statistics make it clear that there are abundant ideas on which to base more advanced development and production activities.	274	Indicator	2014-05-08 16:50:23.223765	2014-05-23 00:18:06.387582
44	Part of maintaining a prosperous region is retaining and attracting young adults who will participate in the labor force and contribute to the regional economy. Except for the marginal in-migration during the recession of 2008-09, the Metro Boston region has historically seen net-out migration to other states. International migration has been critical to help keep the region’s net migration positive for several years. A lot of people move into the region to attend college and graduate institutions, but following graduation there is net out-migration for all age groups. \nThe region competes with all metro areas for this highly mobile generation of young people who enter the labor force after graduation, and except for the most recent period of economic recovery, has not been able to retain enough of the young graduates to capitalize on their skills and add to the labor force significantly. Currently, over 60% of the labor force is comprised of people between the ages of 35-54 years, and the 25-34 year olds comprise of 15% of the labor force. Moving forward, this trend would lead to a stagnating or declining labor force with the older workers retiring and fewer younger people coming in to fill those positions.\nThe demographic profile of the population moving into the region varies from that of the population leaving the region. In-migrants are slightly younger and much more racially diverse than those who leave, and the overall regional population. While the total numbers of in-migrants versus out-migrants may not show significant changes, the shares do show the changing demographics of the region and how important migration is to build the region’s labor force. In terms of educational attainment, the profile of the out-migrants and in-migrants is almost identical. However, given the higher unemployment rate for the minority races irrespective of educational attainment, it is worth noting that closing the unemployment rate gap would be of significance in attracting skilled and diverse workers to the region.	249	Indicator	2014-04-23 16:56:21.552124	2014-05-23 00:18:06.183705
46	Part of maintaining a prosperous region is retaining and attracting young adults who will participate in the labor force and contribute to the regional economy. Except for the marginal in-migration during the recession of 2008-09, the Metro Boston region has historically seen net-out migration to other states. International migration has been critical to help keep the region’s net migration positive for several years. A lot of people move into the region to attend college and graduate institutions, but following graduation there is net out-migration for all age groups. \nThe region competes with all metro areas for this highly mobile generation of young people who enter the labor force after graduation, and except for the most recent period of economic recovery, has not been able to retain enough of the young graduates to capitalize on their skills and add to the labor force significantly. Currently, over 60% of the labor force is comprised of people between the ages of 35-54 years, and the 25-34 year olds comprise of 15% of the labor force. Moving forward, this trend would lead to a stagnating or declining labor force with the older workers retiring and fewer younger people coming in to fill those positions.\nThe demographic profile of the population moving into the region varies from that of the population leaving the region. In-migrants are slightly younger and much more racially diverse than those who leave, and the overall regional population. While the total numbers of in-migrants versus out-migrants may not show significant changes, the shares do show the changing demographics of the region and how important migration is to build the region’s labor force. In terms of educational attainment, the profile of the out-migrants and in-migrants is almost identical. However, given the higher unemployment rate for the minority races irrespective of educational attainment, it is worth noting that closing the unemployment rate gap would be of significance in attracting skilled and diverse workers to the region.	250	Indicator	2014-04-23 16:56:21.586849	2014-05-23 00:18:06.26185
42	In Metro Boston the rich are getting richer, the poor are getting poorer, and the middle class are stuck in place. Adjusted for inflation, mean income for the top fifth of households increased by 9% between 2006 and 2011, while for the bottom fifth, it decreased 6%. Households in the middle fifth of the income range saw no change in income over this time, when adjusted for inflation.\nThe mean income of the richest fifth of Metro Boston households is $250,829, 3.4 times greater than the $71,925 mean income of the middle fifth, and 18 times greater than the $13,877 mean income of the poorest fifth of households. For the richest 5% of households, mean income is $448,015 [3]. \nMetro Boston’s ratio of top fifth to bottom fifth is higher than the national average of 16.0, and ranks 4th highest among the top 25 most populous U.S. metro areas. The region is also moving in the wrong direction: in 2006 Metro Boston’s  ratio was 15.9. \nIn Metro Boston, the poorest fifth of households hold just 3% of aggregate regional household income, while the richest fifth hold 51%, and the top 5% hold 23%. \n[3] These numbers are for the 2008-2012 5 year estimates for the MA portion of the MSA. The time series graph is for the full MSA, as the 1-year data are not available for the MA-only portion.	251	Indicator	2014-04-23 16:56:21.473248	2014-05-23 00:18:07.785992
55	The annual unemployment rate in Metro Boston was 6.4% in 2013, lower than the 7.1% rate of Massachusetts, and the 7.4% rate of the nation. The region’s annual unemployment rate has been consistently lower than that of the state and nation since the early 1990’s, except for in 2002, just following the 2001 recession, when the region and the state had the same annual rate.\nYearly statistics show a steady downward trend in the Metro Boston’s unemployment rate after it peaked in 2009 following the Great Recession, although it ticked upward in 2013. As of January, 2014 the region had 158,174 unemployed workers, 18,287 fewer than in January of 2013.	231	Indicator	2014-04-23 16:56:21.710327	2014-04-23 16:56:21.710327
53	Unemployment gaps by educational attainment, race and ethnicity, and community type have remained stubbornly persistent, with no definitive movement since 2000. Educational attainment is a significant factor in employment outcomes in the region – for an adult in the region without a college degree, the unemployment rate is double that of an adult with a college degree; for an adult without a high school diploma it is triple. Race also plays a significant role in employment outcomes, especially for Black residents: the unemployment rate for Blacks in the region is 6 points higher than that of Whites, a larger gap than 2000’s 4 points. Across all educational attainment levels, Blacks have the highest rate of unemployment of any race or ethnicity. This points to troubling and persistent discrimination in employment practices [6]. The unemployment gap between Latino and White Metro Boston adults has closed a marginal 1 point, from 4 points in 2000 to 3. \nMetro Boston’s unemployment rate for adults ages 16 and older [7] is lower than the national average for Whites and Blacks, but higher for Latinos and Asians. The unemployment gap between Black adults ages 16 and over in Metro Boston is 0.3 percentage points lower than it is for the nation overall. For Latinos, the gap is 2.2 points greater than that of the nation. Metro Boston has the second largest unemployment gap between Latinos and Whites, out of the 25 most populous U.S. metros.\nUnemployment is inherently bad for day-to-day financial well-being, but it also hinders long-term wealth building, because during periods of unemployment people are likely to need to dip into savings in order to make up for lost wages. The disproportionate rate of unemployment between adults of color and white adults accounts for 9% of the growing national racial wealth gap, according to a Brandeis University study [8].\nThe long-term implications of such pronounced gaps in unemployment are not good for the region. Racial gaps, especially, are troubling for our region, which is becoming more diverse every year. While trends show increased educational attainment across races, which should fare well for regional employment in knowledge-based jobs, discriminatory hiring limits opportunity for residents of color who are qualified for those jobs, and imposes an artificial limit on the applicant pool from which employers have to draw from.\n[6] For more information about trends of discrimination in hiring, see MAPC’s State of Equity report: http://regionalindicators.org/site_media/pdf/Equity-Report_12-14_72ppi.pdf pp 75-79.\n[7] Data from ACS for national and metro comparisons for unemployment by race is only available for ages 16 – 64, so cannot be directly compared to our detailed regional analysis of working age adults ages 25-64.\n[8] Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”	234	Indicator	2014-04-23 16:56:21.683363	2014-05-23 00:38:40.808403
58	Metro Boston’s ability to stay innovative and globally competitive is essential to its prosperity. The region’s economy was relatively resilient during the Great Recession thanks in part to its diverse economy and leadership in science and technology development. Indicators of knowledge-based economies, such as research and development expenditures and patents issued per business, showed positive growth through the recession, as did jobs in the clean economy – those that provide goods and services directly related to protecting the environment, mitigating climate change, conserving energy, and generating clean power. As jobs in traditional sectors of manufacturing and trade decline, it is important that Metro Boston fosters continued growth in its knowledge economy, clean economy, and creative economy sectors. There may also be opportunities to stem or reverse recent losses through the development of advanced manufacturing and niche-oriented trade. Although Massachusetts is not rich in natural resources, it has an abundant supply of universities and colleges and research and development investments which fuel our innovative, green, and creative economies. Finally, a more robust local economy—with more customers purchasing from Metro Boston producers—will help retain the benefits of spending within the region rather than distributing it across the country or the globe.  \nMassachusetts is consistently a national leader in research and development. With $22 billion in research and development expenditures in 2012, the state ranked 2nd among states in overall expenditures. Metro Boston ranks 5th among U.S. metropolitan areas in number of total patents issued. The region’s leadership in science and technology development translates into its strong performance in the clean economy, where the region has strong performing clusters in high-skill segments such as fuel cells, solar PV, and energy-saving consumer products [1]. Metro Boston will play an important role in enabling alternative energy production by bringing these technologies to scale. \nGreen and Clean jobs are not just related to energy production, but span multiple sectors and produce goods that reassess old methodologies. The clean economy seeks to reduce green house gas emissions and the impacts of climate change through multiple pathways. Some of these pathways include increasing the energy efficiency of buildings and energy storage and distribution, providing alternative and sustainable forms of transportation, supporting organic agriculture and sustainable forestry, enhancing pollution reduction technologies,  expanding recycling and reuse of materials, enforcing government regulations, and supporting administrative training and advocacy. Clean economy methodological shifts and innovations will be driven by a knowledge-based economy but will also provide employment opportunities in middle-skill and advanced manufacturing jobs. In fact, manufacturing is the largest source of green jobs in the private economy. Examples of green manufacturing jobs are home energy-efficiency, energy efficient appliances, recycling, renewable energy generation, construction and transportation. \nA shift to locally-sourced agricultural goods and organically-produced foods is another part of the clean economy that provides employment opportunities in middle-skill and lower-skill jobs, not only on the farm but also in the food processing facilities necessary to bring goods to market. Given the mechanization and standardization of traditional agriculture, the region’s agricultural economy and food-related business are likely to grow only by focusing on sustainable practices, value added processing, and direct-to-consumer sales that leverage a growing appetite for local foods. Agricultural sales in Metro Boston increased 19% between 2002 and 2007. A strong shift to local and organic agriculture not only has economic benefits, but also environmental, food security, and equity impacts. \nA small but important sector is the creative economy, which includes visual and performing artists, as well as diverse jobs such as advertisers, graphic designers, and architects. Creative jobs come with a variety of skill requirements, and can offer career paths for workers with creative skills that they may not consider during more traditional job development pathways. Although they represent a small percentage of the region’s economy, the 1.5 million creative economy jobs in the region contribute significantly in unique ways. Boston ranks 5th in creative sector wages relative to average regional wages. A robust creative economy can help spur creativity and innovation, which are essential for global competitiveness. A strong creative economy creates a vibrant community that attracts and retains young knowledge workers who seek a high quality of life with access to the arts and related creative professionals. Creative enterprises also create revenue by drawing visitors to our region for entertainment and help to create a unique sense of place.\nTo attract and maintain innovative economies, Metro Boston needs innovative public policies to foster a healthy business climate for growing industries. The region’s planning, land use regulation, and coordinated investment policies all have a roll in encouraging and supporting start-ups and young industries. These types of smaller businesses are more sensitive to arduous and unpredictable permitting processes than larger, more established industries. Chapter 43D, passed by the legislature and signed into law in 2006, expedites the municipal permitting process for development on Priority Development Sites, and is the first step in creating a business development climate that is friendly to smaller businesses.\n[1] “Sizing the Clean Economy,“ The Brookings Institution, 2011. http://www.brookings.edu/~/media/Series/resources/0713_clean_economy.pdf	4	Subject	2014-05-08 16:50:21.454137	2014-05-23 00:17:59.702334
71	The number of patents is one measure of the intellectual productivity of the region’s R&D community. More importantly, each patent represents an opportunity to profit from the development, manufacturing, and sale of new inventions. In 2011, innovators in Metro Boston were issued over 4,500 patents, making the Boston area a national leader in innovation. Metro Boston ranks 5th among U.S. metro areas for number of patents issued. The number of patents is often expressed as ratio of patents to businesses. In 2011, 459 patents were issued per 10,000 businesses in Metro Boston, up 40% from 2003. The region now ranks 17th in the nation for number of patents issued per business, up from 29th in 2003. While it is not possible to determine how many patented inventions came to the market or were manufactured in the region, the statistics make it clear that there are abundant ideas on which to base more advanced development and production activities.	275	Indicator	2014-05-08 16:50:23.240179	2014-05-23 00:18:06.588168
5	While college attainment rates have improved for all racial and ethnic groups over the past decade, stubborn gaps in education attainment persist and have worsened since the year 2000. The college attainment gap (the percentage point difference in working age adults with a 2- or 4-year college degree) between Black and White adults is 23 points, up from 21 points in 2000; between Latinos and Whites the gap is 33 points, up from 30 points in 2000. Within racial and ethnic groups, attainment varies depending on spatial location. For example, educational attainment for Asians is, on average, higher than that of Whites by 7 points regionally, but Asians living in Regional Urban Centers have a college attainment rate 36 percentage points below Asians living in Suburbs. The gap in educational attainment between Regional Urban Centers and the regional average is 16 points. Generally, residents of suburban communities have the highest rates of college degree attainment, although for Whites, the rate is highest in Inner Core communities. \nSeparating 2-year associate’s degrees, 4-year bachelor’s degrees, and graduate or professional degrees, there are some clear differences in patterns of attainment. Though associate’s degrees make up only 14% of total degrees, they are more prevalent in Regional Urban Center communities than in Inner Core communities by 3 percentage points (8% compared to 5%), and the associate’s degree attainment rate for Black adults in the region is higher than any other race or ethnicity (9%). Bachelor’s degrees make up the largest share of total degrees, at 49%, and the largest portion of the racial attainment gap – 12% of Latinos, 17% of Blacks, and 29% of Whites have a bachelor’s degree. However there has been no change since 2000 in the racial attainment gap at the bachelor’s degree level. The largest change in the racial attainment gap is for adults with a graduate or professional degree, which make up 37% of total degrees. In 2000, Black adults had a graduate degree attainment rate of 8%, compared to 18% for Whites; in 2007-11, Black attainment was 9%, compared to 21% for Whites.\nMetro Boston’s educational attainment gap by race is greater than the national average across all races, although for Asians, college attainment exceeds that of Whites in Metro Boston and the nation. Metro Boston has the 3rd largest college attainment gap of the top 25 U.S. metro areas for Blacks, 7th highest for Latinos, and 7th highest for those who identify as another race or multiracial. Adults of all races and ethnicities in Metro Boston have rates of college attainment greater than the national average, but the comparatively large gaps are driven by the region’s disproportionately higher share of Whites with a bachelor’s degree or higher. The share of White, non-Hispanic adults in Metro Boston with a bachelor’s degree or higher is 15 percentage points higher than the national average, whereas the share for adults of color is 5 to 7 percentage points higher.\nCollege attainment gaps have long-term implications for economic equity and prosperity in our region. While the data does show increased college attainment across community types, races and ethnicities, we still must strive to close these gaps to ensure that our increasingly diverse Metro Boston residents are prepared for the knowledge-based jobs that are expanding in the region, and to be sure that businesses looking to locate in our region consider Regional Urban Centers as viable places to set up shop.	213	Indicator	2014-04-23 16:56:20.86476	2014-05-23 00:18:03.051461
59	Employment and wages are fundamental indicators of regional prosperity. They reflect Metro Boston’s success at competing in the global economy, and they provide the resources for improved quality of life and reduced inequality.  Recent changes in the nature of the region’s economy help to explain many of the trends observed across a variety of indicators, and improvements in indicators such as workforce readiness and R&D expenditures should ultimately result in more jobs and higher wages. Metro Boston is home to 141,000 business establishments that provided employment for 2.37 million workers in 2012. Those workers took home $153 billion in total wages,[1]  money that they put back into the region’s economy through real estate, consumer goods and investment. Growth in the number of businesses, number of jobs, and average wages are the ultimate measure of prosperity, and are also a prerequisite for achieving improved quality of live and greater equality of opportunity. \nEmployment in Metro Boston firms was at an all time high in 2001 (2.41 million jobs), but dropped substantially during the two years following the 2001-2002 recession. Between 2004 and 2008 regional employment made a somewhat shaky recovery, but was just about on pace with the rest of the nation. Then the Great Recession hit in late 2008, and Metro Boston, along with the rest of the nation, saw significant losses in employment. The region’s recovery from the Great Recession was strong, however – in the years since 2009, employment in Metro Boston firms grew faster than the rest of the nation, and is now greater than 2008 pre-Recession employment. Overall wages in the region grew 5.4% (adjusted to 2011 dollars) between 2001 and 2011, despite a 2% dip during the Great Recession.\nGrowth in employment and wages has not been consistent among all industries or occupations, however. The industries driving the region’s strong recovery from the Great Recession, with large shares of overall employment and positive job and wage growth over that time, were Education and Healthcare, the region’s largest employer; and Professional and Business Services, its second largest. Improvement in the region’s third and fourth largest industries is not so clear. Trade, Transportation, and Utilities declined in both jobs and wages between 2001 and 2011, while Leisure and Hospitality jobs grew by nearly 20% over this period, but average wages actually declined. Considering the fact that the Leisure and Hospitality sector has the lowest average wages of the eleven major industry sectors, this employment growth coupled with declining wages does not fare well for the economic prosperity of the region’s low-wage earners. It could also help explain some of the growing income inequality and poverty in the region. \nOccupational employment trends reinforce the common wisdom that Metro Boston’s economy is increasingly knowledge-based. Employment in high-skill jobs requiring a college degree or greater, as a share of total regional employment, has grown steadily over the last decade, and shifted from 23% of total jobs in 2004 to 32% in 2012.[2,3] The share of mid-skill jobs requiring some college or an associate’s degree declined over this period, from 39% in 2004 to 37% in 2012. Share of low-skill jobs requiring a high school diploma or less dropped more considerably, from 38% in 2004 to 31% in 2012. While shifts in regional jobs by skill somewhat reflect shifts in educational attainment of the region’s workforce, the workforce shift is not as dramatic as the job shift. As a result, workers with a high school degree or less – a group that already has unemployment rates triple that of workers with a bachelor’s degree or greater – are competing for fewer jobs than they were a decade ago. \n[1] Data Source: Massachusetts Executive Office of Labor and Workforce Development ES-202 for 164 Metro Boston municipalities.\n[2] 2004 is the earliest year for which occupational employment data is comparable with current data\n[3] For tabulation purposes, the geography for this figure is the Boston-Cambridge-Quincy, MA NECTA Division, which is a smaller subset of the Boston-Cambridge-Quincy MA-NH MSA.	5	Subject	2014-05-08 16:50:21.461005	2014-05-23 00:35:28.797464
57	A growing labor force is important to the region’s economy; it ensures that there are sufficient workers to fill available jobs and enable firms to expand here. A declining or stagnant labor force will make it harder to fill jobs and may make Metro Boston less competitive with other regions. This possibility will become increasingly important over the coming decades as many older workers retire from the labor force.  Baby Boomers (defined here as those born between 1945 and 1970) comprise 49% of the labor force, and more than a million workers over the age of 40 are likely to retire or otherwise leave the labor force by the year 2030.  This could result in a decline in the labor force unless the region is able to attract and retain more workers.  Metro Boston is in a unique position with its universities and colleges attracting students from all over the country and abroad to build a well trained and diverse labor force. Migration has been, and will continue to be, a key factor for the region’s labor force. \nMetro Boston’s labor force weathered the Great Recession better than much of the nation – the region’s labor force participation rate was higher and its unemployment rate lower than the national average both during it and in the years following it. But the region was not totally immune to the national trends of job loss and dropping participation that resulted from it. Between 2008 and 2009 the unemployment rate in Metro Boston jumped from 4.9 to 7.6%. As the region continues to work its way back to pre-Recession levels, it is also navigating its way through long-term changes in the makeup of its jobs pool, which point to decreasing employment opportunities for low and middle-skill workers. High-skill jobs – those that employ workers with a bachelor’s or advanced degree – are growing in the region, and employers are willing to pay a premium to hire workers with college degrees, even when the job does not necessitate one [1]. Increasing educational attainment of the existing labor force and working to attract more high and middle skill jobs with decent wages and benefits would have a positive impact on the employment and earnings outcomes of workers, and would help grow the regional economy. \nMigration trends indicate that the region is becoming more racially and ethnically diverse – people of color make up 36 percent of the region’s inmigrant population, and will continue to contribute substantially to the growth of the labor force. Gaps in regional labor force participation between white adults and adults of color have shown improvement since 2000, which is a positive indication for labor force growth. However, persistent gaps in unemployment rates between white adults and adults of color will continue to negatively impact labor force growth. Unless the region makes efforts to close these gaps, the economy and prosperity of the region will suffer as a result. \nYouth and young adults are a unique cohort in labor force analyses, because their labor force status – whether they are in the labor force, not in the labor force, employed or unemployed – varies significantly depending on whether they are in school; and if they are in school, what level of school. It also varies depending on whether they are seeking full time or part time work and if they work in order to contribute supplemental income to their family or help pay for their higher education. That said, they are an important cohort to consider because their attachment to the labor force as youth is an indicator for their long-term wages and lifetime earnings [2], and, as Baby Boomers leave the labor force in the coming decades, today’s 16-24 year olds who currently make up 13% of the population, will potentially take on a greater share of the labor force. Labor force patterns that youth and young adults show today will continue to impact the region’s economy for years into the future.\n[1] Alicia Sasser Modestino, “Mismatch in the Labor Market: Measuring the Supply of and Demand for Skilled Labor in New England”, New England Public Policy Center, Federal Reserve Bank of Boston, Research Report 10-2, November 2010. http://www.bostonfed.org/economic/neppc/conferences/2010/mismatch/\n[2] Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm	3	Subject	2014-05-08 16:50:21.442057	2014-05-23 00:35:28.859419
60	Metro Boston is the among the top 10 most expensive metro areas to live in for family households,  among the 25 most populous U.S. metro areas<sup>1</sup>,  according to the Economic Policy Institute’s Family Budget Calculator.<sup>2</sup> It is widely known that Metro Boston is an expensive place to live, but it is also often qualified with the fact that workers in the region make higher wages relative to the nation, and so are better able to pay the region’s premiums. It is true that Metro Boston families have higher incomes than much of the nation: the median family income for married-couple families with children is 3rd highest of the 25 most populous metro areas, 2nd highest for male-headed single parent families and 7th highest for female-headed single parent families. For married couple families, this translates into a fairly affordable relative cost of living. However, for single parent families, especially female-headed single parent families, higher incomes relative to the nation do not lessen the burden of high living costs. Metro Boston has the2nd highest affordability gap ($37,000) of the top 25 metros, after New York City metro area, comparing the cost of living for a single parent of one child with the median income of a female-headed single parent family. The cost of living for a single parent home with one child is more than double the median income for female-headed single parent families.\n\nThe Family Budget Calculator finds that for a family of one adult and one child in Metro Boston, the cost of living a “secure but modest” lifestyle is $67,900, and for a family of two adults with one child it is $77,500. This includes the cost of household expenses such as housing (26%), food (7%), child care (18%), transportation (8%), healthcare (18%), taxes (15%), and other necessities (8%). Child care and healthcare costs increase significantly with each additional child. The median family income for a single parent Metro Boston family ranges from $30,967 for female headed single parent families to $48,194 for male-headed single parent families, which falls short of the cost of living and raising one child by $19,700-$37,000. This represents the lower bound of the affordability gap, as cost of living increases with each additional child. Single parent families make up 27% of families with children in Metro Boston (5% male, 25% female). The median income of married couple families with children is much higher, at $120,118, and is well above the cost of a “secure but modest” living.\n<ol>\n<li>Economic Policy Institute cost of living numbers are based on state portions of MSA’s, but are joined to full MSA median incomes for all but the Metro Boston MSA, which is based on the MA portion.</li>\n<li>2013 Family Budget Calculator <a href="http://www.epi.org/resources/budget/" target="_blank">EPI.org</a></li>\n</ol>	264	Indicator	2014-05-08 16:50:22.972153	2014-05-23 00:38:43.27394
65	Generally, homeownership rates in Metro Boston are lower than the nation, due to high housing prices and a large mobile student population. However, the gap in homeownership rates between white residents and residents of color is larger than the nation across all races, and among the top 25 most populous U.S. metro areas, Metro Boston ranks in the top 4 for homeownership gaps by race and ethnicity. Given that number of years of homeownership has significant influence on the nation’s widening racial wealth-building gap, according to a Brandeis University study,<sup>1</sup> the racial disparities in Metro Boston homeownership rates likely play a large role in limiting the capacity of Metro Boston residents of color to build wealth. \n\nThe region lost ground in overall homeownership rate during the Great Recession, in parallel with the nation, and has not yet been able to rebound. Gaps in homeownership have closed slightly since 2000, but mostly because homeownership among Whites fell more than for residents of color. Only Latinos had a positive 1 percentage point change in homeownership since 2000. White homeownership fell 4 points, Black homeownership fell 3 points, and Asian homeownership fell 1 point. Trends indicate that the fall in overall homeownership rate has leveled out and a turnaround may be coming. As residents of the region begin to buy houses again, it is critical that the region make direct efforts to open pathways to homeownership for residents of color. <ol>\n<li> Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”</li>\n</ol>	269	Indicator	2014-05-08 16:50:23.143267	2014-05-23 00:38:43.840678
64	Generally, homeownership rates in Metro Boston are lower than the nation, due to high housing prices and a large mobile student population. However, the gap in homeownership rates between white residents and residents of color is larger than the nation across all races, and among the top 25 most populous U.S. metro areas, Metro Boston ranks in the top 4 for homeownership gaps by race and ethnicity. Given that number of years of homeownership has significant influence on the nation’s widening racial wealth-building gap, according to a Brandeis University study [17], the racial disparities in Metro Boston homeownership rates likely play a large role in limiting the capacity of Metro Boston residents of color to build wealth. \nThe region lost ground in overall homeownership rate during the Great Recession, in parallel with the nation, and has not yet been able to rebound. Gaps in homeownership have closed slightly since 2000, but mostly because homeownership among Whites fell more than for residents of color. Only Latinos had a positive 1 percentage point change in homeownership since 2000. White homeownership fell 4 points, Black homeownership fell 3 points, and Asian homeownership fell 1 point. Trends indicate that the fall in overall homeownership rate has leveled out and a turnaround may be coming. As residents of the region begin to buy houses again, it is critical that the region make direct efforts to open pathways to homeownership for residents of color. \n[17] Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”	268	Indicator	2014-05-08 16:50:23.127169	2014-05-23 00:18:08.944419
67	One way to measure the wealth of Metro Boston residents is to calculate the ratio of unearned income (interest, dividends, and capital gains) to earned income (salaries and wages) using tax return data from the Internal Revenue Service, which is available at the zip code level. In 2011, Metro Boston tax payers had a median ratio of unearned to earned income of 0.06; that is for every $100 of earned income, half of tax payers had $6 dollars or more of unearned income. There are clear racial disparities in the distribution of this wealth. In 2011, 81% of Black and Latino Metro Boston tax payers lived in zip codes with unearned to earned ratios below the median, compared to 52% of White tax payers. The below map shows that communities with the largest ratios of unearned to earned income have mostly White residents, and that communities with large populations of color have lower unearned to earned income ratios.	271	Indicator	2014-05-08 16:50:23.174992	2014-05-23 00:41:27.152587
73	The “Clean Economy” comprises industries and firms that provide goods and services directly related to protecting the environment, mitigating climate change, conserving energy, and generating clean power. A strong Clean Economy Sector will help Metro Boston to meet its sustainability and climate resiliency challenges while also positioning the region in the vanguard of this growing segment of the economy. According to The Brookings Institution, Metro Boston had 41,800 clean economy jobs in 2010, for a rank of 8th out of the top 25 largest U.S. metro areas. The Brookings Institution analysis was based on a detailed analysis of firms, establishments, and jobs in the fields of conservation, energy efficiency, recycling, environmental management, renewable energy, and more.  The evolving nature of the field, and the complications of data collection and analysis, make it challenging to define the clean economy and the specific sectors it encompasses. The Brookings Institution analysis provides a common benchmark to compare growth of this field across metro areas and over time. \nThe Brookings Institution reports that the clean economy was more resilient during the Great Recession than the economy overall,  and that it is intensive in manufacturing and export activities. The study reports that Metro Boston’s strongest clean energy industries are  public transit (MBTA), waste management & recycling, professional environmental services, and energy efficient building design and construction. The region’s fastest growing sectors include smart grid technologies and alternative energies such as solar, wind, and biofuels.  \nWhile the clean economy sector has shown consistent growth in the Boston MSA since 2003, its growth has been outpaced by other metro areas and the U.S. overall, and its share of clean jobs in the top 25 metro areas and in the US has steadily declined since 2003. \n[4] For more details about The Brookings Institution’s selection methodologies, see their report “Sizing the Clean Economy, “ Chapter 3. Defining and Measuring the Clean Economy in U.S. Metropolitan Areas. http://www.brookings.edu/~/media/Series/resources/0713_clean_economy.pdf\n[5] Brookings released their data for the years 2003, 2007 and 2010.\n[6] “Sizing the Clean Economy,” p 26.	277	Indicator	2014-05-08 16:50:23.320349	2014-05-23 00:44:11.273608
75	Metro Boston is full of artistic and cultural resources that contribute significantly to our economy. The region’s creative economy is made up of occupations and industries that focus on the production and distribution of cultural goods, services, and intellectual property, in accordance with New England Foundation for the Arts’ definition [9]. Workers in creative occupations cluster into three sub-classes – those who are involved in the direct production of cultural goods (e.g., artists, authors and artisans); those who are involved in the distribution or dissemination of creative goods (e.g., book stores, museums, and art dealers); and those who are involved in the production and distribution of intellectual property (e.g. book publishers, architects and graphic designers, advertising agencies, and media outlets.)\nEmployment in this diverse cluster of creative occupations accounts for 2.8% of total employment within Metro Boston, 5th among the top 25 metropolitan areas by employment. Boston also ranks 5th in terms of how much the creative sector earns relative to the overall workforce. The average earnings among creative cluster workers is 3  times the overall average salary in the Boston region, behind only New York, Los Angeles, San Francisco, and Washington D.C. Creative cluster workers are prevalent in those metropolitan regions where they command a relatively high salary. This relationship holds across all metropolitan areas.\n[9] Douglas DeNatale, PhD, and Gregory H. Wassall, PhD, “The Creative Economy: A New Definition,” New England Foundation for the Arts, 2007, p 10. http://www.nefa.org/sites/default/files/ResearchCreativeEconReport2007.pdf	279	Indicator	2014-05-08 16:50:23.355105	2014-05-23 00:44:11.310525
77	Local agriculture helps to provide low- and mid-skill jobs, contributes to a more sustainable and resilient food system, and helps to preserve the traditional New England landscape. Fortunately, the agricultural sector in Metro Boston has been growing rapidly. Total inflation-adjusted sales of agricultural products in Massachusetts rose 10% between 2002 and 2007, and over the same time period Metro Boston producers saw agricultural sales grow 19% [11]. Sales increased despite an 8% decline in Metro Boston total farmland acreage, which fell from 133,000 acres to 123,000 acres. Despite the overall loss of acreage, the total number of farms increased during that time, and the acreage of smaller farms, those under 180 acres [12], increased by 21% in the state and 12% in the region. Small farm acreage now comprises half of all farmland acreage and 94% of all farms in the region, up from 42% and 92% in 2002. These statistics suggest a shift to a greater number of smaller farms growing higher-value specialty crops. As of 2007, there were 110 organic farms [13] in Metro Boston, accounting for 34% of the state’s organic farms and 14% of the state’s organic farmland acreage. Organic products in Metro Boston had a value of $4.8 million in 2007, accounting for 28% of the state’s organic sales.\nHowever, it is not clear how durable these gains in the agricultural sector will be. While the complete county-level data from the 2012 agricultural census have not yet been released, the 2012 state-level results indicate that farms and farmland acreage did not change appreciably, but statewide inflation adjusted sales of agricultural products dropped 8% since 2007 [14]. \n[11] The Agricultural Census withholds data for records which could potentially disclose information about an individual farm or ranch. For this reason, some of the county level sales and acreage data is withheld.\n[12] This definition of small farms comes from the \n[13] Organic production in the 2007 Census of Agriculture was intended to represent production in compliance with National Organic Standards. Values were self-reported by respondents, and were not verified by certifying organizations, so may differ from other sources. For a more detailed description of survey and reporting methods, see Appendix B of the 2007 Census of Agriculture: http://www.agcensus.usda.gov/Publications/2007/Full_Report/Volume_1,_Chapter_2_County_Level/Massachusetts/maappxb.pdf\n[14] The 2012 Agricultural Census was released in February, 2014 with limited state and national data, and no county level data. The more detailed data release is postponed until May, 2014.	281	Indicator	2014-05-08 16:50:23.385658	2014-05-23 00:44:11.403311
115	The low-skill job sector requires a high school diploma or less. This category is highly varied and includes occupations that may not need any education beyond secondary school, such as short order cooks and cashiers, but also includes roofers, massage therapists, drafters, and other workers with skills developed through certifications, apprenticeships, or vocational schooling. Among the top 25 largest MSA Divisions, Boston has consistently held the lowest or second lowest share of jobs that do not require a formal degree. Consistent with a national trend, Metro Boston’s share of low-skill jobs has decreased over time. Low-skill jobs made up 38% of the region’s jobs in 2004, and 31% in 2012. Within the Metro Boston job market, the proportion of low-skill jobs has experienced a decline almost equivalent to the increase in high-skill jobs.	319	Indicator	2014-05-08 16:50:24.161205	2014-05-08 16:50:24.161205
83	Metro Boston schools, state institutions, restaurants, and health care facilities represent potential large-scale buyers for the region’s local food market. The more food these types of institutions buy from local producers, the better the local agricultural economy will be able to flourish. \nIn 2013 the U.S. Department of Agriculture implemented its first Farm to School Census. This Census was intended to provide baseline data on public school engagement and spending in farm to school activities, in order to inform the development of goals around increasing the availability of local foods in public schools. The Census questionnaire was opt-in, and had a response rate of 73% in Massachusetts school districts. All data was self-reported, and the USDA did not delineate a specific definition of “local foods,” so the answers were subject to the interpretation of each responding school district. \nMassachusetts public schools invest approximately $8.1 million, or 16% of their district food budgets on foods that they consider local.	287	Indicator	2014-05-08 16:50:23.536463	2014-05-23 00:44:11.519191
80	Local agriculture helps to provide low- and mid-skill jobs, contributes to a more sustainable and resilient food system, and helps to preserve the traditional New England landscape. Fortunately, the agricultural sector in Metro Boston has been growing rapidly. Total inflation-adjusted sales of agricultural products in Massachusetts rose 10% between 2002 and 2007, and over the same time period Metro Boston producers saw agricultural sales grow 19% [11]. Sales increased despite an 8% decline in Metro Boston total farmland acreage, which fell from 133,000 acres to 123,000 acres. Despite the overall loss of acreage, the total number of farms increased during that time, and the acreage of smaller farms, those under 180 acres [12], increased by 21% in the state and 12% in the region. Small farm acreage now comprises half of all farmland acreage and 94% of all farms in the region, up from 42% and 92% in 2002. These statistics suggest a shift to a greater number of smaller farms growing higher-value specialty crops. As of 2007, there were 110 organic farms [13] in Metro Boston, accounting for 34% of the state’s organic farms and 14% of the state’s organic farmland acreage. Organic products in Metro Boston had a value of $4.8 million in 2007, accounting for 28% of the state’s organic sales.\nHowever, it is not clear how durable these gains in the agricultural sector will be. While the complete county-level data from the 2012 agricultural census have not yet been released, the 2012 state-level results indicate that farms and farmland acreage did not change appreciably, but statewide inflation adjusted sales of agricultural products dropped 8% since 2007 [14]. \n[11] The Agricultural Census withholds data for records which could potentially disclose information about an individual farm or ranch. For this reason, some of the county level sales and acreage data is withheld.\n[12] This definition of small farms comes from the \n[13] Organic production in the 2007 Census of Agriculture was intended to represent production in compliance with National Organic Standards. Values were self-reported by respondents, and were not verified by certifying organizations, so may differ from other sources. For a more detailed description of survey and reporting methods, see Appendix B of the 2007 Census of Agriculture: http://www.agcensus.usda.gov/Publications/2007/Full_Report/Volume_1,_Chapter_2_County_Level/Massachusetts/maappxb.pdf\n[14] The 2012 Agricultural Census was released in February, 2014 with limited state and national data, and no county level data. The more detailed data release is postponed until May, 2014.	284	Indicator	2014-05-08 16:50:23.432762	2014-05-23 00:44:11.459689
82	Metro Boston schools, state institutions, restaurants, and health care facilities represent potential large-scale buyers for the region’s local food market. The more food these types of institutions buy from local producers, the better the local agricultural economy will be able to flourish. \nIn 2013 the U.S. Department of Agriculture implemented its first Farm to School Census. This Census was intended to provide baseline data on public school engagement and spending in farm to school activities, in order to inform the development of goals around increasing the availability of local foods in public schools. The Census questionnaire was opt-in, and had a response rate of 73% in Massachusetts school districts. All data was self-reported, and the USDA did not delineate a specific definition of “local foods,” so the answers were subject to the interpretation of each responding school district. \nMassachusetts public schools invest approximately $8.1 million, or 16% of their district food budgets on foods that they consider local.	286	Indicator	2014-05-08 16:50:23.518054	2014-05-23 00:44:11.502968
87	Small and micro businesses are an important component of the regional economy because they form the heart and soul of many local business districts, not to mention the fact that almost all start-ups must pass through a small business phase before growing to scale.  There is no official definition of a small business, but it is reasonable to define them by number of employees. Here we define micro businesses as those with fewer than 5 employees, small businesses as those with 5-99 employees, mid-sized businesses as those with 100-499 employees, and large businesses as those with 500 or more employees [15]. Micro and small businesses each account for 4.4% and 26.7% of employment in the Boston metro area, and 3.6% and 22.0% of total compensation, respectively. By comparison, large firms account for nearly 55% of total employment and over 61% of total compensation [16].  Employees in large firms are compensated at 12% above the regional average, while those in micro and small businesses are compensated at 18% below the regional average. \nThe share of employment in small businesses in the Boston metro area is consistent with other major metro areas. Small business employment has hovered between 25% and 33% of total employment in each of the ten largest MSAs every year from 2003 to 2011. \nEmployment in micro, small, and mid-size businesses declined between 2003 and 2011, by 4 to 7%. Large businesses were the only firms to see employment rise over the period, increasing over 5%. These trends suggest that small businesses are having a difficult go of it in Metro Boston—unable to take advantage of the boom years preceding 2008, and also slow to recover from the Great Recession. More assistance and supports are clearly needed if growing small businesses are a key policy priority.  \nBetween 2003 and 2011, average wages fell by half a percent for micro businesses, and grew by 3% for small businesses, adjusted to 2011 dollars. By comparison, wages at mid-sized businesses grew 4%, and at large businesses they grew 14% during this time, adjusted to 2011 dollars.\nIt is important to also compare compensation by firm size within industries. The figure below shows compensation in large firms, mid-sized firms, and small firms, relative to compensation for small firm employees (which is why the grey bars are always 1). The industries shown represent the five most common industries by employment among small firms. We see that compensation is higher in the largest firms in four out of five industries, and within the industry that accounts for the largest share of micro firm employment – professional, scientific and technical services, compensation in large firms is over 50% higher. Only in retail trade do small firms compensate higher than large firms.\n[15]Our definition of a micro business is based on that of the U.S. Small Business Administration: http://www.sba.gov/community/blogs/community-blogs/small-business-matters/your-small-business-microbusiness-if-so-you-m\n[16] For this analysis, the Boston metro area refers to the Boston-Cambridge-Quincy, MA-NH MSA.	291	Indicator	2014-05-08 16:50:23.592662	2014-05-23 00:44:11.643771
88	Attracting more firms to the region requires providing a streamlined process for starting new businesses. Chapter 43D, passed by the legislature and signed into law in 2006, expedites the municipal permitting process for development on Priority Development Sites (PDS). Participating communities define these Priority Development Sites for targeted economic and housing development, by cutting the permitting process for projects in these areas down to 180 days.  In Metro Boston, 47 municipalities have taken advantage of the opportunities provided by this law by defining 89 Priority Development Sites. Defining a site as a PDS allows the municipality to encourage economic and housing growth in designated locations, though these locations are not always the most advantageous alternatives with regard to transportation options and environmental impact.	292	Indicator	2014-05-08 16:50:23.606999	2014-05-23 00:18:07.700932
89	Attracting more firms to the region requires providing a streamlined process for starting new businesses. Chapter 43D, passed by the legislature and signed into law in 2006, expedites the municipal permitting process for development on Priority Development Sites (PDS). Participating communities define these Priority Development Sites for targeted economic and housing development, by cutting the permitting process for projects in these areas down to 180 days.  In Metro Boston, 47 municipalities have taken advantage of the opportunities provided by this law by defining 89 Priority Development Sites. Defining a site as a PDS allows the municipality to encourage economic and housing growth in designated locations, though these locations are not always the most advantageous alternatives with regard to transportation options and environmental impact.	293	Indicator	2014-05-08 16:50:23.620131	2014-05-23 00:18:07.74337
103	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	307	Indicator	2014-05-08 16:50:23.917294	2014-05-23 00:18:01.399715
92	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	296	Indicator	2014-05-08 16:50:23.709358	2014-05-23 00:44:11.715974
93	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	297	Indicator	2014-05-08 16:50:23.724044	2014-05-23 00:44:11.73282
91	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	295	Indicator	2014-05-08 16:50:23.649457	2014-05-23 00:44:11.700002
96	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	300	Indicator	2014-05-08 16:50:23.767373	2014-05-23 00:44:11.832184
97	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	301	Indicator	2014-05-08 16:50:23.781043	2014-05-23 00:44:11.846699
95	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	299	Indicator	2014-05-08 16:50:23.752316	2014-05-23 00:44:11.763172
101	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	305	Indicator	2014-05-08 16:50:23.840461	2014-05-23 00:18:01.224173
99	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	303	Indicator	2014-05-08 16:50:23.810839	2014-05-23 00:44:11.877159
104	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	308	Indicator	2014-05-08 16:50:23.939152	2014-05-23 00:18:01.462287
105	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	309	Indicator	2014-05-08 16:50:23.957013	2014-05-23 00:18:01.704417
106	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	310	Indicator	2014-05-08 16:50:23.974783	2014-05-23 00:18:01.777434
107	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	311	Indicator	2014-05-08 16:50:23.99323	2014-05-23 00:18:01.865282
114	Mid-skill jobs require some college or an associate degree. They are found in all major job categories, including Management (Construction and Food Service Managers), Computer and Mathematical Occupations (Computer Support Specialist), Business and Financial Occupations (Loan Officers and Tax Preparers), and Health Care (Registered Nurses and Dental Hygienists).  Total mid-skill employment declined by almost 15% between 2004 and 2012, from almost 737,000 to fewer than 630,000. As a percent of total employment, mid-skill positions declined from 39% to 37% over the same period. Metro Boston, along with San Francisco, Seattle, and Washington, has consistently had a lower share of employment in mid-skill jobs, compared to the 25 largest MSA Divisions, and has been in the bottom three for percent mid-skill jobs each year since 2005.	318	Indicator	2014-05-08 16:50:24.146985	2014-05-08 16:50:24.146985
109	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	313	Indicator	2014-05-08 16:50:24.026822	2014-05-23 00:18:02.018432
110	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	314	Indicator	2014-05-08 16:50:24.044102	2014-05-23 00:18:02.090521
111	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	315	Indicator	2014-05-08 16:50:24.061421	2014-05-23 00:18:02.154008
112	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	316	Indicator	2014-05-08 16:50:24.120088	2014-05-23 00:18:02.230496
113	Despite the ups and downs of total employment in the region, the demand for educated workers has been steadily increasing over the past ten years as a share of total employment. High-skill employment, defined as jobs that require at least a bachelor’s degree,  now comprise 32% of employment in the Boston MSA, up from 23% in 2004. These jobs include Computer Programmers, Social Workers, Teachers, and Engineers, among many other jobs. Since 2004, the first year for which comparable data by job type were available, such jobs have increased 26% in Metro Boston, from just over 441,000 in 2004 to almost 555,000 in 2012. Among the twenty five largest U.S. MSA Divisions, the percent of high-skill jobs out of total employment has consistently been highest in Boston and Washington D.C.	317	Indicator	2014-05-08 16:50:24.133629	2014-05-23 00:44:12.141479
90	Total full-time employment in Metro Boston has increased by 3.8% since the depths of the Great Recession in 2009, but still remains 33,000 jobs below the region’s peak employment in 2001.Metro Boston’s job market never fully recovered from the losses sustained during the recession of the early 2000s, in the wake of the dot-com bubble of the late 1990s and early 2000s. Between 2001 and 2005, Metro Boston lost more than 115,000 jobs (-4.8%). Not all of these jobs were recovered before the region sustained further job losses as a result of the 2008-2009 Great Recession. Since 2005, employment has increased by over 70,000, despite the Great Recession. \nFortunately, the Metro Boston economy has actually proven more resilient in recent years than the labor markets of most other major metropolitan areas. Since 2005, employment in the region grew by 5.0%, fifth-highest over that period among the twenty five U.S. metropolitan areas with the most employment. Only Houston, Dallas, Seattle, and San Francisco metropolitan areas grew more since 2005.  \nEmployment recovery after 2009 was particularly pronounced in businesses located in the Developing Suburbs, with an increase of 5.2% between 2009 and 2012. Employment growth over this time in the Inner Core was 4.1%, in Regional Urban Centers it was 3.3%, and in Maturing Suburbs it was 2.6%. Over 40% (37,000) of the jobs added in Metro Boston were added in Inner Core municipalities.	294	Indicator	2014-05-08 16:50:23.634374	2014-05-23 00:18:00.174276
108	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	312	Indicator	2014-05-08 16:50:24.010184	2014-05-23 00:18:01.977682
117	Boundaries: This analysis uses a definition of Metro Boston that includes the 164 Eastern Massachusetts municipalities within the official transportation modeling region for the Boston Metropolitan Planning Organization [1]. This is a larger territory than the official MAPC region, which is made up of 101 municipalities surrounding the city of Boston. The 164 municipalities align closely, though not exactly with the boundaries of the Massachusetts portion of U.S. Census Bureau’s Boston-Cambridge-Quincy, MA-NH metropolitan statistical area (MSA) [2]. For data collection purposes, this analysis relies on multiple boundary definitions, including the 164 modeling municipalities, the Massachusetts portion of the Boston-Cambridge-Quincy, MA-NH MSA, the full Boston-Cambridge-Quincy, MA-NH MSA, and the five Massachusetts counties that fit within the MSA boundaries [3]. The map below delineates these multiple boundaries for reference.  \nAbout the PUMA Community Types: Many of the indicators rely on data from the US Census Bureau’s Public Use Microdata Sample (PUMS), which is a dataset comprised of detailed records from the US Census and American Community Survey. The data is aggregated to geographies of roughly 100,000 people in order to maintain the confidentiality of respondents. These geographies are called Public Use Microdata Areas (PUMAs). The PUMAs included here fit into the Metro Boston boundary defined as the 164 transportation modeling municipalities described above. Because PUMAs span municipal boundaries, we could not summarize data by MAPC community types. Therefore, we defined new “PUMA Community Types” based on the MAPC community type of the municipalities within each PUMA’s boundaries [4].\n[1] http://www.ctps.org/Drupal/\n[2] The full Boston-Cambridge-Quincy, MA-NH MSA includes Rockingham and Strafford counties in New Hampshire\n[3] These five counties are Essex, Middlesex, Norfolk, Plymouth, and Suffolk.\n[4] For more details on community types, see MAPC’s map and documentation of Massachusetts community typologies here: http://www.mapc.org/sites/default/files/Massachusetts_Community_Types_-_July_2008.pdf	7	Subject	2014-05-23 00:17:59.741497	2014-05-23 00:35:28.92007
102	Since few people are employed solely for self-enjoyment, it is important to measure monetary earnings in addition to total jobs. Overall, weekly wages have risen in relation to inflation in most sectors, including some of the sectors that are employing more workers. The Education and Health Services sector appears to be very healthy. Not only is it steadily adding jobs in Metro Boston, but its average weekly wages have increased by 16.5% over a decade. Jobs in Professional and Business Services are also increasing since 2009 and have increased average weekly wages by18%. \nAlthough Manufacturing has seen steep declines in employment (-37%), average wages for the remaining jobs have increased substantially (16%), possibly due to increasing specialization of Manufacturing or higher skills needed. Meanwhile, average Construction wages increased less than half a percent over a decade, after adjusting for inflation. Perhaps most alarming is the decrease in wages in the growing Leisure and Hospitality industry, which has been adding more jobs but paying average wages 4% lower than in 2001. Trade, Transportation, and Utilities has seen declines in both employment and wages, unfortunately.	306	Indicator	2014-05-08 16:50:23.901331	2014-05-23 00:18:01.296976
98	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	302	Indicator	2014-05-08 16:50:23.795934	2014-05-23 00:44:11.859788
40	Educational attainment plays a significant role in employment, earnings and wealth-building outcomes. As many of our Prosperity Indicators show, residents in Metro Boston with a college degree have higher rates of employment, earn higher wages, and are more able to build wealth than those who do not. \nAcross Metro Boston, educational attainment is on the rise. Today, 54% of the region’s working age adults have a 2- or 4-year college degree or greater, a 5 percentage point increase since 2000. Across all races, ethnicities, and community types, more adults are getting college degrees. Blacks and Latinos, especially those living in suburban areas, have shown significant increases in college degree attainment. Only Asians living in Suburbs did not gain ground in college degree attainment, but even without gains, they remain the most highly college educated group in the region. Overall college attainment rates are relatively consistent across community types, with the exception of Regional Urban Centers, which are 16 percentage points below the regional average.\nMetro Boston consistently ranks high among the top 25 most populous U.S. metropolitan areas for share of adults ages 25 and over with an associate’s or bachelor’s degree. In 2012 the region was third highest, after Washington D.C. and San Francisco. Trends for 2012, however, show the region’s share decreasing for the first time since 2005. Additionally, the region performs differently at different levels of higher education, and its high ranking is thanks mostly to its high share of adults with a graduate degree (19%), where it ranks 2nd, just after Washington DC. The region’s share of adults with a bachelor’s degree (24%) ranks 6th, and its share of adults with an associate’s degree (7%) ranks low, at 15th, and is lower than the US average.  The associate’s degree level is the only one for which the region’s share in 2012 is lower than it was in 2005, though both associate’s and bachelor’s degree shares were lower in 2012 than 2011.	123	Indicator	2014-04-23 16:56:21.440915	2014-05-23 00:18:02.825201
18	High school diploma attainment gaps by community type, race and ethnicity have improved in Metro Boston since 2000. The percentage point difference in working age adults without a high school diploma is down 3 points since 2000 for Black adults compared to White adults, and down 6 points for Latino adults compared to White adults. In Metro Boston’s Regional Urban Centers, the gap compared to the regional average is down 2 points. There are still some significant differences, however, between groups. Although the most significant gains have been among Latinos in the region, especially those in Regional Urban Centers, where the percentage of working age Latino adults without a high school diploma has decreased 13 points from 48% in 2000 to 35%, overall in the region, Latinos still have the highest rate of no-diploma attainment, at 31%. \nCompared to other community types, Regional Urban Centers have the highest share of residents without a high school diploma, bringing particular economic challenges to these communities. For Latinos and Asians, there is a large gap in high school diploma attainment between those living in Regional Urban Centers and those living in Suburbs. \nWhile the Latino to White high school diploma gap is the largest gap in Metro Boston, it is actually the only racial gap that is smaller for the region than it is for the nation. For Blacks and Asians, the Metro Boston gap is larger than that of the nation. Blacks in Metro Boston have roughly the same share of adults without a high school diploma as they do nationally, and Asians in Metro Boston have a higher share by 2 percentage points. Whites and Latinos, on the other hand, have 3 and 4 percentage points fewer adults without a high school diploma, respectively, than they do nationally.	215	Indicator	2014-04-23 16:56:21.098873	2014-05-23 00:18:03.192756
19	High school diploma attainment gaps by community type, race and ethnicity have improved in Metro Boston since 2000. The percentage point difference in working age adults without a high school diploma is down 3 points since 2000 for Black adults compared to White adults, and down 6 points for Latino adults compared to White adults. In Metro Boston’s Regional Urban Centers, the gap compared to the regional average is down 2 points. There are still some significant differences, however, between groups. Although the most significant gains have been among Latinos in the region, especially those in Regional Urban Centers, where the percentage of working age Latino adults without a high school diploma has decreased 13 points from 48% in 2000 to 35%, overall in the region, Latinos still have the highest rate of no-diploma attainment, at 31%. \nCompared to other community types, Regional Urban Centers have the highest share of residents without a high school diploma, bringing particular economic challenges to these communities. For Latinos and Asians, there is a large gap in high school diploma attainment between those living in Regional Urban Centers and those living in Suburbs. \nWhile the Latino to White high school diploma gap is the largest gap in Metro Boston, it is actually the only racial gap that is smaller for the region than it is for the nation. For Blacks and Asians, the Metro Boston gap is larger than that of the nation. Blacks in Metro Boston have roughly the same share of adults without a high school diploma as they do nationally, and Asians in Metro Boston have a higher share by 2 percentage points. Whites and Latinos, on the other hand, have 3 and 4 percentage points fewer adults without a high school diploma, respectively, than they do nationally.	216	Indicator	2014-04-23 16:56:21.111614	2014-05-23 00:18:03.39606
33	Labor market shifts since 2001 reinforce the increasing importance of education and advanced training. Job losses in manufacturing and construction, two sectors that traditionally offered a path to the middle class for workers without college degrees, correspond to stagnating real wages, increasing unemployment rates, and decreasing labor force participation among less-educated workers. This is especially true in the Boston region. The Boston region ranks in the top four among the 25 largest MSAs in participation rates for workers with a high school degree, some college, or a college degree or higher.  But participation rates for workers without a high school degree are 17th.\n[5] In 2008 the American Community Survey changed the way it measures employment, resulting in systematically higher employment estimates. As a result, we cannot directly compare pre- and post-2008 rates.	222	Indicator	2014-04-23 16:56:21.326375	2014-05-23 00:18:03.811786
34	Labor market shifts since 2001 reinforce the increasing importance of education and advanced training. Job losses in manufacturing and construction, two sectors that traditionally offered a path to the middle class for workers without college degrees, correspond to stagnating real wages, increasing unemployment rates, and decreasing labor force participation among less-educated workers. This is especially true in the Boston region. The Boston region ranks in the top four among the 25 largest MSAs in participation rates for workers with a high school degree, some college, or a college degree or higher.  But participation rates for workers without a high school degree are 17th.\n[5] In 2008 the American Community Survey changed the way it measures employment, resulting in systematically higher employment estimates. As a result, we cannot directly compare pre- and post-2008 rates.	224	Indicator	2014-04-23 16:56:21.340758	2014-05-23 00:18:03.941946
51	Unemployment gaps by educational attainment, race and ethnicity, and community type have remained stubbornly persistent, with no definitive movement since 2000. Educational attainment is a significant factor in employment outcomes in the region – for an adult in the region without a college degree, the unemployment rate is double that of an adult with a college degree; for an adult without a high school diploma it is triple. Race also plays a significant role in employment outcomes, especially for Black residents: the unemployment rate for Blacks in the region is 6 points higher than that of Whites, a larger gap than 2000’s 4 points. Across all educational attainment levels, Blacks have the highest rate of unemployment of any race or ethnicity. This points to troubling and persistent discrimination in employment practices [6]. The unemployment gap between Latino and White Metro Boston adults has closed a marginal 1 point, from 4 points in 2000 to 3. \nMetro Boston’s unemployment rate for adults ages 16 and older [7] is lower than the national average for Whites and Blacks, but higher for Latinos and Asians. The unemployment gap between Black adults ages 16 and over in Metro Boston is 0.3 percentage points lower than it is for the nation overall. For Latinos, the gap is 2.2 points greater than that of the nation. Metro Boston has the second largest unemployment gap between Latinos and Whites, out of the 25 most populous U.S. metros.\nUnemployment is inherently bad for day-to-day financial well-being, but it also hinders long-term wealth building, because during periods of unemployment people are likely to need to dip into savings in order to make up for lost wages. The disproportionate rate of unemployment between adults of color and white adults accounts for 9% of the growing national racial wealth gap, according to a Brandeis University study [8].\nThe long-term implications of such pronounced gaps in unemployment are not good for the region. Racial gaps, especially, are troubling for our region, which is becoming more diverse every year. While trends show increased educational attainment across races, which should fare well for regional employment in knowledge-based jobs, discriminatory hiring limits opportunity for residents of color who are qualified for those jobs, and imposes an artificial limit on the applicant pool from which employers have to draw from.\n[6] For more information about trends of discrimination in hiring, see MAPC’s State of Equity report: http://regionalindicators.org/site_media/pdf/Equity-Report_12-14_72ppi.pdf pp 75-79.\n[7] Data from ACS for national and metro comparisons for unemployment by race is only available for ages 16 – 64, so cannot be directly compared to our detailed regional analysis of working age adults ages 25-64.\n[8] Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”	232	Indicator	2014-04-23 16:56:21.655736	2014-05-23 00:38:40.698719
54	Unemployment gaps by educational attainment, race and ethnicity, and community type have remained stubbornly persistent, with no definitive movement since 2000. Educational attainment is a significant factor in employment outcomes in the region – for an adult in the region without a college degree, the unemployment rate is double that of an adult with a college degree; for an adult without a high school diploma it is triple. Race also plays a significant role in employment outcomes, especially for Black residents: the unemployment rate for Blacks in the region is 6 points higher than that of Whites, a larger gap than 2000’s 4 points. Across all educational attainment levels, Blacks have the highest rate of unemployment of any race or ethnicity. This points to troubling and persistent discrimination in employment practices [6]. The unemployment gap between Latino and White Metro Boston adults has closed a marginal 1 point, from 4 points in 2000 to 3. \nMetro Boston’s unemployment rate for adults ages 16 and older [7] is lower than the national average for Whites and Blacks, but higher for Latinos and Asians. The unemployment gap between Black adults ages 16 and over in Metro Boston is 0.3 percentage points lower than it is for the nation overall. For Latinos, the gap is 2.2 points greater than that of the nation. Metro Boston has the second largest unemployment gap between Latinos and Whites, out of the 25 most populous U.S. metros.\nUnemployment is inherently bad for day-to-day financial well-being, but it also hinders long-term wealth building, because during periods of unemployment people are likely to need to dip into savings in order to make up for lost wages. The disproportionate rate of unemployment between adults of color and white adults accounts for 9% of the growing national racial wealth gap, according to a Brandeis University study [8].\nThe long-term implications of such pronounced gaps in unemployment are not good for the region. Racial gaps, especially, are troubling for our region, which is becoming more diverse every year. While trends show increased educational attainment across races, which should fare well for regional employment in knowledge-based jobs, discriminatory hiring limits opportunity for residents of color who are qualified for those jobs, and imposes an artificial limit on the applicant pool from which employers have to draw from.\n[6] For more information about trends of discrimination in hiring, see MAPC’s State of Equity report: http://regionalindicators.org/site_media/pdf/Equity-Report_12-14_72ppi.pdf pp 75-79.\n[7] Data from ACS for national and metro comparisons for unemployment by race is only available for ages 16 – 64, so cannot be directly compared to our detailed regional analysis of working age adults ages 25-64.\n[8] Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”	235	Indicator	2014-04-23 16:56:21.695361	2014-05-23 00:38:40.858137
25	In addition to the official unemployment rate, the Bureau of Labor Statistics calculates alternative measures of labor underutilization, including the rate of unemployed plus all marginally attached workers, and workers employed part time for economic reasons [9]. These labor underutilization rates are important to gauge the magnitude of adults who are unemployed or underemployed but are not considered in the official unemployment rate, either because they are not counted as part of the labor force, as in the case of marginally attached workers, or are counted as employed even if they would prefer full time work, as in the case of part time workers for economic reasons. In 2013 this underutilization rate (U-6) was 13.2% - 6.2 percentage points higher than the official unemployment rate. In 2003, it was 3.2 points higher than the official rate. The increase in the gap of underutilization to unemployment indicates that today more people are discouraged about finding a job and are dropping out of the labor force, or are working reduced hours when they’d prefer to work full time, relative to the population, than they were in 2003, even as the official unemployment rate is up over that same time.\nThe underutilization gap held relatively steady between 2003 and 2007, then jumped up between 2008 and 2009, during the Great Recession, when the official unemployment rate (U-3) went up by 3 percentage points and the underutilization rate (U-6) went up by 5.5 percentage points. The gap has remained up around 6 points since 2009, indicating that there are potentially still a lot of workers working fewer hours due to economic reasons. Of course, the gap would decrease if the underutilization rate held steady and the unemployment rate went up, so it is important to watch the trends of all three indicators – official unemployment rate, underutilization rate, and the gap between the two. Relative to the rest of the 50 U.S. states and the District of Columbia, Massachusetts ranks around the middle for all three of these measures.\n[9] For more detailed definitions of marginally attached workers and workers employed part time for economic reasons, see the Bureau of Labor Statistics’ definitions: http://www.bls.gov/lau/stalt.htm	236	Indicator	2014-04-23 16:56:21.20048	2014-05-23 00:18:05.093354
23	The labor force patterns that teenagers and young adults take on early in life are strong predictors of their labor force patterns as adults, and are correlated with lifetime earnings[12] and upward mobility [13]. Working age youth tend to have lower rates of labor force participation than adults, mostly because they are enrolled in school, but still 61% of Metro Boston’s 16-24 year olds work or are looking for work. The region has the 5th highest youth participation rate, among the top 25 most populous U.S. metro areas. Metro Boston teenagers (ages 16-19), 90% of whom are enrolled in school, have a labor force participation rate of only 44%, but still participate at the second highest rate of the top 25 metro areas. Metro Boston young adults ages 20-24, 51% of whom are enrolled in school, have a higher participation rate, at 75%, but actually come in lower among the top 25 metro areas, ranking 13th. Participation rates are down for teens and young adults since 2008 in Metro Boston and across the nation, though in recent years rates have leveled out and started to turn around. \nUnemployment among Metro Boston youth is more than double that of adults, but again, compared to the nation, the region’s 15% youth unemployment rate is low, ranking 23rd among the 25 most populous U.S. metro areas. The unemployment rate for Metro Boston teens is more than double that of young adults, and this is true nationally as well. Metro Boston ranks 22nd and 24th, for teen and young adult unemployment, respectively, among the top 25 metro areas.\nThere are significant gaps in unemployment between youth of color in the region and white youth. The rate of unemployment for Black youth is double that of White youth, and for Latino youth it is nearly double. The gap is most stark in the Inner Core, where Black youth have the highest unemployment rate in the region at 30.5%, and White youth have the lowest in the region, at 9.4%. Despite the large gap in unemployment between Black youth and White youth, Metro Boston has one of the smaller Black-to-White unemployment gaps of the 25 most populous MSAs, ranking 21st. The gap in Metro Boston’s Latino-to-White youth unemployment rate, however, is the largest of the top 25 metro areas.\nBecause youth participation in the labor force varies greatly depending on school enrollment, a useful indicator is a measurement of youth who are neither in school nor in employment, often called NEET, for Not in Education, Employment or Training. In Metro Boston, 9% of youth (5% of teenagers and 12% of young adults) are neither in school nor employed.\n[12] Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm\n[13] Raj Chetty, Nathaniel Hendren, Patrick Kline, and Emmanuel Saez, “Where is the Land of Opportunity? The Geography of Intergenerational Mobility in the United States,” The Equality of Opportunity Project, Harvard University, January 2014, p 43. http://obs.rc.fas.harvard.edu/chetty/mobility_geo.pdf	243	Indicator	2014-04-23 16:56:21.176446	2014-05-23 00:38:41.596038
69	Research and development is a driving force for Metro Boston’s knowledge-based economy. The region is known for its research universities and technology companies. Massachusetts has ranked within the top 4 U.S. states in total R&D expenditures since 2002, the earliest year of our analysis, and within the top 4 for R&D intensity (expenditures as a share of state GDP.) In 2012, Massachusetts ranked 2nd for total expenditures and 3rd for intensity, among U.S. states. This chart shows expenditures by performer sector – meaning the sectors doing the research. Each performer sector receives money from multiple sources, including federal, non-profit, business, and others. The size of our R&D industry is enhanced by the diversity in its performing sectors. The chart below shows that despite shrinking R&D expenditure in the business sector in 2009 and 2010 after the Great Recession [2], the state was able to maintain positive overall growth in expenditures during these years, because of increased expenditures in universities and colleges, non-profits and Federally Funded Research and Development Centers. The rebounding of the business performing sector, as of 2011 [3] is a positive sign for the R&D industry, especially as federal funding sources, such as 2009’s American Recovery and Reinvestment Act have started to taper off. [2] In 2008, National Science Foundation changed surveys for business performer sector data, so it may not be appropriate to compare data from 2007 and earlier directly to data from 2008 and later. For more information about this change and NSF’s other data collection methodologies, see http://www.nsf.gov/statistics/nsf14304/content.cfm?pub_id=4326&id=1.\n[3] Current year estimates are subject to correction by NSF upon release of subsequent year data	273	Indicator	2014-05-08 16:50:23.20767	2014-05-23 00:41:27.248738
74	One of the positive impacts of the rise of clean economy industries is that many of the jobs in it are good-paying middle-skill jobs. According to Brookings, the manufacturing-, construction-, and transportation-rich industries within the clean economy offer more opportunities and better pay for low-skilled workers than the national economy overall.  Compared to the US, the clean jobs in Metro Boston are geared toward a more educated labor pool. A higher share of jobs in the Metro Boston, compared to the top 25 MSA’s and the US overall, are occupied by employees with a bachelor’s degree or higher. Though nearly 64% of all Metro Boston clean jobs are considered green collar, or occupations paying mid-level wages, this is lower than the national average, and the region ranks 20th in green collar jobs share out of the top 25 MSA’s.  Just as defining the clean economy is fraught with challenges, so is defining green collar jobs. For example, the Brookings Institution analysis uses nationally-based wage thresholds to define mid-level wages, which, given Metro Boston’s wage premium, may exclude some jobs that would be categorized as high-wage by national standards, but mid-wage by Metro Boston standards. It may also include some jobs on the low end of the national mid-wage scale that would not be considered a livable wage in Metro Boston.\n As jobs trends show decreasing low- and middle-skill opportunities in Metro Boston, it would be advantageous for the region to continue to attract clean economy jobs with low- and middle-skill level requirements that pay livable wages.\n[7] “Sizing the Clean Economy,” p 23.\n[8] Brookings defines Green Collar occupations as those with wages within 20 percentage points of the national median wage, or $26,552-$39,828	278	Indicator	2014-05-08 16:50:23.337513	2014-05-23 00:44:11.291915
79	Local agriculture helps to provide low- and mid-skill jobs, contributes to a more sustainable and resilient food system, and helps to preserve the traditional New England landscape. Fortunately, the agricultural sector in Metro Boston has been growing rapidly. Total inflation-adjusted sales of agricultural products in Massachusetts rose 10% between 2002 and 2007, and over the same time period Metro Boston producers saw agricultural sales grow 19%.<sup>1</sup> Sales increased despite an 8% decline in Metro Boston total farmland acreage, which fell from 133,000 acres to 123,000 acres. Despite the overall loss of acreage, the total number of farms increased during that time, and the acreage of smaller farms, those under 180 acres<sup>2 </sup>, increased by 21% in the state and 12% in the region. Small farm acreage now comprises half of all farmland acreage and 94% of all farms in the region, up from 42% and 92% in 2002. These statistics suggest a shift to a greater number of smaller farms growing higher-value specialty crops. As of 2007, there were 110 organic farms <sup>3</sup> in Metro Boston, accounting for 34% of the state’s organic farms and 14% of the state’s organic farmland acreage. Organic products in Metro Boston had a value of $4.8 million in 2007, accounting for 28% of the state’s organic sales.\n\nHowever, it is not clear how durable these gains in the agricultural sector will be. While the complete county-level data from the 2012 agricultural census have not yet been released, the 2012 state-level results indicate that farms and farmland acreage did not change appreciably, but statewide inflation adjusted sales of agricultural products dropped 8% since 2007. <sup>4</sup>\n<ol>\n<li> The Agricultural Census withholds data for records which could potentially disclose information about an individual farm or ranch. For this reason, some of the county level sales and acreage data is withheld.</li>\n<li>This definition of small farms comes from the </li>\n<li>Organic production in the 2007 Census of Agriculture was intended to represent production in compliance with National Organic Standards. Values were self-reported by respondents, and were not verified by certifying organizations, so may differ from other sources. For a more detailed description of survey and reporting methods, see Appendix B of the 2007 Census of Agriculture: http://www.agcensus.usda.gov/Publications/2007/Full_Report/Volume_1,_Chapter_2_County_Level/Massachusetts/maappxb.pdf</li>\n<li>The 2012 Agricultural Census was released in February, 2014 with limited state and national data, and no county level data. The more detailed data release is postponed until May, 2014.</li>\n</ol>	283	Indicator	2014-05-08 16:50:23.416557	2014-05-23 00:44:11.441824
84	Small and micro businesses are an important component of the regional economy because they form the heart and soul of many local business districts, not to mention the fact that almost all start-ups must pass through a small business phase before growing to scale.  There is no official definition of a small business, but it is reasonable to define them by number of employees. Here we define micro businesses as those with fewer than 5 employees, small businesses as those with 5-99 employees, mid-sized businesses as those with 100-499 employees, and large businesses as those with 500 or more employees [15]. Micro and small businesses each account for 4.4% and 26.7% of employment in the Boston metro area, and 3.6% and 22.0% of total compensation, respectively. By comparison, large firms account for nearly 55% of total employment and over 61% of total compensation [16].  Employees in large firms are compensated at 12% above the regional average, while those in micro and small businesses are compensated at 18% below the regional average. \nThe share of employment in small businesses in the Boston metro area is consistent with other major metro areas. Small business employment has hovered between 25% and 33% of total employment in each of the ten largest MSAs every year from 2003 to 2011. \nEmployment in micro, small, and mid-size businesses declined between 2003 and 2011, by 4 to 7%. Large businesses were the only firms to see employment rise over the period, increasing over 5%. These trends suggest that small businesses are having a difficult go of it in Metro Boston—unable to take advantage of the boom years preceding 2008, and also slow to recover from the Great Recession. More assistance and supports are clearly needed if growing small businesses are a key policy priority.  \nBetween 2003 and 2011, average wages fell by half a percent for micro businesses, and grew by 3% for small businesses, adjusted to 2011 dollars. By comparison, wages at mid-sized businesses grew 4%, and at large businesses they grew 14% during this time, adjusted to 2011 dollars.\nIt is important to also compare compensation by firm size within industries. The figure below shows compensation in large firms, mid-sized firms, and small firms, relative to compensation for small firm employees (which is why the grey bars are always 1). The industries shown represent the five most common industries by employment among small firms. We see that compensation is higher in the largest firms in four out of five industries, and within the industry that accounts for the largest share of micro firm employment – professional, scientific and technical services, compensation in large firms is over 50% higher. Only in retail trade do small firms compensate higher than large firms.\n[15]Our definition of a micro business is based on that of the U.S. Small Business Administration: http://www.sba.gov/community/blogs/community-blogs/small-business-matters/your-small-business-microbusiness-if-so-you-m\n[16] For this analysis, the Boston metro area refers to the Boston-Cambridge-Quincy, MA-NH MSA.	288	Indicator	2014-05-08 16:50:23.550319	2014-05-23 00:44:11.53483
27	Metro Boston family households have the 3rd highest median income in the nation, among the top 25 most populous metro areas. Since 2005, family median income in the region has increased 4%, adjusted to 2012 dollars, 6 points more than that of the US, which actually decreased 2% over that time. The region’s wealth is not consistent across family types, however. Among the 25 most populous metro areas, Metro Boston married couple families with children have the 2nd highest median income; single father families also rank 2nd highest, and single mother families rank 7th highest. \nMarried couple families with children in Metro Boston have fared better than average U.S. married couple families with children. Since 2005, median income for married couple families with children has increased 7%, compared to 1% for the full U.S. Single father families in Metro Boston have also fared better than average single father families in the U.S. by nearly 10 points. Median income for single father families has increased 1% in Metro Boston, compared to a 9% decrease in the full U.S. Single father families across the full U.S. saw large declines during the Great Recession, but in Metro Boston they have been able to jump back to pre-recession growth, while their counterparts across the U.S. have not. Single mothers in Metro Boston, on the other hand, have fared worse than single mother families across the full U.S. Median income for single mother families in Metro Boston has decreased 11% since 2005, a larger decrease than the 8% decrease for the full U.S.	253	Indicator	2014-04-23 16:56:21.231958	2014-05-23 00:18:08.009891
29	Metro Boston family households have the 3rd highest median income in the nation, among the top 25 most populous metro areas. Since 2005, family median income in the region has increased 4%, adjusted to 2012 dollars, 6 points more than that of the US, which actually decreased 2% over that time. The region’s wealth is not consistent across family types, however. Among the 25 most populous metro areas, Metro Boston married couple families with children have the 2nd highest median income; single father families also rank 2nd highest, and single mother families rank 7th highest. \nMarried couple families with children in Metro Boston have fared better than average U.S. married couple families with children. Since 2005, median income for married couple families with children has increased 7%, compared to 1% for the full U.S. Single father families in Metro Boston have also fared better than average single father families in the U.S. by nearly 10 points. Median income for single father families has increased 1% in Metro Boston, compared to a 9% decrease in the full U.S. Single father families across the full U.S. saw large declines during the Great Recession, but in Metro Boston they have been able to jump back to pre-recession growth, while their counterparts across the U.S. have not. Single mothers in Metro Boston, on the other hand, have fared worse than single mother families across the full U.S. Median income for single mother families in Metro Boston has decreased 11% since 2005, a larger decrease than the 8% decrease for the full U.S.	255	Indicator	2014-04-23 16:56:21.265927	2014-05-23 00:18:08.149477
26	While Massachusetts is sometimes branded with the negative moniker Taxachusetts, , the effective rate of Massachusetts state and local taxes is actually slightly lower than the national average, at 10.0% compared to the national 10.2% average. However, like the rest of the states, our tax system is regressive, meaning poorer families pay a larger share of their incomes in taxes than richer families. Currently, Massachusetts’ poorest families, those with incomes in the lowest 20%, pay more than twice as much of their income in taxes as do its richest families, those with incomes in the top 1%. The tax system has not become significantly more or less progressive since 1996 .\nAlong with six other states in the country, Massachusetts’ personal income tax rate is flat, which means it taxes all incomes at the same rate and is neither progressive nor regressive. However,but the state does offer a substantial, automatic personal exemption , an earned income tax credit (EITC) [5] and has No Tax Status and Limited Income Credit thresholds that eliminate or reduce income tax liability for taxpayers who make less than qualifying incomes [6]. These policies make the personal income tax rate effectively progressive, such that the richest 5% of taxpayers end up paying 2.7% of their income towards income taxes, or about 4 times more than the 0.7% that the poorest 20% of taxpayers pay. The income tax relief policies help decrease the overall regressivity of the state and local tax code, but property, sales, and excise taxes are regressive enough to skew the overall rate to be regressive. The sales tax is the most regressive. While the state does offer some sales tax relief by not taxing groceries or clothing that costs under $175, low income taxpayers still end up spending ten times more of their income on sales tax than the richest 5% of taxpayers, at a rate of 5%, compared to 0.5%. \nBetween 1996 and 2003, the state and local tax burden as a share of income decreased across all income groups, primarily because of a drop in the income tax rate from 5.96% to 5.3%.  The rate has since dropped to 5.20 %.  The overall tax burden rebounded a bit between 2003 and 2007, which is due to an increase in property taxes as a share of income.  This change may have been due more to an increase in property value outstripping income increases over those years rather than a change in local property tax codes. The residential property tax rate in Boston, for example, actually decreased from $11.29 to $10.99 per $1,000 of value between 2003 and 2007.  The total amount of residential tax collected in Boston jumped 63% during those years, while the number of residential parcels assessed only increased 6% [7].\n[5] For more information about the Earned Income Tax Credit, see the Massachusetts Department of Revenue’s Guide to Personal Income Tax: http://www.mass.gov/dor/individuals/filing-and-payment-information/guide-to-personal-income-tax/credits/earned-income-credit-eic.html\n[6] For more information about No Tax Status and Limited Income Credit policies, see the Massachusetts Department of Revenue’s Guide to Personal Income Tax: http://www.mass.gov/dor/individuals/filing-and-payment-information/guide-to-personal-income-tax/filing-requirements/no-tax-status-and-limited-income-credit.html\n[7] Massahusetts Department of Revenue	262	Indicator	2014-04-23 16:56:21.217956	2014-05-23 00:18:08.673813
63	Generally, homeownership rates in Metro Boston are lower than the nation, due to high housing prices and a large mobile student population. However, the gap in homeownership rates between white residents and residents of color is larger than the nation across all races, and among the top 25 most populous U.S. metro areas, Metro Boston ranks in the top 4 for homeownership gaps by race and ethnicity. Given that number of years of homeownership has significant influence on the nation’s widening racial wealth-building gap, according to a Brandeis University study [17], the racial disparities in Metro Boston homeownership rates likely play a large role in limiting the capacity of Metro Boston residents of color to build wealth. \nThe region lost ground in overall homeownership rate during the Great Recession, in parallel with the nation, and has not yet been able to rebound. Gaps in homeownership have closed slightly since 2000, but mostly because homeownership among Whites fell more than for residents of color. Only Latinos had a positive 1 percentage point change in homeownership since 2000. White homeownership fell 4 points, Black homeownership fell 3 points, and Asian homeownership fell 1 point. Trends indicate that the fall in overall homeownership rate has leveled out and a turnaround may be coming. As residents of the region begin to buy houses again, it is critical that the region make direct efforts to open pathways to homeownership for residents of color. \n[17] Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”	267	Indicator	2014-05-08 16:50:23.104925	2014-05-23 00:18:08.894426
2	A prosperous Metro Boston is one in which all of our residents are able to participate fully in our economy. Metro Boston families should be financially stable and able to build wealth for the future. The reality, however, is that thousands of Metro Boston households live below the federal poverty threshold, and many more thousands that do not have enough income to support themselves independently. The region’s income disparity is among the top in the nation, and our taxes burden lower-income families at a higher rate than higher-income families.\nThe capacity to build wealth is important for long-term individual and family economic stability. A family’s wealth – its assets minus its debts – is the key to its long-term prosperity. Income above that needed to live off can be saved and invested for retirement, college tuition, and business ventures, or used as a safety net for health emergencies and other unforeseen expenses. In turn, the financial security of families is essential to the financial security of the region. When Metro Boston residents have a comfortable financial cushion, they are more active participants in the regional economy – they can buy real estate, patronize local businesses, invest in new businesses, and contribute more to the tax base. Yet, national studies show that the capacity to build wealth is not equal across racial and ethnic lines. According to analysis of a 25-year study by researchers at Brandeis University, the national racial wealth gap between White and African American families grew $152,000 between 1984 and 2009 [1]. The analysis found that the top factors influencing this gap in wealth accumulation are number of years of homeownership, accounting for 27% of the gap; family income (20%); unemployment (9%); attainment of college degree (5%); and inheritance and financial support from family (5%) [2]. In Metro Boston, the four of these metrics that we are able to measure – homeownership, family income, unemployment, and college degree attainment – show racial disparities greater than that of the nation. This indicates that the barriers to wealth building for families of color in Metro Boston are in fact greater than they are for families of color in the nation overall. Persistent structural inequities in Metro Boston limit opportunities for families of color, and in turn limit the overall prosperity of the region.\n[1] Thomas Shapiro, Tatjana Meschede and Sam Osoro, “The Roots of the Widening Racial Wealth Gap: Explaining the Black-White Economic Divide.” Institute on Assets and Social Policy, February, 2013.\n[2] Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”	2	Subject	2014-04-23 16:56:20.737175	2014-05-23 00:35:28.910025
41	Adults without a high school diploma are at a severe disadvantage for employment and wages in our region. Unemployment among adults in the region without a high school diploma is three times higher than that of adults with a 2- or 4-year college degree. Across the region, 8% of working age adults do not have a high school diploma. This is a 3 point improvement since 2000. This trend was consistent for all four PUMA community types. In 2012, Metro Boston ranked 21st in share of adults 25 and older without a high school diploma, among the 25 most populous U.S. metros. Only Portland, Pittsburgh, Seattle, and Minneapolis had smaller shares. \nThe economic implications of this are significant – the increased employment and earnings that come with a high school diploma add up for the relatively small share of the regional population without a high school diploma in lost earnings potential. The Alliance for Educational Excellence estimates that if Massachusetts dropouts in 2010-2011 had graduated with their class, their total lifetime additional income would have been nearly $2 billion.  For more details about high school dropout rates in the region, see \n<a href="http://regionalindicators.org/equity/education/high-school-dropout-rates/" target="_blank">State of Equity</a>. \nOn a positive note, Metro Boston ranks consistently low among the top 25 most populous U.S. metropolitan areas for share of adults ages 25 and over without a high school diploma. In 2012 the region was fifth lowest, which is a slip from its 4th lowest rank from 2009-2011. Although the region’s share of adults without a high school diploma dropped every year between 2006 and 2012, except for 2011, trends since 2009 show the pace of improvement slowing, relative to the nation and other metro areas.  The region should work to catch up to the national pace of improvement, with the ultimate goal of a zero rate of no high school diploma attainment.	214	Indicator	2014-04-23 16:56:21.456003	2014-05-23 00:38:38.991874
24	Metro Boston has the 3rd highest labor force participation rates among the top twenty metropolitan areas. Nearly 83% of the region’s residents age 25 to 64 are employed or seeking work, behind only Washington, DC and Minneapolis-St.Paul. Between 2005 and 2007, the participation rate in Boston increased from 81.1% to 82.0%, the fourth-highest increase among the twenty largest MSAs. In the years since the Great Recession, labor participation declined in the Boston region, but at a slower rate than other metropolitan areas,. From 2008 to 2012, participation fell just 0.3 percentage points, a smaller decline than all other major metro areas except Miami-Fort Lauderdale, and showed a slight up-tick in 2012.<sup>1 </sup> Relatively strong labor force participation rates are consistent with the Boston region’s relatively strong employment growth over the same period of time, as seen in the  <a href="http://staging.regionalindicators.org/topic_areas/1#economic-context" target="_blank"> Economic Context section</a>. <ol>\n<li>In 2008 the American Community Survey changed the way it measures employment, resulting in systematically higher employment estimates. As a result, we cannot directly compare pre- and post-2008 rates. Below, when calculating the percent of MSA-years in which participation rates declined, we removed the 2007-to-2008 change. </li>\n</ol>	221	Indicator	2014-04-23 16:56:21.18814	2014-05-23 00:38:39.657478
52	Unemployment gaps by educational attainment, race and ethnicity, and community type have remained stubbornly persistent, with no definitive movement since 2000. Educational attainment is a significant factor in employment outcomes in the region – for an adult in the region without a college degree, the unemployment rate is double that of an adult with a college degree; for an adult without a high school diploma it is triple. Race also plays a significant role in employment outcomes, especially for Black residents: the unemployment rate for Blacks in the region is 6 points higher than that of Whites, a larger gap than 2000’s 4 points. Across all educational attainment levels, Blacks have the highest rate of unemployment of any race or ethnicity. This points to troubling and persistent discrimination in employment practices [6]. The unemployment gap between Latino and White Metro Boston adults has closed a marginal 1 point, from 4 points in 2000 to 3. \nMetro Boston’s unemployment rate for adults ages 16 and older [7] is lower than the national average for Whites and Blacks, but higher for Latinos and Asians. The unemployment gap between Black adults ages 16 and over in Metro Boston is 0.3 percentage points lower than it is for the nation overall. For Latinos, the gap is 2.2 points greater than that of the nation. Metro Boston has the second largest unemployment gap between Latinos and Whites, out of the 25 most populous U.S. metros.\nUnemployment is inherently bad for day-to-day financial well-being, but it also hinders long-term wealth building, because during periods of unemployment people are likely to need to dip into savings in order to make up for lost wages. The disproportionate rate of unemployment between adults of color and white adults accounts for 9% of the growing national racial wealth gap, according to a Brandeis University study [8].\nThe long-term implications of such pronounced gaps in unemployment are not good for the region. Racial gaps, especially, are troubling for our region, which is becoming more diverse every year. While trends show increased educational attainment across races, which should fare well for regional employment in knowledge-based jobs, discriminatory hiring limits opportunity for residents of color who are qualified for those jobs, and imposes an artificial limit on the applicant pool from which employers have to draw from.\n[6] For more information about trends of discrimination in hiring, see MAPC’s State of Equity report: http://regionalindicators.org/site_media/pdf/Equity-Report_12-14_72ppi.pdf pp 75-79.\n[7] Data from ACS for national and metro comparisons for unemployment by race is only available for ages 16 – 64, so cannot be directly compared to our detailed regional analysis of working age adults ages 25-64.\n[8] Shapiro, Meschede, and Osoro, “The Roots of the Widening Racial Wealth Gap.”	233	Indicator	2014-04-23 16:56:21.668773	2014-05-23 00:38:40.740576
21	The labor force patterns that teenagers and young adults take on early in life are strong predictors of their labor force patterns as adults, and are correlated with lifetime earnings<sup>1</sup> and upward mobility. <sup>2</sup> Working age youth tend to have lower rates of labor force participation than adults, mostly because they are enrolled in school, but still 61% of Metro Boston’s 16-24 year olds work or are looking for work. The region has the 5th highest youth participation rate, among the top 25 most populous U.S. metro areas. Metro Boston teenagers (ages 16-19), 90% of whom are enrolled in school, have a labor force participation rate of only 44%, but still participate at the second highest rate of the top 25 metro areas. Metro Boston young adults ages 20-24, 51% of whom are enrolled in school, have a higher participation rate, at 75%, but actually come in lower among the top 25 metro areas, ranking 13th. Participation rates are down for teens and young adults since 2008 in Metro Boston and across the nation, though in recent years rates have leveled out and started to turn around. \nUnemployment among Metro Boston youth is more than double that of adults, but again, compared to the nation, the region’s 15% youth unemployment rate is low, ranking 23rd among the 25 most populous U.S. metro areas. The unemployment rate for Metro Boston teens is more than double that of young adults, and this is true nationally as well. Metro Boston ranks 22nd and 24th, for teen and young adult unemployment, respectively, among the top 25 metro areas.\nThere are significant gaps in unemployment between youth of color in the region and white youth. The rate of unemployment for Black youth is double that of White youth, and for Latino youth it is nearly double. The gap is most stark in the Inner Core, where Black youth have the highest unemployment rate in the region at 30.5%, and White youth have the lowest in the region, at 9.4%. Despite the large gap in unemployment between Black youth and White youth, Metro Boston has one of the smaller Black-to-White unemployment gaps of the 25 most populous MSAs, ranking 21st. The gap in Metro Boston’s Latino-to-White youth unemployment rate, however, is the largest of the top 25 metro areas.\nBecause youth participation in the labor force varies greatly depending on school enrollment, a useful indicator is a measurement of youth who are neither in school nor in employment, often called NEET, for Not in Education, Employment or Training. In Metro Boston, 9% of youth (5% of teenagers and 12% of young adults) are neither in school nor employed.\n\n<ol>\n<li>Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm</li>\n<li>Raj Chetty, Nathaniel Hendren, Patrick Kline, and Emmanuel Saez, “Where is the Land of Opportunity? The Geography of Intergenerational Mobility in the United States,” The Equality of Opportunity Project, Harvard University, January 2014, p 43. http://obs.rc.fas.harvard.edu/chetty/mobility_geo.pdf  </li>\n</ol>	241	Indicator	2014-04-23 16:56:21.143836	2014-05-23 00:38:41.410997
49	The labor force patterns that teenagers and young adults take on early in life are strong predictors of their labor force patterns as adults, and are correlated with lifetime earnings[12] and upward mobility [13]. Working age youth tend to have lower rates of labor force participation than adults, mostly because they are enrolled in school, but still 61% of Metro Boston’s 16-24 year olds work or are looking for work. The region has the 5th highest youth participation rate, among the top 25 most populous U.S. metro areas. Metro Boston teenagers (ages 16-19), 90% of whom are enrolled in school, have a labor force participation rate of only 44%, but still participate at the second highest rate of the top 25 metro areas. Metro Boston young adults ages 20-24, 51% of whom are enrolled in school, have a higher participation rate, at 75%, but actually come in lower among the top 25 metro areas, ranking 13th. Participation rates are down for teens and young adults since 2008 in Metro Boston and across the nation, though in recent years rates have leveled out and started to turn around. \nUnemployment among Metro Boston youth is more than double that of adults, but again, compared to the nation, the region’s 15% youth unemployment rate is low, ranking 23rd among the 25 most populous U.S. metro areas. The unemployment rate for Metro Boston teens is more than double that of young adults, and this is true nationally as well. Metro Boston ranks 22nd and 24th, for teen and young adult unemployment, respectively, among the top 25 metro areas.\nThere are significant gaps in unemployment between youth of color in the region and white youth. The rate of unemployment for Black youth is double that of White youth, and for Latino youth it is nearly double. The gap is most stark in the Inner Core, where Black youth have the highest unemployment rate in the region at 30.5%, and White youth have the lowest in the region, at 9.4%. Despite the large gap in unemployment between Black youth and White youth, Metro Boston has one of the smaller Black-to-White unemployment gaps of the 25 most populous MSAs, ranking 21st. The gap in Metro Boston’s Latino-to-White youth unemployment rate, however, is the largest of the top 25 metro areas.\nBecause youth participation in the labor force varies greatly depending on school enrollment, a useful indicator is a measurement of youth who are neither in school nor in employment, often called NEET, for Not in Education, Employment or Training. In Metro Boston, 9% of youth (5% of teenagers and 12% of young adults) are neither in school nor employed.\n[12] Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm\n[13] Raj Chetty, Nathaniel Hendren, Patrick Kline, and Emmanuel Saez, “Where is the Land of Opportunity? The Geography of Intergenerational Mobility in the United States,” The Equality of Opportunity Project, Harvard University, January 2014, p 43. http://obs.rc.fas.harvard.edu/chetty/mobility_geo.pdf	245	Indicator	2014-04-23 16:56:21.629736	2014-05-23 00:38:41.737153
50	The labor force patterns that teenagers and young adults take on early in life are strong predictors of their labor force patterns as adults, and are correlated with lifetime earnings[12] and upward mobility [13]. Working age youth tend to have lower rates of labor force participation than adults, mostly because they are enrolled in school, but still 61% of Metro Boston’s 16-24 year olds work or are looking for work. The region has the 5th highest youth participation rate, among the top 25 most populous U.S. metro areas. Metro Boston teenagers (ages 16-19), 90% of whom are enrolled in school, have a labor force participation rate of only 44%, but still participate at the second highest rate of the top 25 metro areas. Metro Boston young adults ages 20-24, 51% of whom are enrolled in school, have a higher participation rate, at 75%, but actually come in lower among the top 25 metro areas, ranking 13th. Participation rates are down for teens and young adults since 2008 in Metro Boston and across the nation, though in recent years rates have leveled out and started to turn around. \nUnemployment among Metro Boston youth is more than double that of adults, but again, compared to the nation, the region’s 15% youth unemployment rate is low, ranking 23rd among the 25 most populous U.S. metro areas. The unemployment rate for Metro Boston teens is more than double that of young adults, and this is true nationally as well. Metro Boston ranks 22nd and 24th, for teen and young adult unemployment, respectively, among the top 25 metro areas.\nThere are significant gaps in unemployment between youth of color in the region and white youth. The rate of unemployment for Black youth is double that of White youth, and for Latino youth it is nearly double. The gap is most stark in the Inner Core, where Black youth have the highest unemployment rate in the region at 30.5%, and White youth have the lowest in the region, at 9.4%. Despite the large gap in unemployment between Black youth and White youth, Metro Boston has one of the smaller Black-to-White unemployment gaps of the 25 most populous MSAs, ranking 21st. The gap in Metro Boston’s Latino-to-White youth unemployment rate, however, is the largest of the top 25 metro areas.\nBecause youth participation in the labor force varies greatly depending on school enrollment, a useful indicator is a measurement of youth who are neither in school nor in employment, often called NEET, for Not in Education, Employment or Training. In Metro Boston, 9% of youth (5% of teenagers and 12% of young adults) are neither in school nor employed.\n[12] Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm\n[13] Raj Chetty, Nathaniel Hendren, Patrick Kline, and Emmanuel Saez, “Where is the Land of Opportunity? The Geography of Intergenerational Mobility in the United States,” The Equality of Opportunity Project, Harvard University, January 2014, p 43. http://obs.rc.fas.harvard.edu/chetty/mobility_geo.pdf	246	Indicator	2014-04-23 16:56:21.643489	2014-05-23 00:38:41.800443
56	The labor force patterns that teenagers and young adults take on early in life are strong predictors of their labor force patterns as adults, and are correlated with lifetime earnings[12] and upward mobility [13]. Working age youth tend to have lower rates of labor force participation than adults, mostly because they are enrolled in school, but still 61% of Metro Boston’s 16-24 year olds work or are looking for work. The region has the 5th highest youth participation rate, among the top 25 most populous U.S. metro areas. Metro Boston teenagers (ages 16-19), 90% of whom are enrolled in school, have a labor force participation rate of only 44%, but still participate at the second highest rate of the top 25 metro areas. Metro Boston young adults ages 20-24, 51% of whom are enrolled in school, have a higher participation rate, at 75%, but actually come in lower among the top 25 metro areas, ranking 13th. Participation rates are down for teens and young adults since 2008 in Metro Boston and across the nation, though in recent years rates have leveled out and started to turn around. \nUnemployment among Metro Boston youth is more than double that of adults, but again, compared to the nation, the region’s 15% youth unemployment rate is low, ranking 23rd among the 25 most populous U.S. metro areas. The unemployment rate for Metro Boston teens is more than double that of young adults, and this is true nationally as well. Metro Boston ranks 22nd and 24th, for teen and young adult unemployment, respectively, among the top 25 metro areas.\nThere are significant gaps in unemployment between youth of color in the region and white youth. The rate of unemployment for Black youth is double that of White youth, and for Latino youth it is nearly double. The gap is most stark in the Inner Core, where Black youth have the highest unemployment rate in the region at 30.5%, and White youth have the lowest in the region, at 9.4%. Despite the large gap in unemployment between Black youth and White youth, Metro Boston has one of the smaller Black-to-White unemployment gaps of the 25 most populous MSAs, ranking 21st. The gap in Metro Boston’s Latino-to-White youth unemployment rate, however, is the largest of the top 25 metro areas.\nBecause youth participation in the labor force varies greatly depending on school enrollment, a useful indicator is a measurement of youth who are neither in school nor in employment, often called NEET, for Not in Education, Employment or Training. In Metro Boston, 9% of youth (5% of teenagers and 12% of young adults) are neither in school nor employed.\n[12] Julia Dennett and Alicia Sasser Modestino, “Uncertain Futures? Youth Attachment to the Labor Market in the United States and New England,” Boston Fed New England Public Policy Center, Research Report 13-3 December 2013. http://www.bostonfed.org/economic/neppc/researchreports/2013/rr1303.htm\n[13] Raj Chetty, Nathaniel Hendren, Patrick Kline, and Emmanuel Saez, “Where is the Land of Opportunity? The Geography of Intergenerational Mobility in the United States,” The Equality of Opportunity Project, Harvard University, January 2014, p 43. http://obs.rc.fas.harvard.edu/chetty/mobility_geo.pdf	247	Indicator	2014-04-23 16:56:21.727208	2014-05-23 00:38:41.918697
43	Poverty in Metro Boston has not improved in the last decade: 175,790 households, or 11.1% of total households, are in poverty, up from 9.3% in 2000.<sup>1</sup> Despite some indication of a decreasing rate of poverty in Metro Boston from 2005-2007, the region saw a fairly steady increase in poverty from 2008 through 2011. The poverty rate in 2012 dropped for the first time since 2009, by a marginal 0.1points.\nWhile the poverty rate is a useful metric to benchmark change over time, it falls short in measuring the level of hardship households are experiencing in Metro Boston in absolute numbers or relative to other metro areas. The methodology used to calculate the poverty threshold has evolved little since its inception in the 1960’s, and does not reflect regional differences in cost of living, nor fundamental changes in American spending patterns over the last 5 decades.<sup>2</sup> Because of the high cost of living in Metro Boston, our low ranking among the 100 most populous metro areas, and lower poverty rate relative to the nation, may be misleading.\n<ol>\n<li>2000 geography based on Census 2000 5 counties</li>\n<li>“100 Years of U.S. Consumer Spending: Data for the Nation, New York City, and Boston.” U.S. Department of Labor , U.S. Bureau of Labor Statistics, May 2006, <a href="http://www.bls.gov/opub/uscs/report991.pdf" target="_blank"> BLS.gov</a></li>\n</ol>	263	Indicator	2014-04-23 16:56:21.534772	2014-05-23 00:38:43.234039
61	In addition to the Family Budget Calculator, another measure of affordability in Metro Boston is the Economic Independence Index published by Crittenton Women’s Union. The Economic Independence Index calculates the necessary income for a family to “achieve a fair standard of housing, health care, nutrition and child care while avoiding dependence on public income or work supports,” <sup>1</sup>and is a more conservative measure of affordability than the Family Budget Calculator. It calculates cost of living based on number of children by age, and provides county-specific values.\nIn a prosperous Metro Boston, families should be able to afford to live independently, without public assistance. Yet, based on Economic Independence Index thresholds, 30% of Metro Boston households do not make enough to support themselves and their families independently. An individual in Massachusetts needs an income of at least $28,500 to be financially independent. For an adult with one preschool age child, this number jumps to $51,384. Cost of living in the Metro Boston region is higher than that of the state overall. In Norfolk County, the most expensive county to live in within our region, according to the Index, the household expense budget for a family of four in 2011 ranges from $52,807 (2 adults, 2 teenagers) to $86,221(2 adults, 2 preschoolers). In Essex County, the most affordable county in our region, the range is $49,152 to $78,503. In 1998, the cost of living for an individual in Boston was $15,888 ($22,924 in $2012 dollars).\n\nLike the Family Budget Calculator, this Economic Independence Index includes the cost of housing (29%), food (10%), transportation (10%), child care (23%), healthcare (8%), taxes (16%), and personal and household needs (9%).<sup>2</sup> \n<ol>\n<li>Michael W. Ames, MSW, MBA; Jennifer Dobruck Lowe, MA; Kelly Dowd, MPP; Ruth J. Liberman, MPA; and Deborah Connolly Youngblood, PhD, “Massachusetts Economic Independence Index 2013.” Crittenton Women’s Union, 2013.</li>\n<li>Percentages for single parent 1 child households</li>\n</ol>	265	Indicator	2014-05-08 16:50:23.002466	2014-05-23 00:38:43.332168
62	In 2013 , an individual resident needed an hourly wage of $14.32 in the city of Boston ($29,904 annually), $14.37 ($30,000 annually) in Essex County, and $15.73 ($32,844 annually) in Norfolk County to make ends meet, according to the Economic Independence Index. With a state minimum wage of $8.00, working a full-time minimum wage job is not enough for one person to live on their own, let alone raise a family, without assistance. \n\nIn 1998, the gap between minimum wage and the cost for an individual to live independently was not so wide. The hourly wage necessary for independence in the city of Boston<sup>1</sup> was $7.64, so with a minimum wage at the time of $5.25, the hourly wage gap was $2.39. Since 1998, the minimum wage has been increased three times<sup>2 </sup> – to $6.75 in 2001, $7.50 in 2007 and $8.00 in 2008, but has not kept up with the steep 88% increase in cost of living. To learn more about the he degradation of the minimum wage in Massachusetts, see MassBudget's analysis “What's It Worth?: The Value of the Minimum Wage in Massachusetts”.<sup>3</sup>\n<ol>\n<li>Historical Economic Independence Index data only available for city of Boston</li>\n<li>United States Department of Labor, Wage and Hour Division, Changes in basic minimum wages in non-farm employment under state law: selected years 1968 to 2013,<a href=" http://www.dol.gov/whd/state/stateMinWageHis.htm" target="_blank">DOL.gov</a>.</li>\n<li>Sarah Nolan, What's It Worth?: The Value of the Minimum Wage in Massachusetts, The Massachusetts Budget and Policy Center, April 3, 2012 (updated: June 26, 2013). <a href="http://www.massbudget.org/report_window.php?loc=whatsitworth.html" target="_blank"> Massbudget.org</a></li>\n</ol>	266	Indicator	2014-05-08 16:50:23.032177	2014-05-23 00:38:43.394456
68	Research and development is a driving force for Metro Boston’s knowledge-based economy. The region is known for its research universities and technology companies. Massachusetts has ranked within the top 4 U.S. states in total R&D expenditures since 2002, the earliest year of our analysis, and within the top 4 for R&D intensity (expenditures as a share of state GDP.) In 2012, Massachusetts ranked 2nd for total expenditures and 3rd for intensity, among U.S. states. This chart shows expenditures by performer sector – meaning the sectors doing the research. Each performer sector receives money from multiple sources, including federal, non-profit, business, and others. The size of our R&D industry is enhanced by the diversity in its performing sectors. The chart below shows that despite shrinking R&D expenditure in the business sector in 2009 and 2010 after the Great Recession [2], the state was able to maintain positive overall growth in expenditures during these years, because of increased expenditures in universities and colleges, non-profits and Federally Funded Research and Development Centers. The rebounding of the business performing sector, as of 2011 [3] is a positive sign for the R&D industry, especially as federal funding sources, such as 2009’s American Recovery and Reinvestment Act have started to taper off. [2] In 2008, National Science Foundation changed surveys for business performer sector data, so it may not be appropriate to compare data from 2007 and earlier directly to data from 2008 and later. For more information about this change and NSF’s other data collection methodologies, see http://www.nsf.gov/statistics/nsf14304/content.cfm?pub_id=4326&id=1.\n[3] Current year estimates are subject to correction by NSF upon release of subsequent year data	272	Indicator	2014-05-08 16:50:23.19121	2014-05-23 00:41:27.211314
72	The “Clean Economy” comprises industries and firms that provide goods and services directly related to protecting the environment, mitigating climate change, conserving energy, and generating clean power. A strong Clean Economy Sector will help Metro Boston to meet its sustainability and climate resiliency challenges while also positioning the region in the vanguard of this growing segment of the economy. According to The Brookings Institution, Metro Boston had 41,800 clean economy jobs in 2010, for a rank of 8th out of the top 25 largest U.S. metro areas. The Brookings Institution analysis was based on a detailed analysis of firms, establishments, and jobs in the fields of conservation, energy efficiency, recycling, environmental management, renewable energy, and more.  The evolving nature of the field, and the complications of data collection and analysis, make it challenging to define the clean economy and the specific sectors it encompasses. The Brookings Institution analysis provides a common benchmark to compare growth of this field across metro areas and over time. \nThe Brookings Institution reports that the clean economy was more resilient during the Great Recession than the economy overall,  and that it is intensive in manufacturing and export activities. The study reports that Metro Boston’s strongest clean energy industries are  public transit (MBTA), waste management & recycling, professional environmental services, and energy efficient building design and construction. The region’s fastest growing sectors include smart grid technologies and alternative energies such as solar, wind, and biofuels.  \nWhile the clean economy sector has shown consistent growth in the Boston MSA since 2003, its growth has been outpaced by other metro areas and the U.S. overall, and its share of clean jobs in the top 25 metro areas and in the US has steadily declined since 2003. \n[4] For more details about The Brookings Institution’s selection methodologies, see their report “Sizing the Clean Economy, “ Chapter 3. Defining and Measuring the Clean Economy in U.S. Metropolitan Areas. http://www.brookings.edu/~/media/Series/resources/0713_clean_economy.pdf\n[5] Brookings released their data for the years 2003, 2007 and 2010.\n[6] “Sizing the Clean Economy,” p 26.	276	Indicator	2014-05-08 16:50:23.303051	2014-05-23 00:44:11.24389
76	Local agriculture helps to provide low- and mid-skill jobs, contributes to a more sustainable and resilient food system, and helps to preserve the traditional New England landscape. Fortunately, the agricultural sector in Metro Boston has been growing rapidly. Total inflation-adjusted sales of agricultural products in Massachusetts rose 10% between 2002 and 2007, and over the same time period Metro Boston producers saw agricultural sales grow 19% [11]. Sales increased despite an 8% decline in Metro Boston total farmland acreage, which fell from 133,000 acres to 123,000 acres. Despite the overall loss of acreage, the total number of farms increased during that time, and the acreage of smaller farms, those under 180 acres [12], increased by 21% in the state and 12% in the region. Small farm acreage now comprises half of all farmland acreage and 94% of all farms in the region, up from 42% and 92% in 2002. These statistics suggest a shift to a greater number of smaller farms growing higher-value specialty crops. As of 2007, there were 110 organic farms [13] in Metro Boston, accounting for 34% of the state’s organic farms and 14% of the state’s organic farmland acreage. Organic products in Metro Boston had a value of $4.8 million in 2007, accounting for 28% of the state’s organic sales.\nHowever, it is not clear how durable these gains in the agricultural sector will be. While the complete county-level data from the 2012 agricultural census have not yet been released, the 2012 state-level results indicate that farms and farmland acreage did not change appreciably, but statewide inflation adjusted sales of agricultural products dropped 8% since 2007 [14]. \n[11] The Agricultural Census withholds data for records which could potentially disclose information about an individual farm or ranch. For this reason, some of the county level sales and acreage data is withheld.\n[12] This definition of small farms comes from the \n[13] Organic production in the 2007 Census of Agriculture was intended to represent production in compliance with National Organic Standards. Values were self-reported by respondents, and were not verified by certifying organizations, so may differ from other sources. For a more detailed description of survey and reporting methods, see Appendix B of the 2007 Census of Agriculture: http://www.agcensus.usda.gov/Publications/2007/Full_Report/Volume_1,_Chapter_2_County_Level/Massachusetts/maappxb.pdf\n[14] The 2012 Agricultural Census was released in February, 2014 with limited state and national data, and no county level data. The more detailed data release is postponed until May, 2014.	280	Indicator	2014-05-08 16:50:23.370219	2014-05-23 00:44:11.386385
78	Local agriculture helps to provide low- and mid-skill jobs, contributes to a more sustainable and resilient food system, and helps to preserve the traditional New England landscape. Fortunately, the agricultural sector in Metro Boston has been growing rapidly. Total inflation-adjusted sales of agricultural products in Massachusetts rose 10% between 2002 and 2007, and over the same time period Metro Boston producers saw agricultural sales grow 19% [11]. Sales increased despite an 8% decline in Metro Boston total farmland acreage, which fell from 133,000 acres to 123,000 acres. Despite the overall loss of acreage, the total number of farms increased during that time, and the acreage of smaller farms, those under 180 acres [12], increased by 21% in the state and 12% in the region. Small farm acreage now comprises half of all farmland acreage and 94% of all farms in the region, up from 42% and 92% in 2002. These statistics suggest a shift to a greater number of smaller farms growing higher-value specialty crops. As of 2007, there were 110 organic farms [13] in Metro Boston, accounting for 34% of the state’s organic farms and 14% of the state’s organic farmland acreage. Organic products in Metro Boston had a value of $4.8 million in 2007, accounting for 28% of the state’s organic sales.\nHowever, it is not clear how durable these gains in the agricultural sector will be. While the complete county-level data from the 2012 agricultural census have not yet been released, the 2012 state-level results indicate that farms and farmland acreage did not change appreciably, but statewide inflation adjusted sales of agricultural products dropped 8% since 2007 [14]. \n[11] The Agricultural Census withholds data for records which could potentially disclose information about an individual farm or ranch. For this reason, some of the county level sales and acreage data is withheld.\n[12] This definition of small farms comes from the \n[13] Organic production in the 2007 Census of Agriculture was intended to represent production in compliance with National Organic Standards. Values were self-reported by respondents, and were not verified by certifying organizations, so may differ from other sources. For a more detailed description of survey and reporting methods, see Appendix B of the 2007 Census of Agriculture: http://www.agcensus.usda.gov/Publications/2007/Full_Report/Volume_1,_Chapter_2_County_Level/Massachusetts/maappxb.pdf\n[14] The 2012 Agricultural Census was released in February, 2014 with limited state and national data, and no county level data. The more detailed data release is postponed until May, 2014.	282	Indicator	2014-05-08 16:50:23.401128	2014-05-23 00:44:11.421621
81	Local agriculture helps to provide low- and mid-skill jobs, contributes to a more sustainable and resilient food system, and helps to preserve the traditional New England landscape. Fortunately, the agricultural sector in Metro Boston has been growing rapidly. Total inflation-adjusted sales of agricultural products in Massachusetts rose 10% between 2002 and 2007, and over the same time period Metro Boston producers saw agricultural sales grow 19%.<sup>1</sup> Sales increased despite an 8% decline in Metro Boston total farmland acreage, which fell from 133,000 acres to 123,000 acres. Despite the overall loss of acreage, the total number of farms increased during that time, and the acreage of smaller farms, those under 180 acres<sup>2</sup>, increased by 21% in the state and 12% in the region. Small farm acreage now comprises half of all farmland acreage and 94% of all farms in the region, up from 42% and 92% in 2002. These statistics suggest a shift to a greater number of smaller farms growing higher-value specialty crops. As of 2007, there were 110 organic farms<sup>3 </sup> in Metro Boston, accounting for 34% of the state’s organic farms and 14% of the state’s organic farmland acreage. Organic products in Metro Boston had a value of $4.8 million in 2007, accounting for 28% of the state’s organic sales.\n\nHowever, it is not clear how durable these gains in the agricultural sector will be. While the complete county-level data from the 2012 agricultural census have not yet been released, the 2012 state-level results indicate that farms and farmland acreage did not change appreciably, but statewide inflation adjusted sales of agricultural products dropped 8% since 2007.<sup>4 </sup>\n<ol>\n<li> The Agricultural Census withholds data for records which could potentially disclose information about an individual farm or ranch. For this reason, some of the county level sales and acreage data is withheld.</li>\n<li> This definition of small farms comes from the </li>\n<li> Organic production in the 2007 Census of Agriculture was intended to represent production in compliance with National Organic Standards. Values were self-reported by respondents, and were not verified by certifying organizations, so may differ from other sources. For a more detailed description of survey and reporting methods, see Appendix B of the 2007 Census of Agriculture: <a href="http://www.agcensus.usda.gov/Publications/2007/Full_Report/Volume_1,_Chapter_2_County_Level/Massachusetts/maappxb.pdf" target="_blank"> AGCensus.USDA.gov</a></li>\n<li> The 2012 Agricultural Census was released in February, 2014 with limited state and national data, and no county level data. The more detailed data release is postponed until May, 2014.</li>\n</ol>	285	Indicator	2014-05-08 16:50:23.450207	2014-05-23 00:44:11.481895
85	Small and micro businesses are an important component of the regional economy because they form the heart and soul of many local business districts, not to mention the fact that almost all start-ups must pass through a small business phase before growing to scale.  There is no official definition of a small business, but it is reasonable to define them by number of employees. Here we define micro businesses as those with fewer than 5 employees, small businesses as those with 5-99 employees, mid-sized businesses as those with 100-499 employees, and large businesses as those with 500 or more employees [15]. Micro and small businesses each account for 4.4% and 26.7% of employment in the Boston metro area, and 3.6% and 22.0% of total compensation, respectively. By comparison, large firms account for nearly 55% of total employment and over 61% of total compensation [16].  Employees in large firms are compensated at 12% above the regional average, while those in micro and small businesses are compensated at 18% below the regional average. \nThe share of employment in small businesses in the Boston metro area is consistent with other major metro areas. Small business employment has hovered between 25% and 33% of total employment in each of the ten largest MSAs every year from 2003 to 2011. \nEmployment in micro, small, and mid-size businesses declined between 2003 and 2011, by 4 to 7%. Large businesses were the only firms to see employment rise over the period, increasing over 5%. These trends suggest that small businesses are having a difficult go of it in Metro Boston—unable to take advantage of the boom years preceding 2008, and also slow to recover from the Great Recession. More assistance and supports are clearly needed if growing small businesses are a key policy priority.  \nBetween 2003 and 2011, average wages fell by half a percent for micro businesses, and grew by 3% for small businesses, adjusted to 2011 dollars. By comparison, wages at mid-sized businesses grew 4%, and at large businesses they grew 14% during this time, adjusted to 2011 dollars.\nIt is important to also compare compensation by firm size within industries. The figure below shows compensation in large firms, mid-sized firms, and small firms, relative to compensation for small firm employees (which is why the grey bars are always 1). The industries shown represent the five most common industries by employment among small firms. We see that compensation is higher in the largest firms in four out of five industries, and within the industry that accounts for the largest share of micro firm employment – professional, scientific and technical services, compensation in large firms is over 50% higher. Only in retail trade do small firms compensate higher than large firms.\n[15]Our definition of a micro business is based on that of the U.S. Small Business Administration: http://www.sba.gov/community/blogs/community-blogs/small-business-matters/your-small-business-microbusiness-if-so-you-m\n[16] For this analysis, the Boston metro area refers to the Boston-Cambridge-Quincy, MA-NH MSA.	289	Indicator	2014-05-08 16:50:23.564437	2014-05-23 00:44:11.553129
86	Small and micro businesses are an important component of the regional economy because they form the heart and soul of many local business districts, not to mention the fact that almost all start-ups must pass through a small business phase before growing to scale.  There is no official definition of a small business, but it is reasonable to define them by number of employees. Here we define micro businesses as those with fewer than 5 employees, small businesses as those with 5-99 employees, mid-sized businesses as those with 100-499 employees, and large businesses as those with 500 or more employees [15]. Micro and small businesses each account for 4.4% and 26.7% of employment in the Boston metro area, and 3.6% and 22.0% of total compensation, respectively. By comparison, large firms account for nearly 55% of total employment and over 61% of total compensation [16].  Employees in large firms are compensated at 12% above the regional average, while those in micro and small businesses are compensated at 18% below the regional average. \nThe share of employment in small businesses in the Boston metro area is consistent with other major metro areas. Small business employment has hovered between 25% and 33% of total employment in each of the ten largest MSAs every year from 2003 to 2011. \nEmployment in micro, small, and mid-size businesses declined between 2003 and 2011, by 4 to 7%. Large businesses were the only firms to see employment rise over the period, increasing over 5%. These trends suggest that small businesses are having a difficult go of it in Metro Boston—unable to take advantage of the boom years preceding 2008, and also slow to recover from the Great Recession. More assistance and supports are clearly needed if growing small businesses are a key policy priority.  \nBetween 2003 and 2011, average wages fell by half a percent for micro businesses, and grew by 3% for small businesses, adjusted to 2011 dollars. By comparison, wages at mid-sized businesses grew 4%, and at large businesses they grew 14% during this time, adjusted to 2011 dollars.\nIt is important to also compare compensation by firm size within industries. The figure below shows compensation in large firms, mid-sized firms, and small firms, relative to compensation for small firm employees (which is why the grey bars are always 1). The industries shown represent the five most common industries by employment among small firms. We see that compensation is higher in the largest firms in four out of five industries, and within the industry that accounts for the largest share of micro firm employment – professional, scientific and technical services, compensation in large firms is over 50% higher. Only in retail trade do small firms compensate higher than large firms.\n[15]Our definition of a micro business is based on that of the U.S. Small Business Administration: http://www.sba.gov/community/blogs/community-blogs/small-business-matters/your-small-business-microbusiness-if-so-you-m\n[16] For this analysis, the Boston metro area refers to the Boston-Cambridge-Quincy, MA-NH MSA.	290	Indicator	2014-05-08 16:50:23.578418	2014-05-23 00:44:11.625498
94	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	298	Indicator	2014-05-08 16:50:23.737587	2014-05-23 00:44:11.747704
100	It is clear that certain industries are leading the way when it comes to economic growth in Metro Boston. The Education and Health Services sector posted year-over-year gains almost continuously since 2001, adding 109,000 jobs for an increase of 22%. Leisure and Hospitality is close behind at 19% growth since 2001 (38,000 jobs). Nearly every industry was affected to some degree by the Great Recession, though some have recovered much faster than others. The Leisure and Hospitality, Professional and Business Services, Education and Health, and Construction industries all added jobs between 2009 and 2012. Meanwhile, Manufacturing and Financial Services continue to slide. These trends are consistent with national patterns, with a notable exception that Metro Boston’s Construction industry recovered 3% between 2009 and 2012, while in the nation it shrank by 6%. The region’s rate of employment recovery was slightly faster than the nation overall.\nMetro Boston’s decline in total jobs between 2001 and 2012 was driven largely by losses in goods-producing sectors. The loss of 95,300 (37% decline) jobs in Manufacturing and another 19,700 (18% decline) in Construction, made up 57% of total regional job losses. The service sectors were not immune to job losses either, however: Financial Activities (10% decline), Information (26% decline), and Trade, Transportation, and Utilities (10% decline) sector employment all declined during this period.\nThe timing of job losses and gains in different sectors since 2001 reflects the different underlying causes of the two recessions. The region lost almost five times more Information Services jobs between 2001 and 2005 than it did between 2005 and 2012, reflecting the central role that the dot-com bubble played in the recession of the early 2000s. Since 2005, Information employment has remained relatively stable, and it remains to be seen if the region will be able to leverage its abundant educational and intellectual resources to grow this sector. Meanwhile, the Great Recession, with its roots in housing, cost the region over eight times more construction jobs than it lost in the first half of the decade. However, the depth of the housing crisis and the number of vacant units post-2008 was not as severe in Metro Boston as in many other regions. This helps to explain why construction resumed more quickly here, relative to the nation. \nOther labor market changes, however, are related to longer-term structural and demographic trends. Job losses in manufacturing, for example, led all sectors from 2001 to 2012. Statewide, manufacturing declined from 15.4% of total jobs in 1992 to 7.7% of total jobs by 2012. Similarly, Trade, Transportation, and Utilities declined from 18.4% of the total to 16.8% over that same time period. These losses are not attributable to specific housing or IT bubbles, but rather are related to the globalization of manufacturing, increasing automation and efficiencies in the retail sector, and the growth if internet commerce—all trends likely to continue in the future.	304	Indicator	2014-05-08 16:50:23.825742	2014-05-23 00:44:11.892291
116	Greater Boston is poised for a more prosperous future. Metro Boston’s modern global economy is driven by innovation, entrepreneurship and technology. Massachusetts consistently ranks highest among New England states in economic competitiveness, thanks in large part to the strength of Metro Boston’s educated and diverse labor force [1]. The region fared better, relative to the nation, through the Great Recession because of its talented workforce and innovative industries. Increasing competition from other regions necessitates a regional approach to growing the economy. It is more important than ever to have measures of the region’s progress, and not just in terms of businesses, jobs, and wages. We can’t measure the prosperity of our region without also addressing the continued poverty and inequality facing a significant number of the region’s residents and communities. While wages and income overall are up across the region, so is unemployment. And the nature of jobs has shifted over the last several decades to require more skills and education. As a result, inequity in our education system critically impacts future employment and wage outcomes for our young people. While educational attainment is up across all racial and ethnic groups, persistent gaps in attainment levels prevent our labor force from achieving its true potential. Unemployment continues to be disproportionately high among Blacks and Latinos, and in our Inner Core and Regional Urban Center communities. And a high cost of living (relative to wages for most) continues to drive families out of our region. \r\n[Insert graphic of Boston MSA compared to others showing performance through recession]\r\nMetroFuture: Making a Greater Boston Region is a comprehensive long-range plan to improve the lives of the people who live and work in Metropolitan Boston. Among six topic areas, MetroFuture identifies Prosperity as an important element in the future of our region, and calls out specific indicators to measure progress toward prosperity. Prosperity for Metro Boston depends on the continued competitiveness of the region’s economy, generation of wealth for its businesses and individuals and high quality of life for all of its residents. This analysis is a check-in to measure where we stand on those prosperity indicators, and to quantify our progress, or lack thereof, in working towards MAPC’s MetroFuture Prosperity Goals for 2030.\r\n[1] Clayton-Matthews, Alan, Executive Summary: Universal Economics? Boston’s Role in the Regional Economic Network, New England Economic Outlook Conference, New England Economic Partnership, Boston, MA, November 14, 2013.	6	Subject	2014-05-23 00:17:59.337682	2015-03-23 19:34:38.448334
\.


--
-- Name: explanations_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('explanations_id_seq', 117, true);


--
-- Data for Name: explanations_sources; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY explanations_sources (id, explanation_id, source_id) FROM stdin;
895	40	1
896	3	1
897	4	1
898	5	1
899	41	1
900	18	1
901	19	1
902	20	1
903	35	1
904	37	1
905	38	1
906	39	1
907	36	1
908	21	1
909	22	1
910	23	1
911	48	1
912	49	1
913	50	1
914	56	1
915	42	1
916	40	2
917	3	2
918	4	2
919	5	2
920	41	2
921	18	2
922	19	2
923	20	2
924	35	2
925	37	2
926	38	2
927	39	2
928	36	2
929	51	2
930	52	2
931	53	2
932	54	2
933	10	2
934	11	2
935	9	2
936	21	2
937	22	2
938	23	2
939	48	2
940	49	2
941	50	2
942	56	2
943	45	2
944	44	2
945	46	2
946	42	2
947	61	2
948	40	3
949	3	3
950	4	3
951	5	3
952	41	3
953	18	3
954	19	3
955	20	3
956	42	3
957	15	3
958	16	3
959	13	3
960	14	3
961	12	3
962	43	3
963	40	4
964	3	4
965	4	4
966	5	4
967	41	4
968	18	4
969	19	4
970	20	4
971	24	4
972	33	4
973	32	4
974	34	4
975	31	4
976	27	4
977	28	4
978	29	4
979	30	4
980	15	4
981	16	4
982	63	4
983	64	4
984	65	4
985	40	5
986	3	5
987	4	5
988	5	5
989	41	5
990	18	5
991	19	5
992	20	5
993	24	5
994	33	5
995	32	5
996	34	5
997	31	5
998	42	5
999	17	5
1000	15	5
1001	16	5
1002	43	5
1003	40	6
1004	3	6
1005	4	6
1006	5	6
1007	41	6
1008	18	6
1009	19	6
1010	20	6
1011	24	6
1012	33	6
1013	32	6
1014	34	6
1015	31	6
1016	42	6
1017	17	6
1018	27	6
1019	28	6
1020	29	6
1021	30	6
1022	15	6
1023	16	6
1024	43	6
1025	63	6
1026	64	6
1027	65	6
1028	40	7
1029	3	7
1030	4	7
1031	5	7
1032	41	7
1033	18	7
1034	19	7
1035	20	7
1036	24	7
1037	33	7
1038	32	7
1039	34	7
1040	31	7
1041	42	7
1042	17	7
1043	27	7
1044	28	7
1045	29	7
1046	30	7
1047	15	7
1048	16	7
1049	43	7
1050	63	7
1051	64	7
1052	65	7
1053	40	8
1054	3	8
1055	4	8
1056	5	8
1057	41	8
1058	18	8
1059	19	8
1060	20	8
1061	24	8
1062	33	8
1063	32	8
1064	34	8
1065	31	8
1066	42	8
1067	17	8
1068	27	8
1069	28	8
1070	29	8
1071	30	8
1072	15	8
1073	16	8
1074	43	8
1075	63	8
1076	64	8
1077	65	8
1078	40	9
1079	3	9
1080	4	9
1081	5	9
1082	41	9
1083	18	9
1084	19	9
1085	20	9
1086	24	9
1087	33	9
1088	32	9
1089	34	9
1090	31	9
1091	42	9
1092	17	9
1093	27	9
1094	28	9
1095	29	9
1096	30	9
1097	15	9
1098	16	9
1099	43	9
1100	63	9
1101	64	9
1102	65	9
1103	40	10
1104	3	10
1105	4	10
1106	5	10
1107	41	10
1108	18	10
1109	19	10
1110	20	10
1111	24	10
1112	33	10
1113	32	10
1114	34	10
1115	31	10
1116	42	10
1117	17	10
1118	27	10
1119	28	10
1120	29	10
1121	30	10
1122	15	10
1123	16	10
1124	43	10
1125	63	10
1126	64	10
1127	65	10
1128	40	11
1129	3	11
1130	4	11
1131	5	11
1132	41	11
1133	18	11
1134	19	11
1135	20	11
1136	24	11
1137	33	11
1138	32	11
1139	34	11
1140	31	11
1141	42	11
1142	17	11
1143	27	11
1144	28	11
1145	29	11
1146	30	11
1147	15	11
1148	16	11
1149	43	11
1150	63	11
1151	64	11
1152	65	11
1153	43	12
1154	6	13
1155	7	13
1156	6	14
1157	7	14
1158	47	15
1159	55	16
1160	25	17
1161	8	17
1162	113	18
1163	114	18
1164	115	18
1165	113	19
1166	114	19
1167	115	19
1168	113	20
1169	114	20
1170	115	20
1171	113	21
1172	114	21
1173	115	21
1174	113	22
1175	114	22
1176	115	22
1177	113	23
1178	114	23
1179	115	23
1180	113	24
1181	114	24
1182	115	24
1183	113	25
1184	114	25
1185	115	25
1186	10	26
1187	11	26
1188	9	26
1189	113	26
\.


--
-- Name: explanations_sources_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('explanations_sources_id_seq', 1189, true);


--
-- Data for Name: goals; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY goals (id, number, title, topic_area_id, created_at, updated_at, description) FROM stdin;
1	1	Focused growth	1	2014-04-23 16:55:23.477342	2014-04-23 16:55:23.477342	Population and job growth will be concentrated in municipalities already well served by infrastructure, with slower growth in less developed areas where infrastructure is more limited.
2	2	Reuse of land and buildings	1	2014-04-23 16:55:23.483875	2014-04-23 16:55:23.483875	Most new growth will occur through reuse of previously developed land and buildings.
3	3	Brownfields revitalization	1	2014-04-23 16:55:23.489314	2014-04-23 16:55:23.489314	Brownfields and other polluted sites will have been cleaned up and re-used for parks or development.
4	4	Growth in town and village centers	1	2014-04-23 16:55:23.494332	2014-04-23 16:55:23.494332	In suburban municipalities, most new growth will occur near town and village centers.
5	5	Growth near transit	1	2014-04-23 16:55:24.566609	2014-04-23 16:55:24.566609	Most new houses and jobs will be near train stops and bus routes, and new growth will be designed to promote transit use.
6	6	High quality design	1	2014-04-23 16:55:24.572857	2014-04-23 16:55:24.572857	High quality design will help compact development enhance the region’s character and livability.
7	7	Community character	1	2014-04-23 16:55:24.578713	2014-04-23 16:55:24.578713	Cities, towns, and neighborhoods will retain their sense of uniqueness and community character.
8	8	Historic preservation	1	2014-04-23 16:55:24.584488	2014-04-23 16:55:24.584488	Historic resources will be preserved and enhanced.
9	9	Green spaces and farms	1	2014-04-23 16:55:24.589961	2014-04-23 16:55:24.589961	The region’s landscape will retain its distinctive green spaces and working farms.
10	10	Informed, proactive planning	1	2014-04-23 16:55:24.59519	2014-04-23 16:55:24.59519	Growth in the region will be guided by informed, inclusive, and proactive planning.
11	11	Disaster preparedness and resiliency	1	2014-04-23 16:55:24.601986	2014-04-23 16:55:24.601986	The region will be prepared for and resilient to natural disasters and climate change.
12	12	Regional collaboration	1	2014-04-23 16:55:24.60824	2014-04-23 16:55:24.60824	Communities will work together to plan for growth and share resources.
13	13	Suburban housing choice	2	2014-04-23 16:55:24.613999	2014-04-23 16:55:24.613999	Families looking for suburban single-family homes will have a greater choice of smaller homes in more traditional neighborhood settings.
14	14	More moderately priced housing	2	2014-04-23 16:55:24.619611	2014-04-23 16:55:24.619611	An increasing share of housing in each municipality will be affordable to working families and fixed income seniors.
15	15	Less regional segregation	2	2014-04-23 16:55:24.624977	2014-04-23 16:55:24.624977	There will be less regional segregation as all municipalities increasingly reflect Metro Boston’s growing diversity.
16	16	Increased affordable housing production	2	2014-04-23 16:55:24.630212	2014-04-23 16:55:24.630212	Low-income households will be able to find affordable, adequate, conveniently located  housing and avoid displacement.
17	17	An end to homelessness	2	2014-04-23 16:55:24.636261	2014-04-23 16:55:24.636261	Homelessness will be effectively eliminated from the region.  
18	18	Housing choices for seniors	2	2014-04-23 16:55:24.641392	2014-04-23 16:55:24.641392	The region’s seniors will have more housing choices and opportunities to downsize while staying in their own community.
19	19	Accessible housing	2	2014-04-23 16:55:24.646391	2014-04-23 16:55:24.646391	Persons with physical or mental disabilities will be able to find housing that meets their needs in terms of design, services, and affordability.
20	20	Appealing urban housing options	2	2014-04-23 16:55:24.65161	2014-04-23 16:55:24.65161	Urban neighborhoods will boast more appealing housing options for young professionals and their families
21	21	Safe Communities	3	2014-04-23 16:55:24.657358	2014-04-23 16:55:24.657358	All communities will be safe, including areas currently afflicted by high rates of violent crime.
22	22	No disparity in pollutant exposure	3	2014-04-23 16:55:24.662927	2014-04-23 16:55:24.662927	Urban and minority residents will not be disproportionately exposed to pollutants and poor air quality.
23	23	Access to parks and playgrounds	3	2014-04-23 16:55:24.668543	2014-04-23 16:55:24.668543	All neighborhoods will have adequate access to safe and well-maintained parks, community gardens, and appropriate play spaces for children and youth.
24	24	Access to healthy food	3	2014-04-23 16:55:24.673992	2014-04-23 16:55:24.673992	Residents in all communities and of all incomes will have access to affordable, healthy food.
25	25	More physical activity	3	2014-04-23 16:55:24.679551	2014-04-23 16:55:24.679551	Most residents will build regular physical activity into their daily lives.
26	26	Affordable healthcare	3	2014-04-23 16:55:24.685575	2014-04-23 16:55:24.685575	All residents will have access to affordable healthcare
27	27	After-school and youth programs	3	2014-04-23 16:55:24.691835	2014-04-23 16:55:24.691835	Children and youth will have access to a strong system of early education programs, after-school programs, teen centers, and youth organizations.
28	28	High-quality public schools	3	2014-04-23 16:55:24.697583	2014-04-23 16:55:24.697583	Public schools will provide a high-quality education for all students, not only in the fundamentals, but also in areas like health education, physical education, art, music, civics, and science.
29	29	More high school graduates	3	2014-04-23 16:55:24.703244	2014-04-23 16:55:24.703244	More students will graduate from high school and go on to college or career training opportunities.
30	30	Efficient, well-funded municipalities	3	2014-04-23 16:55:24.708469	2014-04-23 16:55:24.708469	Municipalities will operate efficiently and will have adequate funding with less reliance on the property tax .
31	31	Civic Engagement	3	2014-04-23 16:55:24.714038	2014-04-23 16:55:24.714038	The region’s residents—including youth, seniors, and immigrants—will be well-informed and engaged in civic life & community planning.
32	32	Active seniors	3	2014-04-23 16:55:24.721234	2014-04-23 16:55:24.721234	Seniors will remain active members of their communities.
33	33	Competetive in the knowledge economy	4	2014-04-23 16:55:24.728186	2014-04-23 16:55:24.728186	The region will be globally competitive in the knowledge economy.
34	34	Green technology leadership	4	2014-04-23 16:55:24.73382	2014-04-23 16:55:24.73382	The region will be a national leader in the green technology and clean energy sectors, from development through manufacturing and application.
35	35	Robust small business sector	4	2014-04-23 16:55:24.739497	2014-04-23 16:55:24.739497	Small business owners and entrepreneurs will play a major role in the region's economy and innovation
36	36	Consistent economic development policies	4	2014-04-23 16:55:24.745117	2014-04-23 16:55:24.745117	Businesses will readily relocate to and expand in the region thanks to consistent and predictable economic development policies set by an informed public sector
37	37	Strong supply of skilled workers	4	2014-04-23 16:55:24.750848	2014-04-23 16:55:24.750848	A strong supply of educated and skilled workers of all ages will encourage business to locate and expand here
38	38	Better career opportunities for minorities	4	2014-04-23 16:55:24.760416	2014-04-23 16:55:24.760416	More minority and immigrant workers have the opportunities to advance on the career ladder, acquire assets, and build wealth
39	39	Higher labor force participation rates	4	2014-04-23 16:55:24.765921	2014-04-23 16:55:24.765921	More workers will participate in the labor force, earning a living wage through secure employment
40	40	Less poverty	4	2014-04-23 16:55:24.772083	2014-04-23 16:55:24.772083	Fewer of the region's residents will live in poverty
41	41	Engaged and sustainable corporations	4	2014-04-23 16:55:24.777595	2014-04-23 16:55:24.777595	Corporations and Institutions will see civic engagement and sustainability as central to their own success
42	42	Strong agricultural economy	4	2014-04-23 16:55:24.783136	2014-04-23 16:55:24.783136	The region's agricultural economy will grown through a focus on sustainable farming and by bringing more locally produced foods to the market
43	43	Strong arts and culture sector	4	2014-04-23 16:55:24.789015	2014-04-23 16:55:24.789015	More people will take advantage of the region's artistic and cultural resources
44	44	Expanded transit system	5	2014-04-23 16:55:24.79522	2014-04-23 16:55:24.79522	An expanded transit system will provide better service to both urban and suburban areas, linking more homes and jobs.
45	45	Increasing transit ridership	5	2014-04-23 16:55:24.800922	2014-04-23 16:55:24.800922	More people will use transit for work and personal service
46	46	More options for commuters	5	2014-04-23 16:55:24.80716	2014-04-23 16:55:24.80716	Commuters will have more options to avoid congestion
47	47	More walking and biking	5	2014-04-23 16:55:24.812675	2014-04-23 16:55:24.812675	Most people will choose to walk or bike for short trips
48	48	Less driving	5	2014-04-23 16:55:24.818918	2014-04-23 16:55:24.818918	The average person will drive fewer miles every day
49	49	Less suburban congestion	5	2014-04-23 16:55:24.825152	2014-04-23 16:55:24.825152	Outlying areas will see little increase in traffic congestion
50	50	Better transportation for the disabled	5	2014-04-23 16:55:24.831237	2014-04-23 16:55:24.831237	People with disabilities will find it easier to get around the region
51	51	Linked transportation and planning	5	2014-04-23 16:55:24.836526	2014-04-23 16:55:24.836526	Regional transportation planning will be linked with sustainable land use
52	52	Reliable funding for transportation	5	2014-04-23 16:55:24.876498	2014-04-23 16:55:24.876498	The transportation system will be reliably funded and transportation agencies will demonstrate accountability to the public
53	53	Efficient project construction	5	2014-04-23 16:55:24.881605	2014-04-23 16:55:24.881605	Transportation projects will be designed and built quickly and cost effectively
54	54	Safe roads and bridges	5	2014-04-23 16:55:24.886822	2014-04-23 16:55:24.886822	Roads, bridges, and railways will be safe and well maintained
55	55	Efficient transportation of freight	5	2014-04-23 16:55:24.891862	2014-04-23 16:55:24.891862	The region's businesses will access the global marketplace through an efficient freight transportation network
56	56	Fewer greenhouse gas emissions	6	2014-04-23 16:55:24.896949	2014-04-23 16:55:24.896949	The region will be a national leader in reducing greenhouse gas emissions
57	57	Decreasing energy use	6	2014-04-23 16:55:24.902067	2014-04-23 16:55:24.902067	The region will use progressively less energy for electricity, heating, cooling, and transportation
58	58	Less solid waste	6	2014-04-23 16:55:24.907241	2014-04-23 16:55:24.907241	The region will produce less solid waste, and more of that waste will be recycled or composted
59	59	Less energy use	6	2014-04-23 16:55:24.912335	2014-04-23 16:55:24.912335	The region will produce more renewable energy and will obtain more of its energy from renewable sources
60	60	Improving air quality	6	2014-04-23 16:55:24.917502	2014-04-23 16:55:24.917502	The region will have better air quality, both indoors and out
61	61	Sustainably managed water resources	6	2014-04-23 16:55:24.922702	2014-04-23 16:55:24.922702	Water resources will be carefully budgeted and sustainably managed so that clean water is available for appropriate uses and development
62	62	Clean and healthy bodies of water	6	2014-04-23 16:55:24.927852	2014-04-23 16:55:24.927852	The region's rivers, streams, lakes, and ponds will have sufficient clean water to support healthy populations of native fish and other species, as well as recreational use.
63	63	More and healthier wetlands	6	2014-04-23 16:55:24.9331	2014-04-23 16:55:24.9331	The ecological condition of wetlands will improve, and fewer wetlands will be lost to development
64	64	A biodiverse region	6	2014-04-23 16:55:24.93819	2014-04-23 16:55:24.93819	The region will retain its biodiversity, and will have healthy populations of native plants and animals, and fewer invasive species
65	65	A network of green spaces	6	2014-04-23 16:55:24.943288	2014-04-23 16:55:24.943288	A robust network of protected open spaces, farms, parks, and greenways will provide wildlife habitat, ecological benefits, recreational opportunities, and scenic beauty.
\.


--
-- Name: goals_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('goals_id_seq', 65, true);


--
-- Data for Name: indicator_groups; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY indicator_groups (id, title, created_at, updated_at) FROM stdin;
1	College attainment gap	2014-04-23 16:59:25.077549	2014-04-23 16:59:25.077549
2	High school attainment gap	2014-04-23 17:00:20.070615	2014-04-23 17:00:20.070615
3	Debt-to-degree ratio	2014-05-08 16:50:21.812266	2014-05-08 16:50:21.812266
4	Job growth by sector	2014-05-23 00:18:00.276059	2014-05-23 00:18:00.276059
5	Average weekly wages by industry	2014-05-23 00:18:01.212923	2014-05-23 00:18:01.212923
6	Demand for jobs by educational attainment requirements	2014-05-23 00:18:02.297634	2014-05-23 00:18:02.297634
7	College attainment gaps	2014-05-23 00:18:02.889517	2014-05-23 00:18:02.889517
8	High school attainment gaps	2014-05-23 00:18:03.151183	2014-05-23 00:18:03.151183
9	Debt-to-degree ratios	2014-05-23 00:18:03.50165	2014-05-23 00:18:03.50165
10	Number of workers by educational attainment	2014-05-23 00:18:03.777911	2014-05-23 00:18:03.777911
11	Labor force participation gaps	2014-05-23 00:18:04.24644	2014-05-23 00:18:04.24644
12	Unemployment gaps	2014-05-23 00:18:04.684184	2014-05-23 00:18:04.684184
13	Alternatives measures of unemployment: labor underutilization	2014-05-23 00:18:05.077335	2014-05-23 00:18:05.077335
14	Jobs-skills mismatch	2014-05-23 00:18:05.206947	2014-05-23 00:18:05.206947
15	Youth in the labor force	2014-05-23 00:18:05.374298	2014-05-23 00:18:05.374298
16	Migration	2014-05-23 00:18:06.08552	2014-05-23 00:18:06.08552
17	Clean Economy	2014-05-23 00:18:06.627027	2014-05-23 00:18:06.627027
18	Agricultural economy	2014-05-23 00:18:06.922611	2014-05-23 00:18:06.922611
19	Farm to school programs	2014-05-23 00:18:07.406567	2014-05-23 00:18:07.406567
20	Small and micro businesses	2014-05-23 00:18:07.510095	2014-05-23 00:18:07.510095
21	Family median income	2014-05-23 00:18:07.975152	2014-05-23 00:18:07.975152
22	Family income gaps	2014-05-23 00:18:08.226038	2014-05-23 00:18:08.226038
23	Homeownership gap	2014-05-23 00:18:08.878811	2014-05-23 00:18:08.878811
24	Unearned to earned income ratio	2014-05-23 00:18:09.056429	2014-05-23 00:18:09.056429
\.


--
-- Name: indicator_groups_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('indicator_groups_id_seq', 24, true);


--
-- Data for Name: indicators; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY indicators (id, title, created_at, updated_at, units, number, objective_id, subject_id, threshhold, higher_value_is_better, lower_rank_is_better, indicator_group_id, value_delta, rank_delta) FROM stdin;
286	Share of Massachusetts public school districts participating in farm to school activities	2014-05-08 16:50:09.499532	2014-05-23 00:44:11.493455	percent	286	\N	4	100.0	t	t	19	0	0
229	Participation Gap, Regional Urban Center to regional average	2014-04-23 16:55:30.463816	2014-05-23 00:44:13.316948	percentage points	229	\N	3	1.0	f	f	11	-1	0
123	Percentage of working-age adults with at least 2- or 4-year college degree	2014-04-23 16:55:29.817587	2014-05-23 00:44:12.440613	percent	123	122	1	48.0	t	t	\N	5	3
249	Share of inmigrants ages 25-64 with a college degree, relative to share of outmigrants	2014-04-23 16:55:30.610262	2014-05-23 00:18:16.84454	percentage point	249	\N	3	0.0	t	t	16	0	0
268	Difference in homeownership rate of households of color compared to white households, Latino to White	2014-05-08 16:50:09.338522	2014-05-23 00:18:18.586863	percentage points	268	\N	2	0.0	f	f	23	0	0
237	Gap between labor underutilization rate and official unemployment rate, Massachusetts	2014-04-23 16:55:30.546429	2014-05-23 00:44:13.711282	percent	237	\N	3	1.0	f	f	13	3	0
270	Share of Black residents living in zip codes with unearned to earned income ratios below the regional median	2014-05-08 16:50:09.351567	2014-05-23 00:18:18.861958	percent	270	\N	2	50.0	f	f	24	0	0
211	College attainment gap for Black or African American compared to White working age adults	2014-04-23 16:55:30.365448	2014-05-23 00:44:12.480311	percentage points	211	\N	1	1.0	f	f	7	2	3
242	Labor force participation gap between Black and White youth ages 16-24	2014-04-23 16:55:30.572996	2014-05-23 00:44:13.827431	percentage points	242	\N	3	1.0	f	f	15	-14	25
272	Dollars of Research and Development Expenditures, Massachusetts	2014-05-08 16:50:09.364603	2014-05-23 00:44:14.812084	billion dollars	272	\N	4	17000000000.0	t	t	\N	4	0
214	Percentage of working-age adults without a high school diploma	2014-04-23 16:55:30.381036	2014-05-23 00:44:12.646795	percent	214	\N	1	10.0	f	f	\N	-3	21
275	Patent to business ratio (patents per 10,000 businesses)	2014-05-08 16:50:09.383897	2014-05-23 00:44:14.936754	patents per 10,000 businesses	275	\N	4	650.0	t	t	\N	131	3
276	Number of Jobs in ñClean Economyî sector	2014-05-08 16:50:09.390523	2014-05-23 00:44:14.974014	jobs	276	\N	4	40000.0	t	t	17	7816	8
215	High school attainment gap for Black or African American compared to White working age adults	2014-04-23 16:55:30.386498	2014-05-23 00:44:12.685977	percentage points	215	\N	1	1.0	f	f	8	-3	3
216	High school attainment gap for Latino or Hispanic compared to White working age adults	2014-04-23 16:55:30.39187	2014-05-23 00:44:12.725216	percentage points	216	\N	1	1.0	f	f	8	-6	15
217	High school attainment gap for working age adults in Regional Urban Centers compared to regional average	2014-04-23 16:55:30.396982	2014-05-23 00:44:12.759983	percentage points	217	\N	1	1.0	f	f	8	-2	0
266	Disparity between minimum wage and wage needed for individual economic independence	2014-05-08 16:50:09.325332	2014-05-23 00:44:14.629862	2012 dollars	266	\N	2	0.0	f	f	\N	0	0
278	Green collar jobs as share of clean economy	2014-05-08 16:50:09.403819	2014-05-23 00:44:11.28444	percent	278	\N	4	60.0	t	t	\N	0	0
267	Difference in homeownership rate of households of color compared to white households, Black to White	2014-05-08 16:50:09.331862	2014-05-23 00:18:18.539472	percentage points	267	\N	2	0.0	f	f	23	0	0
265	Share of households making less than Economic Independence Index Income	2014-05-08 16:50:09.318713	2014-05-23 00:18:18.414879	percent	265	\N	2	0.0	f	f	\N	0	0
264	Disparity between cost of living and median area income for single parent families	2014-05-08 16:50:09.31023	2014-05-23 00:18:18.382086	dollars	264	\N	2	0.0	f	f	\N	0	0
273	R&D intensity (expenditures as share of state GDP)	2014-05-08 16:50:09.370862	2014-05-23 00:44:14.849378	\N	273	\N	\N	5.0	t	t	\N	1	0
283	Number of organic farms	2014-05-08 16:50:09.479439	2014-05-23 00:44:11.435219	farms	283	\N	4	109.0	t	t	18	0	0
284	Acreage in organic farms 	2014-05-08 16:50:09.486089	2014-05-23 00:44:11.454679	acres	284	\N	4	999.0	t	t	18	0	0
285	Sales of organic products grown in Massachusetts	2014-05-08 16:50:09.492768	2014-05-23 00:44:11.472763	dollars	285	\N	4	4800000.0	t	t	18	0	0
287	Share of public school district food budgets spent on local foodsæ	2014-05-08 16:50:09.505937	2014-05-23 00:44:11.513157	percent	287	\N	4	25.0	t	t	19	0	0
292	Share of municipalities participating in Chapter 43D 	2014-05-08 16:50:09.538053	2014-05-23 00:44:11.65348	percent	292	\N	4	82.0	t	t	20	0	0
293	Number of Chapter 43D sites	2014-05-08 16:50:09.544561	2014-05-23 00:44:11.668002	sites	293	\N	4	82.0	t	t	\N	0	0
294	Total employment in Metro Boston	2014-05-08 16:50:09.551575	2014-05-23 00:44:15.641792	jobs	294	\N	5	2406000.0	t	t	\N	87000	0
295	Job growth by sector - Education & Health Services	2014-05-08 16:50:09.55807	2014-05-23 00:44:15.679294	jobs	295	\N	5	600000.0	t	t	4	109000	0
277	Metro Boston share of national ñClean Economyî sector jobs	2014-05-08 16:50:09.397104	2014-05-23 00:44:15.010702	percent	277	\N	4	2.0	t	t	17	0	16
274	Number of Patents (annual)	2014-05-08 16:50:09.377226	2014-05-23 00:44:14.896784	patents	274	\N	4	4000.0	t	t	\N	1074	4
1	Population and employment growth in Inner Core	2014-04-23 16:55:29.074068	2014-04-23 16:55:29.074068	none	1	1	\N	\N	t	t	\N	\N	\N
2	Population and employment growth in Regional Urban Centers	2014-04-23 16:55:29.079872	2014-04-23 16:55:29.079872	none	2	2	\N	\N	t	t	\N	\N	\N
3	Population and employment growth in Maturing Suburbs	2014-04-23 16:55:29.085321	2014-04-23 16:55:29.085321	none	3	3	\N	\N	t	t	\N	\N	\N
4	Population and employment growth in Developing Suburbs	2014-04-23 16:55:29.090578	2014-04-23 16:55:29.090578	none	4	4	\N	\N	t	t	\N	\N	\N
5	Jobs on redevelopment land	2014-04-23 16:55:29.095889	2014-04-23 16:55:29.095889	none	5	5	\N	\N	t	t	\N	\N	\N
6	housing units on redevelopment land	2014-04-23 16:55:29.101101	2014-04-23 16:55:29.101101	none	6	6	\N	\N	t	t	\N	\N	\N
279	Creative Cluster employment as share of total employment 	2014-05-08 16:50:09.41021	2014-05-23 00:44:15.113799	percent	279	\N	4	2.5	t	t	\N	0	5
280	Total sales of agricultural products grown in Metro Boston	2014-05-08 16:50:09.416787	2014-05-23 00:44:15.146964	dollars	280	\N	4	170000000.0	t	t	18	31829790	0
281	Total acres of farmland in Metro Boston	2014-05-08 16:50:09.465041	2014-05-23 00:44:15.182031	acres	281	\N	4	124000.0	t	t	18	-9840	0
282	Acreage of farms under 260 acresæ	2014-05-08 16:50:09.472636	2014-05-23 00:44:15.216753	acres	282	\N	4	60000.0	t	t	18	6600	0
271	Share of Latino residents living in zip codes with unearned to earned income ratios below the regional median	2014-05-08 16:50:09.358155	2014-05-23 00:18:18.912038	percent	271	\N	2	50.0	f	f	24	0	0
288	Micro business share of regional employment	2014-05-08 16:50:09.512342	2014-05-23 00:44:15.388429	percent	288	\N	4	5.0	t	t	20	0	20
296	Job growth by sector - Professional and Business Services	2014-05-08 16:50:09.564457	2014-05-23 00:44:15.715765	jobs	296	\N	5	415000.0	t	t	4	8000	0
289	Small business share of regional employment	2014-05-08 16:50:09.518841	2014-05-23 00:44:15.429441	percent	289	\N	4	30.0	t	t	20	-2	20
290	Micro business share of regional compensation	2014-05-08 16:50:09.525272	2014-05-23 00:44:15.469438	percent	290	\N	4	5.0	t	t	20	-1	21
291	Small business share of regional compensation	2014-05-08 16:50:09.531526	2014-05-23 00:44:15.51074	percent	291	\N	4	30.0	t	t	20	-3	17
297	Job growth by sector - Trade, Transportation, and Utilities	2014-05-08 16:50:09.571097	2014-05-23 00:44:15.751624	jobs	297	\N	5	445000.0	t	t	4	-44000	0
298	Job growth by sector - Leisure and Hospitality	2014-05-08 16:50:09.577522	2014-05-23 00:44:15.789856	jobs	298	\N	5	230000.0	t	t	4	38000	0
299	Job growth by sector - Financial Activities	2014-05-08 16:50:09.584014	2014-05-23 00:44:15.826774	jobs	299	\N	5	187000.0	t	t	4	-19000	0
300	Job growth by sector - Manufacturing	2014-05-08 16:50:09.59178	2014-05-23 00:44:15.911465	jobs	300	\N	5	260000.0	t	t	4	-95000	0
301	Job growth by sector - Other	2014-05-08 16:50:09.599005	2014-05-23 00:44:15.9633	jobs	301	\N	5	90000.0	t	t	4	18000	0
302	Job growth by sector - Construction	2014-05-08 16:50:09.605675	2014-05-23 00:44:16.002425	jobs	302	\N	5	108000.0	t	t	4	-20000	0
303	Job growth by sector - Public Administration	2014-05-08 16:50:09.612034	2014-05-23 00:44:16.04132	jobs	303	\N	5	75000.0	t	t	4	1000	0
304	Job growth by sector - Information	2014-05-08 16:50:09.61837	2014-05-23 00:44:16.079044	jobs	304	\N	5	97000.0	t	t	4	-25000	0
305	Average weekly wages by industry - Total, all industries	2014-05-08 16:50:09.624804	2014-05-23 00:44:16.114407	dollars per week	305	\N	5	1290.0	t	t	5	67	0
306	Average weekly wages by industry - Construction	2014-05-08 16:50:09.631899	2014-05-23 00:44:16.201843	dollars per week	306	\N	5	1394.0	t	t	5	6	0
307	Average weekly wages by industry - Education and Health Services	2014-05-08 16:50:09.638929	2014-05-23 00:44:16.237864	dollars per week	307	\N	5	950.0	t	t	5	159	0
308	Average weekly wages by industry - Financial Activities	2014-05-08 16:50:09.645471	2014-05-23 00:44:16.273233	dollars per week	308	\N	5	2200.0	t	t	5	209	0
309	Average weekly wages by industry - Information	2014-05-08 16:50:09.651955	2014-05-23 00:44:16.31227	dollars per week	309	\N	5	1700.0	t	t	5	184	0
311	Average weekly wages by industry - Manufacturing	2014-05-08 16:50:09.664521	2014-05-23 00:44:16.405311	dollars per week	311	\N	5	1500.0	t	t	5	235	0
312	Average weekly wages by industry - Natural Resources	2014-05-08 16:50:09.670948	2014-05-23 00:44:16.507119	dollars per week	312	\N	5	730.0	t	t	5	67	0
313	Average weekly wages by industry - Other	2014-05-08 16:50:09.677214	2014-05-23 00:44:16.546651	dollars per week	313	\N	5	670.0	t	t	5	-67	0
314	Average weekly wages by industry - Professional and Business Services	2014-05-08 16:50:09.683514	2014-05-23 00:44:16.588696	dollars per week	314	\N	5	1500.0	t	t	5	274	0
315	Average weekly wages by industry - Public Administration	2014-05-08 16:50:09.690051	2014-05-23 00:44:16.638633	dollars per week	315	\N	5	1200.0	t	t	5	173	0
317	High-Skill Jobs: Total Demand, jobs requiring a bachelor's degree or higher	2014-05-08 16:50:09.702659	2014-05-23 00:44:16.745744	jobs	317	\N	5	\N	t	t	6	113500	2
318	Mid-skill jobs: total demand, jobs requiring some college or an associateÍs degree	2014-05-08 16:50:09.709174	2014-05-23 00:44:16.856834	jobs	318	\N	5	\N	t	t	6	-108000	23
319	Low-skill jobs: total demand, jobs with low or no educational requirements	2014-05-08 16:50:09.715686	2014-05-23 00:44:16.900875	jobs	319	\N	5	\N	\N	\N	6	-201410	24
269	Difference in homeownership rate of households of color compared to white households, Asian to White	2014-05-08 16:50:09.345098	2014-05-23 00:18:18.671665	percentage points	269	\N	2	0.0	f	f	23	0	0
310	Average weekly wages by industry - Leisure and Hospitality	2014-05-08 16:50:09.658234	2014-05-23 00:44:16.360446	dollars per week	310	\N	5	520.0	t	t	5	-21	0
316	Average weekly wages by industry - Trade, Transportation, and Utilities	2014-05-08 16:50:09.696297	2014-05-23 00:44:16.685367	dollars per week	316	\N	5	970.0	t	t	5	-73	0
213	College attainment gap for working age adults in Regional Urban Centers compared to regional average	2014-04-23 16:55:30.375927	2014-05-23 00:18:10.4748	percentage points	213	\N	1	1.0	f	f	7	0	0
7	Number and Location of 21 E and Superfund Sites	2014-04-23 16:55:29.106341	2014-04-23 16:55:29.106341	none	7	7	\N	\N	t	t	\N	\N	\N
8	Number and Location of 21 E and Superfund Sites	2014-04-23 16:55:29.111454	2014-04-23 16:55:29.111454	none	8	8	\N	\N	t	t	\N	\N	\N
9	Population growth in CODAs of Maturing Suburbs	2014-04-23 16:55:29.116631	2014-04-23 16:55:29.116631	none	9	9	\N	\N	t	t	\N	\N	\N
10	Housing unit growth in CODAs of Developing Suburbs	2014-04-23 16:55:29.121889	2014-04-23 16:55:29.121889	none	10	10	\N	\N	t	t	\N	\N	\N
11	Job growth in CODAs of Maturing Suburbs and Developing Suburbs	2014-04-23 16:55:29.126978	2014-04-23 16:55:29.126978	none	11	11	\N	\N	t	t	\N	\N	\N
12	Housing unit and job growth in mixed-use developments	2014-04-23 16:55:29.132231	2014-04-23 16:55:29.132231	none	12	12	\N	\N	t	t	\N	\N	\N
13	Housing unit growth within 1 mile buffer of MBTA commuter rail and rapid transit stations	2014-04-23 16:55:29.137684	2014-04-23 16:55:29.137684	none	13	13	\N	\N	t	t	\N	\N	\N
14	Employment growth within 1 mile buffer of MBTA commuter rail and rapid transit stations	2014-04-23 16:55:29.142818	2014-04-23 16:55:29.142818	none	14	14	\N	\N	t	t	\N	\N	\N
15	Density of development within 1/2 mile buffer of MBTA commuter rail and rapid transit stations	2014-04-23 16:55:29.148028	2014-04-23 16:55:29.148028	none	15	15	\N	\N	t	t	\N	\N	\N
16	Number of communities that have design guidelines or form based codes	2014-04-23 16:55:29.153305	2014-04-23 16:55:29.153305	none	16	16	\N	\N	t	t	\N	\N	\N
17	Number of communities that have LEED or LEED-equivalent requirements in their zoning	2014-04-23 16:55:29.158395	2014-04-23 16:55:29.158395	none	17	17	\N	\N	t	t	\N	\N	\N
18	Proportion of new development that meets the requirements of LEED Certification or equivalent	2014-04-23 16:55:29.163624	2014-04-23 16:55:29.163624	none	18	18	\N	\N	t	t	\N	\N	\N
19	Housing unit growth	2014-04-23 16:55:29.169333	2014-04-23 16:55:29.169333	none	19	19	\N	\N	t	t	\N	\N	\N
20	Regionwide growth of commercial land uses	2014-04-23 16:55:29.174586	2014-04-23 16:55:29.174586	none	20	20	\N	\N	t	t	\N	\N	\N
21	Share of retail and service spending captured by establishments with less than 25 employees	2014-04-23 16:55:29.179647	2014-04-23 16:55:29.179647	none	21	21	\N	\N	t	t	\N	\N	\N
22	Municipal historic resources preservation plans	2014-04-23 16:55:29.184859	2014-04-23 16:55:29.184859	none	22	22	\N	\N	t	t	\N	\N	\N
23	Loss of significant historic resources	2014-04-23 16:55:29.189967	2014-04-23 16:55:29.189967	none	23	23	\N	\N	t	t	\N	\N	\N
24	Change in acres of developed land from greenfields	2014-04-23 16:55:29.19513	2014-04-23 16:55:29.19513	none	24	24	\N	\N	t	t	\N	\N	\N
25	Acres of productive agricultural land	2014-04-23 16:55:29.200214	2014-04-23 16:55:29.200214	none	25	25	\N	\N	t	t	\N	\N	\N
26	Proportion of new single-family housing in suburbs that use open space or conservation subdivision design	2014-04-23 16:55:29.205552	2014-04-23 16:55:29.205552	none	26	26	\N	\N	t	t	\N	\N	\N
27	Number of municipalities with Master Plans, created or updated within five years, consistent with the regional plan	2014-04-23 16:55:29.210651	2014-04-23 16:55:29.210651	none	27	27	\N	\N	t	t	\N	\N	\N
28	Number of municipalities with zoning consistent with local master plans	2014-04-23 16:55:29.215983	2014-04-23 16:55:29.215983	none	28	28	\N	\N	t	t	\N	\N	\N
29	input title	2014-04-23 16:55:29.222196	2014-04-23 16:55:29.222196	none	29	29	\N	\N	t	t	\N	\N	\N
30	By-right development potential for housing units and commercial and industrial square footage in designated growth areas	2014-04-23 16:55:29.227461	2014-04-23 16:55:29.227461	none	30	30	\N	\N	t	t	\N	\N	\N
31	Number of municipalities with updated Pre-Disaster Mitigation Plans	2014-04-23 16:55:29.23263	2014-04-23 16:55:29.23263	none	31	31	\N	\N	t	t	\N	\N	\N
32	Number of municipalities implementing pre-disaster mitigation plans	2014-04-23 16:55:29.237962	2014-04-23 16:55:29.237962	none	32	32	\N	\N	t	t	\N	\N	\N
33	Number of structurally deficient dams	2014-04-23 16:55:29.243861	2014-04-23 16:55:29.243861	none	33	33	\N	\N	t	t	\N	\N	\N
34	Amount of new growth in flood zones	2014-04-23 16:55:29.249985	2014-04-23 16:55:29.249985	none	34	34	\N	\N	t	t	\N	\N	\N
35	Number and type of inter-municipal agreements	2014-04-23 16:55:29.256645	2014-04-23 16:55:29.256645	none	35	35	\N	\N	t	t	\N	\N	\N
36	Value of goods and services purchased through joint procurement	2014-04-23 16:55:29.2621	2014-04-23 16:55:29.2621	none	36	36	\N	\N	t	t	\N	\N	\N
37	Number of municipalities participating in MAPC subregions	2014-04-23 16:55:29.267758	2014-04-23 16:55:29.267758	none	37	37	\N	\N	t	t	\N	\N	\N
38	Proportion of local tax revenues shared through regional tax sharing	2014-04-23 16:55:29.274019	2014-04-23 16:55:29.274019	none	38	38	\N	\N	t	t	\N	\N	\N
39	New housing units on lots smaller than 1/4 acre.	2014-04-23 16:55:29.280281	2014-04-23 16:55:29.280281	none	39	39	\N	\N	t	t	\N	\N	\N
40	Median lot size of new single-family houses	2014-04-23 16:55:29.32941	2014-04-23 16:55:29.32941	none	40	40	\N	\N	t	t	\N	\N	\N
41	Number of New Units	2014-04-23 16:55:29.335826	2014-04-23 16:55:29.335826	none	41	41	\N	\N	t	t	\N	\N	\N
42	Number of New Units permitted	2014-04-23 16:55:29.34101	2014-04-23 16:55:29.34101	none	42	41	\N	\N	t	t	\N	\N	\N
43	Median home price (by type) vs. median household income	2014-04-23 16:55:29.346151	2014-04-23 16:55:29.346151	none	43	42	\N	\N	t	t	\N	\N	\N
44	Number of municipalities where local median housing costs are equal to or less than 30% of regional median income	2014-04-23 16:55:29.351732	2014-04-23 16:55:29.351732	none	44	43	\N	\N	t	t	\N	\N	\N
45	Share of housing stock comprised of ownership housing units with monthly costs less than 30% of regional monthly median income	2014-04-23 16:55:29.357097	2014-04-23 16:55:29.357097	none	45	44	\N	\N	t	t	\N	\N	\N
46	Share of housing stock comprised of rental housing units costing less than 30% of regional median income	2014-04-23 16:55:29.362329	2014-04-23 16:55:29.362329	none	46	45	\N	\N	t	t	\N	\N	\N
47	Number of single-family homes <1,700 square feet or single-family attached; 2-4 family homes build	2014-04-23 16:55:29.367545	2014-04-23 16:55:29.367545	none	47	46	\N	\N	t	t	\N	\N	\N
48	Gap between Non-White proportion of municipal population and Non-White proportion of regional population	2014-04-23 16:55:29.373065	2014-04-23 16:55:29.373065	none	48	47	\N	\N	t	t	\N	\N	\N
49	Home purchase denial rates.	2014-04-23 16:55:29.378412	2014-04-23 16:55:29.378412	none	49	48	\N	\N	t	t	\N	\N	\N
50	Housing affordable to households earning 80%, 50% and 30% of AMI	2014-04-23 16:55:29.384207	2014-04-23 16:55:29.384207	none	50	49	\N	\N	t	t	\N	\N	\N
51	Percent of Housing that is part of the Chapter 40B Subsidized Housing Inventory 	2014-04-23 16:55:29.389625	2014-04-23 16:55:29.389625	none	51	50	\N	\N	t	t	\N	\N	\N
52	input title	2014-04-23 16:55:29.394906	2014-04-23 16:55:29.394906	none	52	51	\N	\N	t	t	\N	\N	\N
53	Occupancy rate for public housing	2014-04-23 16:55:29.400154	2014-04-23 16:55:29.400154	none	53	52	\N	\N	t	t	\N	\N	\N
54	input title	2014-04-23 16:55:29.405644	2014-04-23 16:55:29.405644	none	54	53	\N	\N	t	t	\N	\N	\N
55	Number of units with expiring affordibility requirements	2014-04-23 16:55:29.410682	2014-04-23 16:55:29.410682	none	55	54	\N	\N	t	t	\N	\N	\N
56	Waitlist size for public housing, state-assisted rental housing, and Section 8 vouchers	2014-04-23 16:55:29.415961	2014-04-23 16:55:29.415961	none	56	55	\N	\N	t	t	\N	\N	\N
57	Number of homeless individals and families	2014-04-23 16:55:29.421368	2014-04-23 16:55:29.421368	none	57	56	\N	\N	t	t	\N	\N	\N
58	Demand for Department of Housing and Community Development family shelter inventory.	2014-04-23 16:55:29.426427	2014-04-23 16:55:29.426427	none	58	57	\N	\N	t	t	\N	\N	\N
59	Demand for Department of Housing and Community Development individual shelter inventory.	2014-04-23 16:55:29.431561	2014-04-23 16:55:29.431561	none	59	58	\N	\N	t	t	\N	\N	\N
60	Average length of shelter stays in state homeless shelters	2014-04-23 16:55:29.437074	2014-04-23 16:55:29.437074	none	60	59	\N	\N	t	t	\N	\N	\N
61	Number of families and individuals with repeated periods of homelessness	2014-04-23 16:55:29.442257	2014-04-23 16:55:29.442257	none	61	60	\N	\N	t	t	\N	\N	\N
62	input title	2014-04-23 16:55:29.447612	2014-04-23 16:55:29.447612	none	62	61	\N	\N	t	t	\N	\N	\N
63	Portion of household income spent by seniors on housing 	2014-04-23 16:55:29.452815	2014-04-23 16:55:29.452815	none	63	62	\N	\N	t	t	\N	\N	\N
64	input title	2014-04-23 16:55:29.458029	2014-04-23 16:55:29.458029	none	64	63	\N	\N	t	t	\N	\N	\N
65	Proportion of new construction accessible	2014-04-23 16:55:29.463081	2014-04-23 16:55:29.463081	none	65	64	\N	\N	t	t	\N	\N	\N
66	input title	2014-04-23 16:55:29.468229	2014-04-23 16:55:29.468229	none	66	65	\N	\N	t	t	\N	\N	\N
67	input title	2014-04-23 16:55:29.473399	2014-04-23 16:55:29.473399	none	67	66	\N	\N	t	t	\N	\N	\N
68	Number of new housing units in urban municipalities	2014-04-23 16:55:29.478589	2014-04-23 16:55:29.478589	none	68	67	\N	\N	t	t	\N	\N	\N
69	Proportion of annual housing production in 2- to-4 family homes or townhouses	2014-04-23 16:55:29.483768	2014-04-23 16:55:29.483768	none	69	68	\N	\N	t	t	\N	\N	\N
70	Proportion of urban housing created through accessory apartment creation, conversion of single-family housing ot multifamily, or adaptive reuse.	2014-04-23 16:55:29.489434	2014-04-23 16:55:29.489434	none	70	69	\N	\N	t	t	\N	\N	\N
71	Number of housing units in urban communities with more than 2 bedrooms	2014-04-23 16:55:29.49485	2014-04-23 16:55:29.49485	none	71	70	\N	\N	t	t	\N	\N	\N
72	Trends in reported Part One Crime per 1000 population	2014-04-23 16:55:29.50049	2014-04-23 16:55:29.50049	none	72	71	\N	\N	t	t	\N	\N	\N
73	Trends in reported Part Two Crime per 1000 population	2014-04-23 16:55:29.506225	2014-04-23 16:55:29.506225	none	73	72	\N	\N	t	t	\N	\N	\N
74	Property crime rates across community types.	2014-04-23 16:55:29.511533	2014-04-23 16:55:29.511533	none	74	73	\N	\N	t	t	\N	\N	\N
75	Violent crime rates across community types.	2014-04-23 16:55:29.516784	2014-04-23 16:55:29.516784	none	75	74	\N	\N	t	t	\N	\N	\N
76	Availability of neighborhood crime data updated daily	2014-04-23 16:55:29.522023	2014-04-23 16:55:29.522023	none	76	75	\N	\N	t	t	\N	\N	\N
77	Asthma hospitalization, average annual rates per 1,000 youth under 20.	2014-04-23 16:55:29.527184	2014-04-23 16:55:29.527184	none	77	76	\N	\N	t	t	\N	\N	\N
78	Ambient particulate matter concentration in urban areas	2014-04-23 16:55:29.532201	2014-04-23 16:55:29.532201	none	78	77	\N	\N	t	t	\N	\N	\N
79	Incidence of blood lead levels elevated about 20 ug/dl (per 1,000 children screened)	2014-04-23 16:55:29.537689	2014-04-23 16:55:29.537689	none	79	78	\N	\N	t	t	\N	\N	\N
80	input title	2014-04-23 16:55:29.543041	2014-04-23 16:55:29.543041	none	80	79	\N	\N	t	t	\N	\N	\N
81	Proportion of the region's households with less than 50 acres of open space per 1,000 people, at the TAZ level.	2014-04-23 16:55:29.548134	2014-04-23 16:55:29.548134	none	81	80	\N	\N	t	t	\N	\N	\N
82	input title	2014-04-23 16:55:29.554595	2014-04-23 16:55:29.554595	none	82	81	\N	\N	t	t	\N	\N	\N
83	input title	2014-04-23 16:55:29.560456	2014-04-23 16:55:29.560456	none	83	82	\N	\N	t	t	\N	\N	\N
84	input title	2014-04-23 16:55:29.566253	2014-04-23 16:55:29.566253	none	84	83	\N	\N	t	t	\N	\N	\N
85	Number of region's residents who eat the recommended number of fruits and vegetables per day	2014-04-23 16:55:29.572351	2014-04-23 16:55:29.572351	none	85	84	\N	\N	t	t	\N	\N	\N
86	Proportion of children that qualify enrolled in free school meals	2014-04-23 16:55:29.578431	2014-04-23 16:55:29.578431	none	86	85	\N	\N	t	t	\N	\N	\N
87	Nutritional quality of school meals	2014-04-23 16:55:29.584466	2014-04-23 16:55:29.584466	none	87	86	\N	\N	t	t	\N	\N	\N
88	input title	2014-04-23 16:55:29.628679	2014-04-23 16:55:29.628679	none	88	87	\N	\N	t	t	\N	\N	\N
89	Students within one mile of all schools will be able to walk by sidewalk.	2014-04-23 16:55:29.633938	2014-04-23 16:55:29.633938	none	89	88	\N	\N	t	t	\N	\N	\N
90	Proportion of adults engaging in one 30-minute session of physical activity per week	2014-04-23 16:55:29.63926	2014-04-23 16:55:29.63926	none	90	89	\N	\N	t	t	\N	\N	\N
91	Proportion of region's residents with health insurance	2014-04-23 16:55:29.644638	2014-04-23 16:55:29.644638	none	91	90	\N	\N	t	t	\N	\N	\N
92	Percent of residents who reported needing to see a doctor but who did not because of cost	2014-04-23 16:55:29.649849	2014-04-23 16:55:29.649849	none	92	91	\N	\N	t	t	\N	\N	\N
93	Number of people on waitlist for SACC (School Age Child Care) or compared with total number of subsidized children.	2014-04-23 16:55:29.655228	2014-04-23 16:55:29.655228	none	93	92	\N	\N	t	t	\N	\N	\N
94	Enrollment in Licensed and Licensed Exempt After School Programs	2014-04-23 16:55:29.660429	2014-04-23 16:55:29.660429	none	94	93	\N	\N	t	t	\N	\N	\N
95	Standardized Test Scores, 3rd and 10th Grade, Math and English	2014-04-23 16:55:29.665666	2014-04-23 16:55:29.665666	none	95	94	\N	\N	t	t	\N	\N	\N
96	Student teacher ratios at public schools	2014-04-23 16:55:29.671177	2014-04-23 16:55:29.671177	none	96	95	\N	\N	t	t	\N	\N	\N
97	Proportion of elementary and middle schools with health and physical activity in their curriculum	2014-04-23 16:55:29.676513	2014-04-23 16:55:29.676513	none	97	96	\N	\N	t	t	\N	\N	\N
98	One teacher in each public school dedicated to visual arts, music, theater, and health/physical education	2014-04-23 16:55:29.681841	2014-04-23 16:55:29.681841	none	98	97	\N	\N	t	t	\N	\N	\N
99	Percentage of working-age adults with high school diploma or equivalent	2014-04-23 16:55:29.687359	2014-04-23 16:55:29.687359	none	99	98	\N	\N	t	t	\N	\N	\N
100	Percentage of 25-34 year olds with high school diplomas or equivalent	2014-04-23 16:55:29.692551	2014-04-23 16:55:29.692551	none	100	99	\N	\N	t	t	\N	\N	\N
101	Percent of high school graduates going to 2- or 4-year college	2014-04-23 16:55:29.697707	2014-04-23 16:55:29.697707	none	101	100	\N	\N	t	t	\N	\N	\N
102	Percent of graduates from public high schools taking remedial courses  during their first year in college.	2014-04-23 16:55:29.703274	2014-04-23 16:55:29.703274	none	102	101	\N	\N	t	t	\N	\N	\N
103	Proportion of municipal revenue coming from local property taxes	2014-04-23 16:55:29.708656	2014-04-23 16:55:29.708656	none	103	102	\N	\N	t	t	\N	\N	\N
104	Share of municipal revenue from property taxes	2014-04-23 16:55:29.713837	2014-04-23 16:55:29.713837	none	104	103	\N	\N	t	t	\N	\N	\N
105	Rate of increase of per capita local revenue	2014-04-23 16:55:29.719502	2014-04-23 16:55:29.719502	none	105	104	\N	\N	t	t	\N	\N	\N
106	Number of municipality override attempts by municipal median income	2014-04-23 16:55:29.724758	2014-04-23 16:55:29.724758	none	106	105	\N	\N	t	t	\N	\N	\N
107	Regional increases in municipal fixed costs	2014-04-23 16:55:29.729907	2014-04-23 16:55:29.729907	none	107	106	\N	\N	t	t	\N	\N	\N
108	Municipal bond ratings	2014-04-23 16:55:29.735167	2014-04-23 16:55:29.735167	none	108	107	\N	\N	t	t	\N	\N	\N
109	Participation of registered voters in presidential elections	2014-04-23 16:55:29.740416	2014-04-23 16:55:29.740416	none	109	108	\N	\N	t	t	\N	\N	\N
110	Disparity in voter participation between gubernatorial and local elections	2014-04-23 16:55:29.745902	2014-04-23 16:55:29.745902	none	110	109	\N	\N	t	t	\N	\N	\N
111	Demographics of elected state officials	2014-04-23 16:55:29.751149	2014-04-23 16:55:29.751149	none	111	110	\N	\N	t	t	\N	\N	\N
112	Demographics of elected local officials	2014-04-23 16:55:29.756644	2014-04-23 16:55:29.756644	none	112	111	\N	\N	t	t	\N	\N	\N
113	Demographics of appointed municipal boards	2014-04-23 16:55:29.761854	2014-04-23 16:55:29.761854	none	113	112	\N	\N	t	t	\N	\N	\N
114	Net outmigration rate for seniors over age 65	2014-04-23 16:55:29.767207	2014-04-23 16:55:29.767207	none	114	113	\N	\N	t	t	\N	\N	\N
115	Labor force participation by seniors	2014-04-23 16:55:29.773337	2014-04-23 16:55:29.773337	none	115	114	\N	\N	t	t	\N	\N	\N
116	Total regional employment	2014-04-23 16:55:29.779276	2014-04-23 16:55:29.779276	none	116	115	\N	\N	t	t	\N	\N	\N
117	Growth of workforce, by sector	2014-04-23 16:55:29.785686	2014-04-23 16:55:29.785686	none	117	116	\N	\N	t	t	\N	\N	\N
118	Total R&D funding	2014-04-23 16:55:29.791377	2014-04-23 16:55:29.791377	none	118	117	\N	\N	t	t	\N	\N	\N
119	Ranking of metropolitan areas by patents per 10,000 businesses	2014-04-23 16:55:29.796626	2014-04-23 16:55:29.796626	none	119	118	\N	\N	t	t	\N	\N	\N
120	Share of clean energy and green technology jobs in Metro Boston region	2014-04-23 16:55:29.801879	2014-04-23 16:55:29.801879	none	120	119	\N	\N	t	t	\N	\N	\N
121	Employment by business size	2014-04-23 16:55:29.807345	2014-04-23 16:55:29.807345	none	121	120	\N	\N	t	t	\N	\N	\N
122	Proportion of projects in priority areas permitted within 180 days	2014-04-23 16:55:29.812395	2014-04-23 16:55:29.812395	none	122	121	\N	\N	t	t	\N	\N	\N
124	Number of workers in the labor force with a 2- to 4-year college degree	2014-04-23 16:55:29.823147	2014-04-23 16:55:29.823147	none	124	123	\N	\N	t	t	\N	\N	\N
125	Outmigration rate of adults 30-55	2014-04-23 16:55:29.828331	2014-04-23 16:55:29.828331	none	125	124	\N	\N	t	t	\N	\N	\N
126	Proportion of working-age Blacks and Hispanics with a 2- or 4-year college degree	2014-04-23 16:55:29.833466	2014-04-23 16:55:29.833466	none	126	125	\N	\N	t	t	\N	\N	\N
127	Gap in secondary attainment between Blacks and Hispanics versus Whites	2014-04-23 16:55:29.838897	2014-04-23 16:55:29.838897	none	127	126	\N	\N	t	t	\N	\N	\N
128	Labor force participation rates for Blacks and Hispanics by education level	2014-04-23 16:55:29.844213	2014-04-23 16:55:29.844213	none	128	127	\N	\N	t	t	\N	\N	\N
129	Proportion of families and individuals living below the poverty line	2014-04-23 16:55:29.849684	2014-04-23 16:55:29.849684	none	129	128	\N	\N	t	t	\N	\N	\N
130	Income disparities between top and bottom quintile of the population	2014-04-23 16:55:29.854917	2014-04-23 16:55:29.854917	none	130	129	\N	\N	t	t	\N	\N	\N
131	Amount of corporate charitable contributions compared to inflation or Gross Regional Product	2014-04-23 16:55:29.859959	2014-04-23 16:55:29.859959	none	131	130	\N	\N	t	t	\N	\N	\N
132	Amount of agricultural land and amount of harvested cropland in the region	2014-04-23 16:55:29.864934	2014-04-23 16:55:29.864934	none	132	131	\N	\N	t	t	\N	\N	\N
133	Total market value of agricultural products sold by region's farms	2014-04-23 16:55:29.870311	2014-04-23 16:55:29.870311	none	133	132	\N	\N	t	t	\N	\N	\N
134	Dollar value of local foods purchased by schools, state institutions, restaurants, and health care facilities	2014-04-23 16:55:29.875362	2014-04-23 16:55:29.875362	none	134	133	\N	\N	t	t	\N	\N	\N
135	Number of farms certified organic; share of regional agriculutral sales certified organic	2014-04-23 16:55:29.880534	2014-04-23 16:55:29.880534	none	135	134	\N	\N	t	t	\N	\N	\N
136	Number of restrictions on shellfish beds due to health concerns	2014-04-23 16:55:29.923528	2014-04-23 16:55:29.923528	none	136	135	\N	\N	t	t	\N	\N	\N
137	Economic impact of Creative Cluster industries	2014-04-23 16:55:29.928808	2014-04-23 16:55:29.928808	none	137	136	\N	\N	t	t	\N	\N	\N
138	Number of TAZs with density of 15 persons per developed acre served by fixed-route transit	2014-04-23 16:55:29.93398	2014-04-23 16:55:29.93398	none	138	137	\N	\N	t	t	\N	\N	\N
139	Regional mode share of public transit	2014-04-23 16:55:29.939291	2014-04-23 16:55:29.939291	none	139	138	\N	\N	t	t	\N	\N	\N
140	Number of people who take transit to work	2014-04-23 16:55:29.944363	2014-04-23 16:55:29.944363	none	140	139	\N	\N	t	t	\N	\N	\N
141	Number of daily transit trips	2014-04-23 16:55:29.949826	2014-04-23 16:55:29.949826	none	141	140	\N	\N	t	t	\N	\N	\N
142	Proportion of workers with an auto commute more than 30 minutes	2014-04-23 16:55:29.955279	2014-04-23 16:55:29.955279	none	142	141	\N	\N	t	t	\N	\N	\N
143	Proportion of people walking or biking to work	2014-04-23 16:55:29.960425	2014-04-23 16:55:29.960425	none	143	142	\N	\N	t	t	\N	\N	\N
144	Proportion of commuters who carpool	2014-04-23 16:55:29.965543	2014-04-23 16:55:29.965543	none	144	143	\N	\N	t	t	\N	\N	\N
145	Number of jobs within one hour via transit for region's residents	2014-04-23 16:55:29.971015	2014-04-23 16:55:29.971015	none	145	144	\N	\N	t	t	\N	\N	\N
146	Proportion of workers who telecommute	2014-04-23 16:55:29.976349	2014-04-23 16:55:29.976349	none	146	145	\N	\N	t	t	\N	\N	\N
147	Total annual delay per person	2014-04-23 16:55:29.981771	2014-04-23 16:55:29.981771	none	147	146	\N	\N	t	t	\N	\N	\N
148	Proportion of all trips made on foot or by bicycle	2014-04-23 16:55:29.988228	2014-04-23 16:55:29.988228	none	148	147	\N	\N	t	t	\N	\N	\N
149	Proportion of streets and roads with sidewalks on at least one side of the road	2014-04-23 16:55:29.994593	2014-04-23 16:55:29.994593	none	149	148	\N	\N	t	t	\N	\N	\N
150	Length of new off road multi-use paths	2014-04-23 16:55:29.999882	2014-04-23 16:55:29.999882	none	150	149	\N	\N	t	t	\N	\N	\N
151	Rate per bicyclist mile of auto-bike crashes that result in death and bodily harm	2014-04-23 16:55:30.00521	2014-04-23 16:55:30.00521	none	151	150	\N	\N	t	t	\N	\N	\N
152	Rate per pedestrian mile of auto-pedestrian crashes that result in death or bodily harm	2014-04-23 16:55:30.010298	2014-04-23 16:55:30.010298	none	152	151	\N	\N	t	t	\N	\N	\N
153	Per-capita vehicle miles traveled by automobiles registered in the region	2014-04-23 16:55:30.015446	2014-04-23 16:55:30.015446	none	153	152	\N	\N	t	t	\N	\N	\N
154	Number of cars per resident	2014-04-23 16:55:30.021589	2014-04-23 16:55:30.021589	none	154	153	\N	\N	t	t	\N	\N	\N
155	Proportion of region's households, by income levels, that have no car	2014-04-23 16:55:30.027573	2014-04-23 16:55:30.027573	none	155	154	\N	\N	t	t	\N	\N	\N
156	Traffic congestion (measured as roadway volume/capacity)  in suburban municipalities	2014-04-23 16:55:30.033064	2014-04-23 16:55:30.033064	none	156	155	\N	\N	t	t	\N	\N	\N
157	Handicapped accessibility of transit stations and vehicles	2014-04-23 16:55:30.038544	2014-04-23 16:55:30.038544	none	157	156	\N	\N	t	t	\N	\N	\N
158	input title	2014-04-23 16:55:30.043929	2014-04-23 16:55:30.043929	none	158	157	\N	\N	t	t	\N	\N	\N
159	Resources spent on transportation projects by land use rating	2014-04-23 16:55:30.049192	2014-04-23 16:55:30.049192	none	159	158	\N	\N	t	t	\N	\N	\N
160	Comprehensive corridor planning for transportation projects over $50 million	2014-04-23 16:55:30.054765	2014-04-23 16:55:30.054765	none	160	159	\N	\N	t	t	\N	\N	\N
161	Proportion of total transportaiton budget spent on community-based transit	2014-04-23 16:55:30.060286	2014-04-23 16:55:30.060286	none	161	160	\N	\N	t	t	\N	\N	\N
162	Proportion of total transportation budget spent on sidewalks, bike paths, rail trails, and transportation demand management	2014-04-23 16:55:30.065391	2014-04-23 16:55:30.065391	none	162	161	\N	\N	t	t	\N	\N	\N
163	Funding for transit network expansion; funding for roadway expansion projects	2014-04-23 16:55:30.070667	2014-04-23 16:55:30.070667	none	163	162	\N	\N	t	t	\N	\N	\N
164	Proportion of maintenance targets completed each year	2014-04-23 16:55:30.075955	2014-04-23 16:55:30.075955	none	164	163	\N	\N	t	t	\N	\N	\N
165	Proportion of roadway maintenance and transit maintence funding allocated according to a comprehensive transportation asset management system	2014-04-23 16:55:30.081258	2014-04-23 16:55:30.081258	none	165	164	\N	\N	t	t	\N	\N	\N
166	Amount of MBTA debt service	2014-04-23 16:55:30.086545	2014-04-23 16:55:30.086545	none	166	165	\N	\N	t	t	\N	\N	\N
167	Proportion of transportation funding from user fees and value capture costs	2014-04-23 16:55:30.091655	2014-04-23 16:55:30.091655	none	167	166	\N	\N	t	t	\N	\N	\N
168	Proportion of transportation infrastructure completed on time and within budget	2014-04-23 16:55:30.096671	2014-04-23 16:55:30.096671	none	168	167	\N	\N	t	t	\N	\N	\N
169	Proportion of state-maintained roads in good repair	2014-04-23 16:55:30.102014	2014-04-23 16:55:30.102014	none	169	168	\N	\N	t	t	\N	\N	\N
170	Proportion of auto crashes cleared from roadway within 90 minutes	2014-04-23 16:55:30.10728	2014-04-23 16:55:30.10728	none	170	169	\N	\N	t	t	\N	\N	\N
171	Number of structurally deficient bridges	2014-04-23 16:55:30.112455	2014-04-23 16:55:30.112455	none	171	170	\N	\N	t	t	\N	\N	\N
172	Pavement management systems in all municipalities	2014-04-23 16:55:30.117626	2014-04-23 16:55:30.117626	none	172	171	\N	\N	t	t	\N	\N	\N
173	Proportion of region's freight traveling by rail	2014-04-23 16:55:30.122827	2014-04-23 16:55:30.122827	none	173	172	\N	\N	t	t	\N	\N	\N
174	Connection of the Port of Boston to regional rail network	2014-04-23 16:55:30.128317	2014-04-23 16:55:30.128317	none	174	173	\N	\N	t	t	\N	\N	\N
175	Greenhouse gas emissions related to commercial, industrial, residential, and transportation uses	2014-04-23 16:55:30.133874	2014-04-23 16:55:30.133874	none	175	174	\N	\N	t	t	\N	\N	\N
176	Greenhouse gas emissions from transportation	2014-04-23 16:55:30.139258	2014-04-23 16:55:30.139258	none	176	175	\N	\N	t	t	\N	\N	\N
177	Greenhouse gas emissions resulting from electric power demand	2014-04-23 16:55:30.144599	2014-04-23 16:55:30.144599	none	177	176	\N	\N	t	t	\N	\N	\N
178	Participation in climate protection campaign or equivalent	2014-04-23 16:55:30.149912	2014-04-23 16:55:30.149912	none	178	177	\N	\N	t	t	\N	\N	\N
179	Regionwide average annual energy demand for heating, cooling, lighting, and appliances	2014-04-23 16:55:30.155113	2014-04-23 16:55:30.155113	none	179	178	\N	\N	t	t	\N	\N	\N
180	Energy demand for passenger transportation	2014-04-23 16:55:30.160165	2014-04-23 16:55:30.160165	none	180	179	\N	\N	t	t	\N	\N	\N
181	Per-capita energy demand in the residential sector	2014-04-23 16:55:30.165294	2014-04-23 16:55:30.165294	none	181	180	\N	\N	t	t	\N	\N	\N
182	Fuel profile, non-emergency municipal and state vehicles	2014-04-23 16:55:30.170651	2014-04-23 16:55:30.170651	none	182	181	\N	\N	t	t	\N	\N	\N
183	Regional solid waste production	2014-04-23 16:55:30.214865	2014-04-23 16:55:30.214865	none	183	182	\N	\N	t	t	\N	\N	\N
184	Proportion of solid waste recycled or composted, by municipality	2014-04-23 16:55:30.220349	2014-04-23 16:55:30.220349	none	184	183	\N	\N	t	t	\N	\N	\N
185	Amount of electrcity purchased by region, by source	2014-04-23 16:55:30.225764	2014-04-23 16:55:30.225764	none	185	184	\N	\N	t	t	\N	\N	\N
186	Clean energy capacity in region	2014-04-23 16:55:30.231	2014-04-23 16:55:30.231	none	186	185	\N	\N	t	t	\N	\N	\N
187	Regional ozone levels	2014-04-23 16:55:30.236538	2014-04-23 16:55:30.236538	none	187	186	\N	\N	t	t	\N	\N	\N
188	Distance between sensitive land uses and major transporation facilities	2014-04-23 16:55:30.242065	2014-04-23 16:55:30.242065	none	188	187	\N	\N	t	t	\N	\N	\N
189	Annual ambient air quality across region	2014-04-23 16:55:30.247933	2014-04-23 16:55:30.247933	none	189	188	\N	\N	t	t	\N	\N	\N
190	Public water systems demand	2014-04-23 16:55:30.253374	2014-04-23 16:55:30.253374	none	190	189	\N	\N	t	t	\N	\N	\N
191	Per capita residential water consumption (per capita)	2014-04-23 16:55:30.258939	2014-04-23 16:55:30.258939	none	191	190	\N	\N	t	t	\N	\N	\N
192	Average water demand for new residential development	2014-04-23 16:55:30.264289	2014-04-23 16:55:30.264289	none	192	191	\N	\N	t	t	\N	\N	\N
193	Peak month water demand compared to average annual demand	2014-04-23 16:55:30.269953	2014-04-23 16:55:30.269953	none	193	192	\N	\N	t	t	\N	\N	\N
194	Proportion of water unaccounted for for regional public water supplied	2014-04-23 16:55:30.275261	2014-04-23 16:55:30.275261	none	194	193	\N	\N	t	t	\N	\N	\N
195	Volume of interbasin transfers between basins by type	2014-04-23 16:55:30.280612	2014-04-23 16:55:30.280612	none	195	194	\N	\N	t	t	\N	\N	\N
196	Water body impairment	2014-04-23 16:55:30.286187	2014-04-23 16:55:30.286187	none	196	195	\N	\N	t	t	\N	\N	\N
197	Number of combined sewer outfall points	2014-04-23 16:55:30.2916	2014-04-23 16:55:30.2916	none	197	196	\N	\N	t	t	\N	\N	\N
198	Stream flow levels	2014-04-23 16:55:30.296996	2014-04-23 16:55:30.296996	none	198	197	\N	\N	t	t	\N	\N	\N
199	Number of violations of safe swimming standards	2014-04-23 16:55:30.302375	2014-04-23 16:55:30.302375	none	199	198	\N	\N	t	t	\N	\N	\N
200	Acres of impervious surface	2014-04-23 16:55:30.307569	2014-04-23 16:55:30.307569	none	200	199	\N	\N	t	t	\N	\N	\N
201	Acreage of wetlands in region	2014-04-23 16:55:30.31266	2014-04-23 16:55:30.31266	none	201	200	\N	\N	t	t	\N	\N	\N
202	Acres of undeveloped land of Critical Environmental Concern	2014-04-23 16:55:30.317837	2014-04-23 16:55:30.317837	none	202	201	\N	\N	t	t	\N	\N	\N
203	Size of core habitat for rare and endangered species	2014-04-23 16:55:30.323198	2014-04-23 16:55:30.323198	none	203	202	\N	\N	t	t	\N	\N	\N
204	Acres of developable land permanently protected from development	2014-04-23 16:55:30.328398	2014-04-23 16:55:30.328398	none	204	203	\N	\N	t	t	\N	\N	\N
205	Farmland loss to development	2014-04-23 16:55:30.333669	2014-04-23 16:55:30.333669	none	205	204	\N	\N	t	t	\N	\N	\N
206	Gap in secondary attainment between Blacks and Whites	2014-04-23 16:55:30.339167	2014-04-23 16:55:30.339167	none	206	\N	\N	\N	t	t	\N	\N	\N
207	College Degree Attainment	2014-04-23 16:55:30.344451	2014-04-23 16:55:30.344451	none	207	\N	\N	\N	t	t	\N	\N	\N
208	Gap in secondary attainment between Regional Urban Centers and the Regional Average	2014-04-23 16:55:30.349622	2014-04-23 16:55:30.349622	none	208	\N	\N	\N	t	t	\N	\N	\N
209	Gap in secondary attainment between Hispanics and Whites	2014-04-23 16:55:30.35498	2014-04-23 16:55:30.35498	none	209	\N	\N	\N	t	t	\N	\N	\N
210	High School Diplomas	2014-04-23 16:55:30.360344	2014-04-23 16:55:30.360344	none	210	\N	\N	\N	t	t	\N	\N	\N
218	Debt-to-degree ratio for all Metro Boston undergraduate institutions	2014-04-23 16:55:30.402205	2014-05-23 00:18:11.350134	dollars	218	\N	1	14300.0	f	f	9	0	0
252	Gini Index Value	2014-04-23 16:55:30.626194	2014-05-23 00:44:14.173578	\N	252	\N	2	0.0	f	f	\N	0	6
228	Participation Gap, No High School Diploma to College Degree	2014-04-23 16:55:30.458616	2014-05-23 00:44:13.281463	percentage points	228	\N	3	1.0	f	f	11	-4	0
219	Debt-to-degree ratio for four-year public Metro Boston undergraduate institutions	2014-04-23 16:55:30.407704	2014-05-23 00:44:12.879719	dollars	219	\N	1	14300.0	f	f	9	8700	0
220	Total resident labor force	2014-04-23 16:55:30.413014	2014-05-23 00:44:12.920105	workers	220	\N	3	2510000.0	t	t	\N	100000	0
230	Participation Gap, Core to regional average	2014-04-23 16:55:30.46918	2014-05-23 00:44:13.402752	percentage points	230	\N	3	1.0	f	f	11	-3	0
257	Gap in median income between single fathers and married couples with children	2014-04-23 16:55:30.652922	2014-05-23 00:18:17.939106	dollars	257	\N	2	2.0	f	f	22	0	0
234	Unemployment Gap, No High School Diploma to College Degree	2014-04-23 16:55:30.530145	2014-05-23 00:44:13.558214	percentage points	234	\N	3	1.0	f	f	12	2	0
222	Number of workers with a less-than-high-school education	2014-04-23 16:55:30.423818	2014-05-23 00:44:13.002841	workers	222	\N	3	\N	\N	\N	10	-13000	17
221	Labor force participation rate, population 25–64	2014-04-23 16:55:30.41841	2014-05-23 00:44:12.962495	percent	221	\N	3	80.0	t	t	\N	-1	3
223	Number of workers with a high school education	2014-04-23 16:55:30.428794	2014-05-23 00:44:13.041325	workers	223	\N	3	\N	\N	\N	10	16000	2
224	Number of workers with some college education	2014-04-23 16:55:30.433935	2014-05-23 00:44:13.128334	workers	224	\N	3	500000.0	t	t	10	9000	3
225	Number of workers with a college education or higher	2014-04-23 16:55:30.440405	2014-05-23 00:44:13.167503	workers	225	\N	3	1100000.0	t	t	10	51000	2
226	Participation Gap, Black to White	2014-04-23 16:55:30.446297	2014-05-23 00:44:13.207082	percentage points	226	\N	3	1.0	f	f	11	-9	21
227	Participation Gap, Latino to White	2014-04-23 16:55:30.451729	2014-05-23 00:44:13.24663	percentage points	227	\N	3	1.0	f	f	11	-10	3
231	Unemployment rate for all workers age 16 and over	2014-04-23 16:55:30.514134	2014-05-23 00:44:13.441733	percent	231	\N	3	5.0	f	f	\N	4	0
236	Labor underutilization rate (U-6), Massachusetts	2014-04-23 16:55:30.541182	2014-05-23 00:44:13.67612	percent	236	\N	3	8.0	f	f	13	4	0
232	Unemployment Gap, Black to White	2014-04-23 16:55:30.51973	2014-05-23 00:44:13.487283	percentage points	232	\N	3	1.0	f	f	12	2	14
233	Unemployment Gap, Latino to White	2014-04-23 16:55:30.52493	2014-05-23 00:44:13.52449	percentage points	233	\N	3	1.0	f	f	12	-1	2
251	Ratio of income for the richest fifth of the population compared to the income of the poorest fifth	2014-04-23 16:55:30.621015	2014-05-23 00:44:14.129068	percent	251	\N	2	10.0	f	f	\N	3	0
243	Labor force participation gap between Latino and White youth ages 16-24	2014-04-23 16:55:30.578099	2014-05-23 00:44:13.865578	percentage points	243	\N	3	1.0	f	f	15	-9	8
245	Unemployment gap between Black and White youth ages 16-24	2014-04-23 16:55:30.58887	2014-05-23 00:44:13.981288	percentage points	245	\N	3	1.0	f	f	15	2	21
246	Unemployment gap between Latino and White youth ages 16-24	2014-04-23 16:55:30.594175	2014-05-23 00:44:14.021229	percentage points	246	\N	3	1.0	f	f	15	1	1
253	Median Family Income, all family types	2014-04-23 16:55:30.631344	2014-05-23 00:44:14.260659	2012 dollars	253	\N	2	77500.0	t	t	21	3488	3
254	Median Household Income for Married Couples with Children	2014-04-23 16:55:30.636986	2014-05-23 00:44:14.29903	2012 dollars	254	\N	2	77500.0	t	t	21	7720	2
255	Median Household Income for Single Fathers	2014-04-23 16:55:30.642343	2014-05-23 00:44:14.340739	2012 dollars	255	\N	2	67900.0	t	t	21	511	2
256	Median Household Income for Single Mothers	2014-04-23 16:55:30.647462	2014-05-23 00:44:14.379997	2012 dollars	256	\N	2	67900.0	t	t	21	-3212	7
235	Unemployment Gap, Regional Urban Center to regional average	2014-04-23 16:55:30.53561	2014-05-23 00:18:14.654292	percentage points	235	\N	3	1.0	f	f	12	0	0
238	Gap between total employment and number of workers in the labor force, low skill workers	2014-04-23 16:55:30.55164	2014-05-23 00:18:15.333181	more jobs than qualified workers	238	\N	3	3000.0	f	f	14	0	0
239	Gap between total employment and number of workers in the labor force, mid skill workers	2014-04-23 16:55:30.557201	2014-05-23 00:18:15.436952	more jobs than qualified workers	239	\N	3	3000.0	f	f	14	0	0
240	Gap between total employment and number of workers in the labor force, high skill workers	2014-04-23 16:55:30.562483	2014-05-23 00:18:15.525897	more jobs than qualified workers	240	\N	3	3000.0	f	f	14	0	0
241	Labor force participation among youth ages 16-24	2014-04-23 16:55:30.567682	2014-05-23 00:18:15.612605	percent	241	\N	3	60.0	t	t	15	0	0
244	Unemployment among youth ages 16-24	2014-04-23 16:55:30.583333	2014-05-23 00:18:16.242746	percent	244	\N	3	10.0	f	f	15	0	0
247	Youth ages 16-24 not in education, employment or training (NEET)	2014-04-23 16:55:30.599372	2014-05-23 00:18:16.693182	percent	247	\N	3	1.0	f	f	15	0	0
248	Share of inmigrants ages 25-64, relative to share of outmigrants	2014-04-23 16:55:30.605029	2014-05-23 00:18:16.781422	percentage point	248	\N	3	0.0	t	t	16	0	0
250	Share of Massachusetts-born inmigrants ages 45-64 with a college degree, relative to share of outmigrants	2014-04-23 16:55:30.615454	2014-05-23 00:18:16.938892	percentage point	250	\N	3	0.0	t	t	16	0	0
258	Gap in median income between single mothers and married couples with children	2014-04-23 16:55:30.65829	2014-05-23 00:18:17.988759	dollars	258	\N	2	2.0	f	f	22	0	0
259	Gap in median family income, Black to White	2014-04-23 16:55:30.663534	2014-05-23 00:18:18.055056	dollars	259	\N	2	0.0	f	f	22	0	0
260	Gap in median family income, Latino to White	2014-04-23 16:55:30.668928	2014-05-23 00:18:18.201065	dollars	260	\N	2	0.0	f	f	22	0	0
261	Gap in median family income, Asian to White	2014-04-23 16:55:30.674169	2014-05-23 00:18:18.237526	dollars	261	\N	2	0.0	f	f	22	0	0
212	College attainment gap for Hispanic or Latino compared to White working age adults	2014-04-23 16:55:30.370714	2014-05-23 00:44:12.56662	percentage points	212	\N	1	1.0	f	f	7	3	7
263	Share of households in poverty	2014-04-23 16:55:30.685671	2014-05-23 00:44:14.568798	percent	263	\N	2	0.0	f	f	\N	2	20
262	Massachusetts' ratio of taxes paid to family income, rich (top 1%) to poor (lowest 20%)	2014-04-23 16:55:30.679531	2014-05-23 00:18:18.266133	\N	262	\N	2	1.0	f	f	\N	0	0
\.


--
-- Name: indicators_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('indicators_id_seq', 1, false);


--
-- Data for Name: indicators_issue_areas; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY indicators_issue_areas (id, indicator_id, issue_area_id) FROM stdin;
1282	123	4
1283	123	5
1284	211	4
1285	211	5
1286	212	4
1287	212	5
1288	213	4
1289	213	5
1290	214	4
1291	214	5
1292	215	4
1293	215	5
1294	216	4
1295	216	5
1296	217	4
1297	217	5
1298	218	4
1299	218	5
1300	219	4
1301	219	5
1302	220	4
1303	221	4
1304	222	5
1305	222	4
1306	222	14
1307	223	5
1308	223	4
1309	223	14
1310	224	5
1311	224	4
1312	224	14
1313	225	5
1314	225	4
1315	225	14
1316	226	5
1317	226	4
1318	226	14
1319	227	5
1320	227	4
1321	227	14
1322	228	5
1323	228	4
1324	228	14
1325	229	5
1326	229	4
1327	229	14
1328	230	5
1329	230	4
1330	230	14
1331	231	4
1332	232	4
1333	233	4
1334	234	4
1335	235	4
1336	236	4
1337	237	4
1338	238	4
1339	239	4
1340	240	4
1341	241	5
1342	241	4
1343	241	14
1344	242	5
1345	242	4
1346	242	14
1347	243	5
1348	243	4
1349	243	14
1350	244	5
1351	244	4
1352	244	14
1353	245	5
1354	245	4
1355	245	14
1356	246	5
1357	246	4
1358	246	14
1359	247	5
1360	247	4
1361	247	14
1362	248	5
1363	248	4
1364	248	14
1365	249	5
1366	249	4
1367	249	14
1368	250	5
1369	250	4
1370	250	14
1371	251	4
1372	251	14
1373	252	4
1374	252	14
1375	253	4
1376	253	14
1377	254	4
1378	254	14
1379	255	4
1380	255	14
1381	256	4
1382	256	14
1383	257	4
1384	257	14
1385	258	4
1386	258	14
1387	259	4
1388	259	14
1389	260	4
1390	260	14
1391	261	4
1392	261	14
1393	262	4
1394	262	14
1395	263	4
1396	263	14
1397	264	4
1398	264	14
1399	265	4
1400	265	14
1401	266	4
1402	266	14
1403	267	4
1404	267	14
1405	268	4
1406	268	14
1407	269	4
1408	269	14
1409	270	4
1410	270	14
1411	272	4
1412	272	11
1413	273	4
1414	273	11
1415	274	4
1416	274	11
1417	275	4
1418	275	11
1419	276	4
1420	276	6
1421	276	11
1422	277	4
1423	277	6
1424	277	11
1425	278	4
1426	278	6
1427	278	11
1428	279	4
1429	279	2
1430	280	4
1431	281	4
1432	282	4
1433	283	4
1434	284	4
1435	285	4
1436	286	4
1437	287	4
1438	288	4
1439	289	4
1440	290	4
1441	291	4
1442	292	4
1443	293	4
1444	294	4
1445	295	4
1446	296	4
1447	297	4
1448	298	4
1449	299	4
1450	300	4
1451	301	4
1452	302	4
1453	303	4
1454	304	4
1455	305	4
1456	306	4
1457	307	4
1458	308	4
1459	309	4
1460	310	4
1461	311	4
1462	312	4
1463	313	4
1464	314	4
1465	315	4
1466	316	4
1467	317	4
1468	318	4
1469	319	4
\.


--
-- Name: indicators_issue_areas_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('indicators_issue_areas_id_seq', 1469, true);


--
-- Data for Name: issue_areas; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY issue_areas (id, title, created_at, updated_at, datacommon_url, sort_order) FROM stdin;
1	Demographics	2014-04-23 16:55:30.721704	2014-04-23 16:55:30.721704	http://metrobostondatacommon.org/explore/gallery/?topics=1	12
2	Arts & Culture	2014-04-23 16:55:30.724345	2014-04-23 16:55:30.724345	http://metrobostondatacommon.org/explore/gallery/?topics=2	5
3	Civic Vitality & Governance	2014-04-23 16:55:30.725874	2014-04-23 16:55:30.725874	http://metrobostondatacommon.org/explore/gallery/?topics=3	9
4	Economy	2014-04-23 16:55:30.727143	2014-04-23 16:55:30.727143	http://metrobostondatacommon.org/explore/gallery/?topics=4	8
5	Education	2014-04-23 16:55:30.728244	2014-04-23 16:55:30.728244	http://metrobostondatacommon.org/explore/gallery/?topics=5	10
6	Environment & Energy	2014-04-23 16:55:30.729282	2014-04-23 16:55:30.729282	http://metrobostondatacommon.org/explore/gallery/?topics=6	7
7	Housing	2014-04-23 16:55:30.730343	2014-04-23 16:55:30.730343	http://metrobostondatacommon.org/explore/gallery/?topics=7	4
8	Land Use & Zoning	2014-04-23 16:55:30.731362	2014-04-23 16:55:30.731362	http://metrobostondatacommon.org/explore/gallery/?topics=8	6
9	Public Health	2014-04-23 16:55:30.732551	2014-04-23 16:55:30.732551	http://metrobostondatacommon.org/explore/gallery/?topics=9	2
10	Public Safety	2014-04-23 16:55:30.733595	2014-04-23 16:55:30.733595	http://metrobostondatacommon.org/explore/gallery/?topics=10	1
11	Technology	2014-04-23 16:55:30.734664	2014-04-23 16:55:30.734664	http://metrobostondatacommon.org/explore/gallery/?topics=11	11
12	Transportation	2014-04-23 16:55:30.73576	2014-04-23 16:55:30.73576	http://metrobostondatacommon.org/explore/gallery/?topics=12	3
13	Geographic Boundaries	2014-04-23 16:55:30.736788	2014-04-23 16:55:30.736788	http://metrobostondatacommon.org/explore/gallery/?topics=13	\N
14	Equity	2014-04-23 16:55:30.737788	2014-04-23 16:55:30.737788	http://metrobostondatacommon.org/explore/gallery/?topics=9999	\N
\.


--
-- Name: issue_areas_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('issue_areas_id_seq', 14, true);


--
-- Data for Name: objectives; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY objectives (id, title, goal_id, created_at, updated_at, number) FROM stdin;
39	By 2030, there will be 17,500 new suburban single-family homes less than  1,700 square feet and/or on lots 1/4 of an acre or smaller.	13	2014-04-23 16:55:25.137268	2014-05-09 00:05:41.043758	1
80	No more than 20% of the region's households will have limited access to open space (<50 acres per 1,000 people, at the TAZ level)	23	2014-04-23 16:55:25.228771	2014-05-09 00:05:41.112891	1
87	All pubic school students will have physical education classes at least once per week.	25	2014-04-23 16:55:25.237066	2014-05-09 00:05:41.126706	1
89	An increasing proportion of adults will have at least one 30-minute session of physical activity per week, across all Community Types.	25	2014-04-23 16:55:25.239358	2014-05-09 00:05:41.130238	3
127	Labor force participation rates for Blacks and Hispanics will increase by at least 4% overall (from 67% to at least 71%), with the largest gains in cohorts without a high school diploma (from 59% to at least 67%)	39	2014-04-23 16:55:25.284441	2014-05-09 00:05:41.197284	1
133	The dollar value of local foods purchased by schools, state institutions, restaurants and health care facilities will increase steadliy.	42	2014-04-23 16:55:25.291228	2014-05-09 00:05:41.207728	3
158	No Federal Aid and Non-Federal Aid resources will be allocated to transportation projects with a land use rating that is in the bottom third of the MPO Universe of Projects.	51	2014-04-23 16:55:25.318926	2014-05-09 00:05:41.252151	1
14	70% of new commercial and industrial development (measured in number of jobs created) will be within 1 mile of fixed-route transit service	5	2014-04-23 16:55:25.10693	2014-05-09 00:05:41.002835	2
15	75% of new development within 1/2 mile of rapid transit will be at densities of at least 50 people/jobs per developed acre	5	2014-04-23 16:55:25.1082	2014-05-09 00:05:41.004402	3
16	100% of the region's municipalities will have design guidelines or form-based codes	6	2014-04-23 16:55:25.109317	2014-05-09 00:05:41.005892	1
20	The acreage of land in commercial uses will grow only 7% regionwide	7	2014-04-23 16:55:25.113819	2014-05-09 00:05:41.012122	2
21	Small, locally owned businesses will capture an increasing share of the region's retail and service spending	7	2014-04-23 16:55:25.114949	2014-05-09 00:05:41.013927	3
22	Every municipality will have a historic resources preservation plan	8	2014-04-23 16:55:25.116328	2014-05-09 00:05:41.016945	1
23	There will be no loss of significant historic resources	8	2014-04-23 16:55:25.118295	2014-05-09 00:05:41.01895	2
24	No more then 48,000 acres of open space will be lost to development by 2030	9	2014-04-23 16:55:25.119711	2014-05-09 00:05:41.020522	1
27	100% of municipalities will have a master plan that has been created or updated in the past five years and is consistent with the regional plan.	10	2014-04-23 16:55:25.123146	2014-05-09 00:05:41.025266	1
28	100% of municipalities will have zoning consistent with the local master plan.	10	2014-04-23 16:55:25.124257	2014-05-09 00:05:41.026774	2
29	Disparity between actual development patterns and the MetroFuture land use plan will steadily decrease over time by most measures	10	2014-04-23 16:55:25.125335	2014-05-09 00:05:41.028299	3
30	Regionwide, "as of right" development potential (in terms of housing units and commercial/industrial square footage) in designated growth areas will be equal to or greater than the regional plan's forecasts for those areas.	10	2014-04-23 16:55:25.126432	2014-05-09 00:05:41.029845	4
31	All municipalities will have up-to date Pre-Disaster Mitigation Plans	11	2014-04-23 16:55:25.127545	2014-05-09 00:05:41.031451	1
32	All municipalities will be fully implementing their Pre-Disaster Mitigation plans	11	2014-04-23 16:55:25.128615	2014-05-09 00:05:41.033179	2
33	The region will have no structurally deficient dams	11	2014-04-23 16:55:25.129701	2014-05-09 00:05:41.034693	3
34	The region will have limited new growth in flood zones	11	2014-04-23 16:55:25.130788	2014-05-09 00:05:41.036127	4
35	The region will have an increasing number of inter-municipal planning efforts such as regional open space, economic development, public safety, or housing plans.	12	2014-04-23 16:55:25.131926	2014-05-09 00:05:41.037612	1
36	The inflation-adjusted dollar value of goods and services purchased through joint procurement will steadily increase.	12	2014-04-23 16:55:25.13308	2014-05-09 00:05:41.039058	2
37	There will be 100% participation of the region's municipalities in MAPC subregions.	12	2014-04-23 16:55:25.134403	2014-05-09 00:05:41.04049	3
38	An increasing proportion of local tax revenues will be share through regional tax sharing.	12	2014-04-23 16:55:25.135859	2014-05-09 00:05:41.042236	4
1	The Inner Core will capture 35% of the region's population growth and 41% of the region's employment growth.	1	2014-04-23 16:55:25.090067	2014-05-09 00:05:40.822346	1
2	Regional Urban Centers will capture 26% of the region's population growth and 14% of the region's employment growth.	1	2014-04-23 16:55:25.092399	2014-05-09 00:05:40.967824	2
3	Maturing Suburbs will capture 24% of the region's population growth and 29% of the region's employment growth.	1	2014-04-23 16:55:25.093669	2014-05-09 00:05:40.980227	3
4	Developing Suburbs will capture 16% of the region's population growth and 16% of the region's employment growth.	1	2014-04-23 16:55:25.094795	2014-05-09 00:05:40.983654	4
5	60% of new commercial and industrial development in the region (measured in terms of jobs created) will occur on land that is already developed.	2	2014-04-23 16:55:25.095918	2014-05-09 00:05:40.986261	1
6	61% of new residential development in the region (measured in terms of housing units) will occur on land that is already developed.	2	2014-04-23 16:55:25.097022	2014-05-09 00:05:40.988289	2
7	All existing 21E or Superfund sites will be remediated and reused by 2020	3	2014-04-23 16:55:25.098145	2014-05-09 00:05:40.990156	1
8	All new 21E or Superfund sites will be remediated within 10 years.	3	2014-04-23 16:55:25.099507	2014-05-09 00:05:40.992109	2
9	67% of housing unit growth in Maturing Suburbs will be concentrated near town/village centers or commercial districts.	4	2014-04-23 16:55:25.100697	2014-05-09 00:05:40.994072	1
10	47% of housing unit growth in Developing Suburbs will be concentrated near town/village centers or commercial districts	4	2014-04-23 16:55:25.10186	2014-05-09 00:05:40.996144	2
11	64% of new Suburban job growth would occur near existing employment centers.	4	2014-04-23 16:55:25.103117	2014-05-09 00:05:40.99791	3
12	25% of Suburban housing units and 6% of Suburban jobs will be in mixed-use developments.	4	2014-04-23 16:55:25.104235	2014-05-09 00:05:40.999651	4
13	66% of new housing units regionwide will be within 1 mile of fixed-route transit service	5	2014-04-23 16:55:25.105375	2014-05-09 00:05:41.001181	1
17	100% of the region's municipalities will have incorporated LEED or LEED-equivalent requirements in their zoning	6	2014-04-23 16:55:25.110428	2014-05-09 00:05:41.007418	2
18	All new residential and commercial development will meet the requirements of LEED Certification or equivalent	6	2014-04-23 16:55:25.111556	2014-05-09 00:05:41.008947	3
19	In no municipality will the number of housing units grow by more than 60% from 2000-2030	7	2014-04-23 16:55:25.112713	2014-05-09 00:05:41.010414	1
25	No net loss of agricultural land by 2030	9	2014-04-23 16:55:25.120864	2014-05-09 00:05:41.022038	2
26	66% of single-family housing on nominal lots of 1/2 acre of more in suburbs will use open space or conservation subdivision designs.	9	2014-04-23 16:55:25.121968	2014-05-09 00:05:41.023583	3
43	There will be an increasing number of municipalities in which local median housing costs (ownership and rental) are equal to or less than 30% of regional median income.	14	2014-04-23 16:55:25.141813	2014-05-09 00:05:41.050555	3
193	100% of public water supplies have unaccounted for water less than 10%	61	2014-04-23 16:55:25.357206	2014-05-09 00:05:41.312466	5
44	Ownership housing units with monthly costs less than 30% of regional monthly median income will comprise a growing share of the region's housing stock.	14	2014-04-23 16:55:25.142927	2014-05-09 00:05:41.052261	4
45	Rental housing units costing less than 30% of regional median income will comprise a growing share of the region's housing stock.	14	2014-04-23 16:55:25.14403	2014-05-09 00:05:41.053912	5
46	There will be 97,000 new starter homes (single-family homes <1,700 square feet; single-family attached; 2-4 family homes) by 2030	14	2014-04-23 16:55:25.145188	2014-05-09 00:05:41.055568	6
47	In each city and town, the gap between the Non-White proportion of municipal population and the Non-White proportion of regional population will be decreasing.	15	2014-04-23 16:55:25.146408	2014-05-09 00:05:41.057218	1
48	Home purchase loans will be denied at rates that increasingly reflect the regions demographics, contolling for income.	15	2014-04-23 16:55:25.147584	2014-05-09 00:05:41.058855	2
49	An increasing share of the region's housing stock will be affordable  to households earning less than 80%, 50%, and 30% of area median income.	16	2014-04-23 16:55:25.148672	2014-05-09 00:05:41.060469	1
50	An increasing proportion - up to 10% - of each municipality's housing stock will be deed-restricted and affordable to households earning less than 80% of area median income.	16	2014-04-23 16:55:25.149858	2014-05-09 00:05:41.062107	2
51	66% of new deed-restricted affordable housing units will be located within 1/2 mile of fixed-route transit service.	16	2014-04-23 16:55:25.151024	2014-05-09 00:05:41.06383	3
52	The regionwide occupancy rate for public housing will be at least 95%.	16	2014-04-23 16:55:25.152328	2014-05-09 00:05:41.065551	4
53	No tenants will be evicted as a result of the expiration of affordability restrictions.	16	2014-04-23 16:55:25.153479	2014-05-09 00:05:41.0673	5
54	There will be no net loss of affordable units as affordability restrictions expire	16	2014-04-23 16:55:25.154587	2014-05-09 00:05:41.068969	6
55	There will be a decreasing waitlist for all state-aided public housing and other state-assisted rental housing, including project-based Section 8 and mobile vouchers.	16	2014-04-23 16:55:25.155744	2014-05-09 00:05:41.070624	7
56	The number of homeless individuals and families in the region will decrease by 90%.	17	2014-04-23 16:55:25.156858	2014-05-09 00:05:41.072257	1
57	Demand for Department of Housing and Community Development family shelter inventory will be no more than 400 units statewide.	17	2014-04-23 16:55:25.158001	2014-05-09 00:05:41.073908	2
58	Demand for Department of Housing and Community Development individual shelter inventory will be no more than 250 units statewide.	17	2014-04-23 16:55:25.159105	2014-05-09 00:05:41.07563	3
59	Average length of shelter stays would be no more than 30 days for both individuals and families.	17	2014-04-23 16:55:25.16019	2014-05-09 00:05:41.077255	4
60	Fewer families and individuals will have repeated periods of homelessness.	17	2014-04-23 16:55:25.161351	2014-05-09 00:05:41.078968	5
61	There will be 17,000 new accessory apartments in suburban municipalities by 2030.	18	2014-04-23 16:55:25.162488	2014-05-09 00:05:41.080919	1
62	A declining proportion of seniors will spend over 30% of their household income on housing costs; and non will pay over 50%.	18	2014-04-23 16:55:25.163562	2014-05-09 00:05:41.082578	2
63	76% of new suburban housing units will be in attached single-family or multifamily buildings.	18	2014-04-23 16:55:25.164664	2014-05-09 00:05:41.084192	3
64	All new construction will be built in full compliance with state and federal accessibility rules, regulations, and standards.	19	2014-04-23 16:55:25.165932	2014-05-09 00:05:41.085911	1
65	The supply of accessible homes will equal or exceed the number of households needing such homes.	19	2014-04-23 16:55:25.167205	2014-05-09 00:05:41.087625	2
66	Most new development will incorporate principles of visitability and Universal Design.	19	2014-04-23 16:55:25.168559	2014-05-09 00:05:41.089248	3
67	There will be 183,000 new housing units in the region's urban municipalities	20	2014-04-23 16:55:25.210828	2014-05-09 00:05:41.090848	1
68	25% of urban housing production will be in 2- to 4-family homes or townhouses.	20	2014-04-23 16:55:25.213089	2014-05-09 00:05:41.092521	2
69	6% of urban housing production will occur through accessory apartments, conversion of single-family housing to multifamily, or adaptive reuse.	20	2014-04-23 16:55:25.214456	2014-05-09 00:05:41.094159	3
70	An increasing number of housing units in urban communities will have more than 2 bedrooms.	20	2014-04-23 16:55:25.215666	2014-05-09 00:05:41.09576	4
71	The regional property crime rate will decline.	21	2014-04-23 16:55:25.216894	2014-05-09 00:05:41.097764	1
72	The regional violent crime rate will decline.	21	2014-04-23 16:55:25.218025	2014-05-09 00:05:41.099629	2
73	Disparities in property crime rates across the community types in the region will decline.	21	2014-04-23 16:55:25.219345	2014-05-09 00:05:41.101251	3
74	Disparities in violent crime rates across community types in the region will decline.	21	2014-04-23 16:55:25.220858	2014-05-09 00:05:41.102867	4
75	All residents can access neighborhood crime data that is updated daily.	21	2014-04-23 16:55:25.222642	2014-05-09 00:05:41.104578	1
76	By 2030, asthma hospitalization rates in urban municipalities will be no higher than the regional average	22	2014-04-23 16:55:25.224189	2014-05-09 00:05:41.1062	2
77	There should be no urban areas in the region that have ambient black carbon levels above 0.56 µg/m3.	22	2014-04-23 16:55:25.225323	2014-05-09 00:05:41.107966	3
78	Incidence of lead poisoning will fall to zero in all municipalities.	22	2014-04-23 16:55:25.226424	2014-05-09 00:05:41.109635	4
79	Acres of canopy coverage in urban communities will increase by 20%.	22	2014-04-23 16:55:25.227514	2014-05-09 00:05:41.111248	5
81	The acreage of community gardens in urban areas will increase.	23	2014-04-23 16:55:25.230111	2014-05-09 00:05:41.11517	2
82	Reported crimes in public parks will decrease.	23	2014-04-23 16:55:25.231248	2014-05-09 00:05:41.117069	3
83	In each Community Type, 95% of children and more than 60% of adults will be at a healthy weight.	24	2014-04-23 16:55:25.232423	2014-05-09 00:05:41.118743	1
84	An increasing proportion of the region's residents will eat the recommended number of fruits and vegetables per day.	24	2014-04-23 16:55:25.233588	2014-05-09 00:05:41.121092	2
85	All children that qualify will receive school meals.	24	2014-04-23 16:55:25.234699	2014-05-09 00:05:41.123291	3
86	The nutritional quality of school meals will improve.	24	2014-04-23 16:55:25.235944	2014-05-09 00:05:41.125217	4
40	Average lot size for new single-family houses in suburban communities would be 0.75 acres (0.62 acres in Maturing Suburbs, and 0.79 acres in Developing Suburbs.)	13	2014-04-23 16:55:25.138466	2014-05-09 00:05:41.045382	2
41	The region will produce 350,000 new housing units by 2030.	14	2014-04-23 16:55:25.139579	2014-05-09 00:05:41.047161	1
42	The regional affordability gap will be eliminated by 2030, for households earning 80%, 100%, and 120% of area median income.	14	2014-04-23 16:55:25.140662	2014-05-09 00:05:41.048875	2
92	No municipality will have a waitlist for SACC subsidies that is more than 25% of the number of subsidized children.	27	2014-04-23 16:55:25.24331	2014-05-09 00:05:41.135313	1
93	The region's capacity in licensed and license-exempt after-school programs will be a growing percentage of the region's 5-14 year old population.	27	2014-04-23 16:55:25.24455	2014-05-09 00:05:41.136924	2
94	The region will have declining disparities in standardized test outcomes.	28	2014-04-23 16:55:25.245657	2014-05-09 00:05:41.138686	1
95	Student-teacher ratios will steadily decrease	28	2014-04-23 16:55:25.246764	2014-05-09 00:05:41.140494	2
96	All elementary and middle schools will use a health and physical activity curriculum.	28	2014-04-23 16:55:25.24784	2014-05-09 00:05:41.142211	3
97	All of the region's public schools will have at least one teacher dedicated to each of the following: visual arts, music, theater, and health/physical education.	28	2014-04-23 16:55:25.248948	2014-05-09 00:05:41.143895	4
98	91% of working-age adults (25-65) will have a high school diploma or equivalent (up from 90% today, and 85% if Current Trends continue.)	29	2014-04-23 16:55:25.250195	2014-05-09 00:05:41.145514	1
99	98% of 25-34 year olds will have a high school diploma or equivalent (up from 91% today, and 89% if Current Trends continue).	29	2014-04-23 16:55:25.251342	2014-05-09 00:05:41.147226	2
100	90% of high school graduates will go on to 2- or 4- year college (up from 79% today).	29	2014-04-23 16:55:25.252624	2014-05-09 00:05:41.148939	3
101	Only 10% of graduates from public high schools will need to take remedial courses during their first year of college (down from 37% today).	29	2014-04-23 16:55:25.254166	2014-05-09 00:05:41.150603	4
102	No more than 53% of municipal revenue, regionwide, will come from local property taxes.	30	2014-04-23 16:55:25.255513	2014-05-09 00:05:41.152274	1
103	In all Community Types, a steadily decreasing share of municipal revenue will come from property taxes.	30	2014-04-23 16:55:25.257272	2014-05-09 00:05:41.153894	2
104	Per capita local revenue (property taxes, state aid, local "other") will increase at least as fast as inflation.	30	2014-04-23 16:55:25.258516	2014-05-09 00:05:41.155705	3
105	The region's municipalities will have fewer override attempts; and there will be less disparity in override attempts by municipal median income.	30	2014-04-23 16:55:25.259627	2014-05-09 00:05:41.157439	4
106	Regionwide, annual increases in municipal fixed costs will be slower than currently, after adjusting for inflation.	30	2014-04-23 16:55:25.260745	2014-05-09 00:05:41.159124	5
107	The majority of the region's cities and towns will have a municipal bond rating of AA or higher.	30	2014-04-23 16:55:25.261819	2014-05-09 00:05:41.160752	6
108	78% of registered voters will vote in presidential elections	31	2014-04-23 16:55:25.262896	2014-05-09 00:05:41.162816	1
109	There will be a smaller gap in voter participation  between presidential, gubernatorial, and local elections.	31	2014-04-23 16:55:25.263978	2014-05-09 00:05:41.164712	2
110	The demographics of elected state officials will increasingly reflect the region's genders, ethnicities, and races.	31	2014-04-23 16:55:25.265065	2014-05-09 00:05:41.166733	3
111	The demographics of elected local officials will increasingly reflect the region's genders, ethnicities, and races.	31	2014-04-23 16:55:25.266316	2014-05-09 00:05:41.168591	4
112	The demographics of appointed municipal boards will increasingly reflect the region's genders, ethnicities, and races.	31	2014-04-23 16:55:25.267484	2014-05-09 00:05:41.170408	5
113	The net outmigration rate for seniors (over 65) will be no more than 1.5%.	32	2014-04-23 16:55:25.268642	2014-05-09 00:05:41.17214	1
114	An increasing number of seniors will choose to continue participating in the workforce.	32	2014-04-23 16:55:25.269821	2014-05-09 00:05:41.17385	2
115	Total employment in the region will grow by 11%, or 292,000	33	2014-04-23 16:55:25.270897	2014-05-09 00:05:41.175642	1
116	Sectors that require a more highly skilled workforce will grow faster than the region's employment overall.	33	2014-04-23 16:55:25.271962	2014-05-09 00:05:41.177712	2
117	Total research and development (R&D) funding, from both public and private sources, will grow at least 5% annually.	33	2014-04-23 16:55:25.273037	2014-05-09 00:05:41.179471	3
118	Metro Boston will be ranked in the top ten in the nation in numbers of patents per 10,000 businesses	33	2014-04-23 16:55:25.274195	2014-05-09 00:05:41.181229	4
119	The region will have an increasing share of the nation's employment in clean energy and green technology industries.	34	2014-04-23 16:55:25.275393	2014-05-09 00:05:41.183041	1
120	Employment in micro-businesses and sole proprietorships will grow at a faster rate than overall regional employment	35	2014-04-23 16:55:25.276477	2014-05-09 00:05:41.184834	1
121	100% of all projects in priority areas, consistent with development guidelines, will be permitted in 180 days.	36	2014-04-23 16:55:25.277649	2014-05-09 00:05:41.186706	1
122	53% of working-age adults will have at least a 2- or 4-year degree (up to 43% today)	37	2014-04-23 16:55:25.278818	2014-05-09 00:05:41.188532	1
123	There will be at least 1.32 million workers in the labor force with at least a 2 to 4 year college degree, up 11% from year 2000	37	2014-04-23 16:55:25.279981	2014-05-09 00:05:41.190374	2
124	The net outmigration rate for adults age 30 - 55 will be no more than 1.6% (was 2.7% from 1990-2000)	37	2014-04-23 16:55:25.281062	2014-05-09 00:05:41.192105	3
125	The proportion of working-age Blacks and Hispanics with a 2 or 4 year college degree will increase from 26% to at least 39%.	38	2014-04-23 16:55:25.282187	2014-05-09 00:05:41.193807	1
126	The post secondary attainment gap between Blacks and Hispanics versus Whites will decline by at least 9 points	38	2014-04-23 16:55:25.28335	2014-05-09 00:05:41.195485	2
128	There will be steady declines in the proportion of families and individuals living in poverty	40	2014-04-23 16:55:25.285703	2014-05-09 00:05:41.199274	1
129	The region will increasingly reduce income disparities between top and bottom quintile of the population, as measured by the GINI index.	40	2014-04-23 16:55:25.286859	2014-05-09 00:05:41.201165	2
130	Charitable corporate contributions will increase faster than inflation or Gross Regional Product	41	2014-04-23 16:55:25.287978	2014-05-09 00:05:41.202854	1
131	There will be at least 117,000 acres of agricultural land in the region, and at least 105,000 acres (90%) will be actively harvested cropland.	42	2014-04-23 16:55:25.28908	2014-05-09 00:05:41.204599	1
132	The total market value of agricultural products sold by the region's farms will grow faster than the regional economy.	42	2014-04-23 16:55:25.290159	2014-05-09 00:05:41.206258	2
183	By 2030, 100% of the region's cities and towns will recycle or compost 56% of municipal solid waste	58	2014-04-23 16:55:25.346293	2014-05-09 00:05:41.296022	2
88	All public and private schools will be accessible by sidewalk for children living within one mile.	25	2014-04-23 16:55:25.238209	2014-05-09 00:05:41.128442	2
90	All residents in the region will have health insurance.	26	2014-04-23 16:55:25.240454	2014-05-09 00:05:41.132058	1
91	A decreasing proportion of the region's residents aged 19 to 64 will find cost to be an obstacle to obtaining medical care.	26	2014-04-23 16:55:25.241627	2014-05-09 00:05:41.133694	2
137	All Traffic Analysis Zones with a density of 15 persons per developed acre will be served by fixed-route transit	44	2014-04-23 16:55:25.295532	2014-05-09 00:05:41.215169	1
138	Regional mode shares for public transit would increase from 6.3% to 13.9%	45	2014-04-23 16:55:25.296696	2014-05-09 00:05:41.216841	1
139	The number of people who take transit to work will triple	45	2014-04-23 16:55:25.297774	2014-05-09 00:05:41.218509	2
140	The region would see 2.2 million daily trips transit rideshare	45	2014-04-23 16:55:25.299059	2014-05-09 00:05:41.220168	3
141	Fewer than 34% of the region's workers will have an auto commute that takes more than 30 minutes.	46	2014-04-23 16:55:25.300175	2014-05-09 00:05:41.221993	1
142	The proportion of people walking or biking to work will increase from 17% to 25%	46	2014-04-23 16:55:25.301324	2014-05-09 00:05:41.223652	2
143	The proportion of commuters who carpool will double	46	2014-04-23 16:55:25.302448	2014-05-09 00:05:41.225689	3
144	There will be an increase in the number of jobs within one hour via transit for the region's residents.	46	2014-04-23 16:55:25.303516	2014-05-09 00:05:41.227651	4
145	There will be an increase proportion of workers who telecommute at least one day a week.	46	2014-04-23 16:55:25.304577	2014-05-09 00:05:41.229501	5
146	Total annual delay of 23 hours (2005 delay) per person will not increase.	46	2014-04-23 16:55:25.305714	2014-05-09 00:05:41.231303	6
147	25% of all trips will be made on foot or by bicycle	47	2014-04-23 16:55:25.306818	2014-05-09 00:05:41.233088	1
148	60% of region's streets and roads(not limited access highways) will have sidewalks on at least one side of the road.	47	2014-04-23 16:55:25.307947	2014-05-09 00:05:41.23473	2
149	There will be at least 200 miles of new off road multi-use paths in the MAPC region.	47	2014-04-23 16:55:25.309008	2014-05-09 00:05:41.23647	3
150	There will be a steady reduction in the rate (per bicyclist mile) of auto-bike crashes that result in death or bodily harm	47	2014-04-23 16:55:25.310059	2014-05-09 00:05:41.238161	4
151	There will be a steady reduction in the rate (per pedestrian mile) of auto-pedestrian crashes that result in death or bodily harm	47	2014-04-23 16:55:25.311107	2014-05-09 00:05:41.239804	5
152	There will be a 15% reduction in per-capita vehicle miles traveled by automobiles registered in the region	48	2014-04-23 16:55:25.312152	2014-05-09 00:05:41.24144	1
153	There will be a steady reduction in the number of cars per resident	48	2014-04-23 16:55:25.313194	2014-05-09 00:05:41.243241	2
154	An increasing proportion of the region's households, distributed equally income levels, will have no car.	48	2014-04-23 16:55:25.314234	2014-05-09 00:05:41.245146	3
155	Traffic congestion (roadway volume/capacity) will not increase by more than 10% across all suburban municipalities.	49	2014-04-23 16:55:25.315275	2014-05-09 00:05:41.247049	1
156	All transit stations and vehicles(MBTA and RTA's) will be fully handicapped accessible.	50	2014-04-23 16:55:25.316493	2014-05-09 00:05:41.248943	1
157	100% of municipalities will be served by demand response service with average times less than 30 minutes	50	2014-04-23 16:55:25.317755	2014-05-09 00:05:41.250656	2
159	No tranportation projects over $50 million will be programmed without comprehensive corridor land use plan	51	2014-04-23 16:55:25.320023	2014-05-09 00:05:41.253891	2
160	Funding for community -based transit such as shuttle service and on-demand services will be at least 5% of the total transportation budget.	51	2014-04-23 16:55:25.321084	2014-05-09 00:05:41.255945	3
161	Funding for sidewalks, bike paths, and rail trails and transporation demand management programs will be at least 5% of the total transportation budget.	51	2014-04-23 16:55:25.322152	2014-05-09 00:05:41.25774	4
162	Funding for expansion of transit network (subways, bus, and commuter rail) will be a greater proportion of the region's transportation budget than is spend on roadway expansion projects.	51	2014-04-23 16:55:25.323216	2014-05-09 00:05:41.259394	5
163	The region will complete 95% of maintenance targets annually	52	2014-04-23 16:55:25.324274	2014-05-09 00:05:41.26105	1
164	95% of roadway maintenance and transit maintenance funding will be allocated according to the priorities of a comprehensive  transportation asset management system.	52	2014-04-23 16:55:25.325344	2014-05-09 00:05:41.262818	2
165	There will be a steady decrease in the MBTA debt service costs	52	2014-04-23 16:55:25.326397	2014-05-09 00:05:41.264582	3
166	A growing share of transportation funding in the region will come from user fees and value capture costs	52	2014-04-23 16:55:25.327445	2014-05-09 00:05:41.266439	4
167	90% of transportation infrastructure projects will be complete on time and within budget	53	2014-04-23 16:55:25.328515	2014-05-09 00:05:41.268341	5
168	At least 70% of state-maintained roads will be in good repair	54	2014-04-23 16:55:25.329621	2014-05-09 00:05:41.270051	1
169	90% of auto-crashes will be cleared from the roadway within 90 minutes	54	2014-04-23 16:55:25.330678	2014-05-09 00:05:41.271758	2
170	The number of structurally deficient bridges will not increase	54	2014-04-23 16:55:25.331722	2014-05-09 00:05:41.273468	3
171	All municipalities will have a pavement management system in place	54	2014-04-23 16:55:25.332869	2014-05-09 00:05:41.275177	4
172	15% of the region's freight will travel by rail	55	2014-04-23 16:55:25.333927	2014-05-09 00:05:41.27689	1
173	The Port of Boston will be fully connected to the regional rail network	55	2014-04-23 16:55:25.335107	2014-05-09 00:05:41.278622	2
174	Regional CO2 emissions related to electrical generation and commercial, industrial, residential, and transportation uses will be 33% below 2000 emissions.	56	2014-04-23 16:55:25.336311	2014-05-09 00:05:41.280424	1
175	Regional transportation related emissions will be 40% below 200 emissions	56	2014-04-23 16:55:25.337416	2014-05-09 00:05:41.282154	2
176	Emissions resulting from the region's electric power demand will be 40% below 2000 emissions	56	2014-04-23 16:55:25.338521	2014-05-09 00:05:41.283799	3
177	100% of municipalities will participate in the Climate Protection Campaign or equivalent	56	2014-04-23 16:55:25.339643	2014-05-09 00:05:41.285441	4
178	Regionwide average annual energy demand for heating, cooling, lighting, and appliances in new housing units will not exceed 75 million btus per unit	57	2014-04-23 16:55:25.340747	2014-05-09 00:05:41.287255	1
179	Total energy demand for passenger transportation will decline by 38%	57	2014-04-23 16:55:25.341848	2014-05-09 00:05:41.289142	2
180	Per-Capita energy demand in the residential sector will decline by 38% from 200-2030	57	2014-04-23 16:55:25.342912	2014-05-09 00:05:41.29087	3
181	Non-emergency municipal and state vehicles will be 100% alternative fuel vehicles by 2030.	57	2014-04-23 16:55:25.34409	2014-05-09 00:05:41.292512	4
182	By 2030, the region's solid waste production will be 70% below potential waste generation (based on gross regional product)	58	2014-04-23 16:55:25.34523	2014-05-09 00:05:41.294233	1
134	An increasing number of farms, and an increasing share of the region's agricultural sales, will be certified organic.	42	2014-04-23 16:55:25.292345	2014-05-09 00:05:41.209508	4
135	There will be no restrictions on the harvestable shellfish beds in the region due to human health concerns	42	2014-04-23 16:55:25.293411	2014-05-09 00:05:41.211532	5
136	Increasing economic impact of the "Creative Cluster" industries	43	2014-04-23 16:55:25.294473	2014-05-09 00:05:41.213371	1
190	Per capita residential water consumption will decline by 20%	61	2014-04-23 16:55:25.354035	2014-05-09 00:05:41.307873	2
191	Average water demand for all new residential development will be no more than 50 gallons per person per day	61	2014-04-23 16:55:25.355084	2014-05-09 00:05:41.309373	3
184	By 2030, the region will purchase from renewable sources (without increases in nuclear, large hydroelectric, and biofuels) electricity equivalent to 25% of year 2000 electricity demand.	59	2014-04-23 16:55:25.347345	2014-05-09 00:05:41.297732	1
185	The region will build at least 400 MW of clean energy capacity in the MAPC regions	59	2014-04-23 16:55:25.348452	2014-05-09 00:05:41.299542	2
186	Regional ozone (smog)-O2 levels will never exceed 0.070 ppm (8 hour average)	60	2014-04-23 16:55:25.349673	2014-05-09 00:05:41.301285	1
187	Sensitive land uses (homes, schools, daycare, playgrounds, or medical facilities, etc. ) will not be sited closer than 500 ft to a major transportation facility (freeways or urban roadway within 50,000 vehicles or more per day)	60	2014-04-23 16:55:25.350757	2014-05-09 00:05:41.302819	2
188	There will be no areas in the region that have ambient PM 2.5 level higher than 10 micrograms per cubic meter on an annual basis	60	2014-04-23 16:55:25.351823	2014-05-09 00:05:41.304438	3
189	Total demand for public water systems will decline by 12%	61	2014-04-23 16:55:25.352952	2014-05-09 00:05:41.306163	1
192	In 100% of public water systems, peak month water demand will be no more than 125% of average annual demand	61	2014-04-23 16:55:25.356137	2014-05-09 00:05:41.310934	4
194	The volume of interbasin transfers (via water or wastewater) out of medium of high-stress basins will steadily decline)	61	2014-04-23 16:55:25.358273	2014-05-09 00:05:41.314051	6
195	Fewer of the region's waterways will be impaired due to pollution	62	2014-04-23 16:55:25.359316	2014-05-09 00:05:41.315667	1
196	100% of combined sewer lines in the region will be separated and 100% of CSO outfall points will be closed	62	2014-04-23 16:55:25.360361	2014-05-09 00:05:41.317157	1
197	Stream flow levels measured by USGS gauges will be comparable to historical stream flow	62	2014-04-23 16:55:25.361413	2014-05-09 00:05:41.318609	2
198	There will be zero violations of safe swimming standards in the region's rivers, lakes and beaches.	62	2014-04-23 16:55:25.362481	2014-05-09 00:05:41.320174	3
199	The region will have no more than 18,000 acres of new impervious surface.	62	2014-04-23 16:55:25.363551	2014-05-09 00:05:41.321836	4
200	There will be no net loss of wetland acreage	63	2014-04-23 16:55:25.364596	2014-05-09 00:05:41.323772	1
201	Residential development will result in the loss of no more than 6,000 acres of land in Areas of Critical Environmental Concern.	64	2014-04-23 16:55:25.365637	2014-05-09 00:05:41.370255	1
202	There will be no loss of core habitat for rare and endangered species	64	2014-04-23 16:55:25.366883	2014-05-09 00:05:41.372727	2
203	139,000 acres of developable land identified as a high priority by the State Land Conservation Plan will be permanently protected from development	65	2014-04-23 16:55:25.368116	2014-05-09 00:05:41.374609	1
204	No more than 5,000 acres of prime and important farmland soils will be lost to development	65	2014-04-23 16:55:25.369548	2014-05-09 00:05:41.376255	2
\.


--
-- Name: objectives_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('objectives_id_seq', 204, true);


--
-- Data for Name: rails_admin_histories; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY rails_admin_histories (id, message, username, item, "table", month, year, created_at, updated_at) FROM stdin;
\.


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('rails_admin_histories_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY schema_migrations (version) FROM stdin;
20140422163343
20140131181958
20140131182159
20140131191119
20140131205404
20140131232301
20140131232940
20140201001350
20140201001642
20140201001754
20140201005526
20140201010427
20140201024924
20140201024940
20140203191516
20140203192115
20140203195419
20140203195626
20140204144851
20140204185048
20140204214208
20140204215839
20140205165916
20140205175616
20140205181254
20140205181940
20140205230038
20140205230039
20140205235026
20140206151303
20140206212421
20140207202841
20140207225956
20140210200951
20140212193922
20140212204349
20140212230701
20140326201251
20140416204919
20140417221951
20140508161852
20140508192416
20140511221108
20140522232352
20140523000507
20140529202751
20150323193123
\.


--
-- Data for Name: snapshots; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY snapshots (id, date, value, rank, indicator_id, created_at, updated_at) FROM stdin;
1	2007-01-01 00:00:00	54	3	123	2014-05-23 00:44:12.408413	2014-05-23 00:44:12.408413
2	2000-01-01 00:00:00	49	0	123	2014-05-23 00:44:12.430816	2014-05-23 00:44:12.430816
3	2007-01-01 00:00:00	23	3	211	2014-05-23 00:44:12.450607	2014-05-23 00:44:12.450607
4	2000-01-01 00:00:00	21	0	211	2014-05-23 00:44:12.470752	2014-05-23 00:44:12.470752
5	2007-01-01 00:00:00	33	7	212	2014-05-23 00:44:12.48964	2014-05-23 00:44:12.48964
6	2000-01-01 00:00:00	30	0	212	2014-05-23 00:44:12.556489	2014-05-23 00:44:12.556489
7	2007-01-01 00:00:00	16	0	213	2014-05-23 00:44:12.576821	2014-05-23 00:44:12.576821
8	2000-01-01 00:00:00	16	0	213	2014-05-23 00:44:12.595277	2014-05-23 00:44:12.595277
9	2007-01-01 00:00:00	8	21	214	2014-05-23 00:44:12.61537	2014-05-23 00:44:12.61537
10	2000-01-01 00:00:00	11	0	214	2014-05-23 00:44:12.636778	2014-05-23 00:44:12.636778
11	2007-01-01 00:00:00	9	3	215	2014-05-23 00:44:12.656992	2014-05-23 00:44:12.656992
12	2000-01-01 00:00:00	12	0	215	2014-05-23 00:44:12.676077	2014-05-23 00:44:12.676077
13	2007-01-01 00:00:00	27	15	216	2014-05-23 00:44:12.695226	2014-05-23 00:44:12.695226
14	2000-01-01 00:00:00	33	0	216	2014-05-23 00:44:12.715497	2014-05-23 00:44:12.715497
15	2007-01-01 00:00:00	7	0	217	2014-05-23 00:44:12.73521	2014-05-23 00:44:12.73521
16	2000-01-01 00:00:00	9	0	217	2014-05-23 00:44:12.75335	2014-05-23 00:44:12.75335
17	2012-01-01 00:00:00	15000	0	218	2014-05-23 00:44:12.771951	2014-05-23 00:44:12.771951
18	2007-01-01 00:00:00	15000	0	218	2014-05-23 00:44:12.833419	2014-05-23 00:44:12.833419
19	2012-01-01 00:00:00	24600	0	219	2014-05-23 00:44:12.850804	2014-05-23 00:44:12.850804
20	2007-01-01 00:00:00	15900	0	219	2014-05-23 00:44:12.870865	2014-05-23 00:44:12.870865
21	2013-01-01 00:00:00	2560000	0	220	2014-05-23 00:44:12.89261	2014-05-23 00:44:12.89261
22	2000-01-01 00:00:00	2460000	0	220	2014-05-23 00:44:12.911668	2014-05-23 00:44:12.911668
23	2012-01-01 00:00:00	82	3	221	2014-05-23 00:44:12.932521	2014-05-23 00:44:12.932521
24	2008-01-01 00:00:00	83	0	221	2014-05-23 00:44:12.952121	2014-05-23 00:44:12.952121
25	2012-01-01 00:00:00	188000	17	222	2014-05-23 00:44:12.97279	2014-05-23 00:44:12.97279
26	2008-01-01 00:00:00	201000	0	222	2014-05-23 00:44:12.991968	2014-05-23 00:44:12.991968
27	2012-01-01 00:00:00	575000	2	223	2014-05-23 00:44:13.012889	2014-05-23 00:44:13.012889
28	2008-01-01 00:00:00	559000	0	223	2014-05-23 00:44:13.032249	2014-05-23 00:44:13.032249
29	2012-01-01 00:00:00	605000	3	224	2014-05-23 00:44:13.051747	2014-05-23 00:44:13.051747
30	2008-01-01 00:00:00	596000	0	224	2014-05-23 00:44:13.11907	2014-05-23 00:44:13.11907
31	2012-01-01 00:00:00	1185000	2	225	2014-05-23 00:44:13.13819	2014-05-23 00:44:13.13819
32	2008-01-01 00:00:00	1134000	0	225	2014-05-23 00:44:13.15769	2014-05-23 00:44:13.15769
33	2007-01-01 00:00:00	3	21	226	2014-05-23 00:44:13.176893	2014-05-23 00:44:13.176893
34	2000-01-01 00:00:00	12	0	226	2014-05-23 00:44:13.19681	2014-05-23 00:44:13.19681
35	2007-01-01 00:00:00	7	3	227	2014-05-23 00:44:13.216983	2014-05-23 00:44:13.216983
36	2000-01-01 00:00:00	17	0	227	2014-05-23 00:44:13.236351	2014-05-23 00:44:13.236351
37	2007-01-01 00:00:00	23	0	228	2014-05-23 00:44:13.256444	2014-05-23 00:44:13.256444
38	2000-01-01 00:00:00	27	0	228	2014-05-23 00:44:13.274956	2014-05-23 00:44:13.274956
39	2007-01-01 00:00:00	3	0	229	2014-05-23 00:44:13.292679	2014-05-23 00:44:13.292679
40	2000-01-01 00:00:00	4	0	229	2014-05-23 00:44:13.310403	2014-05-23 00:44:13.310403
41	2007-01-01 00:00:00	1	0	230	2014-05-23 00:44:13.328702	2014-05-23 00:44:13.328702
42	2000-01-01 00:00:00	4	0	230	2014-05-23 00:44:13.393646	2014-05-23 00:44:13.393646
43	2013-01-01 00:00:00	6	0	231	2014-05-23 00:44:13.415728	2014-05-23 00:44:13.415728
44	2000-01-01 00:00:00	2	0	231	2014-05-23 00:44:13.435433	2014-05-23 00:44:13.435433
45	2007-01-01 00:00:00	6	14	232	2014-05-23 00:44:13.45422	2014-05-23 00:44:13.45422
46	2000-01-01 00:00:00	4	0	232	2014-05-23 00:44:13.476026	2014-05-23 00:44:13.476026
47	2007-01-01 00:00:00	3	2	233	2014-05-23 00:44:13.496486	2014-05-23 00:44:13.496486
48	2000-01-01 00:00:00	4	0	233	2014-05-23 00:44:13.515219	2014-05-23 00:44:13.515219
49	2007-01-01 00:00:00	9	0	234	2014-05-23 00:44:13.534464	2014-05-23 00:44:13.534464
50	2000-01-01 00:00:00	7	0	234	2014-05-23 00:44:13.5521	2014-05-23 00:44:13.5521
51	2007-01-01 00:00:00	1	0	235	2014-05-23 00:44:13.569488	2014-05-23 00:44:13.569488
52	2000-01-01 00:00:00	1	0	235	2014-05-23 00:44:13.585952	2014-05-23 00:44:13.585952
53	2013-01-01 00:00:00	13	0	236	2014-05-23 00:44:13.603956	2014-05-23 00:44:13.603956
54	2003-01-01 00:00:00	9	0	236	2014-05-23 00:44:13.669606	2014-05-23 00:44:13.669606
55	2013-01-01 00:00:00	6	0	237	2014-05-23 00:44:13.687508	2014-05-23 00:44:13.687508
56	2003-01-01 00:00:00	3	0	237	2014-05-23 00:44:13.70509	2014-05-23 00:44:13.70509
57	2011-01-01 00:00:00	2000	0	238	2014-05-23 00:44:13.72354	2014-05-23 00:44:13.72354
58	2011-01-01 00:00:00	290000	0	239	2014-05-23 00:44:13.741036	2014-05-23 00:44:13.741036
59	2011-01-01 00:00:00	383000	0	240	2014-05-23 00:44:13.758235	2014-05-23 00:44:13.758235
60	2007-01-01 00:00:00	61	6	241	2014-05-23 00:44:13.777112	2014-05-23 00:44:13.777112
61	2007-01-01 00:00:00	1	25	242	2014-05-23 00:44:13.79813	2014-05-23 00:44:13.79813
62	2000-01-01 00:00:00	15	0	242	2014-05-23 00:44:13.818348	2014-05-23 00:44:13.818348
63	2007-01-01 00:00:00	2	8	243	2014-05-23 00:44:13.83697	2014-05-23 00:44:13.83697
64	2000-01-01 00:00:00	11	0	243	2014-05-23 00:44:13.856056	2014-05-23 00:44:13.856056
65	2007-01-01 00:00:00	15	22	244	2014-05-23 00:44:13.87569	2014-05-23 00:44:13.87569
66	2007-01-01 00:00:00	15	21	245	2014-05-23 00:44:13.895745	2014-05-23 00:44:13.895745
67	2000-01-01 00:00:00	13	0	245	2014-05-23 00:44:13.971287	2014-05-23 00:44:13.971287
68	2007-01-01 00:00:00	7	1	246	2014-05-23 00:44:13.991244	2014-05-23 00:44:13.991244
69	2000-01-01 00:00:00	6	0	246	2014-05-23 00:44:14.011929	2014-05-23 00:44:14.011929
70	2007-01-01 00:00:00	9	0	247	2014-05-23 00:44:14.03087	2014-05-23 00:44:14.03087
71	2007-01-01 00:00:00	1	0	248	2014-05-23 00:44:14.048468	2014-05-23 00:44:14.048468
72	2007-01-01 00:00:00	-1	0	249	2014-05-23 00:44:14.066095	2014-05-23 00:44:14.066095
73	2007-01-01 00:00:00	-1	0	250	2014-05-23 00:44:14.083416	2014-05-23 00:44:14.083416
74	2012-01-01 00:00:00	18	0	251	2014-05-23 00:44:14.100313	2014-05-23 00:44:14.100313
75	2006-01-01 00:00:00	15	0	251	2014-05-23 00:44:14.119776	2014-05-23 00:44:14.119776
76	2012-01-01 00:00:00	0	6	252	2014-05-23 00:44:14.142891	2014-05-23 00:44:14.142891
77	1999-01-01 00:00:00	0	0	252	2014-05-23 00:44:14.163866	2014-05-23 00:44:14.163866
78	2012-01-01 00:00:00	90700	3	253	2014-05-23 00:44:14.183623	2014-05-23 00:44:14.183623
79	2005-01-01 00:00:00	87212	0	253	2014-05-23 00:44:14.251719	2014-05-23 00:44:14.251719
80	2012-01-01 00:00:00	118000	2	254	2014-05-23 00:44:14.270713	2014-05-23 00:44:14.270713
81	2005-01-01 00:00:00	110280	0	254	2014-05-23 00:44:14.289721	2014-05-23 00:44:14.289721
82	2012-01-01 00:00:00	51600	2	255	2014-05-23 00:44:14.308383	2014-05-23 00:44:14.308383
83	2005-01-01 00:00:00	51089	0	255	2014-05-23 00:44:14.328753	2014-05-23 00:44:14.328753
84	2012-01-01 00:00:00	29200	7	256	2014-05-23 00:44:14.351851	2014-05-23 00:44:14.351851
85	2005-01-01 00:00:00	32412	0	256	2014-05-23 00:44:14.370959	2014-05-23 00:44:14.370959
86	2008-01-01 00:00:00	71924	4	257	2014-05-23 00:44:14.389222	2014-05-23 00:44:14.389222
87	2008-01-01 00:00:00	89151	3	258	2014-05-23 00:44:14.406427	2014-05-23 00:44:14.406427
88	2008-01-01 00:00:00	52727	0	259	2014-05-23 00:44:14.423285	2014-05-23 00:44:14.423285
89	2008-01-01 00:00:00	62435	0	260	2014-05-23 00:44:14.439943	2014-05-23 00:44:14.439943
90	2008-01-01 00:00:00	12486	0	261	2014-05-23 00:44:14.456913	2014-05-23 00:44:14.456913
91	2013-01-01 00:00:00	2	0	262	2014-05-23 00:44:14.520504	2014-05-23 00:44:14.520504
92	2008-01-01 00:00:00	11	20	263	2014-05-23 00:44:14.539032	2014-05-23 00:44:14.539032
93	2000-01-01 00:00:00	9	0	263	2014-05-23 00:44:14.558882	2014-05-23 00:44:14.558882
94	2013-01-01 00:00:00	0	2	264	2014-05-23 00:44:14.577645	2014-05-23 00:44:14.577645
95	2014-01-01 00:00:00	0	0	265	2014-05-23 00:44:14.595648	2014-05-23 00:44:14.595648
96	2013-01-01 00:00:00	0	0	266	2014-05-23 00:44:14.613324	2014-05-23 00:44:14.613324
97	1998-01-01 00:00:00	0	0	266	2014-05-23 00:44:14.632891	2014-05-23 00:44:14.632891
98	2008-01-01 00:00:00	35	4	267	2014-05-23 00:44:14.651056	2014-05-23 00:44:14.651056
99	2008-01-01 00:00:00	43	1	268	2014-05-23 00:44:14.66833	2014-05-23 00:44:14.66833
100	2008-01-01 00:00:00	20	3	269	2014-05-23 00:44:14.688242	2014-05-23 00:44:14.688242
101	2011-01-01 00:00:00	81	0	270	2014-05-23 00:44:14.706584	2014-05-23 00:44:14.706584
102	2011-01-01 00:00:00	81	0	271	2014-05-23 00:44:14.724093	2014-05-23 00:44:14.724093
103	2011-01-01 00:00:00	22	0	272	2014-05-23 00:44:14.787693	2014-05-23 00:44:14.787693
104	2002-01-01 00:00:00	18	0	272	2014-05-23 00:44:14.805729	2014-05-23 00:44:14.805729
105	2011-01-01 00:00:00	5	0	273	2014-05-23 00:44:14.823353	2014-05-23 00:44:14.823353
106	2002-01-01 00:00:00	4	0	273	2014-05-23 00:44:14.842029	2014-05-23 00:44:14.842029
107	2011-01-01 00:00:00	4537	4	274	2014-05-23 00:44:14.861521	2014-05-23 00:44:14.861521
108	2003-01-01 00:00:00	3463	0	274	2014-05-23 00:44:14.885692	2014-05-23 00:44:14.885692
109	2011-01-01 00:00:00	459	3	275	2014-05-23 00:44:14.907827	2014-05-23 00:44:14.907827
110	2003-01-01 00:00:00	328	0	275	2014-05-23 00:44:14.927393	2014-05-23 00:44:14.927393
111	2010-01-01 00:00:00	41800	8	276	2014-05-23 00:44:14.946158	2014-05-23 00:44:14.946158
112	2003-01-01 00:00:00	33984	0	276	2014-05-23 00:44:14.964911	2014-05-23 00:44:14.964911
113	2010-01-01 00:00:00	1	16	277	2014-05-23 00:44:14.982965	2014-05-23 00:44:14.982965
114	2003-01-01 00:00:00	1	0	277	2014-05-23 00:44:15.001137	2014-05-23 00:44:15.001137
115	2010-01-01 00:00:00	64	20	278	2014-05-23 00:44:15.069178	2014-05-23 00:44:15.069178
116	2012-01-01 00:00:00	2	5	279	2014-05-23 00:44:15.087123	2014-05-23 00:44:15.087123
117	2004-01-01 00:00:00	2	0	279	2014-05-23 00:44:15.105504	2014-05-23 00:44:15.105504
118	2007-01-01 00:00:00	199355000	0	280	2014-05-23 00:44:15.122874	2014-05-23 00:44:15.122874
119	2002-01-01 00:00:00	167525210	0	280	2014-05-23 00:44:15.140489	2014-05-23 00:44:15.140489
120	2007-01-01 00:00:00	123000	0	281	2014-05-23 00:44:15.158122	2014-05-23 00:44:15.158122
121	2002-01-01 00:00:00	132840	0	281	2014-05-23 00:44:15.175717	2014-05-23 00:44:15.175717
122	2007-01-01 00:00:00	63100	0	282	2014-05-23 00:44:15.193117	2014-05-23 00:44:15.193117
123	2002-01-01 00:00:00	56500	0	282	2014-05-23 00:44:15.210487	2014-05-23 00:44:15.210487
124	2007-01-01 00:00:00	110	0	283	2014-05-23 00:44:15.229858	2014-05-23 00:44:15.229858
125	2007-01-01 00:00:00	1000	0	284	2014-05-23 00:44:15.248	2014-05-23 00:44:15.248
126	2007-01-01 00:00:00	4852000	0	285	2014-05-23 00:44:15.266832	2014-05-23 00:44:15.266832
127	2012-01-01 00:00:00	77	0	286	2014-05-23 00:44:15.283748	2014-05-23 00:44:15.283748
128	2012-01-01 00:00:00	16	0	287	2014-05-23 00:44:15.344778	2014-05-23 00:44:15.344778
129	2011-01-01 00:00:00	4	20	288	2014-05-23 00:44:15.36234	2014-05-23 00:44:15.36234
130	2003-01-01 00:00:00	4	0	288	2014-05-23 00:44:15.38023	2014-05-23 00:44:15.38023
131	2011-01-01 00:00:00	26	20	289	2014-05-23 00:44:15.398261	2014-05-23 00:44:15.398261
132	2003-01-01 00:00:00	28	0	289	2014-05-23 00:44:15.419782	2014-05-23 00:44:15.419782
133	2010-01-01 00:00:00	3	21	290	2014-05-23 00:44:15.439287	2014-05-23 00:44:15.439287
134	2003-01-01 00:00:00	4	0	290	2014-05-23 00:44:15.45824	2014-05-23 00:44:15.45824
135	2010-01-01 00:00:00	22	17	291	2014-05-23 00:44:15.481968	2014-05-23 00:44:15.481968
136	2003-01-01 00:00:00	25	0	291	2014-05-23 00:44:15.502049	2014-05-23 00:44:15.502049
137	2013-01-01 00:00:00	29	0	292	2014-05-23 00:44:15.520455	2014-05-23 00:44:15.520455
138	2013-01-01 00:00:00	87	0	293	2014-05-23 00:44:15.536693	2014-05-23 00:44:15.536693
139	2013-01-01 00:00:00	2373000	0	294	2014-05-23 00:44:15.553326	2014-05-23 00:44:15.553326
140	2009-01-01 00:00:00	2406000	0	294	2014-05-23 00:44:15.616792	2014-05-23 00:44:15.616792
141	2001-01-01 00:00:00	2286000	0	294	2014-05-23 00:44:15.635528	2014-05-23 00:44:15.635528
142	2012-01-01 00:00:00	610000	0	295	2014-05-23 00:44:15.654239	2014-05-23 00:44:15.654239
143	2001-01-01 00:00:00	501000	0	295	2014-05-23 00:44:15.672795	2014-05-23 00:44:15.672795
144	2012-01-01 00:00:00	416000	0	296	2014-05-23 00:44:15.690655	2014-05-23 00:44:15.690655
145	2001-01-01 00:00:00	408000	0	296	2014-05-23 00:44:15.709046	2014-05-23 00:44:15.709046
146	2012-01-01 00:00:00	401000	0	297	2014-05-23 00:44:15.727311	2014-05-23 00:44:15.727311
147	2001-01-01 00:00:00	445000	0	297	2014-05-23 00:44:15.745278	2014-05-23 00:44:15.745278
148	2012-01-01 00:00:00	234000	0	298	2014-05-23 00:44:15.763257	2014-05-23 00:44:15.763257
149	2001-01-01 00:00:00	196000	0	298	2014-05-23 00:44:15.783312	2014-05-23 00:44:15.783312
150	2012-01-01 00:00:00	168000	0	299	2014-05-23 00:44:15.80161	2014-05-23 00:44:15.80161
151	2001-01-01 00:00:00	187000	0	299	2014-05-23 00:44:15.819923	2014-05-23 00:44:15.819923
152	2012-01-01 00:00:00	165000	0	300	2014-05-23 00:44:15.886075	2014-05-23 00:44:15.886075
153	2001-01-01 00:00:00	260000	0	300	2014-05-23 00:44:15.905169	2014-05-23 00:44:15.905169
154	2012-01-01 00:00:00	99000	0	301	2014-05-23 00:44:15.923208	2014-05-23 00:44:15.923208
155	2001-01-01 00:00:00	81000	0	301	2014-05-23 00:44:15.953891	2014-05-23 00:44:15.953891
156	2012-01-01 00:00:00	88000	0	302	2014-05-23 00:44:15.976345	2014-05-23 00:44:15.976345
157	2001-01-01 00:00:00	108000	0	302	2014-05-23 00:44:15.995041	2014-05-23 00:44:15.995041
158	2012-01-01 00:00:00	76000	0	303	2014-05-23 00:44:16.015046	2014-05-23 00:44:16.015046
159	2001-01-01 00:00:00	75000	0	303	2014-05-23 00:44:16.034623	2014-05-23 00:44:16.034623
160	2012-01-01 00:00:00	72000	0	304	2014-05-23 00:44:16.053965	2014-05-23 00:44:16.053965
161	2001-01-01 00:00:00	97000	0	304	2014-05-23 00:44:16.072564	2014-05-23 00:44:16.072564
162	2011-01-01 00:00:00	1300	0	305	2014-05-23 00:44:16.090262	2014-05-23 00:44:16.090262
163	2001-01-01 00:00:00	1233	0	305	2014-05-23 00:44:16.107894	2014-05-23 00:44:16.107894
164	2011-01-01 00:00:00	1400	0	306	2014-05-23 00:44:16.125839	2014-05-23 00:44:16.125839
165	2001-01-01 00:00:00	1394	0	306	2014-05-23 00:44:16.194518	2014-05-23 00:44:16.194518
166	2011-01-01 00:00:00	1100	0	307	2014-05-23 00:44:16.213162	2014-05-23 00:44:16.213162
167	2001-01-01 00:00:00	941	0	307	2014-05-23 00:44:16.23169	2014-05-23 00:44:16.23169
168	2011-01-01 00:00:00	2400	0	308	2014-05-23 00:44:16.249344	2014-05-23 00:44:16.249344
169	2001-01-01 00:00:00	2191	0	308	2014-05-23 00:44:16.267048	2014-05-23 00:44:16.267048
170	2011-01-01 00:00:00	1900	0	309	2014-05-23 00:44:16.284733	2014-05-23 00:44:16.284733
171	2001-01-01 00:00:00	1716	0	309	2014-05-23 00:44:16.303723	2014-05-23 00:44:16.303723
172	2011-01-01 00:00:00	500	0	310	2014-05-23 00:44:16.329748	2014-05-23 00:44:16.329748
173	2001-01-01 00:00:00	521	0	310	2014-05-23 00:44:16.353679	2014-05-23 00:44:16.353679
174	2011-01-01 00:00:00	1700	0	311	2014-05-23 00:44:16.375195	2014-05-23 00:44:16.375195
175	2001-01-01 00:00:00	1465	0	311	2014-05-23 00:44:16.396573	2014-05-23 00:44:16.396573
176	2011-01-01 00:00:00	800	0	312	2014-05-23 00:44:16.419723	2014-05-23 00:44:16.419723
177	2001-01-01 00:00:00	733	0	312	2014-05-23 00:44:16.498508	2014-05-23 00:44:16.498508
178	2011-01-01 00:00:00	600	0	313	2014-05-23 00:44:16.520486	2014-05-23 00:44:16.520486
179	2001-01-01 00:00:00	667	0	313	2014-05-23 00:44:16.540015	2014-05-23 00:44:16.540015
180	2011-01-01 00:00:00	1800	0	314	2014-05-23 00:44:16.562338	2014-05-23 00:44:16.562338
181	2001-01-01 00:00:00	1526	0	314	2014-05-23 00:44:16.581269	2014-05-23 00:44:16.581269
182	2011-01-01 00:00:00	1400	0	315	2014-05-23 00:44:16.60471	2014-05-23 00:44:16.60471
183	2001-01-01 00:00:00	1227	0	315	2014-05-23 00:44:16.631797	2014-05-23 00:44:16.631797
184	2011-01-01 00:00:00	900	0	316	2014-05-23 00:44:16.652682	2014-05-23 00:44:16.652682
185	2001-01-01 00:00:00	973	0	316	2014-05-23 00:44:16.677699	2014-05-23 00:44:16.677699
186	2012-01-01 00:00:00	555000	2	317	2014-05-23 00:44:16.70176	2014-05-23 00:44:16.70176
187	2004-01-01 00:00:00	441500	0	317	2014-05-23 00:44:16.730599	2014-05-23 00:44:16.730599
188	2012-01-01 00:00:00	630000	23	318	2014-05-23 00:44:16.759117	2014-05-23 00:44:16.759117
189	2004-01-01 00:00:00	738000	0	318	2014-05-23 00:44:16.790634	2014-05-23 00:44:16.790634
190	2012-01-01 00:00:00	527000	24	319	2014-05-23 00:44:16.868198	2014-05-23 00:44:16.868198
191	2004-01-01 00:00:00	728410	0	319	2014-05-23 00:44:16.889129	2014-05-23 00:44:16.889129
\.


--
-- Name: snapshots_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('snapshots_id_seq', 191, true);


--
-- Data for Name: sources; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY sources (id, title, url, date, comment, author, created_at, updated_at) FROM stdin;
1	PUMS 2000 Census 5%	http://www.census.gov/census2000/PUMS5.html	2000-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.190823	2014-05-23 00:44:17.190823
2	PUMS 2007-2011 ACS 5-Year	https://www.census.gov/acs/www/data_documentation/pums_data/	2011-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.229022	2014-05-23 00:44:17.229022
3	ACS 2008-2012 5-Year	http://factfinder2.census.gov/	2012-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.30199	2014-05-23 00:44:17.30199
4	ACS 2005 1-Year	http://factfinder2.census.gov/	2005-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.369567	2014-05-23 00:44:17.369567
5	ACS 2006 1-Year	http://factfinder2.census.gov/	2006-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.409909	2014-05-23 00:44:17.409909
6	ACS 2007 1-Year	http://factfinder2.census.gov/	2007-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.475694	2014-05-23 00:44:17.475694
7	ACS 2008 1-Year	http://factfinder2.census.gov/	2008-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.576711	2014-05-23 00:44:17.576711
8	ACS 2009 1-Year	http://factfinder2.census.gov/	2009-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.624738	2014-05-23 00:44:17.624738
9	ACS 2010 1-Year	http://factfinder2.census.gov/	2010-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.675794	2014-05-23 00:44:17.675794
10	ACS 2011 1-Year	http://factfinder2.census.gov/	2011-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.756967	2014-05-23 00:44:17.756967
11	ACS 2012 1-Year	http://factfinder2.census.gov/	2012-01-01 00:00:00	\N	U.S. Census Bureau	2014-05-23 00:44:17.812686	2014-05-23 00:44:17.812686
12	Census 2000	\N	\N	\N	U.S. Census Bureau	2014-05-23 00:44:17.873062	2014-05-23 00:44:17.873062
13	"Debt to Degree: A New Way of Measuring College Success"	http://www.educationsector.org/publications/debt-degree-new-way-measuring-college-success	2011-08-03 00:00:00	\N	Kevin Carey and Erin Dillon, Education Sector	2014-05-23 00:44:17.885628	2014-05-23 00:44:17.885628
14	IPEDS Data Center	http://nces.ed.gov/ipeds/datacenter/	2013-01-01 00:00:00	\N	Integrated Postsecondary Education Data System	2014-05-23 00:44:17.895881	2014-05-23 00:44:17.895881
15	Local Area Unemployment Statistics (LAUS)	\N	2014-01-01 00:00:00	\N	Bureau of Labor Statistics, via the Massachusetts Executive Office of Labor and Workforce Development	2014-05-23 00:44:17.90845	2014-05-23 00:44:17.90845
16	Current Population Survey and Local Area Unemployment Statistics	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:17.977917	2014-05-23 00:44:17.977917
17	Local Area Unemployment Statistics, 2003-2013	http://www.bls.gov/lau/stalt13q4.htm	2014-01-01 00:00:00	\N	Bureau of Labor Statistics	2014-05-23 00:44:17.990568	2014-05-23 00:44:17.990568
18	Occupational Employment Statistics (OES) Survey, 2004	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.004687	2014-05-23 00:44:18.004687
19	Occupational Employment Statistics (OES) Survey, 2005	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.018684	2014-05-23 00:44:18.018684
20	Occupational Employment Statistics (OES) Survey, 2006	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.03017	2014-05-23 00:44:18.03017
21	Occupational Employment Statistics (OES) Survey, 2007	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.042199	2014-05-23 00:44:18.042199
22	Occupational Employment Statistics (OES) Survey, 2008	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.057763	2014-05-23 00:44:18.057763
23	Occupational Employment Statistics (OES) Survey, 2009	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.072355	2014-05-23 00:44:18.072355
24	Occupational Employment Statistics (OES) Survey, 2010	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.089272	2014-05-23 00:44:18.089272
25	Occupational Employment Statistics (OES) Survey, 2011	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.103393	2014-05-23 00:44:18.103393
26	Occupational Employment Statistics (OES) Survey, 2012	\N	\N	\N	Bureau of Labor Statistics	2014-05-23 00:44:18.123101	2014-05-23 00:44:18.123101
\.


--
-- Name: sources_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('sources_id_seq', 26, true);


--
-- Data for Name: static_pages; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY static_pages (id, title, content, slug_id, top, sort_order, created_at, updated_at) FROM stdin;
2	Contact	*Contact* us about this site	contact	t	2	2014-04-23 16:55:30.802571	2014-05-08 16:50:10.223532
1	About	About __Regional__ Indicators	about	t	1	2014-04-23 16:55:30.800113	2014-05-09 00:05:41.390758
3	Framing	###What is the Regional Indicators project? \n\nMetroFuture, the region's plan for smart growth through the year 2030, directs us to achieve this vision by eliminating unfair, preventable, and systematic differences between groups that not only harm individuals and families, but threaten the vibrancy of our region.\r\n\r\nThe policy report will be released later in 2011 and will identify key policy and programmatic recommendations to "bend the trends" towards greater regional equity. MAPC will reach out to a wide variety of stakeholders in translating our data findings to policy; stay in touch to learn more. Click here to view the MetroFuture equity-related recommendations for policy and program change.\r\n\r\nMetroFuture, the region's plan for growth through the year 2030, directs us to achieve this vision by eliminating unfair, preventable, and systematic differences between groups that not only harm individuals and families, but threaten the vibrancy of our region.	framing	f	\N	2014-05-13 15:10:07.130185	2014-05-22 22:59:37.609657
\.


--
-- Name: static_pages_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('static_pages_id_seq', 3, true);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY subjects (id, title, created_at, updated_at, topic_area_id, sort_order) FROM stdin;
3	A Diverse and Productive Workforce	2014-05-08 16:50:21.435384	2014-05-08 16:50:21.435384	1	\N
4	Innovation and Local Economies	2014-05-08 16:50:21.450515	2014-05-08 16:50:21.450515	1	\N
5	Economic Context	2014-05-08 16:50:21.458298	2014-05-08 16:50:21.458298	1	\N
1	An Educated Workforce	2014-04-23 16:56:20.708494	2014-05-08 17:34:30.164925	1	\N
2	Equitable Prosperity	2014-04-23 16:56:20.734984	2014-05-08 17:34:37.037722	1	\N
7	Boundaries and Definitions	2014-05-23 00:17:59.734438	2014-05-23 00:17:59.734438	1	\N
6	Introduction: What Makes  A Prosperous Region?	2014-05-23 00:17:59.258494	2015-03-23 19:34:38.445408	1	1
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('subjects_id_seq', 7, true);


--
-- Data for Name: topic_areas; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY topic_areas (id, abbr, title, created_at, updated_at, subtitle, explanation_id, visible, featured, dashboard_framing) FROM stdin;
2	TC	Transportation Choices	2014-04-23 16:55:21.894047	2014-05-08 16:51:15.55839	Can we all get around?	\N	t	t	\N
3	SG	Sustainable Growth	2014-04-23 16:55:21.896461	2014-05-09 00:05:41.418464	Are we living within our means?	\N	f	f	\N
6	HE	Healthy Environment	2014-04-23 16:55:21.902322	2014-05-09 00:05:41.424901	What makes a healthy region?	\N	f	f	\N
5	HC	Housing Choices	2014-04-23 16:55:21.90086	2014-05-09 19:46:03.014217	How do we accommodate all?	\N	f	f	\N
4	CV	Community Vitality	2014-04-23 16:55:21.899288	2014-05-09 19:46:08.434214	What makes a vital region?	\N	f	f	\N
1	RP	Regional Prosperity	2014-04-23 16:55:21.890708	2014-05-29 20:28:55.953349	What makes a prosperous region?	\N	t	t	MAPC Regional Indicators identifies 110 Prosperity indicators to track in order to measure Metro Boston's progress toward reaching MetroFuture's twelve Prosperity Goals. The region has made positive progress in 60 of these indicators since the year 2000, but has moved in the wrong direction in 50 indicators. This dashboard provides a snapshot of the region's progress in each of these 110 indicators.
\.


--
-- Name: topic_areas_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('topic_areas_id_seq', 6, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, admin) FROM stdin;
3	hstclair@mapc.org	$2a$10$DZq4KQ3p85Th.0ggzs4Qbu7AA/QPmal8cSKn4wfX3nF/Ecevk4sLi	\N	\N	\N	0	\N	\N	\N	\N	2014-05-08 16:50:10.476199	2014-05-09 00:05:41.686303	f
1	mcloyd@mapc.org	$2a$10$Sa9O5ARo9GiG/2P5/tOuAecAhVrU.gJZ2rHm8XDBZCDsc6Uj7ADPO	\N	\N	\N	4	2014-05-23 00:07:35.629346	2014-05-13 15:09:17	127.0.0.1	127.0.0.1	2014-04-23 16:55:30.89006	2014-05-23 00:07:35.632126	t
4	jpartridge@mapc.org	$2a$10$vxLk35eXkM0PEjh3eT/cWuZ9YtMBPQ/G0PV8/IX1NLgAlpSkek2wq	\N	\N	\N	0	\N	\N	\N	\N	2014-05-08 16:50:10.585921	2015-03-23 19:21:24.094097	t
2	mgardner@mapc.org	$2a$10$ZTD4g72vV9cyWUSX.D20b.dtUruzvDbeLUtIXWjiM/3bxMt4M5dVS	\N	\N	\N	2	2015-03-23 19:34:10.257516	2015-03-23 18:06:26.755002	127.0.0.1	172.17.42.1	2015-03-23 18:06:26.738616	2015-03-23 19:34:10.263524	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Data for Name: visualizations; Type: TABLE DATA; Schema: regionalindicators; Owner: editor
--

COPY visualizations (id, title, created_at, updated_at, explanation_id, data_file_name, data_content_type, data_file_size, data_updated_at, d3_file_name, d3_content_type, d3_file_size, d3_updated_at) FROM stdin;
1	Total Employment 2001-2012	2014-05-23 00:45:42.771013	2014-05-23 00:45:42.771013	90	emp_by_year_comm_type.csv	\N	\N	\N	econ_context_total_employment.js	\N	\N	\N
2	Employment Change In Metro Boston Firms, 2005-2012	2014-05-23 00:45:42.78843	2014-05-23 00:45:42.78843	90	employment_change_msa.csv	\N	\N	\N	econ_context_employment_change.js	\N	\N	\N
3	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.803786	2014-05-23 00:45:42.803786	91	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
4	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.817463	2014-05-23 00:45:42.817463	92	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
5	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.829769	2014-05-23 00:45:42.829769	93	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
6	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.840888	2014-05-23 00:45:42.840888	94	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
7	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.854987	2014-05-23 00:45:42.854987	95	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
8	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.870784	2014-05-23 00:45:42.870784	96	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
9	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.880109	2014-05-23 00:45:42.880109	97	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
10	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.889038	2014-05-23 00:45:42.889038	98	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
11	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.898293	2014-05-23 00:45:42.898293	99	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
12	Employment in Metro Boston Firms by Industry, 2001-2012	2014-05-23 00:45:42.913551	2014-05-23 00:45:42.913551	100	employment_change_by_industry_metroboston.csv	\N	\N	\N	econ_context_employment_by_industry.js	\N	\N	\N
13	High Skill Jobs as Percent of Total Employment, 2004-2012	2014-05-23 00:45:42.934472	2014-05-23 00:45:42.934472	113	employment_by_skill_level_msa.csv	\N	\N	\N	econ_context_high_skill_jobs.js	\N	\N	\N
14	Mid Skill Jobs as Percent of Total Employment, 2004-2012	2014-05-23 00:45:42.993736	2014-05-23 00:45:42.993736	114	employment_by_skill_level_msa.csv	\N	\N	\N	econ_context_mid_skill_jobs.js	\N	\N	\N
15	Low Skill Jobs as Percent of Total Employment, 2004-2012	2014-05-23 00:45:43.010876	2014-05-23 00:45:43.010876	115	employment_by_skill_level_msa.csv	\N	\N	\N	econ_context_low_skill_jobs.js	\N	\N	\N
16	% of Working Age Adults with at least a 2 to 4 year degree by Puma Community Type	2014-05-23 00:45:43.02809	2014-05-23 00:45:43.02809	40	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce1_with_degree_by_type_mbc.js	\N	\N	\N
17	Share of Adults Ages 25+ With a 2- or 4-Year Degree or Higher Among 25 Most Populous Metro Areas	2014-05-23 00:45:43.04444	2014-05-23 00:45:43.04444	40	edattain_by_msa.csv	\N	\N	\N	EducatedWorkforce2_share_adults_with_degree_lc.js	\N	\N	\N
18	% of Working Age Adults with at least a 2 to 4 year degree by Race and Puma Community Type	2014-05-23 00:45:43.055738	2014-05-23 00:45:43.055738	3	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce3_with_degree_by_race_type_mbc.js	\N	\N	\N
19	% of Working Age Adults with at least a 2 to 4 year degree by Race and Puma Community Type	2014-05-23 00:45:43.065515	2014-05-23 00:45:43.065515	4	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce3_with_degree_by_race_type_mbc.js	\N	\N	\N
20	% of Working Age Adults with at least a 2 to 4 year degree by Race and Puma Community Type	2014-05-23 00:45:43.074372	2014-05-23 00:45:43.074372	5	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce3_with_degree_by_race_type_mbc.js	\N	\N	\N
21	Bachelors Degree or Higher Attainment Gap. Adults of Color Compared to White Adults	2014-05-23 00:45:43.085834	2014-05-23 00:45:43.085834	3	edattain_gap_msa.csv	\N	\N	\N	EducatedWorkforce4_with_degree_gap_by_race_mbc.js	\N	\N	\N
22	Bachelors Degree or Higher Attainment Gap. Adults of Color Compared to White Adults	2014-05-23 00:45:43.096472	2014-05-23 00:45:43.096472	4	edattain_gap_msa.csv	\N	\N	\N	EducatedWorkforce4_with_degree_gap_by_race_mbc.js	\N	\N	\N
23	Bachelors Degree or Higher Attainment Gap. Adults of Color Compared to White Adults	2014-05-23 00:45:43.108905	2014-05-23 00:45:43.108905	5	edattain_gap_msa.csv	\N	\N	\N	EducatedWorkforce4_with_degree_gap_by_race_mbc.js	\N	\N	\N
24	% of Working Age Adults with No High School Diploma by Puma Community Type	2014-05-23 00:45:43.120547	2014-05-23 00:45:43.120547	41	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce5_adults_without_HS_diploma_by_comm_type.js	\N	\N	\N
25	Share of Adults Ages 25+ Without a High School Diploma Among 25 Most Populous Metro Areas	2014-05-23 00:45:43.134173	2014-05-23 00:45:43.134173	41	edattain_by_msa.csv	\N	\N	\N	EducatedWorkforce6_share_adults_without_HS_diploma_lc.js	\N	\N	\N
26	% Adults Less Than a High School Diploma by Race and Puma Community Type	2014-05-23 00:45:43.147924	2014-05-23 00:45:43.147924	18	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce7_without_HS_diploma_by_race_type_mbc.js	\N	\N	\N
27	% Adults Less Than a High School Diploma by Race and Puma Community Type	2014-05-23 00:45:43.161285	2014-05-23 00:45:43.161285	19	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce7_without_HS_diploma_by_race_type_mbc.js	\N	\N	\N
28	% Adults Less Than a High School Diploma by Race and Puma Community Type	2014-05-23 00:45:43.173357	2014-05-23 00:45:43.173357	20	edattain_by_race_puma.csv	\N	\N	\N	EducatedWorkforce7_without_HS_diploma_by_race_type_mbc.js	\N	\N	\N
29	No High School Diploma Attainment Gap. Adults of Color Compared to White Adults	2014-05-23 00:45:43.19007	2014-05-23 00:45:43.19007	18	edattain_gap_msa.csv	\N	\N	\N	EducatedWorkforce8_without_HS_diploma_gap_by_race_mbc.js	\N	\N	\N
30	No High School Diploma Attainment Gap. Adults of Color Compared to White Adults	2014-05-23 00:45:43.208322	2014-05-23 00:45:43.208322	19	edattain_gap_msa.csv	\N	\N	\N	EducatedWorkforce8_without_HS_diploma_gap_by_race_mbc.js	\N	\N	\N
31	No High School Diploma Attainment Gap. Adults of Color Compared to White Adults	2014-05-23 00:45:43.219097	2014-05-23 00:45:43.219097	20	edattain_gap_msa.csv	\N	\N	\N	EducatedWorkforce8_without_HS_diploma_gap_by_race_mbc.js	\N	\N	\N
32	Debt to Degree Ratio by Sector	2014-05-23 00:45:43.230555	2014-05-23 00:45:43.230555	6	debttodegree_average.csv	\N	\N	\N	EducatedWorkforce10_debt_to_degree_average_mbc_lc.js	\N	\N	\N
33	Debt to Degree Ratio by Sector	2014-05-23 00:45:43.240507	2014-05-23 00:45:43.240507	7	debttodegree_average.csv	\N	\N	\N	EducatedWorkforce10_debt_to_degree_average_mbc_lc.js	\N	\N	\N
34	Debt to Degree Ratio by Year	2014-05-23 00:45:43.251542	2014-05-23 00:45:43.251542	6	debttodegree.csv	\N	\N	\N	EducatedWorkforce9_debt_to_degree_ratio_lc.js	\N	\N	\N
35	Debt to Degree Ratio by Year	2014-05-23 00:45:43.263438	2014-05-23 00:45:43.263438	7	debttodegree.csv	\N	\N	\N	EducatedWorkforce9_debt_to_degree_ratio_lc.js	\N	\N	\N
\.


--
-- Name: visualizations_id_seq; Type: SEQUENCE SET; Schema: regionalindicators; Owner: editor
--

SELECT pg_catalog.setval('visualizations_id_seq', 35, true);


--
-- Name: explanations_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY explanations
    ADD CONSTRAINT explanations_pkey PRIMARY KEY (id);


--
-- Name: explanations_sources_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY explanations_sources
    ADD CONSTRAINT explanations_sources_pkey PRIMARY KEY (id);


--
-- Name: goals_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: indicator_groups_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY indicator_groups
    ADD CONSTRAINT indicator_groups_pkey PRIMARY KEY (id);


--
-- Name: indicators_issue_areas_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY indicators_issue_areas
    ADD CONSTRAINT indicators_issue_areas_pkey PRIMARY KEY (id);


--
-- Name: indicators_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY indicators
    ADD CONSTRAINT indicators_pkey PRIMARY KEY (id);


--
-- Name: issue_areas_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY issue_areas
    ADD CONSTRAINT issue_areas_pkey PRIMARY KEY (id);


--
-- Name: objectives_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY objectives
    ADD CONSTRAINT objectives_pkey PRIMARY KEY (id);


--
-- Name: rails_admin_histories_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY rails_admin_histories
    ADD CONSTRAINT rails_admin_histories_pkey PRIMARY KEY (id);


--
-- Name: snapshots_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY snapshots
    ADD CONSTRAINT snapshots_pkey PRIMARY KEY (id);


--
-- Name: sources_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: static_pages_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: topic_areas_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY topic_areas
    ADD CONSTRAINT topic_areas_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visualizations_pkey; Type: CONSTRAINT; Schema: regionalindicators; Owner: editor; Tablespace: 
--

ALTER TABLE ONLY visualizations
    ADD CONSTRAINT visualizations_pkey PRIMARY KEY (id);


--
-- Name: index_explanations_sources_on_explanation_id_and_source_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_explanations_sources_on_explanation_id_and_source_id ON explanations_sources USING btree (explanation_id, source_id);


--
-- Name: index_goals_on_description; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_goals_on_description ON goals USING gin (to_tsvector('english'::regconfig, (description)::text));


--
-- Name: index_goals_on_title; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_goals_on_title ON goals USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: index_goals_on_topic_area_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_goals_on_topic_area_id ON goals USING btree (topic_area_id);


--
-- Name: index_indicators_issue_areas_on_indicator_id_and_issue_area_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE UNIQUE INDEX index_indicators_issue_areas_on_indicator_id_and_issue_area_id ON indicators_issue_areas USING btree (indicator_id, issue_area_id);


--
-- Name: index_indicators_on_indicator_group_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_indicators_on_indicator_group_id ON indicators USING btree (indicator_group_id);


--
-- Name: index_indicators_on_objective_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_indicators_on_objective_id ON indicators USING btree (objective_id);


--
-- Name: index_indicators_on_subject_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_indicators_on_subject_id ON indicators USING btree (subject_id);


--
-- Name: index_indicators_on_title; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_indicators_on_title ON indicators USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: index_objectives_on_goal_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_objectives_on_goal_id ON objectives USING btree (goal_id);


--
-- Name: index_rails_admin_histories; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_rails_admin_histories ON rails_admin_histories USING btree (item, "table", month, year);


--
-- Name: index_snapshots_on_indicator_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_snapshots_on_indicator_id ON snapshots USING btree (indicator_id);


--
-- Name: index_subjects_on_topic_area_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_subjects_on_topic_area_id ON subjects USING btree (topic_area_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_visualizations_on_explanation_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE INDEX index_visualizations_on_explanation_id ON visualizations USING btree (explanation_id);


--
-- Name: index_visualizations_on_title_and_explanation_id; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE UNIQUE INDEX index_visualizations_on_title_and_explanation_id ON visualizations USING btree (title, explanation_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: regionalindicators; Owner: editor; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: regionalindicators; Type: ACL; Schema: -; Owner: editor
--

REVOKE ALL ON SCHEMA regionalindicators FROM PUBLIC;
REVOKE ALL ON SCHEMA regionalindicators FROM editor;
GRANT ALL ON SCHEMA regionalindicators TO editor;
GRANT ALL ON SCHEMA regionalindicators TO PUBLIC;


--
-- Name: explanations; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE explanations FROM PUBLIC;
REVOKE ALL ON TABLE explanations FROM editor;
GRANT ALL ON TABLE explanations TO editor;
GRANT SELECT ON TABLE explanations TO viewer;


--
-- Name: explanations_sources; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE explanations_sources FROM PUBLIC;
REVOKE ALL ON TABLE explanations_sources FROM editor;
GRANT ALL ON TABLE explanations_sources TO editor;
GRANT SELECT ON TABLE explanations_sources TO viewer;


--
-- Name: goals; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE goals FROM PUBLIC;
REVOKE ALL ON TABLE goals FROM editor;
GRANT ALL ON TABLE goals TO editor;
GRANT SELECT ON TABLE goals TO viewer;


--
-- Name: indicator_groups; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE indicator_groups FROM PUBLIC;
REVOKE ALL ON TABLE indicator_groups FROM editor;
GRANT ALL ON TABLE indicator_groups TO editor;
GRANT SELECT ON TABLE indicator_groups TO viewer;


--
-- Name: indicators; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE indicators FROM PUBLIC;
REVOKE ALL ON TABLE indicators FROM editor;
GRANT ALL ON TABLE indicators TO editor;
GRANT SELECT ON TABLE indicators TO viewer;


--
-- Name: indicators_issue_areas; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE indicators_issue_areas FROM PUBLIC;
REVOKE ALL ON TABLE indicators_issue_areas FROM editor;
GRANT ALL ON TABLE indicators_issue_areas TO editor;
GRANT SELECT ON TABLE indicators_issue_areas TO viewer;


--
-- Name: issue_areas; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE issue_areas FROM PUBLIC;
REVOKE ALL ON TABLE issue_areas FROM editor;
GRANT ALL ON TABLE issue_areas TO editor;
GRANT SELECT ON TABLE issue_areas TO viewer;


--
-- Name: objectives; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE objectives FROM PUBLIC;
REVOKE ALL ON TABLE objectives FROM editor;
GRANT ALL ON TABLE objectives TO editor;
GRANT SELECT ON TABLE objectives TO viewer;


--
-- Name: rails_admin_histories; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE rails_admin_histories FROM PUBLIC;
REVOKE ALL ON TABLE rails_admin_histories FROM editor;
GRANT ALL ON TABLE rails_admin_histories TO editor;
GRANT SELECT ON TABLE rails_admin_histories TO viewer;


--
-- Name: schema_migrations; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE schema_migrations FROM PUBLIC;
REVOKE ALL ON TABLE schema_migrations FROM editor;
GRANT ALL ON TABLE schema_migrations TO editor;
GRANT SELECT ON TABLE schema_migrations TO viewer;


--
-- Name: searches; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE searches FROM PUBLIC;
REVOKE ALL ON TABLE searches FROM editor;
GRANT ALL ON TABLE searches TO editor;
GRANT SELECT ON TABLE searches TO viewer;


--
-- Name: snapshots; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE snapshots FROM PUBLIC;
REVOKE ALL ON TABLE snapshots FROM editor;
GRANT ALL ON TABLE snapshots TO editor;
GRANT SELECT ON TABLE snapshots TO viewer;


--
-- Name: sources; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE sources FROM PUBLIC;
REVOKE ALL ON TABLE sources FROM editor;
GRANT ALL ON TABLE sources TO editor;
GRANT SELECT ON TABLE sources TO viewer;


--
-- Name: static_pages; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE static_pages FROM PUBLIC;
REVOKE ALL ON TABLE static_pages FROM editor;
GRANT ALL ON TABLE static_pages TO editor;
GRANT SELECT ON TABLE static_pages TO viewer;


--
-- Name: subjects; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE subjects FROM PUBLIC;
REVOKE ALL ON TABLE subjects FROM editor;
GRANT ALL ON TABLE subjects TO editor;
GRANT SELECT ON TABLE subjects TO viewer;


--
-- Name: topic_areas; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE topic_areas FROM PUBLIC;
REVOKE ALL ON TABLE topic_areas FROM editor;
GRANT ALL ON TABLE topic_areas TO editor;
GRANT SELECT ON TABLE topic_areas TO viewer;


--
-- Name: users; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM editor;
GRANT ALL ON TABLE users TO editor;


--
-- Name: visualizations; Type: ACL; Schema: regionalindicators; Owner: editor
--

REVOKE ALL ON TABLE visualizations FROM PUBLIC;
REVOKE ALL ON TABLE visualizations FROM editor;
GRANT ALL ON TABLE visualizations TO editor;
GRANT SELECT ON TABLE visualizations TO viewer;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: regionalindicators; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA regionalindicators REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA regionalindicators REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA regionalindicators GRANT SELECT ON TABLES  TO editor;


--
-- PostgreSQL database dump complete
--

