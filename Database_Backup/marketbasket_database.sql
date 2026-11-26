--
-- PostgreSQL database dump
--

\restrict qSPR1KY8FIocLPdnOCJf6ohghgBb4oIfxChdGLuDoWv6Lmb1uOkgAPbnbRGJE87

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-08-03 21:33:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 248 (class 1259 OID 16688)
-- Name: activity_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_logs (
    activity_id integer NOT NULL,
    admin_id integer,
    activity_type character varying(100),
    module character varying(100),
    description text,
    ip_address character varying(100),
    device_info text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.activity_logs OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16687)
-- Name: activity_logs_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_logs_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_logs_activity_id_seq OWNER TO postgres;

--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 247
-- Name: activity_logs_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_logs_activity_id_seq OWNED BY public.activity_logs.activity_id;


--
-- TOC entry 223 (class 1259 OID 16414)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    role character varying(30) DEFAULT 'Admin'::character varying,
    phone character varying(20),
    profile_image text,
    is_active boolean DEFAULT true,
    last_login timestamp without time zone
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16413)
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 222
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- TOC entry 250 (class 1259 OID 16705)
-- Name: ai_conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_conversations (
    conversation_id integer NOT NULL,
    admin_id integer,
    title character varying(255),
    status character varying(30) DEFAULT 'Active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ai_conversations OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16704)
-- Name: ai_conversations_conversation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_conversations_conversation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_conversations_conversation_id_seq OWNER TO postgres;

--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 249
-- Name: ai_conversations_conversation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_conversations_conversation_id_seq OWNED BY public.ai_conversations.conversation_id;


--
-- TOC entry 252 (class 1259 OID 16721)
-- Name: ai_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_messages (
    message_id integer NOT NULL,
    conversation_id integer NOT NULL,
    sender character varying(20) NOT NULL,
    message text NOT NULL,
    response_time_ms integer,
    token_usage integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ai_messages OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16720)
-- Name: ai_messages_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_messages_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_messages_message_id_seq OWNER TO postgres;

--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 251
-- Name: ai_messages_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_messages_message_id_seq OWNED BY public.ai_messages.message_id;


--
-- TOC entry 220 (class 1259 OID 16403)
-- Name: association_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.association_rules (
    antecedents text,
    consequents text,
    antecedent_support double precision,
    consequent_support double precision,
    support double precision,
    confidence double precision,
    lift double precision,
    representativity double precision,
    leverage double precision,
    conviction double precision,
    zhangs_metric double precision,
    jaccard double precision,
    certainty double precision,
    kulczynski double precision,
    rule_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.association_rules OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16448)
-- Name: association_rules_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.association_rules_rule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.association_rules_rule_id_seq OWNER TO postgres;

--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 226
-- Name: association_rules_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.association_rules_rule_id_seq OWNED BY public.association_rules.rule_id;


--
-- TOC entry 225 (class 1259 OID 16429)
-- Name: business_insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_insights (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    description text NOT NULL,
    insight_type character varying(50) NOT NULL,
    priority character varying(20) DEFAULT 'Medium'::character varying,
    status character varying(20) DEFAULT 'Active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    source character varying(100),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.business_insights OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16428)
-- Name: business_insights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_insights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_insights_id_seq OWNER TO postgres;

--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 224
-- Name: business_insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_insights_id_seq OWNED BY public.business_insights.id;


--
-- TOC entry 232 (class 1259 OID 16512)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL,
    description text,
    status character varying(20) DEFAULT 'Active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16511)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 231
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 221 (class 1259 OID 16408)
-- Name: customer_segments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_segments (
    customer_id integer,
    recency bigint,
    frequency bigint,
    monetary double precision,
    cluster bigint,
    segment_name text,
    segment_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customer_segments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16462)
-- Name: customer_segments_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_segments_segment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_segments_segment_id_seq OWNER TO postgres;

--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 227
-- Name: customer_segments_segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_segments_segment_id_seq OWNED BY public.customer_segments.segment_id;


--
-- TOC entry 230 (class 1259 OID 16493)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(150) NOT NULL,
    email character varying(150),
    phone character varying(20),
    gender character varying(20),
    city character varying(100),
    state character varying(100),
    country character varying(100),
    total_orders integer DEFAULT 0,
    total_spent numeric(12,2) DEFAULT 0,
    average_order_value numeric(12,2) DEFAULT 0,
    customer_status character varying(30) DEFAULT 'Active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16492)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 229
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 256 (class 1259 OID 16760)
-- Name: forecast_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forecast_models (
    model_id integer NOT NULL,
    model_name character varying(100) NOT NULL,
    model_version character varying(50),
    model_type character varying(50),
    training_data_days integer,
    training_start_date date,
    training_end_date date,
    mape double precision,
    mae double precision,
    rmse double precision,
    accuracy_percentage double precision,
    status character varying(30) DEFAULT 'Active'::character varying,
    is_active boolean DEFAULT true,
    trained_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_forecast_model_status CHECK (((status)::text = ANY ((ARRAY['Active'::character varying, 'Training'::character varying, 'Failed'::character varying, 'Archived'::character varying])::text[])))
);


ALTER TABLE public.forecast_models OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16759)
-- Name: forecast_models_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forecast_models_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forecast_models_model_id_seq OWNER TO postgres;

--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 255
-- Name: forecast_models_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forecast_models_model_id_seq OWNED BY public.forecast_models.model_id;


--
-- TOC entry 258 (class 1259 OID 16798)
-- Name: forecast_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forecast_results (
    forecast_id integer NOT NULL,
    model_id integer NOT NULL,
    category_id integer,
    forecast_date date NOT NULL,
    forecast_type character varying(50) DEFAULT 'Revenue'::character varying,
    frequency character varying(30) DEFAULT 'Daily'::character varying,
    historical_value double precision,
    forecasted_value double precision NOT NULL,
    lower_bound double precision,
    upper_bound double precision,
    confidence_percentage double precision,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_forecast_frequency CHECK (((frequency)::text = ANY ((ARRAY['Daily'::character varying, 'Weekly'::character varying, 'Monthly'::character varying])::text[]))),
    CONSTRAINT chk_forecast_type CHECK (((forecast_type)::text = ANY ((ARRAY['Revenue'::character varying, 'Orders'::character varying, 'Units'::character varying])::text[]))),
    CONSTRAINT chk_forecast_values CHECK ((forecasted_value >= (0)::double precision))
);


ALTER TABLE public.forecast_results OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16797)
-- Name: forecast_results_forecast_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forecast_results_forecast_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forecast_results_forecast_id_seq OWNER TO postgres;

--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 257
-- Name: forecast_results_forecast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forecast_results_forecast_id_seq OWNED BY public.forecast_results.forecast_id;


--
-- TOC entry 236 (class 1259 OID 16551)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    product_id integer NOT NULL,
    available_stock integer DEFAULT 0,
    reserved_stock integer DEFAULT 0,
    damaged_stock integer DEFAULT 0,
    reorder_level integer DEFAULT 20,
    warehouse_location character varying(100),
    last_restock_date date,
    supplier_name character varying(150),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16550)
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 235
-- Name: inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.inventory.inventory_id;


--
-- TOC entry 246 (class 1259 OID 16669)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    notification_id integer NOT NULL,
    admin_id integer,
    title character varying(255) NOT NULL,
    message text,
    notification_type character varying(100),
    priority character varying(20) DEFAULT 'Medium'::character varying,
    is_read boolean DEFAULT false,
    action_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16668)
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_notification_id_seq OWNER TO postgres;

--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 245
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;


--
-- TOC entry 240 (class 1259 OID 16589)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    discount numeric(10,2) DEFAULT 0,
    total_price numeric(12,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16588)
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_order_item_id_seq OWNER TO postgres;

--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 239
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;


--
-- TOC entry 238 (class 1259 OID 16570)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    order_status character varying(30) DEFAULT 'Completed'::character varying,
    payment_method character varying(50),
    payment_status character varying(30) DEFAULT 'Paid'::character varying,
    subtotal numeric(12,2),
    tax numeric(12,2),
    discount numeric(12,2),
    total_amount numeric(12,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16569)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 237
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 234 (class 1259 OID 16528)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(200) NOT NULL,
    sku character varying(100),
    category_id integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    cost_price numeric(10,2),
    stock_quantity integer DEFAULT 0,
    reorder_level integer DEFAULT 20,
    supplier_name character varying(150),
    status character varying(30) DEFAULT 'Active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16527)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 233
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 244 (class 1259 OID 16647)
-- Name: report_downloads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_downloads (
    download_id integer NOT NULL,
    report_id integer NOT NULL,
    downloaded_by integer NOT NULL,
    download_format character varying(20) NOT NULL,
    download_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ip_address character varying(50),
    device character varying(100)
);


ALTER TABLE public.report_downloads OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16646)
-- Name: report_downloads_download_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_downloads_download_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_downloads_download_id_seq OWNER TO postgres;

--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 243
-- Name: report_downloads_download_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_downloads_download_id_seq OWNED BY public.report_downloads.download_id;


--
-- TOC entry 242 (class 1259 OID 16628)
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    report_id integer NOT NULL,
    report_name character varying(255) NOT NULL,
    report_type character varying(100) NOT NULL,
    description text,
    generated_by integer,
    format character varying(20),
    status character varying(30),
    file_path text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16627)
-- Name: reports_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_report_id_seq OWNER TO postgres;

--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 241
-- Name: reports_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_report_id_seq OWNED BY public.reports.report_id;


--
-- TOC entry 219 (class 1259 OID 16388)
-- Name: sales_forecasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_forecasts (
    forecast_month text,
    forecast_value double precision,
    time_index bigint,
    forecast_id integer NOT NULL,
    forecast_type character varying(50) DEFAULT 'Revenue'::character varying,
    model_name character varying(100) DEFAULT 'Prophet'::character varying,
    accuracy numeric(5,2),
    confidence_score numeric(5,2),
    status character varying(30) DEFAULT 'Active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sales_forecasts OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16476)
-- Name: sales_forecasts_forecast_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_forecasts_forecast_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_forecasts_forecast_id_seq OWNER TO postgres;

--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 228
-- Name: sales_forecasts_forecast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_forecasts_forecast_id_seq OWNED BY public.sales_forecasts.forecast_id;


--
-- TOC entry 254 (class 1259 OID 16740)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    setting_id integer NOT NULL,
    setting_key character varying(100) NOT NULL,
    setting_value text,
    category character varying(100),
    description text,
    updated_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16739)
-- Name: settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_setting_id_seq OWNER TO postgres;

--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 253
-- Name: settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_setting_id_seq OWNED BY public.settings.setting_id;


--
-- TOC entry 5014 (class 2604 OID 16691)
-- Name: activity_logs activity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_logs ALTER COLUMN activity_id SET DEFAULT nextval('public.activity_logs_activity_id_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 16417)
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- TOC entry 5016 (class 2604 OID 16708)
-- Name: ai_conversations conversation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_conversations ALTER COLUMN conversation_id SET DEFAULT nextval('public.ai_conversations_conversation_id_seq'::regclass);


--
-- TOC entry 5020 (class 2604 OID 16724)
-- Name: ai_messages message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_messages ALTER COLUMN message_id SET DEFAULT nextval('public.ai_messages_message_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 16449)
-- Name: association_rules rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.association_rules ALTER COLUMN rule_id SET DEFAULT nextval('public.association_rules_rule_id_seq'::regclass);


--
-- TOC entry 4968 (class 2604 OID 16432)
-- Name: business_insights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_insights ALTER COLUMN id SET DEFAULT nextval('public.business_insights_id_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 16515)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 16463)
-- Name: customer_segments segment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_segments ALTER COLUMN segment_id SET DEFAULT nextval('public.customer_segments_segment_id_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 16496)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 5025 (class 2604 OID 16763)
-- Name: forecast_models model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecast_models ALTER COLUMN model_id SET DEFAULT nextval('public.forecast_models_model_id_seq'::regclass);


--
-- TOC entry 5031 (class 2604 OID 16801)
-- Name: forecast_results forecast_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecast_results ALTER COLUMN forecast_id SET DEFAULT nextval('public.forecast_results_forecast_id_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 16554)
-- Name: inventory inventory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 16672)
-- Name: notifications notification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- TOC entry 5002 (class 2604 OID 16592)
-- Name: order_items order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);


--
-- TOC entry 4996 (class 2604 OID 16573)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4984 (class 2604 OID 16531)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 16650)
-- Name: report_downloads download_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_downloads ALTER COLUMN download_id SET DEFAULT nextval('public.report_downloads_download_id_seq'::regclass);


--
-- TOC entry 5005 (class 2604 OID 16631)
-- Name: reports report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN report_id SET DEFAULT nextval('public.reports_report_id_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 16477)
-- Name: sales_forecasts forecast_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_forecasts ALTER COLUMN forecast_id SET DEFAULT nextval('public.sales_forecasts_forecast_id_seq'::regclass);


--
-- TOC entry 5022 (class 2604 OID 16743)
-- Name: settings setting_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN setting_id SET DEFAULT nextval('public.settings_setting_id_seq'::regclass);


--
-- TOC entry 5286 (class 0 OID 16688)
-- Dependencies: 248
-- Data for Name: activity_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_logs (activity_id, admin_id, activity_type, module, description, ip_address, device_info, created_at) FROM stdin;
1	1	Login	Authentication	Administrator logged into system.	192.168.1.5	Chrome Windows 11	2026-07-31 22:55:25.761576
2	1	Export Report	Reports	Executive Summary exported as PDF.	192.168.1.5	Chrome Windows 11	2026-07-31 22:55:25.761576
3	1	Forecast Generated	Sales Forecast	Generated 30-day revenue forecast.	192.168.1.5	Chrome Windows 11	2026-07-31 22:55:25.761576
4	1	AI Chat	AI Assistant	Asked AI about top-selling products.	192.168.1.5	Chrome Windows 11	2026-07-31 22:55:25.761576
5	1	Settings Updated	Settings	Changed theme from Light to Dark.	192.168.1.5	Chrome Windows 11	2026-07-31 22:55:25.761576
\.


--
-- TOC entry 5261 (class 0 OID 16414)
-- Dependencies: 223
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, name, email, password, created_at, updated_at, role, phone, profile_image, is_active, last_login) FROM stdin;
1	Administrator	dibyashasahoo682@gmail.com	$2b$12$pv6GsgRh4MZmTKWCi8v8X.8sr5wMPmOWhv7lXZz8XPJxoDbnSTiTe	2026-07-30 11:06:31.71017	2026-07-30 11:06:31.71017	Admin	\N	\N	t	\N
\.


--
-- TOC entry 5288 (class 0 OID 16705)
-- Dependencies: 250
-- Data for Name: ai_conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ai_conversations (conversation_id, admin_id, title, status, created_at, updated_at) FROM stdin;
1	1	Sales Performance Analysis	Active	2026-07-31 22:56:11.227962	2026-07-31 22:56:11.227962
2	1	Customer Segmentation Insights	Active	2026-07-31 22:56:11.227962	2026-07-31 22:56:11.227962
3	1	Revenue Forecast Discussion	Active	2026-07-31 22:56:11.227962	2026-07-31 22:56:11.227962
4	1	Market Basket Analysis	Active	2026-07-31 22:56:11.227962	2026-07-31 22:56:11.227962
5	1	Inventory Optimization	Active	2026-07-31 22:56:11.227962	2026-07-31 22:56:11.227962
\.


--
-- TOC entry 5290 (class 0 OID 16721)
-- Dependencies: 252
-- Data for Name: ai_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ai_messages (message_id, conversation_id, sender, message, response_time_ms, token_usage, created_at) FROM stdin;
1	1	User	Show me the top selling products.	\N	\N	2026-07-31 22:57:02.585696
2	1	AI	The top selling products are Milk, Bread, Coffee, Soft Drinks and Butter.	850	420	2026-07-31 22:57:02.585696
3	2	User	Which customer segment generates the highest revenue?	\N	\N	2026-07-31 22:57:02.585696
4	2	AI	Premium customers generate nearly 62% of total revenue.	910	465	2026-07-31 22:57:02.585696
5	3	User	Forecast next month revenue.	\N	\N	2026-07-31 22:57:02.585696
6	3	AI	Projected revenue for next month is expected to increase by approximately 9%.	970	510	2026-07-31 22:57:02.585696
\.


--
-- TOC entry 5258 (class 0 OID 16403)
-- Dependencies: 220
-- Data for Name: association_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.association_rules (antecedents, consequents, antecedent_support, consequent_support, support, confidence, lift, representativity, leverage, conviction, zhangs_metric, jaccard, certainty, kulczynski, rule_id, created_at, updated_at) FROM stdin;
frozenset({'PINK REGENCY TEACUP AND SAUCER'})	frozenset({'GREEN REGENCY TEACUP AND SAUCER', 'ROSES REGENCY TEACUP AND SAUCER '})	0.0300021584286639	0.0291927476796891	0.0210446794733434	0.7014388489208634	24.02784611497494	1	0.0201688340324893	3.251619471627066	0.9880244884917782	0.5516265912305517	0.6924609387027647	0.7111630473809493	1	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GREEN REGENCY TEACUP AND SAUCER', 'ROSES REGENCY TEACUP AND SAUCER '})	frozenset({'PINK REGENCY TEACUP AND SAUCER'})	0.0291927476796891	0.0300021584286639	0.0210446794733434	0.7208872458410351	24.02784611497493	1	0.0201688340324893	3.47529028006684	0.9872007228685566	0.5516265912305517	0.7122542523323355	0.7111630473809493	2	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	frozenset({'PINK REGENCY TEACUP AND SAUCER', 'ROSES REGENCY TEACUP AND SAUCER '})	0.0372868551694366	0.0235268724368659	0.0210446794733434	0.5643994211287988	23.989564386144263	1	0.0201674363882001	2.2416708675951016	0.9954317266911852	0.5291723202170963	0.5539041817174458	0.7294474169864178	3	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'PINK REGENCY TEACUP AND SAUCER', 'ROSES REGENCY TEACUP AND SAUCER '})	frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	0.0235268724368659	0.0372868551694366	0.0210446794733434	0.8944954128440368	23.989564386144263	1	0.0201674363882001	9.124846329263606	0.9814045886327052	0.5291723202170963	0.8904091133246841	0.7294474169864178	4	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'PINK REGENCY TEACUP AND SAUCER'})	frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	0.0300021584286639	0.0372868551694366	0.0248219296352255	0.827338129496403	22.18846630365751	1	0.0237032434991254	5.575713630477015	0.9844676960585128	0.5844980940279544	0.8206507603737089	0.7465200054139034	5	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	frozenset({'PINK REGENCY TEACUP AND SAUCER'})	0.0372868551694366	0.0300021584286639	0.0248219296352255	0.6657018813314037	22.188466303657503	1	0.0237032434991254	2.9015952750034337	0.9919170060169176	0.5844980940279544	0.6553619973761445	0.7465200054139034	6	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	frozenset({'GREEN REGENCY TEACUP AND SAUCER', 'PINK REGENCY TEACUP AND SAUCER'})	0.0422512410964817	0.0248219296352255	0.0210446794733434	0.4980842911877394	20.06630018324171	1	0.0199959221398455	1.942912033322184	0.9920818941045432	0.4572098475967174	0.4853086589359887	0.6729551890721306	7	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GREEN REGENCY TEACUP AND SAUCER', 'PINK REGENCY TEACUP AND SAUCER'})	frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	0.0248219296352255	0.0422512410964817	0.0210446794733434	0.8478260869565217	20.06630018324171	1	0.0199959221398455	6.293777558508834	0.9743504614022542	0.4572098475967174	0.8411129102190693	0.6729551890721306	8	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'PINK REGENCY TEACUP AND SAUCER'})	frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	0.0300021584286639	0.0422512410964817	0.0235268724368659	0.7841726618705036	18.55975449525437	1	0.0222592440076816	4.437569249586302	0.9753835899445948	0.4828349944629014	0.774651404010602	0.6705026783171164	9	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	frozenset({'PINK REGENCY TEACUP AND SAUCER'})	0.0422512410964817	0.0300021584286639	0.0235268724368659	0.5568326947637292	18.55975449525437	1	0.0222592440076816	2.1887847549001616	0.9878582124538866	0.4828349944629014	0.5431254728171689	0.6705026783171164	10	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	0.0372868551694366	0.0422512410964817	0.0291927476796891	0.7829232995658465	18.530184658434568	1	0.0276173317721957	4.412029282682205	0.9826748519293604	0.5798499464094319	0.7733469258862057	0.7369278055939066	11	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	0.0422512410964817	0.0372868551694366	0.0291927476796891	0.6909323116219668	18.530184658434568	1	0.0276173317721957	3.1148941834807067	0.9877684395330282	0.5798499464094319	0.6789618070163269	0.7369278055939066	12	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'DOLLY GIRL LUNCH BOX'})	frozenset({'SPACEBOY LUNCH BOX '})	0.0332398014245629	0.0379883444852147	0.0228793438376861	0.6883116883116883	18.119023022432117	1	0.0216166188105497	3.0864540614432694	0.9772944601010164	0.4732142857142856	0.6760036015140345	0.6452922077922078	13	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'SPACEBOY LUNCH BOX '})	frozenset({'DOLLY GIRL LUNCH BOX'})	0.0379883444852147	0.0332398014245629	0.0228793438376861	0.6022727272727272	18.11902302243211	1	0.0216166188105497	2.430711356418241	0.9821184399354842	0.4732142857142856	0.5885977998335666	0.6452922077922078	14	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GARDENERS KNEELING PAD CUP OF TEA '})	frozenset({'GARDENERS KNEELING PAD KEEP CALM '})	0.0342650550399309	0.0407943017483272	0.0249838117850205	0.7291338582677166	17.87342415531392	1	0.0235859927902985	3.5412535952896067	0.9775467032313896	0.4989224137931034	0.7176141236170862	0.6707838603507895	15	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GARDENERS KNEELING PAD KEEP CALM '})	frozenset({'GARDENERS KNEELING PAD CUP OF TEA '})	0.0407943017483272	0.0342650550399309	0.0249838117850205	0.6124338624338624	17.87342415531392	1	0.0235859927902985	2.4917939194191545	0.984200795889524	0.4989224137931034	0.5986827031694887	0.6707838603507895	16	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ALARM CLOCK BAKELIKE RED '})	frozenset({'ALARM CLOCK BAKELIKE GREEN'})	0.0473235484567235	0.0425750053960716	0.0285991797971077	0.6043329532497149	14.194547895594065	1	0.0265843794662014	2.419774409993214	0.9757251941029051	0.4665492957746479	0.5867383356604698	0.6380346642040716	17	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ALARM CLOCK BAKELIKE GREEN'})	frozenset({'ALARM CLOCK BAKELIKE RED '})	0.0425750053960716	0.0473235484567235	0.0285991797971077	0.6717363751584283	14.194547895594065	1	0.0265843794662014	2.9021688041221814	0.9708858874985512	0.4665492957746479	0.6554301050374395	0.6380346642040716	18	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ALARM CLOCK BAKELIKE RED '})	frozenset({'ALARM CLOCK BAKELIKE PINK'})	0.0473235484567235	0.0330779192747679	0.0213684437729333	0.451539338654504	13.650778179356063	1	0.0198030792572862	1.7629743550852983	0.9727794798737874	0.3619744058500913	0.4327767745937423	0.5487713006486223	19	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ALARM CLOCK BAKELIKE PINK'})	frozenset({'ALARM CLOCK BAKELIKE RED '})	0.0330779192747679	0.0473235484567235	0.0213684437729333	0.6460032626427407	13.650778179356063	1	0.0198030792572862	2.691201220258196	0.9584475538351314	0.3619744058500913	0.628418717830375	0.5487713006486223	20	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'PAPER CHAIN KIT VINTAGE CHRISTMAS'})	frozenset({"PAPER CHAIN KIT 50'S CHRISTMAS "})	0.0376106194690265	0.0528815022663501	0.0243362831858407	0.6470588235294117	12.236014405762305	1	0.0223473771271505	2.6835024102453406	0.9541606137064504	0.3678629690048938	0.6273526730655798	0.5536314525810324	21	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({"PAPER CHAIN KIT 50'S CHRISTMAS "})	frozenset({'PAPER CHAIN KIT VINTAGE CHRISTMAS'})	0.0528815022663501	0.0376106194690265	0.0243362831858407	0.460204081632653	12.236014405762305	1	0.0223473771271505	1.7828763571273232	0.9695450401922598	0.3678629690048938	0.4391086089608256	0.5536314525810324	22	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'WOODEN FRAME ANTIQUE WHITE '})	frozenset({'WOODEN PICTURE FRAME WHITE FINISH'})	0.0437621411612346	0.0472695877401251	0.025253615368012	0.5770653514180024	12.207962434336096	1	0.0231849969966953	2.252665785255856	0.9601023846833904	0.3839212469237079	0.556081507276757	0.555655963380234	23	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'WOODEN PICTURE FRAME WHITE FINISH'})	frozenset({'WOODEN FRAME ANTIQUE WHITE '})	0.0472695877401251	0.0437621411612346	0.025253615368012	0.5342465753424657	12.207962434336096	1	0.0231849969966953	2.053098932212643	0.9636369709432692	0.3839212469237079	0.5129314109952359	0.555655963380234	24	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'HEART OF WICKER LARGE'})	frozenset({'HEART OF WICKER SMALL'})	0.0432225339952514	0.051856248650982	0.0219620116555147	0.5081148564294632	9.798527075287003	1	0.0197206531853314	1.9275714335801104	0.9385085630644256	0.3003690036900369	0.4812124818935069	0.4658160130222237	25	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'HEART OF WICKER SMALL'})	frozenset({'HEART OF WICKER LARGE'})	0.051856248650982	0.0432225339952514	0.0219620116555147	0.4235171696149843	9.798527075287003	1	0.0197206531853314	1.6596807668421725	0.94705454053243	0.3003690036900369	0.3974744902884716	0.4658160130222237	26	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG WOODLAND'})	frozenset({'LUNCH BAG SPACEBOY DESIGN '})	0.0442477876106194	0.0533131879991366	0.0218540902223181	0.4939024390243903	9.264170040485832	1	0.0194950996028873	1.8705618935920676	0.9333561957018748	0.2886671418389166	0.4654012767897857	0.4519107336822356	27	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SPACEBOY DESIGN '})	frozenset({'LUNCH BAG WOODLAND'})	0.0533131879991366	0.0442477876106194	0.0218540902223181	0.409919028340081	9.26417004048583	1	0.0194950996028873	1.619696716707904	0.9422939431299364	0.2886671418389166	0.3826004648373069	0.4519107336822356	28	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG PINK POLKADOT'})	frozenset({'LUNCH BAG CARS BLUE'})	0.0502374271530325	0.0521260522339736	0.0230412259874811	0.4586466165413533	8.798798237830601	1	0.0204225472356016	1.7509338201789095	0.9332312526952176	0.2904761904761904	0.4288761868236571	0.4503378010242999	29	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG CARS BLUE'})	frozenset({'LUNCH BAG PINK POLKADOT'})	0.0521260522339736	0.0502374271530325	0.0230412259874811	0.4420289855072463	8.7987982378306	1	0.0204225472356016	1.7021718838036557	0.9350907024187936	0.2904761904761904	0.4125152638725237	0.4503378010242999	30	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG  BLACK SKULL.'})	frozenset({'LUNCH BAG PINK POLKADOT'})	0.0567666738614288	0.0502374271530325	0.0250377725016188	0.4410646387832699	8.77960245535076	1	0.0221859608587853	1.699235079311241	0.9394278189852442	0.3054641211323238	0.4114999082967762	0.4697267339995834	31	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG PINK POLKADOT'})	frozenset({'LUNCH BAG  BLACK SKULL.'})	0.0502374271530325	0.0567666738614288	0.0250377725016188	0.4983888292158969	8.77960245535076	1	0.0221859608587853	1.8804073375482009	0.9329696196728634	0.3054641211323238	0.4682003308368994	0.4697267339995834	32	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG CARS BLUE'})	frozenset({'LUNCH BAG SUKI DESIGN '})	0.0521260522339736	0.0485106842218864	0.0210446794733434	0.4037267080745342	8.32242864742744	1	0.0185160090136875	1.595726873336211	0.9282276075285296	0.2644067796610169	0.3733263400463487	0.4187710292319279	33	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SUKI DESIGN '})	frozenset({'LUNCH BAG CARS BLUE'})	0.0485106842218864	0.0521260522339736	0.0210446794733434	0.4338153503893215	8.32242864742744	1	0.0185160090136875	1.6741427879010955	0.924700626884033	0.2644067796610169	0.4026793848010307	0.4187710292319279	34	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG PINK POLKADOT'})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.0502374271530325	0.0695014029786315	0.0282214547809194	0.5617615467239527	8.082736788733147	1	0.0247298831117469	2.1232700829090536	0.9226300913069536	0.308372641509434	0.5290283567552941	0.4839087236725354	35	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'LUNCH BAG PINK POLKADOT'})	0.0695014029786315	0.0502374271530325	0.0282214547809194	0.406055900621118	8.082736788733147	1	0.0247298831117469	1.5990773775514957	0.9417311666141088	0.308372641509434	0.3746393926657894	0.4839087236725354	36	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG  BLACK SKULL.'})	frozenset({'LUNCH BAG SUKI DESIGN '})	0.0567666738614288	0.0485106842218864	0.0220699330887114	0.3887832699619771	8.014384381463138	1	0.0193161428986928	1.5567134684270223	0.9278980378553484	0.2652399481193255	0.3576210264240549	0.4218666071723123	37	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SUKI DESIGN '})	frozenset({'LUNCH BAG  BLACK SKULL.'})	0.0485106842218864	0.0567666738614288	0.0220699330887114	0.4549499443826473	8.014384381463136	1	0.0193161428986928	1.730544408568521	0.9198467476726304	0.2652399481193255	0.4221471607150584	0.4218666071723123	38	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SUKI DESIGN '})	frozenset({'LUNCH BAG SPACEBOY DESIGN '})	0.0485106842218864	0.0533131879991366	0.0203971508741636	0.4204671857619577	7.886738751559313	1	0.0178108916462754	1.6335344414371904	0.917724312608904	0.2504970178926441	0.3878304768889991	0.4015291394396833	39	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SPACEBOY DESIGN '})	frozenset({'LUNCH BAG SUKI DESIGN '})	0.0533131879991366	0.0485106842218864	0.0203971508741636	0.3825910931174089	7.886738751559313	1	0.0178108916462754	1.5411007278504527	0.9223798908021434	0.2504970178926441	0.3511131479414632	0.4015291394396833	40	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG  BLACK SKULL.'})	frozenset({'LUNCH BAG CARS BLUE'})	0.0567666738614288	0.0521260522339736	0.0227174616878912	0.400190114068441	7.677353202811956	1	0.0197584390810414	1.5802906387477964	0.9220908048288644	0.2636192861615529	0.3672050093314556	0.4180039597257319	41	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG CARS BLUE'})	frozenset({'LUNCH BAG  BLACK SKULL.'})	0.0521260522339736	0.0567666738614288	0.0227174616878912	0.4358178053830228	7.677353202811956	1	0.0197584390810414	1.6718594367887336	0.9175764128662504	0.2636192861615529	0.4018635909243809	0.4180039597257319	42	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG WOODLAND'})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.0442477876106194	0.0695014029786315	0.023364990287071	0.5280487804878049	7.597670807453417	1	0.0202897069694324	1.9715990944638813	0.9085835257890684	0.2585074626865671	0.4927974947807934	0.4321144523557036	43	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'LUNCH BAG WOODLAND'})	0.0695014029786315	0.0442477876106194	0.023364990287071	0.3361801242236025	7.597670807453416	1	0.0202897069694324	1.43977643223102	0.933242368868939	0.2585074626865671	0.3054477225672877	0.4321144523557036	44	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG CARS BLUE'})	frozenset({'LUNCH BAG SPACEBOY DESIGN '})	0.0521260522339736	0.0533131879991366	0.0210986401899417	0.4047619047619048	7.592153460574515	1	0.018319634167539	1.5904338441614507	0.9160343176323246	0.2501599488163788	0.3712407443597594	0.4002554463080779	45	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SPACEBOY DESIGN '})	frozenset({'LUNCH BAG CARS BLUE'})	0.0533131879991366	0.0521260522339736	0.0210986401899417	0.395748987854251	7.592153460574514	1	0.018319634167539	1.5686758130533234	0.9171830154770528	0.2501599488163788	0.362519654042752	0.4002554463080779	46	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG  BLACK SKULL.'})	frozenset({'LUNCH BAG SPACEBOY DESIGN '})	0.0567666738614288	0.0533131879991366	0.0225555795380962	0.397338403041825	7.452910207663059	1	0.0195291671824362	1.5708431013011168	0.9179321822342418	0.2577065351418002	0.3633991840612803	0.410207663059374	47	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SPACEBOY DESIGN '})	frozenset({'LUNCH BAG  BLACK SKULL.'})	0.0533131879991366	0.0567666738614288	0.0225555795380962	0.4230769230769231	7.452910207663058	1	0.0195291671824362	1.6349377653068569	0.9145835924221698	0.2577065351418002	0.3883559232529484	0.410207663059374	48	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO BAG RED RETROSPOT'})	frozenset({'JUMBO BAG STRAWBERRY'})	0.0863371465573062	0.0352903086552989	0.022339736671703	0.25875	7.33204128440367	1	0.0192928721212778	1.301463327277843	0.945219924882822	0.2249999999999999	0.2316341313346011	0.4458887614678899	49	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO BAG STRAWBERRY'})	frozenset({'JUMBO BAG RED RETROSPOT'})	0.0352903086552989	0.0863371465573062	0.022339736671703	0.6330275229357799	7.33204128440367	1	0.0192928721212778	2.489731275631341	0.8952043723076375	0.2249999999999999	0.5983502276781167	0.4458887614678899	50	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO BAG PINK POLKADOT'})	frozenset({'JUMBO BAG RED RETROSPOT'})	0.0469997841571336	0.0863371465573062	0.0294625512626807	0.6268656716417911	7.260671641791045	1	0.0254047240097445	2.44861644722642	0.9047969564361614	0.2836363636363636	0.5916061083667418	0.4840578358208955	51	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO BAG RED RETROSPOT'})	frozenset({'JUMBO BAG PINK POLKADOT'})	0.0863371465573062	0.0469997841571336	0.0294625512626807	0.34125	7.260671641791045	1	0.0254047240097445	1.4466796445432508	0.9437526014421832	0.2836363636363636	0.30876196138384	0.4840578358208955	52	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'LUNCH BAG SUKI DESIGN '})	0.0695014029786315	0.0485106842218864	0.0242823224692423	0.3493788819875776	7.202101714119898	1	0.0209107618563679	1.4624322657782938	0.9254733369416738	0.2590673575129533	0.3162076470818231	0.4249675277568588	53	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SUKI DESIGN '})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.0485106842218864	0.0695014029786315	0.0242823224692423	0.5005561735261401	7.202101714119898	1	0.0209107618563679	1.8630695739915597	0.9050565543141962	0.2590673575129533	0.4632513922399924	0.4249675277568588	54	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'LUNCH BAG  BLACK SKULL.'})	0.0695014029786315	0.0567666738614288	0.0278976904813295	0.4013975155279503	7.071006423730014	1	0.0239523270055298	1.575725712148482	0.9227068356016076	0.2835984640702139	0.3653717824807766	0.4464211912240512	55	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG  BLACK SKULL.'})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.0567666738614288	0.0695014029786315	0.0278976904813295	0.4914448669201521	7.071006423730014	1	0.0239523270055298	1.8296906991896813	0.9102492375923408	0.2835984640702139	0.4534595380285467	0.4464211912240512	56	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'LUNCH BAG CARS BLUE'})	0.0695014029786315	0.0521260522339736	0.0247140082020289	0.3555900621118013	6.821733986600312	1	0.0210911744400303	1.470917644244147	0.9171531342083163	0.255011135857461	0.3201522845870375	0.4148550724637682	57	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG CARS BLUE'})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.0521260522339736	0.0695014029786315	0.0247140082020289	0.474120082815735	6.821733986600312	1	0.0210911744400303	1.7694126864618935	0.9003409225941141	0.255011135857461	0.434840719945558	0.4148550724637682	58	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'LUNCH BAG SPACEBOY DESIGN '})	0.0695014029786315	0.0533131879991366	0.0251996546514137	0.3625776397515528	6.800899615258884	1	0.0214943132882102	1.4851797976335104	0.9166705161886058	0.2581536760641238	0.326680849286125	0.4176248522644404	59	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG SPACEBOY DESIGN '})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.0533131879991366	0.0695014029786315	0.0251996546514137	0.472672064777328	6.800899615258884	1	0.0214943132882102	1.7645539613380268	0.900995575761304	0.2581536760641238	0.4332845456073673	0.4176248522644404	60	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO BAG RED RETROSPOT'})	frozenset({'JUMBO STORAGE BAG SUKI'})	0.0863371465573062	0.0417655946470969	0.0234189510036693	0.27125	6.494580103359173	1	0.0198130287375698	1.3149014138633317	0.925971165769067	0.2237113402061855	0.2394867102151143	0.4159867571059431	61	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO STORAGE BAG SUKI'})	frozenset({'JUMBO BAG RED RETROSPOT'})	0.0417655946470969	0.0863371465573062	0.0234189510036693	0.5607235142118863	6.494580103359172	1	0.0198130287375698	2.079926613425426	0.8829003141571036	0.2237113402061855	0.5192138061289083	0.4159867571059431	62	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG APPLE DESIGN'})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.046729980574142	0.0695014029786315	0.020990718756745	0.4491916859122402	6.4630592572404	1	0.017742919545678	1.6893328826425684	0.886710474887203	0.2203966005665722	0.4080503550989118	0.3756051597263064	63	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'LUNCH BAG APPLE DESIGN'})	0.0695014029786315	0.046729980574142	0.020990718756745	0.3020186335403726	6.4630592572404	1	0.017742919545678	1.3657528198225863	0.9084103020968062	0.2203966005665722	0.267803085971368	0.3756051597263064	64	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'RED HANGING HEART T-LIGHT HOLDER'})	frozenset({'WHITE HANGING HEART T-LIGHT HOLDER'})	0.0366393265702568	0.1063565724152816	0.0245521260522339	0.6701030927835051	6.300532986029384	1	0.0206552928626172	2.708856639866177	0.8732796470319575	0.2072892938496582	0.6308405600787342	0.4504751892126556	65	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'WHITE HANGING HEART T-LIGHT HOLDER'})	frozenset({'RED HANGING HEART T-LIGHT HOLDER'})	0.1063565724152816	0.0366393265702568	0.0245521260522339	0.2308472856418061	6.300532986029384	1	0.0206552928626172	1.252495967895794	0.941408220425188	0.2072892938496582	0.2015942361235619	0.4504751892126556	66	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	frozenset({'REGENCY CAKESTAND 3 TIER'})	0.0372868551694366	0.0918951003669328	0.0201813080077703	0.5412445730824891	5.889808824641626	1	0.0167548287096076	1.979496800146528	0.862370277918404	0.1851485148514851	0.4948211081089005	0.3804285108512856	67	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'REGENCY CAKESTAND 3 TIER'})	frozenset({'GREEN REGENCY TEACUP AND SAUCER'})	0.0918951003669328	0.0372868551694366	0.0201813080077703	0.2196124486200822	5.889808824641625	1	0.0167548287096076	1.2336346769348754	0.9142283040193858	0.1851485148514851	0.1893872483508414	0.3804285108512856	68	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'REGENCY CAKESTAND 3 TIER'})	frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	0.0918951003669328	0.0422512410964817	0.0226635009712929	0.2466236054022313	5.837073633862263	1	0.0187808189301042	1.271275242722285	0.912539154350908	0.2032913843175217	0.213388284146383	0.3915110364175908	69	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'ROSES REGENCY TEACUP AND SAUCER '})	frozenset({'REGENCY CAKESTAND 3 TIER'})	0.0422512410964817	0.0918951003669328	0.0226635009712929	0.5363984674329502	5.837073633862262	1	0.0187808189301042	1.9588047835060372	0.8652386854792624	0.2032913843175217	0.4894846038663873	0.3915110364175908	70	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO SHOPPER VINTAGE RED PAISLEY'})	frozenset({'JUMBO BAG RED RETROSPOT'})	0.0426289661126699	0.0863371465573062	0.0213684437729333	0.5012658227848101	5.805911392405063	1	0.0176879804780772	1.831963589390173	0.8646195923842187	0.1985957873620862	0.4541376227172278	0.3743829113924051	71	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO BAG RED RETROSPOT'})	frozenset({'JUMBO SHOPPER VINTAGE RED PAISLEY'})	0.0863371465573062	0.0426289661126699	0.0213684437729333	0.2475	5.805911392405063	1	0.0176879804780772	1.2722538656310034	0.905981621077298	0.1985957873620862	0.2139933491150941	0.3743829113924051	72	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'SPOTTY BUNTING'})	frozenset({'PARTY BUNTING'})	0.0541225987481113	0.0744118281890783	0.020990718756745	0.3878364905284147	5.212027441967065	1	0.0169633572375541	1.511995010303509	0.8543771973318984	0.1951831409934771	0.3386221560352464	0.3349624802170717	73	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'PARTY BUNTING'})	frozenset({'SPOTTY BUNTING'})	0.0744118281890783	0.0541225987481113	0.020990718756745	0.2820884699057288	5.212027441967065	1	0.0169633572375541	1.3175403397235903	0.8731054563068178	0.1951831409934771	0.2410099563177001	0.3349624802170717	74	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'JUMBO BAG RED RETROSPOT'})	frozenset({'LUNCH BAG RED RETROSPOT'})	0.0863371465573062	0.0695014029786315	0.0229333045542844	0.265625	3.821865295031056	1	0.0169327517393799	1.2670619193482464	0.8081182862939648	0.172553796183516	0.2107725875666898	0.2977969720496894	75	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
frozenset({'LUNCH BAG RED RETROSPOT'})	frozenset({'JUMBO BAG RED RETROSPOT'})	0.0695014029786315	0.0863371465573062	0.0229333045542844	0.3299689440993789	3.821865295031056	1	0.0169327517393799	1.3636126943617493	0.7934968002510677	0.172553796183516	0.2666539376358191	0.2977969720496894	76	2026-07-31 22:29:25.717145	2026-07-31 22:29:25.717145
\.


--
-- TOC entry 5263 (class 0 OID 16429)
-- Dependencies: 225
-- Data for Name: business_insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business_insights (id, title, description, insight_type, priority, status, created_at, source, updated_at) FROM stdin;
1	High Revenue Opportunity	Customers purchasing Coffee are highly likely to purchase Sugar.	Recommendation	High	Active	2026-07-30 21:08:45.805675	Market Basket Analysis	2026-07-31 22:30:32.260205
2	Customer Growth	Premium customer segment has increased by 12% compared to last month.	Customer	Medium	Active	2026-07-30 21:08:45.805675	Customer Intelligence	2026-07-31 22:30:32.260205
3	Sales Forecast	Projected sales for next month show an increase of approximately 9%.	Forecast	High	Active	2026-07-30 21:08:45.805675	Sales Forecast	2026-07-31 22:30:32.260205
4	Inventory Alert	Best-selling products should be restocked to avoid stock shortages.	Inventory	High	Active	2026-07-30 21:08:45.805675	Product Analytics	2026-07-31 22:30:32.260205
\.


--
-- TOC entry 5270 (class 0 OID 16512)
-- Dependencies: 232
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name, description, status, created_at, updated_at) FROM stdin;
1	Beverages	Soft drinks, tea, coffee, juices	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
2	Snacks	Chips, biscuits, namkeen	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
3	Dairy	Milk, cheese, butter, yogurt	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
4	Bakery	Bread, cakes, cookies	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
5	Frozen Foods	Frozen products	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
6	Personal Care	Soap, shampoo, toothpaste	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
7	Household	Cleaning products	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
8	Fruits & Vegetables	Fresh produce	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
9	Grocery	Rice, pulses, flour	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
10	Others	Miscellaneous	Active	2026-07-31 22:37:04.521538	2026-07-31 22:37:04.521538
\.


--
-- TOC entry 5259 (class 0 OID 16408)
-- Dependencies: 221
-- Data for Name: customer_segments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_segments (customer_id, recency, frequency, monetary, cluster, segment_name, segment_id, created_at, updated_at) FROM stdin;
12346	325	1	77183.6	1	Low Value	1	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12347	1	7	4310	0	Regular	2	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12348	74	4	1797.24	0	Regular	3	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12349	18	1	1757.55	0	Regular	4	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12350	309	1	334.4	1	Low Value	5	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12352	35	8	2506.04	0	Regular	6	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12353	203	1	89	1	Low Value	7	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12354	231	1	1079.4	1	Low Value	8	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12355	213	1	459.4	1	Low Value	9	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12356	22	3	2811.43	0	Regular	10	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12357	32	1	6207.67	0	Regular	11	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12358	1	2	1168.06	0	Regular	12	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12359	57	4	6310.03	0	Regular	13	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12360	51	3	2662.06	0	Regular	14	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12361	286	1	189.9	1	Low Value	15	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12362	2	10	5226.23	0	Regular	16	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12363	109	2	552	0	Regular	17	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12364	7	4	1313.1	0	Regular	18	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12365	290	2	641.38	1	Low Value	19	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12367	3	1	168.9	0	Regular	20	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12370	50	4	3541.94	0	Regular	21	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12371	44	2	1887.96	0	Regular	22	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12372	71	3	1298.04	0	Regular	23	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12373	310	1	364.6	1	Low Value	24	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12374	24	1	742.9300000000001	0	Regular	25	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12375	10	2	457.5	0	Regular	26	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12377	314	2	1628.12	1	Low Value	27	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12378	129	1	4008.62	0	Regular	28	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12379	81	2	852.24	0	Regular	29	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12380	21	4	2724.81	0	Regular	30	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12381	4	5	1845.31	0	Regular	31	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12383	184	5	1850.56	1	Low Value	32	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12384	28	2	585.27	0	Regular	33	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12386	337	2	401.9	1	Low Value	34	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12388	15	6	2780.66	0	Regular	35	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12390	79	1	549.84	0	Regular	36	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12391	21	1	439.66	0	Regular	37	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12393	71	4	1582.6	0	Regular	38	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12394	63	2	1272.48	0	Regular	39	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12395	18	12	3018.63	0	Regular	40	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12397	35	2	2409.9	0	Regular	41	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12398	45	1	1635.66	0	Regular	42	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12399	118	4	1108.65	0	Regular	43	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12401	302	1	84.3	1	Low Value	44	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12402	322	1	225.6	1	Low Value	45	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12403	49	1	427.7	0	Regular	46	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12405	148	1	1710.39	1	Low Value	47	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12406	21	2	3415.3	0	Regular	48	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12407	49	5	1708.12	0	Regular	49	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12408	32	5	2888.55	0	Regular	50	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12409	78	3	11072.67	0	Regular	51	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12410	308	2	693.3299999999999	1	Low Value	52	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12412	74	3	1226.88	0	Regular	53	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12413	66	3	758.1	0	Regular	54	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12414	216	3	562.41	1	Low Value	55	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12415	23	21	124914.53	2	Premium	56	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12417	2	9	3649.1	0	Regular	57	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12418	112	1	668.58	0	Regular	58	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12420	63	1	600.39	0	Regular	59	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12421	15	4	807.04	0	Regular	60	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12422	95	3	803.5600000000001	0	Regular	61	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12423	0	8	1859.31	0	Regular	62	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12424	162	2	1760.96	1	Low Value	63	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12425	77	1	777.2	0	Regular	64	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12426	194	1	582.73	1	Low Value	65	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12427	21	3	825.8	0	Regular	66	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12428	25	9	7956.46	0	Regular	67	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12429	8	4	3750.4	0	Regular	68	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12430	42	1	256.4	0	Regular	69	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12431	35	15	6419.95	0	Regular	70	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12432	42	5	5059.32	0	Regular	71	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12433	0	7	13375.87	0	Regular	72	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12434	84	2	806.14	0	Regular	73	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12435	79	2	7829.89	0	Regular	74	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12436	99	1	509.01	0	Regular	75	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12437	1	18	4951.41	0	Regular	76	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12438	13	2	2906.85	0	Regular	77	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12441	366	1	173.55	1	Low Value	78	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12442	2	1	172.06	0	Regular	79	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12444	20	5	5005.46	0	Regular	80	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12445	21	1	133.4	0	Regular	81	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12446	57	1	1002.31	0	Regular	82	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12447	242	1	476.49	1	Low Value	83	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12448	43	1	449.45	0	Regular	84	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12449	21	4	4067.29	0	Regular	85	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12450	155	2	197.88	1	Low Value	86	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12451	10	5	9035.52	0	Regular	87	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12452	16	2	430.57	0	Regular	88	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12453	133	1	707.09	0	Regular	89	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12454	55	1	3528.34	0	Regular	90	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12455	72	6	2466.86	0	Regular	91	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12456	43	3	3181.04	0	Regular	92	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12457	65	7	2363.23	0	Regular	93	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12458	70	2	947.4	0	Regular	94	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12461	93	2	826.88	0	Regular	95	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12462	18	2	1189.59	0	Regular	96	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12463	52	4	1344.78	0	Regular	97	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12464	9	8	1212.05	0	Regular	98	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12465	16	2	742.1899999999999	0	Regular	99	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12468	187	2	729.5400000000001	1	Low Value	100	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12471	1	30	19788.65	0	Regular	101	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12472	31	7	6572.11	0	Regular	102	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12473	28	5	3928.05	0	Regular	103	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12474	16	18	7324.09	0	Regular	104	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12475	53	1	723.38	0	Regular	105	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12476	15	11	6816.42	0	Regular	106	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12477	22	6	13219.74	0	Regular	107	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12478	3	1	680.99	0	Regular	108	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12479	10	1	527.2	0	Regular	109	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12480	27	4	3281.63	0	Regular	110	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12481	22	10	5579.82	0	Regular	111	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12483	16	8	2484.98	0	Regular	112	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12484	32	6	4527.32	0	Regular	113	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12488	9	3	1298.66	0	Regular	114	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12489	335	1	334.93	1	Low Value	115	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12490	4	10	5417.93	0	Regular	116	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12491	38	1	460.4	0	Regular	117	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12492	62	2	263.21000000000004	0	Regular	118	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12493	165	2	433.74	1	Low Value	119	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12494	15	7	1246.1	0	Regular	120	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12497	81	1	1043.1	0	Regular	121	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12498	20	3	403.7000000000001	0	Regular	122	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12500	22	11	4257.82	0	Regular	123	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12501	336	1	2169.39	1	Low Value	124	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12502	95	5	3723.87	0	Regular	125	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12504	17	2	482.05	0	Regular	126	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12506	232	1	73.5	1	Low Value	127	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12507	133	3	1304.81	0	Regular	128	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12508	25	2	397.88	0	Regular	129	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12509	283	1	176.5	1	Low Value	130	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12510	142	2	982.57	1	Low Value	131	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12512	65	2	132.18	0	Regular	132	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12513	112	1	612.29	0	Regular	133	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12514	266	1	1017.68	1	Low Value	134	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12515	352	1	383.7	1	Low Value	135	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12516	77	2	1312.06	0	Regular	136	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12517	27	5	2481.6	0	Regular	137	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12518	0	5	2056.89	0	Regular	138	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12519	63	1	330.84	0	Regular	139	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12520	78	5	2634.26	0	Regular	140	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12521	142	1	599.68	1	Low Value	141	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12522	38	2	192.72	0	Regular	142	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12523	18	11	1789.77	0	Regular	143	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12524	8	8	4485.72	0	Regular	144	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12526	0	3	1316.66	0	Regular	145	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12527	81	3	348.71000000000004	0	Regular	146	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12528	8	6	1933.48	0	Regular	147	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12530	59	4	1662.28	0	Regular	148	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12531	14	1	125.22	0	Regular	149	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12532	29	1	349.83000000000004	0	Regular	150	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12534	130	1	1089.18	0	Regular	151	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12535	91	2	716.35	0	Regular	152	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12536	42	3	12601.830000000002	0	Regular	153	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12538	28	1	363.95	0	Regular	154	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12539	21	4	5568.35	0	Regular	155	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12540	19	17	13400.24	0	Regular	156	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12541	29	3	981.18	0	Regular	157	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12544	35	1	372.7	0	Regular	158	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12545	74	2	1000.39	0	Regular	159	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12546	46	2	1161.5	0	Regular	160	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12547	197	2	207.8	1	Low Value	161	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12548	165	1	95.2	1	Low Value	162	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12550	78	1	964.83	0	Regular	163	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12551	357	1	168	1	Low Value	164	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12552	38	2	437.82	0	Regular	165	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12553	7	10	3692.28	0	Regular	166	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12556	49	2	599.56	0	Regular	167	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12557	15	5	11990.96	0	Regular	168	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12558	7	1	269.96	0	Regular	169	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12559	310	2	561.71	1	Low Value	170	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12560	4	3	2134.01	0	Regular	171	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12561	302	1	238.85	1	Low Value	172	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12562	7	7	3781.74	0	Regular	173	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12564	260	1	456.9	1	Low Value	174	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12565	288	1	145.92	1	Low Value	175	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12566	85	1	351.65	0	Regular	176	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12567	22	10	9401.28	0	Regular	177	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12569	1	32	4124.69	0	Regular	178	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12571	39	2	519.61	0	Regular	179	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12572	8	2	1020.42	0	Regular	180	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12573	226	1	160.54000000000002	1	Low Value	181	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12574	315	1	218.45	1	Low Value	182	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12576	35	5	1315.83	0	Regular	183	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12577	34	3	626.6	0	Regular	184	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12578	20	2	2794.51	0	Regular	185	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12579	77	1	440.42	0	Regular	186	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12580	246	1	415.7	1	Low Value	187	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12581	39	1	197.71	0	Regular	188	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12582	238	2	511.36	1	Low Value	189	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12583	2	15	7281.38	0	Regular	190	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12584	3	9	2338.15	0	Regular	191	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12585	233	2	2040.1	1	Low Value	192	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12586	16	1	196.94000000000003	0	Regular	193	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12587	7	1	144	0	Regular	194	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12588	38	1	214.9	0	Regular	195	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12589	28	2	646.68	0	Regular	196	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12590	210	2	9864.26	1	Low Value	197	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12591	316	1	452.85	1	Low Value	198	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12592	91	2	437.6	0	Regular	199	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12593	108	3	418.1	0	Regular	200	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12594	37	10	3338.2200000000003	0	Regular	201	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12596	50	2	618.27	0	Regular	202	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12597	18	4	3811.22	0	Regular	203	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12598	9	8	3023.08	0	Regular	204	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12599	28	7	1032.58	0	Regular	205	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12600	28	10	2599.04	0	Regular	206	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12601	189	5	577.0600000000001	1	Low Value	207	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12602	58	1	153.12	0	Regular	208	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12603	21	1	739.1999999999999	0	Regular	209	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12604	78	2	254.18	0	Regular	210	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12607	59	1	1579.51	0	Regular	211	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12609	77	3	1126.85	0	Regular	212	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12610	22	5	2099.54	0	Regular	213	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12611	51	1	1193.32	0	Regular	214	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12612	73	1	704.0400000000001	0	Regular	215	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12613	56	5	3344.38	0	Regular	216	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12614	277	1	315.6	1	Low Value	217	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12615	1	4	2291.19	0	Regular	218	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12616	94	2	713.3	0	Regular	219	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12617	28	1	352.98	0	Regular	220	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12618	21	1	177.31	0	Regular	221	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12619	15	9	3641.24	0	Regular	222	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12620	14	3	1339.41	0	Regular	223	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12621	1	20	13689.67	0	Regular	224	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12622	231	1	180.1	1	Low Value	225	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12623	275	1	305.1	1	Low Value	226	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12624	105	2	641.13	0	Regular	227	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12625	211	2	2683.82	1	Low Value	228	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12626	22	9	6620.48	0	Regular	229	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12627	10	7	4478.53	0	Regular	230	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12628	3	3	786.46	0	Regular	231	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12630	9	2	1270.88	0	Regular	232	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12631	56	1	640.5	0	Regular	233	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12633	58	4	2163.98	0	Regular	234	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12635	89	2	1689.18	0	Regular	235	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12637	66	8	6002.9	0	Regular	236	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12638	32	1	671.69	0	Regular	237	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12639	238	1	486.1	1	Low Value	238	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12640	23	3	1174.58	0	Regular	239	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12641	114	1	185.9	0	Regular	240	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12642	24	3	1013.26	0	Regular	241	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12643	127	6	3344.64	0	Regular	242	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12644	129	1	477.91	0	Regular	243	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12645	33	4	1775.18	0	Regular	244	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12646	4	2	1346.97	0	Regular	245	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12647	21	12	3722.82	0	Regular	246	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12648	154	1	318.05	1	Low Value	247	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12649	106	3	623.51	0	Regular	248	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12650	2	1	314.44	0	Regular	249	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12651	334	1	114	1	Low Value	250	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12652	330	1	919.98	1	Low Value	251	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12653	148	2	2209.85	1	Low Value	252	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12654	10	5	601.98	0	Regular	253	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12656	16	5	4051.17	0	Regular	254	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12657	10	4	1643.18	0	Regular	255	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12658	18	1	686.05	0	Regular	256	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12659	29	1	91.68	0	Regular	257	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12660	10	1	245.1	0	Regular	258	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12662	0	11	3849.78	0	Regular	259	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12664	7	9	4881.88	0	Regular	260	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12665	324	1	63	1	Low Value	261	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12667	57	1	620.13	0	Regular	262	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12668	11	4	3807.15	0	Regular	263	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12669	150	3	2744.03	1	Low Value	264	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12670	9	5	2996.05	0	Regular	265	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12672	329	1	225.9	1	Low Value	266	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12673	4	2	610.52	0	Regular	267	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12674	38	4	1970.6	0	Regular	268	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12676	24	6	1331.39	0	Regular	269	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12678	41	12	17628.46	0	Regular	270	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12679	58	4	1113.02	0	Regular	271	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12680	0	4	862.81	0	Regular	272	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12681	14	22	13787.54	0	Regular	273	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12682	3	31	12279.82	0	Regular	274	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12683	3	15	8476.57	0	Regular	275	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12684	7	7	2283.63	0	Regular	276	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12685	27	6	2863.08	0	Regular	277	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12686	371	1	89.14	1	Low Value	278	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12688	113	1	4873.81	0	Regular	279	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12689	25	2	1247.61	0	Regular	280	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12690	205	1	389.01	1	Low Value	281	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12691	27	6	1035.8	0	Regular	282	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12693	126	4	855.91	0	Regular	283	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12694	69	2	869.67	0	Regular	284	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12695	6	4	582.1	0	Regular	285	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12697	28	3	957.59	0	Regular	286	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12700	7	4	4939.99	0	Regular	287	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12701	79	2	797.71	0	Regular	288	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12702	19	1	219	0	Regular	289	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12703	70	1	283.55	0	Regular	290	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12704	6	8	2340.84	0	Regular	291	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12705	14	9	6868.29	0	Regular	292	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12707	291	1	603.42	1	Low Value	293	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12708	29	10	2712.91	0	Regular	294	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12709	14	15	9706.52	0	Regular	295	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12710	96	3	1149.02	0	Regular	296	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12712	28	13	4396.13	0	Regular	297	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12713	0	1	848.55	0	Regular	298	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12714	8	5	4708.86	0	Regular	299	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12715	105	1	343.36	0	Regular	300	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12716	3	2	1053.49	0	Regular	301	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12717	150	2	1030.98	1	Low Value	302	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12718	70	1	238.25	0	Regular	303	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12719	4	2	644.95	0	Regular	304	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12720	2	25	5781.73	0	Regular	305	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12721	31	6	2656.13	0	Regular	306	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12722	84	4	997.63	0	Regular	307	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12723	3	5	725.07	0	Regular	308	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12724	4	4	1031.41	0	Regular	309	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12725	370	1	427.8	1	Low Value	310	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12726	27	7	2609.1	0	Regular	311	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12727	10	7	3980.7	0	Regular	312	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12728	70	4	836.33	0	Regular	313	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12729	113	1	453.01	0	Regular	314	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12731	23	12	18895.91	0	Regular	315	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12732	179	1	236.26	1	Low Value	316	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12733	233	1	383.95	1	Low Value	317	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12734	352	1	110.4	1	Low Value	318	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12735	314	2	779.5699999999999	1	Low Value	319	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12736	332	1	234	1	Low Value	320	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12738	371	1	155.35	1	Low Value	321	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12739	77	2	1013.04	0	Regular	322	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12740	63	1	427.6	0	Regular	323	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12743	133	2	540.13	0	Regular	324	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12744	51	7	21279.29	0	Regular	325	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12747	1	11	4196.01	0	Regular	326	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12748	0	209	33053.19	2	Premium	327	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12749	3	5	4090.88	0	Regular	328	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12750	128	1	275.88	0	Regular	329	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12752	80	1	4366.78	0	Regular	330	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12753	22	6	21429.39	0	Regular	331	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12754	235	3	3010.74	1	Low Value	332	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12755	280	2	3811.95	1	Low Value	333	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12756	86	1	112.07999999999998	0	Regular	334	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12757	15	13	7834.650000000001	0	Regular	335	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12758	116	2	2791.59	0	Regular	336	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12759	51	3	1531.44	0	Regular	337	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12762	7	2	1898.52	0	Regular	338	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12763	137	2	494.08	0	Regular	339	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12764	316	1	1693.88	1	Low Value	340	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12766	3	7	6989.63	0	Regular	341	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12769	238	1	1143.6	1	Low Value	342	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12770	210	1	1351.45	1	Low Value	343	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12772	59	1	892.47	0	Regular	344	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12775	16	5	1386.04	0	Regular	345	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12778	19	6	822.23	0	Regular	346	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12779	37	8	3981.36	0	Regular	347	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12781	63	2	826.74	0	Regular	348	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12782	4	5	2330.92	0	Regular	349	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12783	1	6	2225.91	0	Regular	350	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12784	8	2	532.8199999999999	0	Regular	351	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12785	363	1	311.95	1	Low Value	352	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12787	9	3	463.66	0	Regular	353	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12789	64	1	91.85	0	Regular	354	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12790	191	1	324.92	1	Low Value	355	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12791	373	1	192.6	1	Low Value	356	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12792	256	1	400.54	1	Low Value	357	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12793	334	2	545.48	1	Low Value	358	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12794	52	2	860.41	0	Regular	359	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12795	18	1	430.48	0	Regular	360	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12797	365	1	254.03	1	Low Value	361	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12798	9	3	6977.04	0	Regular	362	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12802	186	1	427.58	1	Low Value	363	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12808	36	3	483.65	0	Regular	364	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12809	177	1	489.31	1	Low Value	365	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12811	260	3	514.85	1	Low Value	366	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12812	44	1	229.64	0	Regular	367	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12814	101	1	125.92	0	Regular	368	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12815	147	2	1063.46	1	Low Value	369	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12816	95	2	572.2	0	Regular	370	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12817	280	1	166.04	1	Low Value	371	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12818	261	1	1542.08	1	Low Value	372	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12820	2	4	942.34	0	Regular	373	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12821	213	1	92.72	1	Low Value	374	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12822	70	2	948.88	0	Regular	375	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12823	74	5	1759.5	0	Regular	376	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12824	59	1	397.12	0	Regular	377	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12826	2	7	1474.72	0	Regular	378	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12827	5	3	430.15	0	Regular	379	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12828	2	6	1018.71	0	Regular	380	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12829	336	2	293	1	Low Value	381	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12830	37	6	6814.64	0	Regular	382	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12831	261	1	215.05	1	Low Value	383	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12832	31	2	383.03	0	Regular	384	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12833	144	1	417.38	1	Low Value	385	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12834	282	1	312.38	1	Low Value	386	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12836	58	4	2610.36	0	Regular	387	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12837	172	1	134.1	1	Low Value	388	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12838	33	2	671.95	0	Regular	389	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12839	2	14	5591.42	0	Regular	390	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12840	143	4	2726.77	0	Regular	391	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12841	4	25	3991.58	0	Regular	392	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12842	69	2	1118.99	0	Regular	393	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12843	65	8	1702.26	0	Regular	394	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12844	28	2	325.96000000000004	0	Regular	395	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12845	266	4	354.09	1	Low Value	396	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12847	21	1	843.64	0	Regular	397	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12849	30	2	1010.29	0	Regular	398	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12851	96	1	131.81	0	Regular	399	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12852	294	1	311.55	1	Low Value	400	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12853	134	6	1957.1	0	Regular	401	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12854	78	3	1316.25	0	Regular	402	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12855	372	1	38.1	1	Low Value	403	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12856	7	6	2170.78	0	Regular	404	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12857	210	2	1106.4	1	Low Value	405	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12863	51	1	521.2	0	Regular	406	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12864	137	1	147.12	1	Low Value	407	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12865	25	2	1568.23	0	Regular	408	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12866	282	1	559.12	1	Low Value	409	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12867	25	7	4009.34	0	Regular	410	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12868	185	6	1607.0600000000002	1	Low Value	411	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12871	83	2	380.64	0	Regular	412	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12872	326	2	599.97	1	Low Value	413	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12873	281	1	374	1	Low Value	414	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12875	142	2	343.2300000000001	1	Low Value	415	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12876	57	2	2218.02	0	Regular	416	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12877	3	12	1535.77	0	Regular	417	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12878	235	2	854.99	1	Low Value	418	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12879	44	3	573.22	0	Regular	419	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12881	275	1	298	1	Low Value	420	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12882	8	2	1463.04	0	Regular	421	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12883	24	4	703.47	0	Regular	422	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12884	87	1	309.05	0	Regular	423	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12885	62	3	1175.22	0	Regular	424	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12886	67	2	1378.4	0	Regular	425	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12888	213	2	354.12	1	Low Value	426	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12890	23	1	376.72	0	Regular	427	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12891	185	3	331	1	Low Value	428	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12893	30	1	176.55	0	Regular	429	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12895	41	2	372.8	0	Regular	430	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12897	204	2	216.5	1	Low Value	431	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12901	8	28	17654.54	0	Regular	432	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12902	264	1	138.68	1	Low Value	433	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12904	17	2	496.06	0	Regular	434	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12906	11	5	2919.81	0	Regular	435	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12908	175	2	750	1	Low Value	436	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12909	39	5	2178.67	0	Regular	437	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12910	22	8	3075.04	0	Regular	438	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12912	2	5	1662.3	0	Regular	439	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12913	4	5	2483.63	0	Regular	440	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12915	148	2	363.65	1	Low Value	441	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12916	138	4	2944.95	0	Regular	442	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12917	127	1	594	0	Regular	443	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12919	7	6	1335.19	0	Regular	444	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12920	16	1	162.78	0	Regular	445	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12921	8	37	16587.09	0	Regular	446	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12922	160	1	405.38	1	Low Value	447	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12923	63	1	172.82	0	Regular	448	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12924	87	4	933.7	0	Regular	449	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12925	4	2	694.05	0	Regular	450	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12928	34	5	2062.7000000000003	0	Regular	451	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12929	311	1	117.85	1	Low Value	452	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12930	77	2	415.8	0	Regular	453	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12931	21	15	42055.96	0	Regular	454	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12933	23	3	607.53	0	Regular	455	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12935	1	7	2160.7	0	Regular	456	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12936	16	4	1063.9	0	Regular	457	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12937	14	4	1504.27	0	Regular	458	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12938	25	1	114.14	0	Regular	459	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12939	63	8	11581.8	0	Regular	460	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12940	54	2	899.69	0	Regular	461	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12942	130	3	675.6	0	Regular	462	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12944	35	2	604.51	0	Regular	463	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12945	287	1	462.95	1	Low Value	464	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12947	143	6	1603.99	0	Regular	465	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12948	15	7	2064.95	0	Regular	466	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12949	30	8	4167.22	0	Regular	467	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12950	1	3	1843	0	Regular	468	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12951	8	6	1064.07	0	Regular	469	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12952	5	4	1387.79	0	Regular	470	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12953	9	1	329.85	0	Regular	471	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12955	0	11	4757.16	0	Regular	472	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12956	305	1	108.07	1	Low Value	473	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12957	9	8	4017.54	0	Regular	474	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12962	6	2	266.39	0	Regular	475	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12963	7	8	1856.63	0	Regular	476	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12965	88	1	769.8100000000001	0	Regular	477	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12966	9	1	160.18	0	Regular	478	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12967	357	2	1660.9	1	Low Value	479	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12968	111	1	135.95	0	Regular	480	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12970	6	4	405.47	0	Regular	481	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12971	3	86	11189.91	0	Regular	482	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12974	197	1	144.8	1	Low Value	483	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12976	211	1	738.6	1	Low Value	484	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12977	155	1	39.24	1	Low Value	485	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12980	157	9	7374.900000000001	0	Regular	486	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12981	29	2	372.22	0	Regular	487	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12982	242	1	390.54	1	Low Value	488	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12984	18	1	97.5	0	Regular	489	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12985	0	2	1239.38	0	Regular	490	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12987	73	2	558.7	0	Regular	491	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12988	291	1	505.82	1	Low Value	492	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12989	2	15	6924.110000000001	0	Regular	493	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12990	30	3	409.5	0	Regular	494	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12991	22	2	503.76	0	Regular	495	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12993	22	4	414.76	0	Regular	496	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12994	3	3	974.42	0	Regular	497	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12995	84	1	211.32	0	Regular	498	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12997	21	4	1226.89	0	Regular	499	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
12999	195	3	455.88	1	Low Value	500	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13000	106	3	534.85	0	Regular	501	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13001	3	13	9785.97	0	Regular	502	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13002	317	1	120.95	1	Low Value	503	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13003	105	3	149.05	0	Regular	504	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13004	11	18	5655.91	0	Regular	505	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13005	173	2	513.7	1	Low Value	506	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13006	55	1	81.57	0	Regular	507	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13008	322	1	229.47	1	Low Value	508	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13011	371	1	50.55	1	Low Value	509	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13012	8	8	1646.84	0	Regular	510	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13013	0	13	4810.9400000000005	0	Regular	511	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13014	10	10	3466.28	0	Regular	512	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13015	52	5	3339.64	0	Regular	513	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13016	72	3	789.89	0	Regular	514	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13017	6	1	204	0	Regular	515	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13018	15	28	7277.7	0	Regular	516	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13021	3	9	2616.38	0	Regular	517	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13023	63	2	689.9	0	Regular	518	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13026	0	5	975.36	0	Regular	519	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13027	113	6	6912	0	Regular	520	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13028	22	2	661.3199999999999	0	Regular	521	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13029	30	3	1247.5	0	Regular	522	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13030	10	2	752.4399999999999	0	Regular	523	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13032	51	2	1010.18	0	Regular	524	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13033	356	1	190.55	1	Low Value	525	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13034	54	2	642.77	0	Regular	526	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13035	73	2	921.88	0	Regular	527	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13037	137	3	881.07	0	Regular	528	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13038	79	3	908.46	0	Regular	529	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13040	8	2	676.99	0	Regular	530	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13043	272	1	516.42	1	Low Value	531	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13044	290	1	560.47	1	Low Value	532	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13045	98	1	305.28000000000003	0	Regular	533	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13046	30	2	629.31	0	Regular	534	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13047	31	10	3237.54	0	Regular	535	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13048	13	4	1819.41	0	Regular	536	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13049	63	2	656.6800000000001	0	Regular	537	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13050	14	17	5836.86	0	Regular	538	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13052	211	1	348.15000000000003	1	Low Value	539	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13055	77	3	1214.41	0	Regular	540	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13058	24	3	271.40000000000003	0	Regular	541	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13059	249	1	183.4	1	Low Value	542	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13060	253	1	307.53	1	Low Value	543	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13061	71	1	248.61	0	Regular	544	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13062	190	1	346.98	1	Low Value	545	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13064	12	4	1105.59	0	Regular	546	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13065	372	1	205.86	1	Low Value	547	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13066	23	2	470.8	0	Regular	548	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13067	81	1	115.46	0	Regular	549	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13068	9	2	344	0	Regular	550	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13069	0	24	4431.44	0	Regular	551	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13070	191	1	228.8	1	Low Value	552	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13072	266	1	177.15	1	Low Value	553	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13075	129	1	919.61	0	Regular	554	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13077	0	4	728.02	0	Regular	555	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13078	2	26	12627.94	0	Regular	556	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13079	3	5	220.1	0	Regular	557	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13080	178	1	58.08	1	Low Value	558	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13081	11	11	28337.38	0	Regular	559	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13082	125	9	3613.63	0	Regular	560	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13083	3	2	303.75	0	Regular	561	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13085	157	2	416.08	1	Low Value	562	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13089	2	97	58762.08	2	Premium	563	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13090	8	14	8910.82	0	Regular	564	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13091	27	1	345.82	0	Regular	565	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13092	70	5	477.83	0	Regular	566	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13093	275	8	7832.47	1	Low Value	567	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13094	20	12	1927.32	0	Regular	568	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13095	70	1	74.39999999999999	0	Regular	569	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13097	32	10	6003.22	0	Regular	570	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13098	0	28	28882.44	0	Regular	571	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13099	98	1	207.36	0	Regular	572	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13101	233	1	101.19	1	Low Value	573	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13102	0	24	6424.09	0	Regular	574	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13103	39	1	243.94	0	Regular	575	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13104	2	6	1098.48	0	Regular	576	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13106	132	1	76.5	0	Regular	577	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13107	43	4	1531.62	0	Regular	578	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13108	372	1	350.06	1	Low Value	579	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13109	59	2	786.54	0	Regular	580	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13110	30	7	1488.67	0	Regular	581	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13113	0	24	12245.96	0	Regular	582	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13115	11	4	2294.78	0	Regular	583	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13116	137	1	501.14	1	Low Value	584	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13117	21	8	984.91	0	Regular	585	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13118	19	5	1197.81	0	Regular	586	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13120	238	1	30.6	1	Low Value	587	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13121	268	1	283.73	1	Low Value	588	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13122	93	2	922.39	0	Regular	589	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13124	89	3	3756.33	0	Regular	590	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13126	4	8	2099.64	0	Regular	591	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13127	77	1	259.17	0	Regular	592	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13130	93	1	64	0	Regular	593	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13131	22	3	1073.3	0	Regular	594	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13132	261	1	77.3	1	Low Value	595	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13133	273	2	109.8	1	Low Value	596	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13134	85	4	1793.58	0	Regular	597	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13135	196	1	3096	1	Low Value	598	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13136	55	5	2607.61	0	Regular	599	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13137	10	8	3603.29	0	Regular	600	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13138	21	6	962.39	0	Regular	601	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13139	15	7	5064.94	0	Regular	602	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13140	107	3	422.47	0	Regular	603	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13141	84	5	2388.75	0	Regular	604	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13142	18	1	307.09	0	Regular	605	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13144	332	1	110.95	1	Low Value	606	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13145	39	4	618.52	0	Regular	607	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13146	25	1	228.91	0	Regular	608	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13147	9	4	712.8000000000001	0	Regular	609	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13148	28	12	3683.26	0	Regular	610	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13149	13	4	1676.06	0	Regular	611	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13151	295	1	1257.87	1	Low Value	612	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13153	5	1	486.22	0	Regular	613	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13155	32	4	971.76	0	Regular	614	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13157	48	4	1741.22	0	Regular	615	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13158	94	4	1201.06	0	Regular	616	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13159	8	4	1429.35	0	Regular	617	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13160	21	1	91.8	0	Regular	618	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13161	312	1	112.75	1	Low Value	619	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13162	121	4	1688.29	0	Regular	620	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13165	45	2	1021.48	0	Regular	621	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13166	282	1	417.2	1	Low Value	622	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13167	18	4	791.33	0	Regular	623	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13168	35	4	1299.59	0	Regular	624	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13169	63	2	712.88	0	Regular	625	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13170	26	1	108.81	0	Regular	626	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13171	21	3	468.41	0	Regular	627	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13173	3	2	353.65	0	Regular	628	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13174	15	3	2742.82	0	Regular	629	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13176	45	1	481.49	0	Regular	630	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13177	64	1	282.45	0	Regular	631	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13178	25	11	5725.47	0	Regular	632	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13182	44	1	121.18	0	Regular	633	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13183	7	9	3957.78	0	Regular	634	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13184	14	10	1668.95	0	Regular	635	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13185	267	1	71.4	1	Low Value	636	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13186	39	3	1575.89	0	Regular	637	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13187	336	1	236.02	1	Low Value	638	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13188	10	1	114.6	0	Regular	639	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13189	18	2	260.68	0	Regular	640	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13192	94	2	911.94	0	Regular	641	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13193	60	1	112.08	0	Regular	642	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13194	135	1	60.7	0	Regular	643	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13196	10	4	1797.78	0	Regular	644	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13198	9	6	3401.24	0	Regular	645	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13199	3	38	9817.12	0	Regular	646	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13200	18	4	870.09	0	Regular	647	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13203	9	4	869.46	0	Regular	648	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13207	14	2	250.26	0	Regular	649	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13208	58	6	1217.65	0	Regular	650	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13209	29	8	5891.61	0	Regular	651	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13210	93	1	353.48	0	Regular	652	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13211	9	3	1095.42	0	Regular	653	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13212	19	3	786.83	0	Regular	654	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13213	56	5	1520.58	0	Regular	655	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13216	267	1	333.74	1	Low Value	656	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13217	121	3	533.98	0	Regular	657	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13218	126	1	62.63999999999999	0	Regular	658	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13220	77	4	819.2900000000001	0	Regular	659	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13221	239	2	847.41	1	Low Value	660	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13223	199	2	163.20000000000002	1	Low Value	661	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13224	59	2	2155.95	0	Regular	662	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13225	2	7	6463.84	0	Regular	663	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13226	272	1	108.21	1	Low Value	664	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13227	201	1	257.7	1	Low Value	665	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13228	80	1	358	0	Regular	666	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13229	225	1	160.95	1	Low Value	667	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13230	3	14	2755.63	0	Regular	668	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13232	12	7	1328.35	0	Regular	669	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13233	73	2	605.12	0	Regular	670	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13235	211	1	1031.07	1	Low Value	671	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13236	24	2	744.85	0	Regular	672	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13238	16	4	700.73	0	Regular	673	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13239	261	1	329.56	1	Low Value	674	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13240	95	4	663.65	0	Regular	675	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13242	111	3	270.40000000000003	0	Regular	676	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13243	202	1	585.12	1	Low Value	677	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13244	92	1	121.74	0	Regular	678	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13245	50	1	430.5	0	Regular	679	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13246	17	6	1961.52	0	Regular	680	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13247	17	4	501.12	0	Regular	681	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13248	124	2	465.68	0	Regular	682	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13249	91	3	711.41	0	Regular	683	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13253	156	2	1030.4	1	Low Value	684	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13255	8	2	399.51	0	Regular	685	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13258	11	3	672.83	0	Regular	686	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13259	61	1	283.18	0	Regular	687	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13260	60	1	557.62	0	Regular	688	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13261	268	2	944.1	1	Low Value	689	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13262	262	1	200.29	1	Low Value	690	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13263	0	35	7436.93	0	Regular	691	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13265	52	5	2092.66	0	Regular	692	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13266	10	12	3834.26	0	Regular	693	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13267	2	19	4521.49	0	Regular	694	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13268	17	11	3174.75	0	Regular	695	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13269	0	15	5343.28	0	Regular	696	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13270	365	1	590	1	Low Value	697	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13271	36	1	211.49	0	Regular	698	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13272	30	2	276.56	0	Regular	699	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13273	112	1	138.98	0	Regular	700	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13276	63	2	590.9300000000001	0	Regular	701	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13277	15	4	258.4	0	Regular	702	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13278	40	1	542.73	0	Regular	703	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13279	77	1	137.75	0	Regular	704	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13280	121	3	798.46	0	Regular	705	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13282	17	3	1132.14	0	Regular	706	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13283	59	2	93.66	0	Regular	707	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13284	330	1	201.19	1	Low Value	708	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13285	22	4	2709.12	0	Regular	709	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13291	155	1	361.11	1	Low Value	710	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13292	38	2	578.9399999999999	0	Regular	711	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13294	189	2	873.74	1	Low Value	712	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13295	359	1	201.2	1	Low Value	713	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13296	136	1	87.4	1	Low Value	714	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13297	7	4	2089.85	0	Regular	715	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13298	0	1	360	0	Regular	716	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13299	267	1	142.5	1	Low Value	717	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13300	168	1	371.89	1	Low Value	718	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13301	103	4	618.09	0	Regular	719	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13302	154	1	63.75	1	Low Value	720	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13304	350	1	300.42	1	Low Value	721	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13305	3	10	2000.86	0	Regular	722	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13307	119	1	15	0	Regular	723	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13308	22	3	1385.51	0	Regular	724	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13309	6	5	1456.79	0	Regular	725	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13310	27	3	1132.03	0	Regular	726	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13311	3	2	598.57	0	Regular	727	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13313	21	5	1555.32	0	Regular	728	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13314	1	3	775.94	0	Regular	729	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13316	36	4	5732.93	0	Regular	730	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13317	65	6	2273.68	0	Regular	731	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13318	0	3	640.76	0	Regular	732	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13319	4	26	10845.55	0	Regular	733	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13320	77	4	1532.2	0	Regular	734	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13321	71	2	567.36	0	Regular	735	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13322	16	1	199.48	0	Regular	736	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13323	2	5	787.85	0	Regular	737	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13324	35	10	7121.95	0	Regular	738	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13325	81	1	675.3	0	Regular	739	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13327	38	8	3627.77	0	Regular	740	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13328	315	1	1308.48	1	Low Value	741	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13329	31	2	789	0	Regular	742	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13330	92	3	1140.93	0	Regular	743	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13332	13	1	350.9	0	Regular	744	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13334	81	3	3502.32	0	Regular	745	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13336	76	1	795.12	0	Regular	746	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13338	157	1	487.02	1	Low Value	747	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13339	200	1	860.12	1	Low Value	748	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13340	44	7	10736.48	0	Regular	749	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13341	260	1	775.85	1	Low Value	750	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13343	177	1	353.43	1	Low Value	751	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13344	67	3	2511.69	0	Regular	752	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13345	287	1	389.5	1	Low Value	753	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13347	69	1	341.36	0	Regular	754	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13348	63	1	233.76	0	Regular	755	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13349	10	1	247.32	0	Regular	756	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13350	15	2	979.12	0	Regular	757	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13351	65	1	373.94	0	Regular	758	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13352	59	1	397.98	0	Regular	759	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13354	70	1	743.53	0	Regular	760	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13355	121	1	674.7	0	Regular	761	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13356	79	1	768.24	0	Regular	762	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13357	256	1	609.4	1	Low Value	763	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13358	268	1	439.03	1	Low Value	764	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13359	63	1	439.56	0	Regular	765	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13362	8	4	3090.74	0	Regular	766	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13363	17	2	992.5	0	Regular	767	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13364	70	1	134.95999999999998	0	Regular	768	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13365	33	2	2225.37	0	Regular	769	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13366	49	1	56.16	0	Regular	770	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13368	256	2	623.4	1	Low Value	771	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13369	365	1	308.28000000000003	1	Low Value	772	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13370	371	1	754.87	1	Low Value	773	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13372	89	1	378.64	0	Regular	774	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13373	60	3	3312.25	0	Regular	775	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13375	88	1	778.65	0	Regular	776	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13376	98	3	1019.76	0	Regular	777	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13379	25	3	572.56	0	Regular	778	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13381	31	6	3639.31	0	Regular	779	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13382	280	1	222.99	1	Low Value	780	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13384	30	7	4151.93	0	Regular	781	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13385	329	1	534.57	1	Low Value	782	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13388	130	2	677.1	0	Regular	783	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13389	10	3	797.96	0	Regular	784	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13390	74	1	544.08	0	Regular	785	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13391	203	1	59.8	1	Low Value	786	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13394	1	8	2520.02	0	Regular	787	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13395	184	1	307.72	1	Low Value	788	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13396	28	2	1360.99	0	Regular	789	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13397	72	5	1544.13	0	Regular	790	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13398	191	1	457.34	1	Low Value	791	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13402	126	2	621.23	0	Regular	792	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13403	17	1	75	0	Regular	793	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13404	0	2	252.49	0	Regular	794	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13405	73	3	572.451	0	Regular	795	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13408	1	62	28117.04	0	Regular	796	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13410	23	5	1003.06	0	Regular	797	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13411	106	1	213.55	0	Regular	798	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13414	133	3	1390.5	0	Regular	799	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13416	43	2	712.5	0	Regular	800	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13417	4	2	640.83	0	Regular	801	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13418	11	18	6127.43	0	Regular	802	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13419	63	1	221.06	0	Regular	803	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13420	149	2	159.85	1	Low Value	804	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13421	39	2	1833.71	0	Regular	805	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13422	63	1	2626.3	0	Regular	806	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13425	107	3	1624.21	0	Regular	807	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13426	0	10	3641.32	0	Regular	808	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13427	18	3	582.6	0	Regular	809	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13428	9	1	201.78	0	Regular	810	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13429	10	4	1006.8	0	Regular	811	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13430	18	2	679.45	0	Regular	812	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13431	66	2	1269.1	0	Regular	813	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13434	73	2	534.24	0	Regular	814	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13435	4	7	3809.89	0	Regular	815	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13436	1	1	196.89	0	Regular	816	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13437	13	7	3408.06	0	Regular	817	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13439	254	1	283.71	1	Low Value	818	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13441	91	1	296.64	0	Regular	819	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13447	22	3	1129.14	0	Regular	820	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13448	16	6	3534.69	0	Regular	821	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13449	23	1	291.88	0	Regular	822	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13450	26	6	2043.72	0	Regular	823	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13451	25	5	2898.26	0	Regular	824	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13452	258	2	590	1	Low Value	825	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13453	165	2	356.98	1	Low Value	826	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13455	24	2	1058.34	0	Regular	827	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13456	17	6	1766.72	0	Regular	828	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13458	6	14	9646.57	0	Regular	829	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13460	28	2	183.44	0	Regular	830	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13461	38	3	1445	0	Regular	831	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13462	252	1	151.5	1	Low Value	832	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13464	57	1	674.68	0	Regular	833	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13466	183	1	307.9	1	Low Value	834	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13467	10	2	1071.91	0	Regular	835	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13468	1	37	5704.97	0	Regular	836	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13470	98	2	165	0	Regular	837	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13471	0	4	2501.84	0	Regular	838	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13473	60	2	422.64	0	Regular	839	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13474	235	1	226.84	1	Low Value	840	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13475	190	4	1431.78	1	Low Value	841	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13476	178	2	1238.47	1	Low Value	842	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13477	37	6	1454.58	0	Regular	843	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13479	200	2	300.95	1	Low Value	844	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13481	45	5	1804.56	0	Regular	845	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13482	231	1	184.64	1	Low Value	846	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13483	65	1	140.34	0	Regular	847	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13484	240	1	313.8	1	Low Value	848	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13485	232	1	454.24	1	Low Value	849	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13486	77	3	1122.41	0	Regular	850	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13487	57	3	575.4	0	Regular	851	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13488	16	13	8968.31	0	Regular	852	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13489	104	4	449.52	0	Regular	853	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13491	51	10	1215.82	0	Regular	854	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13492	135	3	1269.84	0	Regular	855	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13493	274	2	618.63	1	Low Value	856	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13494	311	1	316.26000000000005	1	Low Value	857	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13495	7	5	2044.87	0	Regular	858	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13496	10	2	653.33	0	Regular	859	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13497	282	2	348.05	1	Low Value	860	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13499	17	5	1159.11	0	Regular	861	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13500	22	3	1166.77	0	Regular	862	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13501	287	1	1340.32	1	Low Value	863	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13502	16	3	292	0	Regular	864	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13503	70	1	216.85	0	Regular	865	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13504	63	1	295.93	0	Regular	866	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13505	72	4	4393.63	0	Regular	867	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13506	315	2	458.52	1	Low Value	868	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13507	2	4	2479.16	0	Regular	869	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13508	243	1	110.97	1	Low Value	870	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13509	8	7	979.72	0	Regular	871	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13510	0	4	1791.56	0	Regular	872	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13512	260	1	251.21	1	Low Value	873	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13513	126	1	205.1	0	Regular	874	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13514	73	1	152.20000000000002	0	Regular	875	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13515	72	4	891.12	0	Regular	876	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13516	20	3	1389.41	0	Regular	877	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13517	59	3	2128.42	0	Regular	878	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13518	85	1	627.16	0	Regular	879	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13519	77	1	122.75	0	Regular	880	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13520	58	6	3624.35	0	Regular	881	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13521	0	3	1071.73	0	Regular	882	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13522	29	1	125.8	0	Regular	883	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13523	32	5	3964.88	0	Regular	884	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13524	40	5	680.1800000000001	0	Regular	885	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13525	14	2	628.78	0	Regular	886	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13527	33	7	2242.36	0	Regular	887	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13529	78	2	307.76	0	Regular	888	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13531	204	2	483.8	1	Low Value	889	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13532	33	1	210.31	0	Regular	890	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13533	182	3	269.09	1	Low Value	891	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13534	1	25	5870.08	0	Regular	892	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13536	0	7	3444.39	0	Regular	893	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13538	42	7	1280.85	0	Regular	894	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13539	85	3	631.34	0	Regular	895	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13544	39	2	276.06	0	Regular	896	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13546	11	3	621.09	0	Regular	897	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13548	95	2	678.16	0	Regular	898	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13549	25	7	918.2	0	Regular	899	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13551	318	1	91.8	1	Low Value	900	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13552	65	12	3740.07	0	Regular	901	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13555	73	4	4098.88	0	Regular	902	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13557	27	2	584.06	0	Regular	903	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13558	5	4	594.52	0	Regular	904	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13560	6	1	171.42000000000002	0	Regular	905	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13561	215	1	141.86	1	Low Value	906	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13562	81	3	1799.33	0	Regular	907	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13563	83	2	777.53	0	Regular	908	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13564	143	3	1724.67	1	Low Value	909	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13565	18	2	240.22	0	Regular	910	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13566	40	2	856.84	0	Regular	911	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13568	172	1	187.05	1	Low Value	912	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13569	16	2	338.62	0	Regular	913	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13570	242	1	239.49	1	Low Value	914	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13571	12	12	2088.94	0	Regular	915	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13572	205	1	1384.25	1	Low Value	916	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13573	49	2	290.25	0	Regular	917	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13575	22	5	732.0699999999999	0	Regular	918	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13576	9	18	6717.34	0	Regular	919	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13577	24	4	1687.6	0	Regular	920	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13579	14	2	467.04	0	Regular	921	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13581	308	1	118	1	Low Value	922	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13583	155	1	781.03	1	Low Value	923	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13584	306	1	142.4	1	Low Value	924	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13587	63	1	712.4	0	Regular	925	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13588	15	9	2478.95	0	Regular	926	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13589	14	2	379.65	0	Regular	927	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13590	10	6	1981.92	0	Regular	928	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13591	64	3	1117.13	0	Regular	929	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13592	35	4	247.96	0	Regular	930	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13593	107	5	2011.88	0	Regular	931	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13594	52	1	396.97	0	Regular	932	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13596	5	2	664.11	0	Regular	933	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13598	46	1	160.04	0	Regular	934	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13599	0	21	5149.92	0	Regular	935	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13600	311	1	219.52	1	Low Value	936	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13601	44	2	693.32	0	Regular	937	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13602	64	1	428.89	0	Regular	938	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13603	25	1	164.34	0	Regular	939	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13606	28	3	276.75	0	Regular	940	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13607	39	1	675.51	0	Regular	941	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13610	11	7	1082.33	0	Regular	942	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13611	88	3	1154.4	0	Regular	943	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13614	23	4	1585.46	0	Regular	944	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13615	318	1	417.69	1	Low Value	945	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13617	39	3	544.18	0	Regular	946	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13618	173	1	177.34	1	Low Value	947	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13621	116	1	213.85	0	Regular	948	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13623	30	5	727.74	0	Regular	949	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13626	252	1	257.23	1	Low Value	950	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13627	58	5	1638.47	0	Regular	951	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13629	22	11	7792.36	0	Regular	952	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13630	4	7	2031.78	0	Regular	953	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13631	99	11	3070.42	0	Regular	954	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13632	24	5	2118.93	0	Regular	955	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13634	32	5	1547.36	0	Regular	956	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13635	67	1	1071.03	0	Regular	957	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13636	36	5	949.12	0	Regular	958	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13637	51	3	804.3	0	Regular	959	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13638	15	1	122.64	0	Regular	960	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13639	73	1	1033.34	0	Regular	961	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13642	215	1	312.28	1	Low Value	962	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13643	30	3	519.44	0	Regular	963	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13644	15	4	2624.26	0	Regular	964	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13645	119	1	252.1	0	Regular	965	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13647	9	4	1648.12	0	Regular	966	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13649	256	2	346.6	1	Low Value	967	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13650	16	6	1836.34	0	Regular	968	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13651	34	2	94.2	0	Regular	969	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13652	45	3	1095.08	0	Regular	970	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13654	42	6	2707.33	0	Regular	971	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13655	113	2	932.97	0	Regular	972	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13656	164	2	379.65	1	Low Value	973	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13657	10	2	382.14	0	Regular	974	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13658	9	5	2639.17	0	Regular	975	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13659	205	2	1563	1	Low Value	976	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13662	85	3	881.26	0	Regular	977	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13663	178	1	189.47	1	Low Value	978	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13666	59	3	84.65	0	Regular	979	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13667	148	1	299.05	1	Low Value	980	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13668	2	21	6309.83	0	Regular	981	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13669	50	2	218.55	0	Regular	982	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13670	74	1	349.7	0	Regular	983	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13672	300	2	186.39	1	Low Value	984	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13673	18	2	387.44	0	Regular	985	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13675	150	2	486.8200000000001	1	Low Value	986	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13678	151	1	232.6	1	Low Value	987	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13680	0	4	3719.12	0	Regular	988	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13681	17	4	827.83	0	Regular	989	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13682	186	1	59.5	1	Low Value	990	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13684	285	1	65.13	1	Low Value	991	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13685	2	7	3119.44	0	Regular	992	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13686	182	1	72	1	Low Value	993	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13689	62	1	910	0	Regular	994	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13690	58	1	172.25	0	Regular	995	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13692	24	3	1488.32	0	Regular	996	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13694	3	50	65039.62	2	Premium	997	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13695	30	15	2504.13	0	Regular	998	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13697	38	1	151.29999999999998	0	Regular	999	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13699	154	1	308.58000000000004	1	Low Value	1000	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13700	25	10	2248.63	0	Regular	1001	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13703	317	1	99.5	1	Low Value	1002	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13704	4	9	2308.06	0	Regular	1003	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13705	7	3	711.86	0	Regular	1004	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13706	302	1	330.79	1	Low Value	1005	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13707	266	2	806.41	1	Low Value	1006	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13708	270	1	285.33	1	Low Value	1007	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13709	3	13	6307.650000000001	0	Regular	1008	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13710	31	1	180.48	0	Regular	1009	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13711	218	2	252.06	1	Low Value	1010	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13712	246	1	228.84	1	Low Value	1011	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13715	280	5	1077.39	1	Low Value	1012	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13716	268	1	138.28	1	Low Value	1013	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13717	31	6	1445.01	0	Regular	1014	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13718	245	2	306.55	1	Low Value	1015	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13719	14	5	1041.68	0	Regular	1016	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13720	116	4	799.9	0	Regular	1017	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13721	35	1	524.14	0	Regular	1018	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13722	131	3	2375.41	0	Regular	1019	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13723	216	1	199.85	1	Low Value	1020	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13725	49	8	1980.56	0	Regular	1021	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13726	38	2	1079.66	0	Regular	1022	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13727	28	2	333.48	0	Regular	1023	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13728	36	6	1016.14	0	Regular	1024	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13730	135	2	752.6	0	Regular	1025	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13731	218	2	610.59	1	Low Value	1026	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13732	27	1	491.86	0	Regular	1027	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13735	24	4	2883.54	0	Regular	1028	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13736	4	2	729.8	0	Regular	1029	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13737	199	1	339.6	1	Low Value	1030	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13739	17	1	216.9	0	Regular	1031	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13740	240	1	350.75	1	Low Value	1032	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13741	71	3	668.4300000000001	0	Regular	1033	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13742	16	12	3107.87	0	Regular	1034	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13743	2	7	1341.6	0	Regular	1035	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13744	94	2	1080.52	0	Regular	1036	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13745	161	1	300.04	1	Low Value	1037	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13747	373	1	79.6	1	Low Value	1038	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13748	95	5	948.25	0	Regular	1039	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13750	53	5	1647.26	0	Regular	1040	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13751	287	1	296.25	1	Low Value	1041	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13752	123	6	1175.38	0	Regular	1042	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13753	287	1	741.26	1	Low Value	1043	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13754	151	2	282.6	1	Low Value	1044	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13755	3	9	2108.06	0	Regular	1045	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13756	1	14	5189.52	0	Regular	1046	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13758	11	7	3190.55	0	Regular	1047	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13759	32	2	659.4100000000001	0	Regular	1048	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13760	53	2	286.79	0	Regular	1049	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13761	49	2	1070.65	0	Regular	1050	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13762	218	1	306.72	1	Low Value	1051	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13763	62	1	1714.96	0	Regular	1052	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13764	70	3	1519.42	0	Regular	1053	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13767	1	37	17220.36	0	Regular	1054	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13769	1	10	2796.51	0	Regular	1055	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13771	63	4	2634.45	0	Regular	1056	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13772	33	3	1122.63	0	Regular	1057	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13774	81	1	345	0	Regular	1058	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13777	0	33	25977.16	0	Regular	1059	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13778	102	1	178.7	0	Regular	1060	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13780	6	2	360.01	0	Regular	1061	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13781	250	1	127.84	1	Low Value	1062	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13782	12	6	908.86	0	Regular	1063	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13784	9	11	2462.79	0	Regular	1064	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13786	366	1	230.4	1	Low Value	1065	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13787	75	2	309.04	0	Regular	1066	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13790	3	1	348.8	0	Regular	1067	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13791	127	2	1516	0	Regular	1068	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13792	65	2	195.55	0	Regular	1069	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13798	0	57	37153.85	0	Regular	1070	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13799	116	2	688.86	0	Regular	1071	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13800	309	1	558.32	1	Low Value	1072	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13801	66	1	324.8	0	Regular	1073	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13802	138	3	4599.42	0	Regular	1074	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13803	254	1	277.07	1	Low Value	1075	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13804	30	7	2588.39	0	Regular	1076	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13805	51	2	924.6	0	Regular	1077	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13806	63	1	256.38	0	Regular	1078	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13807	366	1	112.6	1	Low Value	1079	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13808	5	5	1747.66	0	Regular	1080	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13809	304	1	155.05	1	Low Value	1081	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13810	28	3	1499.01	0	Regular	1082	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13811	183	3	814.5	1	Low Value	1083	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13812	41	3	539	0	Regular	1084	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13813	39	4	1366.86	0	Regular	1085	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13814	91	2	1579.12	0	Regular	1086	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13815	21	4	4027.36	0	Regular	1087	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13816	23	2	571.6700000000001	0	Regular	1088	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13817	28	2	382.98	0	Regular	1089	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13819	301	3	1140.35	1	Low Value	1090	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13821	144	2	385.64	1	Low Value	1091	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13822	5	2	632	0	Regular	1092	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13823	18	2	957.66	0	Regular	1093	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13824	32	5	1698.94	0	Regular	1094	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13826	175	1	189.5	1	Low Value	1095	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13827	57	3	409.8	0	Regular	1096	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13828	21	1	209.49	0	Regular	1097	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13831	15	6	2198.45	0	Regular	1098	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13832	18	1	52.2	0	Regular	1099	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13833	158	1	383.85	1	Low Value	1100	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13835	24	4	834.57	0	Regular	1101	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13837	211	2	266.59000000000003	1	Low Value	1102	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13838	5	4	674.82	0	Regular	1103	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13841	252	1	85	1	Low Value	1104	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13842	58	9	3385.62	0	Regular	1105	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13844	10	1	361.62	0	Regular	1106	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13845	64	1	312.98	0	Regular	1107	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13846	24	3	865.0600000000001	0	Regular	1108	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13848	91	3	1255	0	Regular	1109	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13849	51	2	1537.95	0	Regular	1110	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13850	128	1	1595.48	0	Regular	1111	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13851	95	3	2651.46	0	Regular	1112	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13853	56	1	1090.14	0	Regular	1113	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13854	8	25	8109.519999999999	0	Regular	1114	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13856	168	3	388.5	1	Low Value	1115	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13858	56	1	216.17	0	Regular	1116	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13859	325	1	201.16	1	Low Value	1117	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13860	0	5	1245.9	0	Regular	1118	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13862	17	8	2209.36	0	Regular	1119	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13863	247	1	305.78	1	Low Value	1120	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13865	57	4	501.56	0	Regular	1121	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13866	73	1	145.67000000000002	0	Regular	1122	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13867	30	3	1005.09	0	Regular	1123	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13868	6	2	3192.54	0	Regular	1124	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13869	122	4	3083.65	0	Regular	1125	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13870	1	8	2770.94	0	Regular	1126	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13871	22	13	6403.25	0	Regular	1127	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13873	119	3	389.6	0	Regular	1128	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13874	357	1	540.45	1	Low Value	1129	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13875	53	5	1786.79	0	Regular	1130	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13876	63	1	122.7	0	Regular	1131	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13877	85	1	117.24	0	Regular	1132	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13878	54	1	1271.57	0	Regular	1133	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13880	20	13	3219.77	0	Regular	1134	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13881	3	20	17159.52	0	Regular	1135	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13882	2	5	1191.13	0	Regular	1136	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13883	10	5	2674.48	0	Regular	1137	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13884	6	5	787.6	0	Regular	1138	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13885	188	2	506.8	1	Low Value	1139	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13886	70	1	243.56	0	Regular	1140	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13887	203	1	349.55	1	Low Value	1141	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13888	119	2	595.67	0	Regular	1142	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13889	92	1	416.9	0	Regular	1143	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13890	0	10	1883.81	0	Regular	1144	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13892	26	4	632.97	0	Regular	1145	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13893	297	1	821.1	1	Low Value	1146	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13894	23	3	564.62	0	Regular	1147	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13895	27	4	2593.07	0	Regular	1148	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13897	49	1	311.16	0	Regular	1149	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13898	325	1	155.93	1	Low Value	1150	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13899	15	2	388.52	0	Regular	1151	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13900	182	3	740.95	1	Low Value	1152	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13901	71	5	2867.2	0	Regular	1153	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13904	36	2	332.64	0	Regular	1154	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13908	79	4	2369.55	0	Regular	1155	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13911	56	9	2580.91	0	Regular	1156	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13914	11	2	626.45	0	Regular	1157	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13917	49	2	272.04	0	Regular	1158	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13918	49	2	1212.84	0	Regular	1159	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13919	58	2	384.81	0	Regular	1160	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13922	351	1	172.25	1	Low Value	1161	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13923	53	1	351.13	0	Regular	1162	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13924	1	6	1838.85	0	Regular	1163	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13925	92	4	678.25	0	Regular	1164	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13926	22	1	223.85	0	Regular	1165	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13927	74	1	348.99	0	Regular	1166	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13928	10	4	464.57	0	Regular	1167	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13929	168	2	842.65	1	Low Value	1168	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13930	57	2	337.34	0	Regular	1169	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13931	95	2	1237.53	0	Regular	1170	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13932	294	1	307.4	1	Low Value	1171	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13933	108	2	608.7900000000001	0	Regular	1172	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13934	263	1	922.1	1	Low Value	1173	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13936	179	1	376.58	1	Low Value	1174	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13937	168	1	158.85	1	Low Value	1175	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13938	34	1	71.66	0	Regular	1176	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13939	22	3	568.55	0	Regular	1177	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13940	16	4	839.14	0	Regular	1178	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13941	21	5	5112.96	0	Regular	1179	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13946	78	3	561.5699999999999	0	Regular	1180	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13947	64	1	90.6	0	Regular	1181	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13948	360	1	102	1	Low Value	1182	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13949	2	6	2427.32	0	Regular	1183	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13950	10	4	745.06	0	Regular	1184	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13951	175	3	674.45	1	Low Value	1185	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13952	217	2	3251.071	1	Low Value	1186	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13953	6	7	3515.68	0	Regular	1187	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13954	1	2	439.92	0	Regular	1188	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13955	153	2	322.96	1	Low Value	1189	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13956	4	5	1019.27	0	Regular	1190	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13959	78	3	594.04	0	Regular	1191	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13960	20	2	230.22	0	Regular	1192	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13962	21	2	169.55	0	Regular	1193	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13963	307	4	664.54	1	Low Value	1194	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13967	145	1	80.7	1	Low Value	1195	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13969	6	18	9024.17	0	Regular	1196	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13971	18	8	2758.26	0	Regular	1197	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13972	70	2	190.25	0	Regular	1198	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13973	286	1	264.7	1	Low Value	1199	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13974	48	1	413.59	0	Regular	1200	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13975	30	6	2461.24	0	Regular	1201	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13976	206	1	357.98	1	Low Value	1202	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13978	14	2	196.79	0	Regular	1203	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13979	72	1	869.87	0	Regular	1204	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13980	59	1	200.14	0	Regular	1205	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13982	38	4	1871.81	0	Regular	1206	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13983	29	12	2603.43	0	Regular	1207	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13984	26	5	920.51	0	Regular	1208	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13985	3	15	7060.13	0	Regular	1209	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13986	16	1	320.46	0	Regular	1210	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13988	19	6	4147.96	0	Regular	1211	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13989	65	2	1266.08	0	Regular	1212	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13990	212	1	311.3	1	Low Value	1213	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13991	11	6	852.88	0	Regular	1214	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13992	29	1	76.8	0	Regular	1215	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13993	42	9	3466.36	0	Regular	1216	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13994	3	6	2274.14	0	Regular	1217	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13995	14	5	1393.69	0	Regular	1218	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
13999	9	12	3901.81	0	Regular	1219	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14000	210	1	635.66	1	Low Value	1220	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14001	45	3	2043.08	0	Regular	1221	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14002	133	2	529.73	0	Regular	1222	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14004	42	7	4582.64	0	Regular	1223	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14005	9	5	2874.72	0	Regular	1224	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14006	115	3	962.19	0	Regular	1225	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14009	197	2	695.61	1	Low Value	1226	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14012	277	1	328.8	1	Low Value	1227	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14013	109	3	473.02	0	Regular	1228	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14014	76	1	505.18	0	Regular	1229	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14015	52	1	917.34	0	Regular	1230	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14016	161	4	4341.21	1	Low Value	1231	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14019	46	3	1421.61	0	Regular	1232	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14020	16	2	642.8	0	Regular	1233	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14021	154	3	631.9	1	Low Value	1234	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14022	224	1	440	1	Low Value	1235	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14023	6	2	584.07	0	Regular	1236	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14024	121	2	327.7	0	Regular	1237	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14027	60	1	104.82	0	Regular	1238	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14029	62	2	467.66	0	Regular	1239	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14030	17	8	2358.84	0	Regular	1240	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14031	6	19	17286.86	0	Regular	1241	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14032	1	11	2975.59	0	Regular	1242	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14034	21	3	648.89	0	Regular	1243	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14035	28	5	1428.02	0	Regular	1244	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14036	284	1	626.65	1	Low Value	1245	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14037	175	2	147.20000000000002	1	Low Value	1246	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14038	77	3	1560.38	0	Regular	1247	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14039	32	1	152.2	0	Regular	1248	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14040	40	12	3560.32	0	Regular	1249	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14041	265	1	141.41	1	Low Value	1250	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14044	26	4	646.42	0	Regular	1251	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14045	108	4	1659.75	0	Regular	1252	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14046	283	1	154.99	1	Low Value	1253	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14047	8	5	1308.61	0	Regular	1254	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14048	304	1	409.93	1	Low Value	1255	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14049	16	4	5578.72	0	Regular	1256	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14050	31	2	746.36	0	Regular	1257	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14051	0	23	15610.39	0	Regular	1258	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14052	19	1	225.36	0	Regular	1259	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14053	123	2	260.25	0	Regular	1260	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14054	64	1	92.46	0	Regular	1261	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14055	105	1	725.6400000000001	0	Regular	1262	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14056	0	23	8152.71	0	Regular	1263	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14057	23	17	6211.66	0	Regular	1264	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14059	266	1	183.6	1	Low Value	1265	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14060	4	19	6140.42	0	Regular	1266	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14062	9	12	10464.85	0	Regular	1267	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14064	28	5	1334.34	0	Regular	1268	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14066	266	1	152.55	1	Low Value	1269	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14067	63	2	374.7	0	Regular	1270	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14068	319	1	265.85	1	Low Value	1271	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14071	3	8	1437.57	0	Regular	1272	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14073	31	1	151.04	0	Regular	1273	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14075	4	3	942.26	0	Regular	1274	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14076	128	1	118.67	0	Regular	1275	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14077	40	5	499.42	0	Regular	1276	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14078	101	6	1049.37	0	Regular	1277	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14079	124	1	375.1	0	Regular	1278	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14080	32	1	45.6	0	Regular	1279	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14081	301	2	921.62	1	Low Value	1280	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14082	364	1	182.25	1	Low Value	1281	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14083	3	9	1002.9	0	Regular	1282	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14085	1	18	4421.29	0	Regular	1283	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14087	2	1	191.47	0	Regular	1284	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14088	9	13	50491.81	0	Regular	1285	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14089	56	1	158.75	0	Regular	1286	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14090	324	1	76.32000000000001	1	Low Value	1287	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14092	7	14	4076.91	0	Regular	1288	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14093	11	1	433.86	0	Regular	1289	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14096	3	17	65164.79	0	Regular	1290	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14098	36	1	147.35	0	Regular	1291	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14099	15	11	3104.17	0	Regular	1292	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14100	137	1	191.95	1	Low Value	1293	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14101	73	6	5976.79	0	Regular	1294	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14102	4	5	1105.88	0	Regular	1295	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14104	154	2	216.21	1	Low Value	1296	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14105	238	1	1266.23	1	Low Value	1297	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14107	51	7	2703.23	0	Regular	1298	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14108	30	2	597.91	0	Regular	1299	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14109	72	1	144.2	0	Regular	1300	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14110	3	12	5683.15	0	Regular	1301	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14111	13	4	692.85	0	Regular	1302	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14112	22	7	2915.15	0	Regular	1303	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14113	3	4	1840.42	0	Regular	1304	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14114	273	2	386.53	1	Low Value	1305	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14116	19	5	1382.74	0	Regular	1306	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14117	143	1	90	1	Low Value	1307	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14121	3	4	2780.15	0	Regular	1308	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14124	83	1	419.58	0	Regular	1309	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14125	10	3	2720.63	0	Regular	1310	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14126	7	3	706.1300000000001	0	Regular	1311	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14127	122	3	709.71	0	Regular	1312	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14128	60	2	637.5	0	Regular	1313	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14129	1	5	1123.86	0	Regular	1314	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14130	318	1	480.91	1	Low Value	1315	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14132	1	11	3586.03	0	Regular	1316	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14133	129	3	605.64	0	Regular	1317	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14135	1	15	4690.31	0	Regular	1318	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14138	1	2	965.88	0	Regular	1319	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14139	45	1	415.82	0	Regular	1320	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14140	3	2	935.05	0	Regular	1321	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14141	2	4	915.13	0	Regular	1322	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14142	372	1	311.81	1	Low Value	1323	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14143	133	1	115.8	0	Regular	1324	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14145	46	4	3742.2	0	Regular	1325	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14146	8	5	4191	0	Regular	1326	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14147	77	2	483.4	0	Regular	1327	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14148	233	1	157.2	1	Low Value	1328	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14149	220	1	446.62	1	Low Value	1329	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14150	35	2	658.64	0	Regular	1330	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14152	74	2	621.29	0	Regular	1331	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14154	238	2	1345.62	1	Low Value	1332	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14155	265	1	118.75	1	Low Value	1333	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14156	9	55	117210.08	2	Premium	1334	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14157	19	2	424.89	0	Regular	1335	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14158	39	1	507.66	0	Regular	1336	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14159	19	11	4630.35	0	Regular	1337	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14161	215	3	1097.62	1	Low Value	1338	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14162	173	2	289.36	1	Low Value	1339	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14163	86	4	2445.91	0	Regular	1340	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14164	70	2	1631.77	0	Regular	1341	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14165	275	1	120.44	1	Low Value	1342	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14167	38	4	562.59	0	Regular	1343	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14171	97	1	363.79	0	Regular	1344	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14173	10	4	450.84	0	Regular	1345	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14174	32	1	134.46	0	Regular	1346	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14175	59	3	3222.3	0	Regular	1347	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14176	296	4	576.9000000000001	1	Low Value	1348	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14177	85	4	549.46	0	Regular	1349	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14178	8	7	1600.26	0	Regular	1350	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14179	40	2	701.57	0	Regular	1351	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14180	10	25	4748.52	0	Regular	1352	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14184	66	1	452.89	0	Regular	1353	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14185	330	1	197.65	1	Low Value	1354	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14188	30	6	2054.36	0	Regular	1355	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14189	1	15	4654.08	0	Regular	1356	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14191	1	13	4684.76	0	Regular	1357	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14193	67	2	853.39	0	Regular	1358	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14194	4	21	11349.52	0	Regular	1359	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14195	201	2	1012	1	Low Value	1360	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14196	106	1	335.52	0	Regular	1361	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14198	17	4	701.4	0	Regular	1362	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14199	217	1	185.4	1	Low Value	1363	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14201	59	7	747.44	0	Regular	1364	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14204	1	1	150.61	0	Regular	1365	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14205	16	2	466.7	0	Regular	1366	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14206	238	1	328.16	1	Low Value	1367	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14208	94	1	151.74	0	Regular	1368	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14209	10	6	2073.43	0	Regular	1369	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14210	105	6	1905.84	0	Regular	1370	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14211	52	9	2241.1	0	Regular	1371	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14212	89	1	1070.48	0	Regular	1372	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14214	30	5	1004.38	0	Regular	1373	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14215	11	6	1789.72	0	Regular	1374	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14216	2	4	1839.3	0	Regular	1375	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14217	1	17	2004.98	0	Regular	1376	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14218	42	1	169.48000000000002	0	Regular	1377	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14219	3	1	89.94	0	Regular	1378	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14220	246	2	632.4	1	Low Value	1379	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14221	41	9	3432.8	0	Regular	1380	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14222	176	1	683.17	1	Low Value	1381	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14223	91	3	991.13	0	Regular	1382	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14224	109	4	1009.73	0	Regular	1383	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14226	28	5	2214.79	0	Regular	1384	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14227	25	10	3350.96	0	Regular	1385	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14229	51	3	1547.2	0	Regular	1386	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14231	183	3	925.71	1	Low Value	1387	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14232	42	5	2048.07	0	Regular	1388	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14233	48	4	1462.72	0	Regular	1389	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14234	21	4	754.12	0	Regular	1390	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14235	74	5	3144.86	0	Regular	1391	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14236	80	2	490.86	0	Regular	1392	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14237	372	1	161	1	Low Value	1393	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14238	325	1	146.85	1	Low Value	1394	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14239	42	11	2380.85	0	Regular	1395	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14240	29	2	890.34	0	Regular	1396	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14241	183	1	213.7	1	Low Value	1397	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14242	234	2	280.55	1	Low Value	1398	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14243	8	10	2588.77	0	Regular	1399	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14245	219	2	1693.45	1	Low Value	1400	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14246	110	3	1474.06	0	Regular	1401	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14247	277	1	136.76999999999998	1	Low Value	1402	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14248	317	1	302.58	1	Low Value	1403	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14250	6	3	1904.05	0	Regular	1404	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14251	1	5	2879.7000000000003	0	Regular	1405	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14256	259	2	969.06	1	Low Value	1406	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14257	63	5	3099.7200000000003	0	Regular	1407	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14258	8	9	12669.98	0	Regular	1408	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14259	141	1	120	1	Low Value	1409	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14261	50	2	1163.45	0	Regular	1410	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14262	7	8	2618.23	0	Regular	1411	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14264	154	2	333.97	1	Low Value	1412	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14265	108	2	530.18	0	Regular	1413	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14267	162	3	1516.24	1	Low Value	1414	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14270	331	1	492.65	1	Low Value	1415	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14271	225	1	112.32	1	Low Value	1416	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14272	73	2	437.96	0	Regular	1417	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14273	50	4	559.97	0	Regular	1418	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14276	98	3	1119.74	0	Regular	1419	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14277	14	3	4188	0	Regular	1420	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14280	196	1	134.04	1	Low Value	1421	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14282	2	15	3701.44	0	Regular	1422	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14284	30	2	595.25	0	Regular	1423	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14285	20	4	1910.01	0	Regular	1424	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14286	23	3	4628.75	0	Regular	1425	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14287	7	3	176.63	0	Regular	1426	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14288	212	1	426.6	1	Low Value	1427	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14289	8	6	911.26	0	Regular	1428	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14290	10	5	2314.65	0	Regular	1429	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14291	1	11	3883.25	0	Regular	1430	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14292	7	9	4871.93	0	Regular	1431	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14293	2	4	1046.56	0	Regular	1432	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14295	39	1	166.20000000000002	0	Regular	1433	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14297	17	4	1305.33	0	Regular	1434	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14298	7	44	51527.3	0	Regular	1435	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14299	7	9	3965.62	0	Regular	1436	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14300	18	1	43.2	0	Regular	1437	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14301	116	1	640.14	0	Regular	1438	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14304	222	1	383.45	1	Low Value	1439	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14305	70	3	1858.96	0	Regular	1440	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14306	50	2	2093.32	0	Regular	1441	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14307	88	6	2995.72	0	Regular	1442	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14309	7	9	2352.53	0	Regular	1443	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14311	242	1	310.26	1	Low Value	1444	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14312	46	6	1611.59	0	Regular	1445	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14314	106	1	120	0	Regular	1446	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14315	44	6	2481.13	0	Regular	1447	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14317	64	1	508.58	0	Regular	1448	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14320	206	2	477.79	1	Low Value	1449	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14321	10	5	1530.75	0	Regular	1450	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14323	114	2	605.0600000000001	0	Regular	1451	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14326	241	1	183.85	1	Low Value	1452	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14327	162	1	311.65	1	Low Value	1453	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14329	16	7	4975.24	0	Regular	1454	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14331	123	2	462.66	0	Regular	1455	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14332	22	3	840.21	0	Regular	1456	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14333	67	1	415.2	0	Regular	1457	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14334	16	8	2552.21	0	Regular	1458	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14335	15	2	454.86	0	Regular	1459	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14336	16	4	1614.91	0	Regular	1460	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14338	160	2	588.22	1	Low Value	1461	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14339	242	1	309.52	1	Low Value	1462	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14340	218	1	134.7	1	Low Value	1463	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14341	44	8	2166.98	0	Regular	1464	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14342	20	4	668.5600000000001	0	Regular	1465	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14344	126	8	889.9300000000001	0	Regular	1466	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14345	38	1	108.98	0	Regular	1467	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14346	120	2	1021.58	0	Regular	1468	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14348	259	1	409.57	1	Low Value	1469	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14349	9	1	133.5	0	Regular	1470	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14350	273	1	282.93	1	Low Value	1471	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14351	164	1	51	1	Low Value	1472	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14352	156	4	1078.96	1	Low Value	1473	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14353	214	1	90.6	1	Low Value	1474	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14354	5	2	163.62	0	Regular	1475	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14355	365	1	174.4	1	Low Value	1476	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14356	79	2	701.23	0	Regular	1477	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14357	42	1	225.12	0	Regular	1478	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14359	18	3	912.18	0	Regular	1479	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14360	31	4	2118.03	0	Regular	1480	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14362	21	1	151.5	0	Regular	1481	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14364	108	8	3717.35	0	Regular	1482	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14367	7	16	9227.82	0	Regular	1483	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14368	319	1	155	1	Low Value	1484	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14371	294	1	100.5	1	Low Value	1485	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14373	357	1	76.55	1	Low Value	1486	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14375	184	1	235.56	1	Low Value	1487	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14377	190	2	617.05	1	Low Value	1488	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14379	43	2	348.1	0	Regular	1489	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14381	51	1	202.68	0	Regular	1490	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14382	25	1	615.49	0	Regular	1491	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14383	37	3	1247.69	0	Regular	1492	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14385	8	3	202.11	0	Regular	1493	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14386	296	1	142.4	1	Low Value	1494	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14387	32	3	1727.6	0	Regular	1495	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14388	9	8	3212.84	0	Regular	1496	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14389	64	2	1043.46	0	Regular	1497	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14390	9	9	4642.57	0	Regular	1498	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14393	217	1	67.95	1	Low Value	1499	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14395	1	9	3479.91	0	Regular	1500	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14396	64	2	487.99	0	Regular	1501	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14397	2	19	2612.96	0	Regular	1502	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14400	148	1	574.7	1	Low Value	1503	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14401	3	13	4051.48	0	Regular	1504	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14403	129	4	1475.81	0	Regular	1505	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14404	33	6	1449.32	0	Regular	1506	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14406	118	1	156.75	0	Regular	1507	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14407	106	6	2157.73	0	Regular	1508	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14408	10	7	2599.03	0	Regular	1509	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14409	70	6	2059.4500000000003	0	Regular	1510	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14410	91	9	1100.27	0	Regular	1511	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14411	310	1	1063	1	Low Value	1512	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14412	42	2	770.03	0	Regular	1513	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14413	361	1	121.05	1	Low Value	1514	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14414	91	7	1496.98	0	Regular	1515	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14415	0	13	5855.57	0	Regular	1516	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14416	21	2	490.22	0	Regular	1517	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14418	3	3	1937.25	0	Regular	1518	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14419	10	6	1051.79	0	Regular	1519	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14420	98	1	387.52	0	Regular	1520	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14421	56	2	813.11	0	Regular	1521	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14422	0	6	4263.64	0	Regular	1522	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14423	217	1	265.2	1	Low Value	1523	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14424	17	1	322.08	0	Regular	1524	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14426	23	10	4481.67	0	Regular	1525	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14427	49	2	363.34	0	Regular	1526	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14428	6	5	1224.06	0	Regular	1527	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14431	302	1	470.36	1	Low Value	1528	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14432	9	6	2248.5	0	Regular	1529	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14434	21	6	1372.8	0	Regular	1530	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14436	98	1	89.06	0	Regular	1531	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14437	365	1	63	1	Low Value	1532	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14438	305	1	131.9	1	Low Value	1533	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14439	319	1	2661.24	1	Low Value	1534	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14440	7	5	2357.6800000000003	0	Regular	1535	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14441	0	4	1712.89	0	Regular	1536	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14442	204	2	1589.82	1	Low Value	1537	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14443	53	4	1420.2	0	Regular	1538	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14446	0	4	1010.35	0	Regular	1539	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14447	18	5	1163.23	0	Regular	1540	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14448	8	2	375.35	0	Regular	1541	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14449	18	4	885.8	0	Regular	1542	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14450	180	3	483.25	1	Low Value	1543	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14451	59	2	643.9	0	Regular	1544	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14452	10	2	259.05	0	Regular	1545	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14453	189	1	119.93	1	Low Value	1546	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14456	4	9	3017.28	0	Regular	1547	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14457	310	1	113.64	1	Low Value	1548	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14459	154	1	1837.92	1	Low Value	1549	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14460	109	3	434.34	0	Regular	1550	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14461	147	3	2103.06	1	Low Value	1551	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14462	65	11	1980.57	0	Regular	1552	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14463	97	3	529.62	0	Regular	1553	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14465	246	3	1038.44	1	Low Value	1554	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14466	28	7	2272.4	0	Regular	1555	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14467	17	4	596.26	0	Regular	1556	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14470	11	2	461.19	0	Regular	1557	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14472	103	8	1852.67	0	Regular	1558	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14473	73	2	234.34000000000003	0	Regular	1559	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14474	45	1	547.66	0	Regular	1560	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14475	71	3	925.85	0	Regular	1561	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14476	256	1	193	1	Low Value	1562	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14477	19	4	1309.6	0	Regular	1563	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14479	253	2	316.25	1	Low Value	1564	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14480	10	1	279.05	0	Regular	1565	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14481	164	2	636.51	1	Low Value	1566	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14482	17	6	2022.81	0	Regular	1567	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14483	281	1	137.1	1	Low Value	1568	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14484	49	1	321.92	0	Regular	1569	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14485	38	1	162.8	0	Regular	1570	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14487	26	6	1165.48	0	Regular	1571	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14488	67	1	1064.28	0	Regular	1572	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14489	206	1	463.38	1	Low Value	1573	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14491	174	2	340.93	1	Low Value	1574	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14493	6	5	2383.24	0	Regular	1575	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14494	25	1	139.56	0	Regular	1576	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14495	50	2	123.8	0	Regular	1577	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14496	311	2	538.8100000000001	1	Low Value	1578	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14497	308	1	475.37	1	Low Value	1579	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14498	42	5	1957.32	0	Regular	1580	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14499	25	3	808.44	0	Regular	1581	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14500	87	3	356.85	0	Regular	1582	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14501	183	2	251.21	1	Low Value	1583	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14502	19	11	2429.83	0	Regular	1584	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14503	2	6	3543.26	0	Regular	1585	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14504	46	4	673.26	0	Regular	1586	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14505	16	8	5859.43	0	Regular	1587	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14506	16	5	1960.65	0	Regular	1588	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14507	23	6	1367.88	0	Regular	1589	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14508	21	2	268.05	0	Regular	1590	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14511	10	5	1314.81	0	Regular	1591	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14512	187	2	275.28	1	Low Value	1592	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14513	100	3	455.59	0	Regular	1593	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14514	60	3	990.2	0	Regular	1594	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14515	17	6	2076.89	0	Regular	1595	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14517	32	2	330.45	0	Regular	1596	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14518	63	1	174.37	0	Regular	1597	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14520	1	2	270.6	0	Regular	1598	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14522	23	4	974.54	0	Regular	1599	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14523	107	1	241.09	0	Regular	1600	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14524	31	9	1843.83	0	Regular	1601	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14525	19	9	4215.9	0	Regular	1602	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14527	2	55	8507.13	0	Regular	1603	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14528	36	1	364.22	0	Regular	1604	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14529	59	3	578.61	0	Regular	1605	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14530	25	6	2862.11	0	Regular	1606	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14532	235	4	932.85	1	Low Value	1607	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14533	24	7	1949.72	0	Regular	1608	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14534	2	18	4397.3	0	Regular	1609	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14535	59	3	2854.84	0	Regular	1610	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14536	259	1	170.95	1	Low Value	1611	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14537	57	1	355.56	0	Regular	1612	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14538	64	2	388.25	0	Regular	1613	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14539	15	2	537.48	0	Regular	1614	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14540	9	3	952.66	0	Regular	1615	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14541	58	8	1453.35	0	Regular	1616	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14542	185	1	103.25	1	Low Value	1617	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14543	28	16	3599.73	0	Regular	1618	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14544	23	2	2004.3	0	Regular	1619	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14546	4	5	2573.93	0	Regular	1620	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14547	3	8	3974.75	0	Regular	1621	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14548	150	2	652.8	1	Low Value	1622	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14549	310	1	289.24	1	Low Value	1623	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14550	10	2	757.37	0	Regular	1624	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14551	17	2	186.23	0	Regular	1625	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14552	151	1	164.22	1	Low Value	1626	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14553	18	5	859.27	0	Regular	1627	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14554	9	4	2279.49	0	Regular	1628	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14555	56	2	312.54	0	Regular	1629	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14557	84	1	788.38	0	Regular	1630	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14560	6	22	2237.77	0	Regular	1631	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14561	75	3	1080.76	0	Regular	1632	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14562	3	18	5006.77	0	Regular	1633	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14565	95	4	3099.12	0	Regular	1634	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14566	110	1	1432	0	Regular	1635	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14567	56	2	1530.36	0	Regular	1636	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14569	0	1	227.39	0	Regular	1637	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14570	280	2	218.06	1	Low Value	1638	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14572	2	7	2804.54	0	Regular	1639	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14573	179	9	1639.82	1	Low Value	1640	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14576	371	1	35.400000000000006	1	Low Value	1641	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14577	12	4	859.71	0	Regular	1642	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14578	2	1	168.63	0	Regular	1643	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14581	16	1	138.6	0	Regular	1644	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14582	40	1	114.11	0	Regular	1645	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14583	5	5	986.96	0	Regular	1646	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14584	168	4	1033.06	1	Low Value	1647	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14585	49	1	157.05	0	Regular	1648	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14586	276	1	237.36	1	Low Value	1649	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14587	18	9	1580.29	0	Regular	1650	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14589	371	1	39.75	1	Low Value	1651	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14591	14	4	1320.21	0	Regular	1652	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14592	34	3	557.94	0	Regular	1653	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14593	21	3	617.15	0	Regular	1654	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14594	6	2	363.33	0	Regular	1655	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14595	19	6	1740.6	0	Regular	1656	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14597	10	2	866.24	0	Regular	1657	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14598	43	1	221.97	0	Regular	1658	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14600	305	1	393.33	1	Low Value	1659	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14601	10	1	213.96	0	Regular	1660	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14603	274	1	660	1	Low Value	1661	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14606	0	93	12076.15	0	Regular	1662	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14607	15	14	16209.5	0	Regular	1663	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14608	3	4	1785.15	0	Regular	1664	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14609	71	4	601.56	0	Regular	1665	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14616	242	3	406.08	1	Low Value	1666	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14618	8	3	553.44	0	Regular	1667	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14619	245	1	394.44	1	Low Value	1668	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14620	205	2	412.78	1	Low Value	1669	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14621	0	5	1788.36	0	Regular	1670	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14622	184	1	320.58000000000004	1	Low Value	1671	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14623	31	5	886.7	0	Regular	1672	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14624	56	2	225.85	0	Regular	1673	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14625	195	2	899.63	1	Low Value	1674	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14626	23	4	2791.27	0	Regular	1675	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14628	90	2	671.96	0	Regular	1676	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14629	3	2	955.26	0	Regular	1677	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14631	50	3	1006.98	0	Regular	1678	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14632	262	1	114.56	1	Low Value	1679	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14633	265	1	344.90000000000003	1	Low Value	1680	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14636	35	2	609.85	0	Regular	1681	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14638	50	1	443.6	0	Regular	1682	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14639	51	6	2984.49	0	Regular	1683	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14640	23	6	2107.38	0	Regular	1684	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14641	21	1	110.46	0	Regular	1685	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14642	58	1	96.12	0	Regular	1686	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14643	169	2	693.8100000000001	1	Low Value	1687	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14644	67	2	830.76	0	Regular	1688	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14645	156	2	597.09	1	Low Value	1689	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14646	1	73	280206.02	2	Premium	1690	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14647	200	1	236.04	1	Low Value	1691	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14649	4	4	1402.59	0	Regular	1692	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14651	66	2	653.75	0	Regular	1693	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14652	76	1	114.18	0	Regular	1694	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14653	0	7	1926.65	0	Regular	1695	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14655	7	4	1932.23	0	Regular	1696	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14656	168	2	291.05	1	Low Value	1697	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14657	17	4	848.22	0	Regular	1698	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14658	4	2	247.15	0	Regular	1699	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14659	8	9	2529.93	0	Regular	1700	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14660	86	2	285.74	0	Regular	1701	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14661	26	1	107.95	0	Regular	1702	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14662	28	4	741.37	0	Regular	1703	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14664	19	2	636.24	0	Regular	1704	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14665	60	5	1835.7	0	Regular	1705	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14666	23	1	195.25	0	Regular	1706	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14667	10	25	9175.04	0	Regular	1707	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14669	241	3	1259.24	1	Low Value	1708	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14670	279	2	392.86	1	Low Value	1709	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14672	234	2	765.55	1	Low Value	1710	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14673	2	5	1736.4	0	Regular	1711	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14675	15	1	596.36	0	Regular	1712	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14676	30	6	2548.24	0	Regular	1713	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14680	24	16	28754.11	0	Regular	1714	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14681	70	3	498.95	0	Regular	1715	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14682	187	2	52	1	Low Value	1716	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14684	25	5	1201.51	0	Regular	1717	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14687	106	1	628.38	0	Regular	1718	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14688	7	21	5579.1	0	Regular	1719	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14689	208	1	112.8	1	Low Value	1720	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14690	43	2	355.05	0	Regular	1721	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14691	30	5	2114.33	0	Regular	1722	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14692	136	4	591.55	0	Regular	1723	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14693	264	1	172.9	1	Low Value	1724	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14696	3	7	2078.95	0	Regular	1725	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14697	217	2	188.61	1	Low Value	1726	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14698	1	5	1217.27	0	Regular	1727	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14699	213	1	109.13	1	Low Value	1728	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14700	31	3	2195.1	0	Regular	1729	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14701	10	9	2526.09	0	Regular	1730	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14702	0	17	3251.79	0	Regular	1731	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14703	14	1	318.17	0	Regular	1732	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14704	10	9	1493.96	0	Regular	1733	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14705	198	1	179	1	Low Value	1734	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14708	2	3	1126.37	0	Regular	1735	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14709	14	13	4921.04	0	Regular	1736	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14710	13	4	599.48	0	Regular	1737	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14711	9	11	2839.62	0	Regular	1738	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14712	28	3	917.07	0	Regular	1739	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14713	8	11	2662.2	0	Regular	1740	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14714	23	1	160.19	0	Regular	1741	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14715	24	4	867.38	0	Regular	1742	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14716	42	2	307.51	0	Regular	1743	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14719	1	5	1581.84	0	Regular	1744	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14720	5	3	663.81	0	Regular	1745	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14722	146	1	180.42	1	Low Value	1746	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14723	9	6	1122.36	0	Regular	1747	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14725	24	1	655.58	0	Regular	1748	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14727	273	1	268.58	1	Low Value	1749	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14729	373	1	313.49	1	Low Value	1750	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14730	0	8	1897.57	0	Regular	1751	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14731	46	3	380.02	0	Regular	1752	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14732	7	8	2702.49	0	Regular	1753	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14733	15	12	9585.91	0	Regular	1754	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14735	3	32	6065.69	0	Regular	1755	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14737	3	3	1164.55	0	Regular	1756	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14738	42	7	1314.45	0	Regular	1757	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14739	3	7	3902.28	0	Regular	1758	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14740	196	3	1448.21	1	Low Value	1759	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14741	11	6	1400.34	0	Regular	1760	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14744	15	7	1099.98	0	Regular	1761	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14745	112	5	1220.26	0	Regular	1762	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14747	248	1	328.2	1	Low Value	1763	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14748	28	5	1415.75	0	Regular	1764	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14752	43	1	389.64	0	Regular	1765	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14753	86	1	563.15	0	Regular	1766	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14754	44	2	638.05	0	Regular	1767	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14755	9	11	5010.28	0	Regular	1768	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14756	14	1	738.96	0	Regular	1769	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14757	74	1	420.5	0	Regular	1770	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14758	144	4	1484.06	0	Regular	1771	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14759	4	3	1625.97	0	Regular	1772	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14760	296	1	89.2	1	Low Value	1773	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14761	58	2	255.9	0	Regular	1774	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14762	263	1	300.52	1	Low Value	1775	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14764	46	1	278.3	0	Regular	1776	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14765	28	3	254.11	0	Regular	1777	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14766	7	6	2473.37	0	Regular	1778	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14768	16	2	192.6	0	Regular	1779	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14769	2	8	10416.98	0	Regular	1780	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14770	231	2	876.42	1	Low Value	1781	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14772	111	1	139.26	0	Regular	1782	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14775	57	3	1011.9	0	Regular	1783	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14776	50	11	2538.3	0	Regular	1784	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14778	126	2	730.86	0	Regular	1785	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14779	280	3	386.15	1	Low Value	1786	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14780	54	2	447.68	0	Regular	1787	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14782	319	1	200.1	1	Low Value	1788	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14784	25	2	289.99	0	Regular	1789	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14785	9	2	77.4	0	Regular	1790	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14788	6	2	679.4399999999999	0	Regular	1791	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14789	28	1	197.64	0	Regular	1792	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14790	16	4	745.06	0	Regular	1793	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14792	63	1	6.2	0	Regular	1794	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14793	20	1	228.99	0	Regular	1795	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14794	2	7	1319.91	0	Regular	1796	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14795	165	1	131.45000000000002	1	Low Value	1797	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14796	0	17	7975.49	0	Regular	1798	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14798	52	3	173.74	0	Regular	1799	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14799	50	1	157.7	0	Regular	1800	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14800	47	12	4331.79	0	Regular	1801	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14801	60	1	189.34	0	Regular	1802	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14803	161	3	845.55	1	Low Value	1803	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14804	8	1	353.27	0	Regular	1804	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14805	14	4	546.4	0	Regular	1805	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14806	74	1	193.39	0	Regular	1806	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14808	39	8	2718.6	0	Regular	1807	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14810	40	11	2085.33	0	Regular	1808	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14813	369	2	152.88	1	Low Value	1809	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14815	36	2	778.5	0	Regular	1810	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14816	196	1	271.85	1	Low Value	1811	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14817	199	2	1110.34	1	Low Value	1812	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14818	73	3	657.8	0	Regular	1813	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14819	63	2	272.07	0	Regular	1814	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14820	20	4	507.29	0	Regular	1815	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14821	366	1	48.8	1	Low Value	1816	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14823	179	3	321.43	1	Low Value	1817	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14824	9	4	1127.71	0	Regular	1818	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14825	3	12	2221.01	0	Regular	1819	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14828	196	3	2139.76	1	Low Value	1820	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14829	28	4	697.55	0	Regular	1821	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14830	52	1	188.88	0	Regular	1822	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14834	17	6	1720.3	0	Regular	1823	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14836	9	3	102.45	0	Regular	1824	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14837	89	4	1649.5	0	Regular	1825	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14840	267	1	62.85	1	Low Value	1826	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14841	52	6	3295.76	0	Regular	1827	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14842	43	4	2824.69	0	Regular	1828	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14844	63	4	3189.81	0	Regular	1829	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14847	148	1	309.4	1	Low Value	1830	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14849	21	25	7930.54	0	Regular	1831	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14850	311	1	325.75	1	Low Value	1832	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14851	22	2	511.35	0	Regular	1833	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14852	57	6	2836.69	0	Regular	1834	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14853	23	2	475.8	0	Regular	1835	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14854	77	7	2740.03	0	Regular	1836	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14855	118	2	645.65	0	Regular	1837	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14856	35	3	1290.53	0	Regular	1838	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14857	59	2	1173.12	0	Regular	1839	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14859	12	4	1353.74	0	Regular	1840	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14860	18	1	170.32	0	Regular	1841	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14861	51	1	125.79	0	Regular	1842	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14862	25	2	841.1999999999999	0	Regular	1843	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14863	28	1	266.76	0	Regular	1844	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14865	6	2	52.2	0	Regular	1845	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14866	10	12	14389.9	0	Regular	1846	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14867	185	3	710.28	1	Low Value	1847	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14868	2	8	2953.59	0	Regular	1848	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14869	8	2	721.45	0	Regular	1849	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14870	261	1	327.25	1	Low Value	1850	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14871	2	4	501.28	0	Regular	1851	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14873	209	1	519.68	1	Low Value	1852	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14875	107	2	1465.3200000000002	0	Regular	1853	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14878	12	9	1476.09	0	Regular	1854	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14880	76	3	690.59	0	Regular	1855	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14881	19	1	255.4	0	Regular	1856	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14882	26	2	589.7	0	Regular	1857	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14883	18	6	761.59	0	Regular	1858	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14885	131	1	765.3199999999999	0	Regular	1859	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14886	252	1	364.8	1	Low Value	1860	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14887	78	1	1862	0	Regular	1861	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14888	206	1	369.2	1	Low Value	1862	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14889	335	1	135.9	1	Low Value	1863	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14890	253	1	125.65	1	Low Value	1864	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14891	147	2	554.38	1	Low Value	1865	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14893	9	2	1237.85	0	Regular	1866	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14894	84	1	655.75	0	Regular	1867	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14895	7	20	11138.71	0	Regular	1868	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14896	204	2	468.77	1	Low Value	1869	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14897	7	4	1366.38	0	Regular	1870	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14898	22	6	1269.31	0	Regular	1871	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14901	10	9	1421.29	0	Regular	1872	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14902	25	1	332.66	0	Regular	1873	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14903	20	5	2795.33	0	Regular	1874	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14904	1	2	1025.44	0	Regular	1875	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14905	157	2	616.15	1	Low Value	1876	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14907	2	7	3501.1	0	Regular	1877	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14908	73	1	277.8	0	Regular	1878	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14910	2	4	434.35	0	Regular	1879	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14911	0	201	143711.17	2	Premium	1880	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14912	16	2	867.85	0	Regular	1881	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14913	35	4	1227.43	0	Regular	1882	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14915	90	2	307.48	0	Regular	1883	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14916	70	4	1268.98	0	Regular	1884	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14918	115	2	1610.15	0	Regular	1885	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14920	212	2	977.77	1	Low Value	1886	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14921	29	2	1316.07	0	Regular	1887	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14923	50	1	749.1	0	Regular	1888	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14924	245	1	310.05	1	Low Value	1889	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14929	31	1	223.88	0	Regular	1890	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14930	108	3	2362.96	0	Regular	1891	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14931	4	5	1257.68	0	Regular	1892	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14932	365	1	363.53	1	Low Value	1893	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14934	81	2	1890.94	0	Regular	1894	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14935	296	1	1784.71	1	Low Value	1895	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14936	33	8	8137.02	0	Regular	1896	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14937	56	3	1621.88	0	Regular	1897	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14944	29	12	5900.25	0	Regular	1898	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14946	13	1	100.9	0	Regular	1899	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14947	71	2	290.82	0	Regular	1900	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14948	22	6	1101.97	0	Regular	1901	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14950	18	1	371.2	0	Regular	1902	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14951	78	1	311.69	0	Regular	1903	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14952	59	11	8099.49	0	Regular	1904	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14953	24	1	285.67	0	Regular	1905	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14954	11	1	294.85	0	Regular	1906	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14957	252	1	58.49	1	Low Value	1907	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14958	146	3	483.73	1	Low Value	1908	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14959	63	4	695.42	0	Regular	1909	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14960	7	2	221.27	0	Regular	1910	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14961	10	9	7044.68	0	Regular	1911	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14962	270	1	126.7	1	Low Value	1912	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14963	9	5	1472.34	0	Regular	1913	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14964	246	1	206.21	1	Low Value	1914	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14965	95	2	596.09	0	Regular	1915	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14966	14	1	183.02	0	Regular	1916	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14967	49	1	463.8	0	Regular	1917	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14968	29	1	147.59	0	Regular	1918	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14970	67	4	1592.06	0	Regular	1919	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14971	34	3	1097.98	0	Regular	1920	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14972	127	1	114.77	0	Regular	1921	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14973	106	3	1314.45	0	Regular	1922	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14974	36	1	89.94	0	Regular	1923	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14975	56	1	279.94	0	Regular	1924	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14976	56	7	790.86	0	Regular	1925	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14978	71	5	1921.37	0	Regular	1926	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14981	245	1	102.12	1	Low Value	1927	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14984	18	2	202.37	0	Regular	1928	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14985	197	2	292.01	1	Low Value	1929	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14987	15	2	326.4	0	Regular	1930	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14988	211	1	334.54	1	Low Value	1931	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14995	38	2	231.98	0	Regular	1932	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14997	45	3	546.1999999999999	0	Regular	1933	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
14998	169	2	414.87	1	Low Value	1934	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15000	47	1	490.52	0	Regular	1935	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15002	115	4	1641.76	0	Regular	1936	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15004	146	1	1220.77	1	Low Value	1937	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15005	15	28	6295.37	0	Regular	1938	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15006	50	1	480.38	0	Regular	1939	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15007	158	1	156.91	1	Low Value	1940	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15009	11	3	1259.43	0	Regular	1941	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15010	35	1	308.94	0	Regular	1942	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15012	53	2	405.04	0	Regular	1943	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15014	42	2	257.67	0	Regular	1944	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15016	172	1	170.04	1	Low Value	1945	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15017	33	1	125.58	0	Regular	1946	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15018	38	3	496.21	0	Regular	1947	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15019	266	1	252.81	1	Low Value	1948	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15021	8	9	1871.77	0	Regular	1949	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15022	11	4	852.39	0	Regular	1950	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15023	2	11	6720.41	0	Regular	1951	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15024	9	10	1636.43	0	Regular	1952	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15025	32	1	361.96	0	Regular	1953	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15026	79	3	469	0	Regular	1954	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15027	30	4	1066.15	0	Regular	1955	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15028	7	4	627.13	0	Regular	1956	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15030	71	2	518.28	0	Regular	1957	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15031	3	4	653.19	0	Regular	1958	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15032	255	3	4959.1	1	Low Value	1959	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15033	4	10	2557.18	0	Regular	1960	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15034	15	8	4274.16	0	Regular	1961	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15035	89	1	252.73	0	Regular	1962	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15036	71	3	429.56	0	Regular	1963	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15038	58	6	685.74	0	Regular	1964	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15039	9	47	19766.59	0	Regular	1965	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15041	169	1	179.93	1	Low Value	1966	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15042	198	1	135.93	1	Low Value	1967	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15043	30	1	537	0	Regular	1968	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15044	18	17	7634.73	0	Regular	1969	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15045	151	2	735.66	1	Low Value	1970	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15046	8	15	5090.42	0	Regular	1971	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15047	269	1	343.62	1	Low Value	1972	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15048	64	4	381	0	Regular	1973	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15049	273	1	121.17000000000002	1	Low Value	1974	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15050	24	3	1737.69	0	Regular	1975	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15051	22	3	1383.36	0	Regular	1976	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15052	318	1	207.73	1	Low Value	1977	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15053	4	3	693.95	0	Regular	1978	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15054	11	2	302.1	0	Regular	1979	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15057	274	2	1489.5	1	Low Value	1980	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15058	24	11	2102.54	0	Regular	1981	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15059	40	9	1337.72	0	Regular	1982	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15060	7	4	294.25	0	Regular	1983	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15061	3	48	54534.14	0	Regular	1984	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15062	70	4	987.86	0	Regular	1985	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15063	212	1	370.8	1	Low Value	1986	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15065	37	4	3158.13	0	Regular	1987	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15066	52	1	893.59	0	Regular	1988	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15067	77	3	1744.76	0	Regular	1989	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15068	45	2	553.36	0	Regular	1990	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15069	178	1	1109.53	1	Low Value	1991	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15070	372	1	106.2	1	Low Value	1992	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15071	93	2	982.07	0	Regular	1993	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15073	9	3	1043.41	0	Regular	1994	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15074	104	1	735.67	0	Regular	1995	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15075	77	1	773.03	0	Regular	1996	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15076	172	1	880.85	1	Low Value	1997	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15078	6	32	9743.11	0	Regular	1998	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15079	212	4	895.61	1	Low Value	1999	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15081	21	5	504.8	0	Regular	2000	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15083	256	1	88.2	1	Low Value	2001	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15087	281	1	306.94	1	Low Value	2002	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15088	20	2	1160.07	0	Regular	2003	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15089	9	6	2420.84	0	Regular	2004	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15090	307	1	381.32	1	Low Value	2005	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15091	67	1	480.71	0	Regular	2006	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15092	214	2	457.81	1	Low Value	2007	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15093	17	6	4597.02	0	Regular	2008	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15095	103	4	1370.6	0	Regular	2009	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15096	42	1	219.39	0	Regular	2010	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15097	3	1	248.08	0	Regular	2011	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15098	181	3	39916.5	1	Low Value	2012	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15099	83	1	410.48	0	Regular	2013	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15100	333	3	876	1	Low Value	2014	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15101	8	2	317.53	0	Regular	2015	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15103	30	2	703.36	0	Regular	2016	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15104	196	2	993.54	1	Low Value	2017	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15105	17	7	2298.93	0	Regular	2018	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15106	17	5	1422.52	0	Regular	2019	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15107	310	6	319.5	1	Low Value	2020	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15108	141	4	1300.25	0	Regular	2021	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15109	245	1	484.95	1	Low Value	2022	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15110	23	4	996.1	0	Regular	2023	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15111	28	3	1567.48	0	Regular	2024	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15113	9	3	3509.43	0	Regular	2025	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15114	29	10	2760.56	0	Regular	2026	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15115	17	1	340.11	0	Regular	2027	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15116	17	4	1352.75	0	Regular	2028	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15117	14	5	1551.78	0	Regular	2029	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15118	133	1	244.8	0	Regular	2030	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15119	245	1	266.4	1	Low Value	2031	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15120	133	1	358.82	0	Regular	2032	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15121	49	2	457.72	0	Regular	2033	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15122	113	3	1633.78	0	Regular	2034	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15123	6	2	2199.31	0	Regular	2035	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15124	22	2	184.19	0	Regular	2036	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15125	24	15	11528.48	0	Regular	2037	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15127	65	1	406.53	0	Regular	2038	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15128	59	4	1471	0	Regular	2039	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15129	49	11	3447.4	0	Regular	2040	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15130	169	1	330.11	1	Low Value	2041	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15132	17	5	977.93	0	Regular	2042	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15133	127	3	982.42	0	Regular	2043	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15134	14	8	1387.99	0	Regular	2044	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15135	238	1	139.05	1	Low Value	2045	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15136	2	4	1286.7	0	Regular	2046	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15139	239	2	178.96	1	Low Value	2047	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15140	51	7	2354.25	0	Regular	2048	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15142	45	1	498.74	0	Regular	2049	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15143	225	1	259.45	1	Low Value	2050	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15144	7	17	6580.44	0	Regular	2051	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15145	3	4	1194.73	0	Regular	2052	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15146	164	2	1327.16	1	Low Value	2053	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15147	239	1	623.5	1	Low Value	2054	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15148	10	1	301.29	0	Regular	2055	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15149	133	1	520.8000000000001	0	Regular	2056	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15150	16	10	5291.33	0	Regular	2057	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15152	9	13	4745.69	0	Regular	2058	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15153	30	1	329.25	0	Regular	2059	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15154	74	1	254.28	0	Regular	2060	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15156	0	3	961.49	0	Regular	2061	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15157	3	3	1936.07	0	Regular	2062	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15158	44	1	401.4	0	Regular	2063	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15159	1	30	18641.01	0	Regular	2064	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15160	356	1	158.16	1	Low Value	2065	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15163	17	2	304.47	0	Regular	2066	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15164	68	3	824.58	0	Regular	2067	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15165	372	1	487.75	1	Low Value	2068	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15167	320	1	158.8	1	Low Value	2069	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15168	25	1	106.56	0	Regular	2070	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15171	330	1	1289.5	1	Low Value	2071	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15172	8	5	1624.05	0	Regular	2072	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15174	322	1	135.75	1	Low Value	2073	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15175	71	1	224.14	0	Regular	2074	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15178	259	1	40.5	1	Low Value	2075	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15179	17	5	2206.95	0	Regular	2076	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15180	366	1	87.5	1	Low Value	2077	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15181	65	3	689.4799999999999	0	Regular	2078	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15182	153	2	622.85	1	Low Value	2079	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15184	28	2	402.2	0	Regular	2080	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15185	69	1	310.62	0	Regular	2081	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15186	13	2	411.41	0	Regular	2082	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15187	1	16	4777.18	0	Regular	2083	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15189	0	41	16225.39	0	Regular	2084	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15192	119	3	1044.32	0	Regular	2085	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15193	60	1	499.32	0	Regular	2086	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15194	2	15	7616.53	0	Regular	2087	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15195	2	1	3861	0	Regular	2088	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15197	10	3	1079.61	0	Regular	2089	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15198	91	2	193.64	0	Regular	2090	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15199	58	4	1268.7	0	Regular	2091	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15201	86	5	1236.54	0	Regular	2092	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15203	25	6	1827.8	0	Regular	2093	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15204	356	1	316.58	1	Low Value	2094	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15205	84	2	653.24	0	Regular	2095	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15206	9	4	420.3	0	Regular	2096	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15208	0	5	870.12	0	Regular	2097	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15210	224	1	331.18	1	Low Value	2098	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15211	59	2	894.4100000000001	0	Regular	2099	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15212	240	1	101.8	1	Low Value	2100	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15213	318	2	328.35	1	Low Value	2101	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15214	1	8	1661.44	0	Regular	2102	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15215	46	3	734.94	0	Regular	2103	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15216	87	1	96.6	0	Regular	2104	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15218	10	11	5756.89	0	Regular	2105	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15219	175	1	305.75	1	Low Value	2106	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15220	51	6	1778.96	0	Regular	2107	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15221	365	1	403.25	1	Low Value	2108	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15222	318	1	585	1	Low Value	2109	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15223	225	2	755.75	1	Low Value	2110	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15224	357	2	322.08	1	Low Value	2111	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15225	233	1	409.4	1	Low Value	2112	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15226	310	1	154.41	1	Low Value	2113	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15227	36	5	1219.4	0	Regular	2114	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15228	65	4	3386.71	0	Regular	2115	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15230	238	2	429.6	1	Low Value	2116	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15232	112	2	612.06	0	Regular	2117	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15234	276	1	197	1	Low Value	2118	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15235	217	12	2247.51	1	Low Value	2119	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15236	298	1	321.05	1	Low Value	2120	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15237	1	4	1412.32	0	Regular	2121	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15238	28	3	1071.99	0	Regular	2122	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15239	9	2	780.59	0	Regular	2123	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15240	44	5	1706.57	0	Regular	2124	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15241	66	8	1756.44	0	Regular	2125	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15243	73	1	316.68	0	Regular	2126	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15244	64	2	631.57	0	Regular	2127	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15245	133	3	2515.84	0	Regular	2128	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15246	237	2	514.15	1	Low Value	2129	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15247	121	1	356	0	Regular	2130	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15249	31	13	6688.46	0	Regular	2131	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15251	8	11	10484.99	0	Regular	2132	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15252	35	2	740.78	0	Regular	2133	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15253	15	5	918.2	0	Regular	2134	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15254	126	1	300.36	0	Regular	2135	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15255	66	1	890.85	0	Regular	2136	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15256	148	1	98.45	1	Low Value	2137	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15257	282	1	317.15	1	Low Value	2138	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15258	168	2	623.16	1	Low Value	2139	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15260	99	7	1810.77	0	Regular	2140	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15261	134	1	254.82	0	Regular	2141	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15262	323	1	178.95000000000002	1	Low Value	2142	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15263	106	1	156.51	0	Regular	2143	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15264	63	1	393.74	0	Regular	2144	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15265	150	2	1506.12	1	Low Value	2145	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15266	337	1	119.3	1	Low Value	2146	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15267	21	5	1717.36	0	Regular	2147	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15269	23	1	408.8	0	Regular	2148	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15270	15	7	2379.49	0	Regular	2149	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15271	6	15	2493.34	0	Regular	2150	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15272	56	2	721.94	0	Regular	2151	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15274	3	2	716.57	0	Regular	2152	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15275	37	1	615.14	0	Regular	2153	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15276	65	1	128.63	0	Regular	2154	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15277	46	1	255.9	0	Regular	2155	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15279	354	1	290.51	1	Low Value	2156	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15280	171	1	113.12	1	Low Value	2157	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15281	58	9	2332.15	0	Regular	2158	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15286	49	1	240.55	0	Regular	2159	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15287	21	2	486.69	0	Regular	2160	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15288	42	5	2306.52	0	Regular	2161	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15289	28	3	939.78	0	Regular	2162	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15290	4	18	7943.22	0	Regular	2163	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15291	25	15	4668.3	0	Regular	2164	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15292	200	1	178.39	1	Low Value	2165	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15296	50	6	3672.86	0	Regular	2166	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15297	9	3	641.94	0	Regular	2167	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15298	1	12	4799.9	0	Regular	2168	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15299	66	7	4507.01	0	Regular	2169	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15300	63	1	496.44	0	Regular	2170	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15301	50	12	5049.95	0	Regular	2171	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15303	289	1	574.02	1	Low Value	2172	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15304	60	8	694.4000000000001	0	Regular	2173	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15306	63	3	1174.35	0	Regular	2174	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15307	95	1	205.3	0	Regular	2175	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15308	273	1	310.47	1	Low Value	2176	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15311	0	91	60632.75	2	Premium	2177	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15312	74	4	924.85	0	Regular	2178	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15313	109	1	52	0	Regular	2179	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15314	198	1	327.97	1	Low Value	2180	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15315	63	2	570.5	0	Regular	2181	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15316	326	1	165	1	Low Value	2182	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15318	3	1	312.62	0	Regular	2183	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15319	283	1	204.5	1	Low Value	2184	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15320	43	1	267.13	0	Regular	2185	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15321	70	3	2748.31	0	Regular	2186	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15322	85	1	679.68	0	Regular	2187	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15325	103	1	161.74	0	Regular	2188	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15326	333	1	311.71	1	Low Value	2189	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15327	52	1	208.75	0	Regular	2190	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15329	38	3	1049.7	0	Regular	2191	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15330	31	2	714.96	0	Regular	2192	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15332	365	4	1661.06	1	Low Value	2193	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15333	207	1	1028.56	1	Low Value	2194	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15334	156	3	350.82	1	Low Value	2195	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15335	53	1	170.22	0	Regular	2196	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15339	65	2	574.07	0	Regular	2197	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15341	80	1	2020.52	0	Regular	2198	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15342	129	1	406.09	0	Regular	2199	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15343	86	1	364.5	0	Regular	2200	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15344	0	3	563.94	0	Regular	2201	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15345	45	1	393.54	0	Regular	2202	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15346	332	1	252.42	1	Low Value	2203	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15347	365	1	201.6	1	Low Value	2204	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15348	71	1	158.04	0	Regular	2205	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15349	157	2	463.91	1	Low Value	2206	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15350	372	1	115.65	1	Low Value	2207	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15351	11	7	1934.66	0	Regular	2208	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15353	254	2	770.12	1	Low Value	2209	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15355	28	2	277.05	0	Regular	2210	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15356	30	10	2718.03	0	Regular	2211	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15358	4	22	8347.2	0	Regular	2212	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15360	39	1	427.93	0	Regular	2213	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15361	361	1	418.92	1	Low Value	2214	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15363	372	1	326	1	Low Value	2215	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15364	95	2	913.19	0	Regular	2216	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15365	25	7	2314.32	0	Regular	2217	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15366	74	2	602.51	0	Regular	2218	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15367	56	4	1877.59	0	Regular	2219	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15368	20	1	446.94000000000005	0	Regular	2220	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15370	40	7	2386.05	0	Regular	2221	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15372	136	1	2007.4	0	Regular	2222	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15373	7	12	2415.91	0	Regular	2223	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15374	128	1	168	0	Regular	2224	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15376	39	3	1221.56	0	Regular	2225	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15379	168	7	3703.29	1	Low Value	2226	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15380	8	5	1690.2600000000002	0	Regular	2227	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15381	213	2	596.85	1	Low Value	2228	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15382	14	6	5955.71	0	Regular	2229	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15384	169	2	642.41	1	Low Value	2230	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15385	39	1	316.88	0	Regular	2231	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15386	185	1	394.14	1	Low Value	2232	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15388	269	1	140.54	1	Low Value	2233	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15389	171	1	500	1	Low Value	2234	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15392	4	4	1535.53	0	Regular	2235	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15393	15	2	231.86	0	Regular	2236	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15394	9	4	2183.54	0	Regular	2237	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15395	325	1	107.45	1	Low Value	2238	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15396	112	1	288.18	0	Regular	2239	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15397	289	1	94	1	Low Value	2240	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15398	15	2	1345.53	0	Regular	2241	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15399	0	3	815.77	0	Regular	2242	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15400	91	5	716.2	0	Regular	2243	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15402	148	2	626.77	1	Low Value	2244	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15405	188	1	349.1	1	Low Value	2245	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15406	30	2	510.71	0	Regular	2246	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15407	33	4	1046.74	0	Regular	2247	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15408	263	1	267.18	1	Low Value	2248	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15410	83	8	3450.84	0	Regular	2249	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15411	25	4	1348.93	0	Regular	2250	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15412	170	1	190.53	1	Low Value	2251	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15414	9	3	774.9000000000001	0	Regular	2252	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15415	312	1	559.61	1	Low Value	2253	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15416	64	4	3984.32	0	Regular	2254	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15417	84	1	508.8	0	Regular	2255	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15419	24	1	135.86	0	Regular	2256	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15421	58	4	950.36	0	Regular	2257	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15422	322	2	97.7	1	Low Value	2258	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15423	37	1	43.5	0	Regular	2259	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15424	253	2	383.34	1	Low Value	2260	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15426	18	5	1404.07	0	Regular	2261	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15427	32	3	1430.54	0	Regular	2262	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15428	14	1	93.78	0	Regular	2263	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15429	26	2	397.35	0	Regular	2264	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15432	22	1	171.19	0	Regular	2265	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15433	213	2	533.3	1	Low Value	2266	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15434	7	5	1041.48	0	Regular	2267	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15435	21	1	149.29	0	Regular	2268	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15436	11	3	1067.75	0	Regular	2269	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15437	261	1	200.16	1	Low Value	2270	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15438	130	1	156.57999999999998	0	Regular	2271	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15440	54	3	383.68	0	Regular	2272	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15442	248	1	594	1	Low Value	2273	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15443	1	7	3213.59	0	Regular	2274	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15444	8	2	1411.21	0	Regular	2275	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15445	263	1	113.5	1	Low Value	2276	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15447	330	1	155.17	1	Low Value	2277	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15448	312	1	494.64	1	Low Value	2278	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15449	25	3	974.52	0	Regular	2279	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15450	29	1	429.84	0	Regular	2280	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15452	29	3	528.48	0	Regular	2281	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15453	1	7	1371.77	0	Regular	2282	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15454	361	1	179.1	1	Low Value	2283	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15456	282	3	434.59	1	Low Value	2284	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15457	261	1	237.07	1	Low Value	2285	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15458	24	1	161.64	0	Regular	2286	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15460	353	1	214.26	1	Low Value	2287	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15462	93	3	234.6	0	Regular	2288	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15463	28	1	126.14	0	Regular	2289	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15464	337	1	1044.65	1	Low Value	2290	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15465	19	18	7354.62	0	Regular	2291	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15466	84	1	334.53	0	Regular	2292	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15467	8	3	524.88	0	Regular	2293	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15468	50	2	467.51	0	Regular	2294	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15469	49	2	538.55	0	Regular	2295	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15471	1	1	454.48	0	Regular	2296	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15472	112	1	371.56	0	Regular	2297	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15473	13	7	1771.2	0	Regular	2298	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15475	76	1	454.11	0	Regular	2299	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15478	39	2	1399.92	0	Regular	2300	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15480	115	1	905.5	0	Regular	2301	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15482	15	12	10879.76	0	Regular	2302	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15483	160	4	225.26	1	Low Value	2303	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15484	0	4	3590.41	0	Regular	2304	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15485	29	3	2564.5	0	Regular	2305	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15488	92	1	91.32	0	Regular	2306	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15489	22	3	1134.28	0	Regular	2307	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15491	94	6	3100.09	0	Regular	2308	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15492	27	2	659.4599999999999	0	Regular	2309	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15493	32	5	1953.41	0	Regular	2310	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15494	20	2	1280.58	0	Regular	2311	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15497	17	2	1262.2	0	Regular	2312	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15498	2	27	13316.4	0	Regular	2313	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15500	7	4	1131.56	0	Regular	2314	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15502	15	12	10384.93	0	Regular	2315	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15503	362	1	141.04	1	Low Value	2316	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15504	80	1	52.83	0	Regular	2317	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15505	52	5	3610.96	0	Regular	2318	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15506	22	3	972.08	0	Regular	2319	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15507	171	1	475.86	1	Low Value	2320	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15508	188	6	1000.27	1	Low Value	2321	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15510	330	1	250	1	Low Value	2322	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15511	11	5	900.53	0	Regular	2323	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15512	155	2	121	1	Low Value	2324	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15513	32	19	14758.22	0	Regular	2325	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15514	11	11	4023.72	0	Regular	2326	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15516	44	3	62.43	0	Regular	2327	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15517	232	1	267.03	1	Low Value	2328	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15518	63	8	1921.55	0	Regular	2329	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15520	1	1	343.5	0	Regular	2330	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15521	39	8	3000.2	0	Regular	2331	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15522	32	2	397.99	0	Regular	2332	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15523	83	1	412.0100000000001	0	Regular	2333	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15524	24	1	440	0	Regular	2334	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15525	1	3	734.37	0	Regular	2335	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15526	32	2	148.44	0	Regular	2336	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15527	18	8	2428.53	0	Regular	2337	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15528	253	1	229.33	1	Low Value	2338	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15529	22	11	3962.6	0	Regular	2339	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15530	21	4	1497.31	0	Regular	2340	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15531	7	2	1972.39	0	Regular	2341	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15532	24	4	1564.73	0	Regular	2342	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15533	18	3	807.57	0	Regular	2343	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15535	172	4	502.9	1	Low Value	2344	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15537	162	1	110.92	1	Low Value	2345	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15539	6	1	538.46	0	Regular	2346	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15540	10	1	213.3	0	Regular	2347	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15541	113	1	85.13000000000001	0	Regular	2348	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15543	287	1	127.86	1	Low Value	2349	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15544	8	9	3546.71	0	Regular	2350	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15545	53	2	288.97	0	Regular	2351	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15547	6	14	4910.6	0	Regular	2352	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15549	76	3	1681.46	0	Regular	2353	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15550	3	4	575.63	0	Regular	2354	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15551	36	1	436.06	0	Regular	2355	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15552	216	1	90.12	1	Low Value	2356	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15553	59	1	428.93	0	Regular	2357	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15554	277	1	217.2	1	Low Value	2358	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15555	11	16	4794.86	0	Regular	2359	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15556	23	1	279.77	0	Regular	2360	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15557	28	1	468.91	0	Regular	2361	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15561	11	4	800.59	0	Regular	2362	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15562	351	1	134.55	1	Low Value	2363	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15563	21	4	1400.44	0	Regular	2364	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15565	49	2	173.16	0	Regular	2365	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15567	18	1	186.01	0	Regular	2366	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15568	2	3	758.29	0	Regular	2367	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15569	103	5	1375.71	0	Regular	2368	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15570	6	12	4148.82	0	Regular	2369	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15571	11	4	650.4300000000001	0	Regular	2370	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15572	4	7	2533.42	0	Regular	2371	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15573	31	2	591.1899999999999	0	Regular	2372	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15574	177	4	675.64	1	Low Value	2373	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15576	37	1	921.37	0	Regular	2374	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15577	150	3	258.88	1	Low Value	2375	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15578	161	1	127.1	1	Low Value	2376	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15579	68	2	327.6	0	Regular	2377	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15581	120	13	3675.77	0	Regular	2378	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15582	24	3	682.9100000000001	0	Regular	2379	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15584	23	4	720.86	0	Regular	2380	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15585	176	1	455.3	1	Low Value	2381	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15587	49	4	913.68	0	Regular	2382	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15589	255	3	478.53	1	Low Value	2383	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15592	46	1	388.58	0	Regular	2384	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15593	70	1	199.8	0	Regular	2385	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15594	15	5	1771.78	0	Regular	2386	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15596	100	5	1406.59	0	Regular	2387	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15597	34	1	324.57	0	Regular	2388	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15598	52	1	240.68	0	Regular	2389	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15599	26	2	761.74	0	Regular	2390	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15601	10	14	6776.56	0	Regular	2391	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15602	7	9	1297.87	0	Regular	2392	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15603	78	1	48.48	0	Regular	2393	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15604	51	1	216.39	0	Regular	2394	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15605	35	5	1198.23	0	Regular	2395	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15606	60	9	2920.16	0	Regular	2396	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15607	336	1	104.76	1	Low Value	2397	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15608	27	4	1093.68	0	Regular	2398	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15609	183	1	298.48	1	Low Value	2399	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15610	51	1	112.46	0	Regular	2400	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15611	9	13	1591.45	0	Regular	2401	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15612	35	2	195.15	0	Regular	2402	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15615	9	23	10399.74	0	Regular	2403	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15618	32	4	776.851	0	Regular	2404	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15619	10	1	336.40000000000003	0	Regular	2405	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15620	56	3	1553.18	0	Regular	2406	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15621	3	4	1293.03	0	Regular	2407	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15622	42	9	3709.56	0	Regular	2408	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15623	140	1	301.03	1	Low Value	2409	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15624	116	4	588.13	0	Regular	2410	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15625	103	4	1534.26	0	Regular	2411	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15626	74	2	675.8	0	Regular	2412	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15628	4	9	2870.24	0	Regular	2413	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15630	44	2	1186.35	0	Regular	2414	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15632	15	8	3285.31	0	Regular	2415	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15634	16	1	243.55	0	Regular	2416	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15636	89	2	724.76	0	Regular	2417	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15637	52	1	223.36	0	Regular	2418	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15639	133	1	425.32	0	Regular	2419	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15640	3	15	12416.11	0	Regular	2420	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15641	104	4	1887.2	0	Regular	2421	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15643	191	3	664	1	Low Value	2422	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15644	165	4	803.54	1	Low Value	2423	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15645	18	1	612.01	0	Regular	2424	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15646	157	3	447.64	1	Low Value	2425	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15648	203	2	639.5	1	Low Value	2426	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15649	335	2	816	1	Low Value	2427	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15651	36	3	646.3	0	Regular	2428	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15652	90	1	337.74	0	Regular	2429	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15653	92	2	877.4399999999999	0	Regular	2430	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15654	8	2	922.53	0	Regular	2431	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15655	242	1	560.67	1	Low Value	2432	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15656	44	4	748.5	0	Regular	2433	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15657	22	1	30	0	Regular	2434	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15658	189	5	1024.1	1	Low Value	2435	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15659	43	1	306.45	0	Regular	2436	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15660	24	9	1600.86	0	Regular	2437	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15661	316	2	309.8	1	Low Value	2438	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15663	105	1	138.14	0	Regular	2439	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15664	50	1	386.43	0	Regular	2440	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15665	167	2	2222.21	1	Low Value	2441	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15667	39	1	301.32	0	Regular	2442	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15668	217	1	76.32000000000001	1	Low Value	2443	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15669	39	4	684.34	0	Regular	2444	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15670	296	1	173.05	1	Low Value	2445	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15671	18	7	2657.13	0	Regular	2446	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15673	87	4	2726.23	0	Regular	2447	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15674	72	5	2446.6	0	Regular	2448	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15675	80	3	323.69	0	Regular	2449	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15676	18	3	3435.76	0	Regular	2450	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15677	48	1	657.23	0	Regular	2451	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15678	52	1	352.7	0	Regular	2452	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15679	23	4	781.28	0	Regular	2453	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15680	8	3	1333.68	0	Regular	2454	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15681	24	5	1426.16	0	Regular	2455	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15683	116	1	193.75	0	Regular	2456	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15687	8	9	2993.1	0	Regular	2457	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15689	119	2	254.1	0	Regular	2458	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15690	3	2	239.76	0	Regular	2459	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15691	251	1	136.8	1	Low Value	2460	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15692	27	1	191.04	0	Regular	2461	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15694	0	14	6479.4	0	Regular	2462	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15695	266	2	409.98	1	Low Value	2463	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15696	32	8	2711.11	0	Regular	2464	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15699	17	1	309.65	0	Regular	2465	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15700	171	2	696.68	1	Low Value	2466	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15701	1	4	1529	0	Regular	2467	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15703	264	1	211.5	1	Low Value	2468	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15704	139	4	2293.62	0	Regular	2469	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15705	200	1	143.1	1	Low Value	2470	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15706	63	4	1060.56	0	Regular	2471	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15707	34	4	916.98	0	Regular	2472	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15708	40	7	3235.25	0	Regular	2473	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15709	283	1	133.25	1	Low Value	2474	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15712	8	5	1072.36	0	Regular	2475	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15713	142	2	356.7	1	Low Value	2476	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15714	11	2	330.03000000000003	0	Regular	2477	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15716	145	4	1101.11	1	Low Value	2478	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15717	233	1	150.3	1	Low Value	2479	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15719	32	13	5030.07	0	Regular	2480	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15720	23	1	598.73	0	Regular	2481	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15721	11	1	471.4	0	Regular	2482	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15722	35	5	2211.21	0	Regular	2483	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15723	364	1	190.7	1	Low Value	2484	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15724	200	2	218.25	1	Low Value	2485	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15725	14	1	415.25	0	Regular	2486	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15727	16	7	5159.06	0	Regular	2487	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15729	212	1	85	1	Low Value	2488	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15730	65	3	1120.88	0	Regular	2489	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15732	211	2	294.12	1	Low Value	2490	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15733	282	1	162.3	1	Low Value	2491	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15734	114	2	1339.45	0	Regular	2492	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15737	14	8	1188.12	0	Regular	2493	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15738	18	16	4812.42	0	Regular	2494	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15739	65	1	449.12	0	Regular	2495	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15740	48	1	154.88	0	Regular	2496	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15743	15	4	775.96	0	Regular	2497	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15744	77	1	34.8	0	Regular	2498	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15745	18	4	1094.59	0	Regular	2499	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15746	133	1	196.88	0	Regular	2500	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15747	12	3	946.64	0	Regular	2501	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15748	39	1	144.36	0	Regular	2502	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15749	234	3	44534.3	1	Low Value	2503	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15750	2	8	2463.05	0	Regular	2504	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15752	39	7	2626.6	0	Regular	2505	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15753	304	1	79.2	1	Low Value	2506	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15754	50	3	458.57	0	Regular	2507	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15755	9	6	2364.25	0	Regular	2508	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15756	60	4	528.01	0	Regular	2509	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15757	65	2	714.42	0	Regular	2510	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15758	24	1	205.25	0	Regular	2511	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15759	217	3	253.04	1	Low Value	2512	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15762	64	2	583.75	0	Regular	2513	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15763	31	2	1086.92	0	Regular	2514	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15764	87	6	3279.97	0	Regular	2515	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15766	63	1	315.06	0	Regular	2516	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15768	115	3	621.8299999999999	0	Regular	2517	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15769	6	26	56252.72	0	Regular	2518	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15773	5	1	635.6800000000001	0	Regular	2519	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15774	68	1	270.8	0	Regular	2520	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15775	244	1	104.9	1	Low Value	2521	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15776	132	1	241.62	0	Regular	2522	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15777	240	4	1047.11	1	Low Value	2523	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15780	183	3	475.28	1	Low Value	2524	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15781	24	3	345.46	0	Regular	2525	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15782	9	3	2614.74	0	Regular	2526	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15783	10	1	246.3	0	Regular	2527	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15785	32	5	2328.9700000000003	0	Regular	2528	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15786	45	3	4919	0	Regular	2529	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15787	25	3	933.26	0	Regular	2530	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15789	357	1	351.3	1	Low Value	2531	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15790	9	1	218.75	0	Regular	2532	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15791	43	2	1612.69	0	Regular	2533	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15793	14	3	965.61	0	Regular	2534	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15795	149	1	610.01	1	Low Value	2535	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15796	0	8	2708.61	0	Regular	2536	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15797	112	4	2207.4	0	Regular	2537	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15799	75	3	884.14	0	Regular	2538	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15800	106	2	696.89	0	Regular	2539	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15801	45	3	1063.95	0	Regular	2540	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15802	142	1	451.42	1	Low Value	2541	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15803	50	1	415.8200000000001	0	Regular	2542	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15804	0	13	4206.39	0	Regular	2543	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15805	22	17	5488.18	0	Regular	2544	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15806	45	3	784.58	0	Regular	2545	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15807	49	3	903.9	0	Regular	2546	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15808	305	4	3651.27	1	Low Value	2547	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15809	35	5	515.77	0	Regular	2548	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15810	78	4	1391.98	0	Regular	2549	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15811	21	6	2218.62	0	Regular	2550	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15812	106	5	1801.14	0	Regular	2551	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15813	207	2	1303.91	1	Low Value	2552	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15814	16	4	1945.33	0	Regular	2553	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15815	63	5	2100.6	0	Regular	2554	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15819	48	4	1905.45	0	Regular	2555	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15820	319	1	206.98	1	Low Value	2556	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15821	43	2	570.96	0	Regular	2557	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15822	2	2	885.47	0	Regular	2558	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15823	371	1	15	1	Low Value	2559	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15825	171	1	532.94	1	Low Value	2560	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15826	55	3	1654.31	0	Regular	2561	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15827	72	14	1836.09	0	Regular	2562	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15829	98	2	636.14	0	Regular	2563	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15830	37	1	576	0	Regular	2564	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15831	57	3	794.64	0	Regular	2565	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15832	253	1	836.79	1	Low Value	2566	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15834	69	4	2225.15	0	Regular	2567	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15835	43	4	954.09	0	Regular	2568	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15836	49	1	137.37	0	Regular	2569	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15837	64	1	391.98	0	Regular	2570	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15838	10	19	33643.08	0	Regular	2571	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15839	32	3	1048.49	0	Regular	2572	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15840	58	2	355.56	0	Regular	2573	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15841	72	4	1224.06	0	Regular	2574	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15843	303	1	118.95000000000002	1	Low Value	2575	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15844	45	1	130.73999999999998	0	Regular	2576	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15845	17	8	3711.77	0	Regular	2577	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15847	37	2	389.27	0	Regular	2578	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15850	18	2	234.88	0	Regular	2579	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15852	186	2	160.71	1	Low Value	2580	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15853	51	1	110.8	0	Regular	2581	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15854	3	12	2969.12	0	Regular	2582	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15855	136	5	712.24	0	Regular	2583	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15856	3	27	16143.64	0	Regular	2584	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15857	18	1	297	0	Regular	2585	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15858	15	5	1427.57	0	Regular	2586	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15860	40	8	965.16	0	Regular	2587	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15861	11	8	3146.92	0	Regular	2588	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15862	7	4	832.88	0	Regular	2589	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15863	25	2	68.84	0	Regular	2590	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15864	21	6	1936.32	0	Regular	2591	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15865	40	3	895.13	0	Regular	2592	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15866	100	1	211.89	0	Regular	2593	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15867	4	15	3810.14	0	Regular	2594	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15869	276	2	149.64	1	Low Value	2595	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15870	32	1	351.44	0	Regular	2596	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15872	14	2	316.25	0	Regular	2597	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15874	63	7	4405.88	0	Regular	2598	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15877	1	2	490.33	0	Regular	2599	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15880	368	1	329.03000000000003	1	Low Value	2600	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15881	311	5	501.39	1	Low Value	2601	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15882	198	4	516.36	1	Low Value	2602	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15883	1	2	396.48	0	Regular	2603	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15885	92	3	379.35	0	Regular	2604	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15886	59	1	181.09	0	Regular	2605	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15888	80	1	168.31	0	Regular	2606	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15889	156	2	420.07	1	Low Value	2607	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15891	226	1	511.68	1	Low Value	2608	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15894	252	2	258.25	1	Low Value	2609	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15895	149	1	179.17	1	Low Value	2610	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15897	193	2	208.59	1	Low Value	2611	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15898	0	5	1383.83	0	Regular	2612	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15899	368	1	56.25	1	Low Value	2613	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15900	23	1	337.28	0	Regular	2614	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15901	16	3	351.73	0	Regular	2615	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15903	9	7	5126.76	0	Regular	2616	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15904	7	1	164.68	0	Regular	2617	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15906	19	7	1567.69	0	Regular	2618	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15907	3	3	882.72	0	Regular	2619	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15909	173	1	191.94	1	Low Value	2620	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15910	0	8	1228.88	0	Regular	2621	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15912	177	2	264.62	1	Low Value	2622	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15916	15	8	1502.86	0	Regular	2623	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15917	247	1	123.1	1	Low Value	2624	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15918	190	2	334.23	1	Low Value	2625	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15919	19	2	525.69	0	Regular	2626	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15920	153	4	167.5	1	Low Value	2627	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15921	172	1	323.03000000000003	1	Low Value	2628	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15922	372	1	369.5	1	Low Value	2629	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15923	372	1	127.08	1	Low Value	2630	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15925	193	1	207.15	1	Low Value	2631	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15930	66	1	426.63	0	Regular	2632	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15932	3	8	2495.87	0	Regular	2633	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15933	20	3	1107.46	0	Regular	2634	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15935	238	2	416.86	1	Low Value	2635	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15937	63	1	145.35	0	Regular	2636	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15938	111	5	404.58	0	Regular	2637	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15939	89	15	6115.01	0	Regular	2638	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15940	310	1	35.8	1	Low Value	2639	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15942	133	1	337.44	0	Regular	2640	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15944	276	1	325.1	1	Low Value	2641	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15945	364	1	181	1	Low Value	2642	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15947	82	1	1708.24	0	Regular	2643	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15948	7	2	955.24	0	Regular	2644	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15949	16	2	364.72	0	Regular	2645	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15950	31	4	1744.71	0	Regular	2646	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15951	8	2	708.22	0	Regular	2647	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15952	33	4	781.91	0	Regular	2648	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15953	14	8	1657.28	0	Regular	2649	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15955	23	14	4416.26	0	Regular	2650	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15957	31	1	428.89	0	Regular	2651	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15958	73	1	104.35	0	Regular	2652	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15963	19	2	470.76	0	Regular	2653	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15965	16	4	808.87	0	Regular	2654	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15967	22	2	397.68	0	Regular	2655	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15969	2	3	666.1	0	Regular	2656	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15970	303	1	314.1	1	Low Value	2657	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15971	17	12	4199.85	0	Regular	2658	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15973	366	1	307.82000000000005	1	Low Value	2659	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15974	38	7	3442.15	0	Regular	2660	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15975	83	1	371.01	0	Regular	2661	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15976	164	2	427.64	1	Low Value	2662	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15977	16	2	1054.73	0	Regular	2663	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15978	76	1	1098.78	0	Regular	2664	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15980	88	3	2398.86	0	Regular	2665	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15981	24	8	3408.48	0	Regular	2666	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15983	21	4	1465.12	0	Regular	2667	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15984	2	10	2780.63	0	Regular	2668	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15985	122	2	1142.42	0	Regular	2669	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15986	29	1	168.12	0	Regular	2670	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15987	11	7	1432.77	0	Regular	2671	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15988	18	1	156.78	0	Regular	2672	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15990	43	2	792.11	0	Regular	2673	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15992	3	1	41.99	0	Regular	2674	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15993	8	7	2777.67	0	Regular	2675	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15994	54	1	414.27	0	Regular	2676	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15996	87	6	1032.58	0	Regular	2677	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
15998	36	5	3080.22	0	Regular	2678	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16000	2	3	12393.7	0	Regular	2679	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16003	29	5	2735.37	0	Regular	2680	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16005	11	4	578.71	0	Regular	2681	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16006	210	1	101.4	1	Low Value	2682	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16007	47	4	1693.81	0	Regular	2683	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16008	23	3	478.78	0	Regular	2684	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16009	21	4	972.11	0	Regular	2685	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16010	245	3	392.4	1	Low Value	2686	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16011	7	16	3352.96	0	Regular	2687	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16012	34	3	1415.29	0	Regular	2688	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16013	3	47	37130.6	0	Regular	2689	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16014	37	3	646.83	0	Regular	2690	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16015	3	3	704.55	0	Regular	2691	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16016	2	8	1465.51	0	Regular	2692	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16017	46	1	211.88	0	Regular	2693	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16018	38	2	408.9	0	Regular	2694	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16019	46	9	3786.24	0	Regular	2695	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16020	16	3	851.01	0	Regular	2696	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16022	259	1	602.63	1	Low Value	2697	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16023	45	3	719.81	0	Regular	2698	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16024	11	1	251.03	0	Regular	2699	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16025	29	1	439.66	0	Regular	2700	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16026	42	1	236.09	0	Regular	2701	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16027	91	6	934.62	0	Regular	2702	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16029	38	63	80850.84	2	Premium	2703	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16030	309	1	331.24	1	Low Value	2704	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16031	91	2	547.9	0	Regular	2705	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16033	5	20	8778.82	0	Regular	2706	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16034	195	3	437.7	1	Low Value	2707	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16036	86	2	758.92	0	Regular	2708	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16037	269	3	855.02	1	Low Value	2709	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16038	7	3	471.78	0	Regular	2710	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16040	64	3	1313.55	0	Regular	2711	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16041	30	3	3166.4	0	Regular	2712	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16042	21	5	1177.47	0	Regular	2713	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16043	37	4	773.99	0	Regular	2714	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16045	119	4	1340.7	0	Regular	2715	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16048	372	2	256.44	1	Low Value	2716	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16049	39	3	1074.81	0	Regular	2717	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16050	173	1	137.9	1	Low Value	2718	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16052	53	1	362.06	0	Regular	2719	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16053	32	2	1511.95	0	Regular	2720	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16054	144	1	783.9	1	Low Value	2721	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16055	220	1	134.8	1	Low Value	2722	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16056	44	1	650.75	0	Regular	2723	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16057	15	7	2263.12	0	Regular	2724	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16059	65	6	1453.16	0	Regular	2725	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16062	9	4	1153.62	0	Regular	2726	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16063	259	1	335.32	1	Low Value	2727	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16065	364	1	367.14	1	Low Value	2728	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16066	16	5	1521.04	0	Regular	2729	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16070	21	2	852.15	0	Regular	2730	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16071	44	1	326.24	0	Regular	2731	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16072	287	1	584.3199999999999	1	Low Value	2732	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16073	296	1	122.4	1	Low Value	2733	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16076	2	10	2234.73	0	Regular	2734	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16078	283	1	79.2	1	Low Value	2735	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16079	16	3	1352	0	Regular	2736	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16080	81	2	217.16	0	Regular	2737	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16081	55	5	2799.42	0	Regular	2738	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16083	100	2	1317.62	0	Regular	2739	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16084	298	1	436.18	1	Low Value	2740	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16085	22	5	981.51	0	Regular	2741	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16086	58	5	1121.39	0	Regular	2742	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16091	154	2	315.06	1	Low Value	2743	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16092	114	3	817.86	0	Regular	2744	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16093	106	1	17	0	Regular	2745	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16094	11	4	1078.23	0	Regular	2746	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16096	263	1	320.62	1	Low Value	2747	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16097	239	1	185.05	1	Low Value	2748	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16098	87	7	2005.63	0	Regular	2749	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16099	49	3	731.9	0	Regular	2750	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16101	70	1	1290.7	0	Regular	2751	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16102	41	3	1842.14	0	Regular	2752	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16103	6	6	1429.64	0	Regular	2753	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16104	61	1	298.21	0	Regular	2754	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16105	248	1	336.96	1	Low Value	2755	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16106	65	1	108.38	0	Regular	2756	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16107	17	7	3204.1600000000003	0	Regular	2757	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16108	84	1	842.5	0	Regular	2758	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16109	218	2	611.88	1	Low Value	2759	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16110	44	3	1320.95	0	Regular	2760	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16112	142	4	195.74	0	Regular	2761	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16113	182	1	161.38	1	Low Value	2762	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16114	170	1	135.75000000000003	1	Low Value	2763	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16115	9	8	1660.88	0	Regular	2764	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16116	211	1	612.78	1	Low Value	2765	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16117	189	1	232.21	1	Low Value	2766	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16119	7	2	423.36	0	Regular	2767	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16120	58	4	1309.14	0	Regular	2768	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16121	56	2	854.66	0	Regular	2769	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16122	72	4	684.4200000000001	0	Regular	2770	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16123	51	1	307.78	0	Regular	2771	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16124	316	1	249	1	Low Value	2772	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16125	366	1	289.35	1	Low Value	2773	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16126	28	4	6287.77	0	Regular	2774	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16127	38	1	656.25	0	Regular	2775	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16128	17	5	1880.22	0	Regular	2776	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16131	51	6	3506.54	0	Regular	2777	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16133	3	33	14589.04	0	Regular	2778	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16134	21	2	618.09	0	Regular	2779	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16135	262	1	517.55	1	Low Value	2780	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16136	59	3	709.38	0	Regular	2781	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16139	18	3	635.41	0	Regular	2782	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16140	65	2	725.18	0	Regular	2783	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16141	87	1	620.4	0	Regular	2784	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16142	249	1	535.34	1	Low Value	2785	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16143	2	6	2424.94	0	Regular	2786	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16144	246	1	175.2	1	Low Value	2787	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16145	8	11	3799.49	0	Regular	2788	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16146	156	3	734.13	1	Low Value	2789	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16147	133	1	375	0	Regular	2790	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16148	295	1	76.32000000000001	1	Low Value	2791	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16149	4	2	280.52	0	Regular	2792	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16150	42	5	2053.02	0	Regular	2793	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16152	268	1	1829.04	1	Low Value	2794	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16153	49	5	1824.23	0	Regular	2795	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16156	8	9	3092.04	0	Regular	2796	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16157	15	3	656.69	0	Regular	2797	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16159	281	1	348.2	1	Low Value	2798	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16160	64	2	1025.44	0	Regular	2799	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16161	1	19	5533.67	0	Regular	2800	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16162	251	1	37.4	1	Low Value	2801	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16163	231	2	856.6	1	Low Value	2802	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16164	16	3	822.48	0	Regular	2803	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16168	10	27	3787.6	0	Regular	2804	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16169	7	4	1822.97	0	Regular	2805	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16170	50	6	1885.05	0	Regular	2806	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16171	58	1	73.2	0	Regular	2807	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16172	94	5	1140.21	0	Regular	2808	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16173	15	6	1418.32	0	Regular	2809	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16174	125	3	1009.55	0	Regular	2810	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16175	93	4	1037.59	0	Regular	2811	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16177	49	1	331.95	0	Regular	2812	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16178	137	1	197.9	1	Low Value	2813	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16179	60	1	215.83	0	Regular	2814	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16180	99	8	10254.18	0	Regular	2815	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16181	72	1	305.54	0	Regular	2816	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16182	71	4	6617.65	0	Regular	2817	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16183	66	1	338.71000000000004	0	Regular	2818	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16184	63	6	1158.79	0	Regular	2819	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16185	16	2	529.41	0	Regular	2820	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16186	22	12	4006.94	0	Regular	2821	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16187	31	15	6911.4400000000005	0	Regular	2822	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16188	44	4	981.86	0	Regular	2823	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16189	15	2	215.48	0	Regular	2824	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16190	39	1	215.08	0	Regular	2825	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16191	2	13	5180.52	0	Regular	2826	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16193	236	1	314.45	1	Low Value	2827	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16198	74	1	400.681	0	Regular	2828	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16200	3	2	1068.87	0	Regular	2829	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16201	2	4	1863.47	0	Regular	2830	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16202	360	1	365.27	1	Low Value	2831	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16203	58	4	592.9	0	Regular	2832	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16204	22	1	384.18	0	Regular	2833	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16205	30	4	757.63	0	Regular	2834	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16206	54	4	537.0600000000001	0	Regular	2835	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16207	24	1	394.38	0	Regular	2836	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16208	44	2	664.26	0	Regular	2837	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16209	88	5	2262.62	0	Regular	2838	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16210	1	18	21086.3	0	Regular	2839	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16211	88	1	547.02	0	Regular	2840	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16212	18	2	690.34	0	Regular	2841	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16213	78	1	159	0	Regular	2842	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16214	170	3	1062.75	1	Low Value	2843	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16215	80	1	242.35	0	Regular	2844	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16216	266	1	914.93	1	Low Value	2845	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16217	234	2	304.25	1	Low Value	2846	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16218	29	7	3084.68	0	Regular	2847	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16221	36	3	860.86	0	Regular	2848	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16222	317	1	773.5500000000001	1	Low Value	2849	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16224	56	4	1295.3	0	Regular	2850	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16225	44	5	1096.32	0	Regular	2851	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16226	202	3	255.12	1	Low Value	2852	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16227	224	1	314.22	1	Low Value	2853	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16229	86	2	1010.6	0	Regular	2854	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16230	189	2	542.03	1	Low Value	2855	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16232	43	4	990.88	0	Regular	2856	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16233	70	3	536.6800000000001	0	Regular	2857	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16235	40	5	867.31	0	Regular	2858	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16236	77	1	432.2	0	Regular	2859	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16239	56	2	414.2	0	Regular	2860	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16240	23	2	3718.8	0	Regular	2861	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16241	9	13	2590.31	0	Regular	2862	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16242	7	7	3579.86	0	Regular	2863	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16243	33	2	409.1	0	Regular	2864	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16244	211	2	1522.75	1	Low Value	2865	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16245	23	3	1413.66	0	Regular	2866	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16247	169	1	114.56	1	Low Value	2867	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16248	61	1	152.94	0	Regular	2868	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16249	52	5	1800.07	0	Regular	2869	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16250	260	2	389.44	1	Low Value	2870	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16253	66	2	3683.86	0	Regular	2871	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16255	16	8	2619.91	0	Regular	2872	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16256	266	1	752.4300000000001	1	Low Value	2873	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16257	176	1	46.95	1	Low Value	2874	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16258	44	5	5203.51	0	Regular	2875	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16260	50	1	1035.45	0	Regular	2876	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16261	16	4	728.54	0	Regular	2877	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16265	8	9	5447	0	Regular	2878	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16266	73	7	861.89	0	Regular	2879	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16268	70	2	667.65	0	Regular	2880	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16270	352	1	1141.24	1	Low Value	2881	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16271	2	5	1404.64	0	Regular	2882	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16272	116	1	411.7	0	Regular	2883	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16274	372	1	351.75	1	Low Value	2884	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16275	196	1	559.87	1	Low Value	2885	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16276	176	1	810.6000000000001	1	Low Value	2886	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16278	99	1	566.38	0	Regular	2887	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16279	20	3	1502.78	0	Regular	2888	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16281	71	1	2062.06	0	Regular	2889	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16282	339	1	168.3	1	Low Value	2890	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16283	5	5	1570.81	0	Regular	2891	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16284	30	2	812.68	0	Regular	2892	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16287	169	1	142.5	1	Low Value	2893	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16292	121	1	302.25	0	Regular	2894	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16293	21	10	2248.99	0	Regular	2895	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16295	9	4	1328.55	0	Regular	2896	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16297	268	1	301.9	1	Low Value	2897	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16298	22	3	598.2	0	Regular	2898	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16302	126	1	233.22	0	Regular	2899	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16303	25	3	5360.63	0	Regular	2900	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16305	138	1	361.22	1	Low Value	2901	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16306	213	6	632.27	1	Low Value	2902	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16308	37	4	2560	0	Regular	2903	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16309	105	2	706.57	0	Regular	2904	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16311	17	2	616.26	0	Regular	2905	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16313	2	2	274.15000000000003	0	Regular	2906	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16315	330	1	226.37	1	Low Value	2907	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16316	63	8	2938.91	0	Regular	2908	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16317	119	3	1341.65	0	Regular	2909	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16318	34	1	328.15	0	Regular	2910	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16319	217	1	404.4	1	Low Value	2911	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16320	171	2	1038.46	1	Low Value	2912	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16321	71	5	373.65	0	Regular	2913	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16322	0	2	326.75	0	Regular	2914	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16323	195	1	207.50000000000003	1	Low Value	2915	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16324	127	3	408.59	0	Regular	2916	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16325	46	3	594.24	0	Regular	2917	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16326	5	14	3039.2200000000003	0	Regular	2918	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16327	13	6	3820.27	0	Regular	2919	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16330	17	3	251.91	0	Regular	2920	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16332	27	7	1582.8	0	Regular	2921	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16333	7	22	26626.8	0	Regular	2922	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16337	36	1	151.05	0	Regular	2923	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16338	156	1	214.8	1	Low Value	2924	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16339	283	1	94.05	1	Low Value	2925	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16340	106	1	534.31	0	Regular	2926	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16341	24	4	1971.87	0	Regular	2927	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16342	74	4	322.41	0	Regular	2928	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16343	15	2	328.58	0	Regular	2929	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16344	157	1	101.1	1	Low Value	2930	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16345	43	1	565.46	0	Regular	2931	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16347	10	2	847.45	0	Regular	2932	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16348	31	7	1415.65	0	Regular	2933	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16349	290	1	53.5	1	Low Value	2934	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16350	20	4	1116.47	0	Regular	2935	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16351	332	1	153.9	1	Low Value	2936	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16352	17	2	494.44	0	Regular	2937	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16353	3	23	6675.71	0	Regular	2938	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16354	62	2	395.8	0	Regular	2939	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16356	197	3	211.77	1	Low Value	2940	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16357	32	3	658.88	0	Regular	2941	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16358	0	4	2027.5	0	Regular	2942	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16359	6	9	1750.92	0	Regular	2943	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16360	4	6	3450.41	0	Regular	2944	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16361	9	4	891.21	0	Regular	2945	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16362	31	5	709.99	0	Regular	2946	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16363	52	1	109.36	0	Regular	2947	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16364	11	2	705.79	0	Regular	2948	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16365	17	9	1540.42	0	Regular	2949	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16366	18	1	327.3	0	Regular	2950	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16367	36	2	800.67	0	Regular	2951	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16368	1	2	479.91	0	Regular	2952	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16369	17	3	1545.41	0	Regular	2953	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16370	81	4	1301.91	0	Regular	2954	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16372	32	2	355.73	0	Regular	2955	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16374	65	2	466.73	0	Regular	2956	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16376	8	2	974.96	0	Regular	2957	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16377	266	1	676.2	1	Low Value	2958	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16378	246	3	362.95	1	Low Value	2959	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16379	3	4	2157.4	0	Regular	2960	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16380	60	1	1743.15	0	Regular	2961	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16383	74	2	643.76	0	Regular	2962	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16384	89	2	584.5	0	Regular	2963	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16385	59	3	554.86	0	Regular	2964	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16386	28	2	302.57	0	Regular	2965	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16387	322	1	94.36	1	Low Value	2966	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16389	52	4	1382.07	0	Regular	2967	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16392	269	1	217.89	1	Low Value	2968	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16393	1	13	3040.96	0	Regular	2969	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16394	56	5	1555.34	0	Regular	2970	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16395	60	5	1482.06	0	Regular	2971	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16398	153	2	1705.8	1	Low Value	2972	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16399	18	2	408.02	0	Regular	2973	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16400	94	1	303.93	0	Regular	2974	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16401	0	12	4098.32	0	Regular	2975	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16402	264	2	293.45	1	Low Value	2976	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16403	311	1	177.5	1	Low Value	2977	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16404	69	1	443.05	0	Regular	2978	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16405	301	2	167.25	1	Low Value	2979	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16406	18	1	154.35	0	Regular	2980	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16407	12	10	2079.68	0	Regular	2981	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16409	35	5	2022.98	0	Regular	2982	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16411	18	2	211.7	0	Regular	2983	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16412	53	1	135.99	0	Regular	2984	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16413	56	1	262.2	0	Regular	2985	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16414	21	2	126.25	0	Regular	2986	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16415	43	1	200.27	0	Regular	2987	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16416	26	3	1051.4	0	Regular	2988	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16418	44	3	631.12	0	Regular	2989	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16419	112	6	958.71	0	Regular	2990	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16422	16	51	34684.4	0	Regular	2991	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16423	24	1	346.12	0	Regular	2992	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16424	190	1	133.56	1	Low Value	2993	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16425	301	1	302.7	1	Low Value	2994	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16426	1	10	1863.76	0	Regular	2995	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16427	262	2	241.06	1	Low Value	2996	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16429	105	1	284.55	0	Regular	2997	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16430	56	1	300.85	0	Regular	2998	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16431	212	3	623.28	1	Low Value	2999	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16432	63	1	287.4	0	Regular	3000	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16433	27	1	184.26	0	Regular	3001	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16434	28	7	1511.8	0	Regular	3002	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16438	5	5	798.35	0	Regular	3003	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16440	7	5	3640.67	0	Regular	3004	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16441	66	2	381.2	0	Regular	3005	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16442	1	3	609.3	0	Regular	3006	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16444	45	4	654.67	0	Regular	3007	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16445	33	1	230.51	0	Regular	3008	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16446	0	2	168472.5	2	Premium	3009	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16447	135	1	255.91	0	Regular	3010	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16448	197	1	182.99	1	Low Value	3011	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16449	197	2	707.69	1	Low Value	3012	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16450	149	1	311.92	1	Low Value	3013	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16451	87	1	266.97	0	Regular	3014	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16454	44	2	6.9	0	Regular	3015	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16455	63	7	1841.18	0	Regular	3016	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16456	98	5	2158.18	0	Regular	3017	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16457	217	1	208.36	1	Low Value	3018	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16458	2	18	3482.74	0	Regular	3019	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16460	27	3	811.23	0	Regular	3020	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16461	177	1	142.92	1	Low Value	3021	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16462	73	3	136	0	Regular	3022	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16463	20	4	1422.4	0	Regular	3023	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16464	19	3	1298.66	0	Regular	3024	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16466	33	7	1595.96	0	Regular	3025	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16468	73	1	74.9	0	Regular	3026	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16469	23	4	625.42	0	Regular	3027	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16470	51	4	752.77	0	Regular	3028	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16471	274	1	223.95	1	Low Value	3029	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16473	164	3	316.11	1	Low Value	3030	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16474	6	7	1810.65	0	Regular	3031	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16475	87	4	544.3	0	Regular	3032	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16477	63	7	2494.46	0	Regular	3033	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16478	24	3	331	0	Regular	3034	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16479	9	2	300.83	0	Regular	3035	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16480	75	1	769.29	0	Regular	3036	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16482	15	1	220.62	0	Regular	3037	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16483	191	1	139.35	1	Low Value	3038	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16484	173	2	404.3	1	Low Value	3039	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16485	76	1	363.65	0	Regular	3040	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16488	32	3	498.8	0	Regular	3041	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16491	46	1	731.5	0	Regular	3042	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16493	79	4	1351.63	0	Regular	3043	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16494	296	1	826.53	1	Low Value	3044	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16495	2	3	648.26	0	Regular	3045	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16496	8	3	1599.52	0	Regular	3046	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16497	49	6	2965.69	0	Regular	3047	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16498	160	2	100.97	1	Low Value	3048	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16499	359	2	365.45	1	Low Value	3049	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16500	4	6	400.86	0	Regular	3050	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16503	106	4	1431.93	0	Regular	3051	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16504	24	1	465.88	0	Regular	3052	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16505	31	1	777.6	0	Regular	3053	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16506	19	2	90.3	0	Regular	3054	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16509	296	1	363.7	1	Low Value	3055	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16510	371	1	248.1	1	Low Value	3056	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16511	21	3	918.33	0	Regular	3057	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16513	4	4	874.59	0	Regular	3058	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16515	51	5	1624.14	0	Regular	3059	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16516	29	1	101.7	0	Regular	3060	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16517	276	1	162.7	1	Low Value	3061	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16518	60	2	484.32	0	Regular	3062	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16519	24	2	215.08	0	Regular	3063	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16520	185	3	1046.57	1	Low Value	3064	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16523	1	21	9418.47	0	Regular	3065	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16525	1	26	13027.45	0	Regular	3066	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16526	171	1	290.36	1	Low Value	3067	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16527	80	1	228.06	0	Regular	3068	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16528	3	1	244.41	0	Regular	3069	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16529	189	1	455.25	1	Low Value	3070	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16531	21	7	1244.59	0	Regular	3071	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16532	17	3	6748.8	0	Regular	3072	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16533	18	3	1082.81	0	Regular	3073	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16535	4	1	593.75	0	Regular	3074	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16536	109	1	548.12	0	Regular	3075	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16539	2	4	1388.81	0	Regular	3076	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16542	53	1	119.62	0	Regular	3077	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16545	164	1	339.3	1	Low Value	3078	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16546	290	2	787.15	1	Low Value	3079	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16549	9	10	4034.9	0	Regular	3080	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16550	108	5	2298.97	0	Regular	3081	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16551	95	3	922.12	0	Regular	3082	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16552	242	2	379.73	1	Low Value	3083	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16553	162	12	5719.82	0	Regular	3084	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16554	41	3	837.1	0	Regular	3085	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16555	34	2	285.89	0	Regular	3086	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16556	66	7	3313.79	0	Regular	3087	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16557	23	2	281.85	0	Regular	3088	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16558	0	20	8338.49	0	Regular	3089	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16560	26	2	841.41	0	Regular	3090	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16561	5	2	511.12	0	Regular	3091	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16563	53	1	1077.74	0	Regular	3092	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16565	363	1	173.7	1	Low Value	3093	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16566	14	5	614.66	0	Regular	3094	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16567	193	2	865.6	1	Low Value	3095	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16569	2	1	124.2	0	Regular	3096	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16570	14	10	3738.4	0	Regular	3097	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16571	26	3	1421.69	0	Regular	3098	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16572	126	3	1009.6	0	Regular	3099	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16573	84	2	663.61	0	Regular	3100	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16574	70	1	451.44	0	Regular	3101	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16581	182	1	105.84	1	Low Value	3102	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16582	112	1	313.62	0	Regular	3103	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16583	373	1	233.45	1	Low Value	3104	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16584	79	2	936.08	0	Regular	3105	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16586	248	1	463.95	1	Low Value	3106	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16587	231	1	225.15	1	Low Value	3107	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16589	70	3	459.24	0	Regular	3108	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16591	68	1	213.5	0	Regular	3109	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16592	3	16	4113.68	0	Regular	3110	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16593	50	3	330.03	0	Regular	3111	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16594	74	1	181.09	0	Regular	3112	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16595	60	1	360.16	0	Regular	3113	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16596	15	2	250.15	0	Regular	3114	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16597	3	1	90.04	0	Regular	3115	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16598	285	1	145.04999999999998	1	Low Value	3116	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16600	3	6	813.52	0	Regular	3117	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16601	40	1	242.7	0	Regular	3118	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16602	35	1	528.08	0	Regular	3119	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16603	74	2	482.47	0	Regular	3120	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16607	17	14	3347.71	0	Regular	3121	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16609	14	7	5493.46	0	Regular	3122	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16610	218	1	75.66	1	Low Value	3123	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16611	185	1	129.49	1	Low Value	3124	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16612	32	4	1187.66	0	Regular	3125	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16613	69	1	618.59	0	Regular	3126	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16614	182	1	506.19	1	Low Value	3127	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16616	14	2	500.42	0	Regular	3128	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16617	235	1	151.85	1	Low Value	3129	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16618	30	5	2647.59	0	Regular	3130	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16619	263	1	226.21	1	Low Value	3131	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16620	3	2	178.96	0	Regular	3132	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16621	51	4	813.48	0	Regular	3133	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16623	245	1	129.45	1	Low Value	3134	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16624	80	2	810.5699999999999	0	Regular	3135	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16625	274	1	333.08	1	Low Value	3136	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16626	0	17	4413.1	0	Regular	3137	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16627	78	1	322.8	0	Regular	3138	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16628	29	5	2188.05	0	Regular	3139	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16629	73	2	408.63	0	Regular	3140	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16633	16	6	2883.1	0	Regular	3141	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16634	222	2	217.9	1	Low Value	3142	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16637	31	4	1154.47	0	Regular	3143	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16638	22	10	1680.72	0	Regular	3144	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16639	30	3	1257.51	0	Regular	3145	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16641	105	1	231.1	0	Regular	3146	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16642	4	2	688.33	0	Regular	3147	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16643	245	1	487.51	1	Low Value	3148	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16644	177	2	833.78	1	Low Value	3149	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16647	169	2	214.06	1	Low Value	3150	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16648	42	1	290.66	0	Regular	3151	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16650	71	1	518.42	0	Regular	3152	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16652	58	7	6773.97	0	Regular	3153	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16653	15	2	1212.66	0	Regular	3154	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16654	140	4	601.27	0	Regular	3155	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16655	17	6	3789.52	0	Regular	3156	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16656	21	15	8625.8	0	Regular	3157	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16657	9	4	874.43	0	Regular	3158	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16658	367	1	123.24	1	Low Value	3159	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16659	188	1	39.12	1	Low Value	3160	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16660	15	4	1267.65	0	Regular	3161	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16665	361	1	135.39999999999998	1	Low Value	3162	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16666	18	1	118.98	0	Regular	3163	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16667	67	2	567.1800000000001	0	Regular	3164	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16668	14	6	306.72	0	Regular	3165	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16669	23	3	1348.88	0	Regular	3166	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16670	16	11	4095.9	0	Regular	3167	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16671	27	3	1692.27	0	Regular	3168	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16672	1	20	8134.94	0	Regular	3169	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16674	54	2	304.24	0	Regular	3170	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16676	33	4	1592.12	0	Regular	3171	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16678	2	12	3109.99	0	Regular	3172	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16679	365	1	129.75	1	Low Value	3173	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16680	42	1	183.7	0	Regular	3174	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16681	72	6	1770.34	0	Regular	3175	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16682	4	5	1028	0	Regular	3176	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16684	3	28	66653.56	0	Regular	3177	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16685	60	2	324.24	0	Regular	3178	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16686	46	7	2959.88	0	Regular	3179	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16688	0	4	1260.86	0	Regular	3180	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16689	75	2	422.6	0	Regular	3181	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16690	71	2	225.58	0	Regular	3182	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16692	255	2	1276	1	Low Value	3183	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16693	68	2	477.86	0	Regular	3184	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16696	134	4	657.9000000000001	0	Regular	3185	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16697	240	1	112.75	1	Low Value	3186	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16698	226	2	1998	1	Low Value	3187	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16700	8	13	5076.55	0	Regular	3188	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16701	8	13	5398.3	0	Regular	3189	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16705	0	20	14034.99	0	Regular	3190	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16706	36	3	531.35	0	Regular	3191	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16708	45	1	656.63	0	Regular	3192	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16709	84	5	3029.87	0	Regular	3193	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16710	18	10	2467.99	0	Regular	3194	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16711	2	5	1651.03	0	Regular	3195	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16712	8	11	3611.31	0	Regular	3196	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16713	18	15	6910.78	0	Regular	3197	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16714	218	3	1129.06	1	Low Value	3198	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16715	77	1	301.72	0	Regular	3199	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16716	266	2	901.2	1	Low Value	3200	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16717	23	6	3843.08	0	Regular	3201	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16718	368	1	606.0500000000001	1	Low Value	3202	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16719	14	7	1770.22	0	Regular	3203	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16720	25	1	152.95	0	Regular	3204	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16721	261	1	292.47	1	Low Value	3205	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16722	16	13	4730.81	0	Regular	3206	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16723	90	2	576.4	0	Regular	3207	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16725	301	7	758.27	1	Low Value	3208	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16726	25	5	1358.74	0	Regular	3209	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16727	363	1	256.32	1	Low Value	3210	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16728	45	4	1048.28	0	Regular	3211	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16729	37	21	7205.33	0	Regular	3212	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16730	51	3	743.11	0	Regular	3213	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16732	31	1	603.75	0	Regular	3214	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16734	51	3	646.76	0	Regular	3215	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16735	78	5	2247.41	0	Regular	3216	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16737	52	1	417.6	0	Regular	3217	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16738	297	1	3.75	1	Low Value	3218	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16739	176	1	323	1	Low Value	3219	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16742	46	1	464.9	0	Regular	3220	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16743	28	7	2213.13	0	Regular	3221	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16744	10	7	1291.91	0	Regular	3222	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16745	86	17	7180.7	0	Regular	3223	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16746	4	18	6680.11	0	Regular	3224	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16747	37	2	836.06	0	Regular	3225	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16748	17	5	1515.9	0	Regular	3226	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16750	44	5	623.93	0	Regular	3227	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16751	30	1	1764.72	0	Regular	3228	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16752	372	1	207.5	1	Low Value	3229	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16753	57	1	223.92	0	Regular	3230	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16754	371	1	2002.4	1	Low Value	3231	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16755	113	3	1475.43	0	Regular	3232	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16756	214	1	239.4	1	Low Value	3233	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16757	318	1	106.83	1	Low Value	3234	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16758	64	1	369.34	0	Regular	3235	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16759	7	3	789.79	0	Regular	3236	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16761	96	1	316.62	0	Regular	3237	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16762	19	3	1207.24	0	Regular	3238	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16763	198	1	611.85	1	Low Value	3239	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16764	3	13	2790.9500000000003	0	Regular	3240	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16765	293	1	34	1	Low Value	3241	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16766	272	2	1145.6	1	Low Value	3242	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16767	30	11	5575.56	0	Regular	3243	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16768	47	3	478.09	0	Regular	3244	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16769	259	1	361.54	1	Low Value	3245	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16770	57	5	757.1	0	Regular	3246	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16771	32	5	2242.61	0	Regular	3247	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16773	56	1	171.59	0	Regular	3248	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16774	67	4	661.52	0	Regular	3249	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16775	9	11	1691.51	0	Regular	3250	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16776	59	1	371.54	0	Regular	3251	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16777	79	2	222.62	0	Regular	3252	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16778	73	2	245.94	0	Regular	3253	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16779	1	22	10611.72	0	Regular	3254	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16780	99	2	422.24	0	Regular	3255	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16781	371	1	311.25	1	Low Value	3256	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16782	9	13	2267.9500000000003	0	Regular	3257	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16784	19	1	107.6	0	Regular	3258	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16788	122	2	594.39	0	Regular	3259	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16789	7	1	80.8	0	Regular	3260	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16790	3	6	1545.62	0	Regular	3261	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16791	28	7	1705.78	0	Regular	3262	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16792	281	2	110.38	1	Low Value	3263	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16793	56	1	243.84	0	Regular	3264	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16794	0	10	1196.5	0	Regular	3265	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16795	364	1	414.88	1	Low Value	3266	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16796	88	1	305.62	0	Regular	3267	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16800	10	1	1162.65	0	Regular	3268	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16801	162	4	1594.23	1	Low Value	3269	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16803	64	1	332.3	0	Regular	3270	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16804	22	3	536.99	0	Regular	3271	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16805	173	2	460.59	1	Low Value	3272	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16806	102	4	762.16	0	Regular	3273	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16807	142	3	1121.59	1	Low Value	3274	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16808	98	2	288.42	0	Regular	3275	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16809	22	5	914.69	0	Regular	3276	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16810	191	1	309.54	1	Low Value	3277	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16811	4	2	547.07	0	Regular	3278	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16812	360	1	479.35	1	Low Value	3279	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16813	7	10	1652.18	0	Regular	3280	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16814	13	21	6416.7	0	Regular	3281	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16816	102	4	417.06	0	Regular	3282	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16817	2	9	1604.75	0	Regular	3283	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16818	10	11	3349.57	0	Regular	3284	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16820	95	1	497.61	0	Regular	3285	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16823	226	1	358.38	1	Low Value	3286	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16824	15	2	460.64	0	Regular	3287	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16825	38	2	775.1800000000001	0	Regular	3288	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16826	50	1	341.7	0	Regular	3289	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16828	92	2	128.5	0	Regular	3290	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16829	156	1	197.22	1	Low Value	3291	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16830	38	1	325.91	0	Regular	3292	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16832	183	3	199.15	1	Low Value	3293	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16833	0	4	1106.53	0	Regular	3294	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16834	227	1	413.46	1	Low Value	3295	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16835	127	2	180.85	0	Regular	3296	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16836	39	2	251.87	0	Regular	3297	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16837	30	11	3170.98	0	Regular	3298	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16838	196	2	588.85	1	Low Value	3299	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16839	8	34	16594.35	0	Regular	3300	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16841	36	6	1869.82	0	Regular	3301	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16842	100	3	1264.19	0	Regular	3302	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16843	42	16	10196.57	0	Regular	3303	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16846	49	1	214.32	0	Regular	3304	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16847	42	1	193.44	0	Regular	3305	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16848	52	1	281.42	0	Regular	3306	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16849	186	1	124.57	1	Low Value	3307	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16850	333	1	332.41	1	Low Value	3308	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16851	3	3	342.45	0	Regular	3309	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16852	9	2	144.91000000000005	0	Regular	3310	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16855	23	2	328.4	0	Regular	3311	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16856	14	1	35.400000000000006	0	Regular	3312	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16858	368	1	375.69000000000005	1	Low Value	3313	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16859	144	2	747.81	1	Low Value	3314	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16861	59	2	173.76	0	Regular	3315	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16863	30	2	502.8	0	Regular	3316	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16866	140	3	207.74	0	Regular	3317	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16869	22	4	817.12	0	Regular	3318	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16871	21	6	2812.34	0	Regular	3319	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16872	76	3	680.02	0	Regular	3320	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16873	4	6	7123.62	0	Regular	3321	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16875	66	5	2095.53	0	Regular	3322	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16877	11	6	846.62	0	Regular	3323	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16878	83	1	13.3	0	Regular	3324	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16880	30	7	1491.43	0	Regular	3325	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16881	66	1	432	0	Regular	3326	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16882	66	3	705.12	0	Regular	3327	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16883	186	2	272.48	1	Low Value	3328	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16884	37	2	429.84	0	Regular	3329	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16885	14	3	450.41	0	Regular	3330	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16887	34	1	192.33	0	Regular	3331	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16889	194	3	1578.67	1	Low Value	3332	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16891	1	5	742.43	0	Regular	3333	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16892	0	5	518.19	0	Regular	3334	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16893	366	1	145.93	1	Low Value	3335	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16895	64	1	202.27	0	Regular	3336	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16897	298	2	289.78	1	Low Value	3337	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16898	25	3	501.03	0	Regular	3338	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16899	7	6	1271.06	0	Regular	3339	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16900	16	3	887.11	0	Regular	3340	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16902	115	1	1706.88	0	Regular	3341	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16903	28	1	363.2	0	Regular	3342	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16904	3	16	3653.75	0	Regular	3343	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16905	4	7	3037.6	0	Regular	3344	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16906	81	4	559.59	0	Regular	3345	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16907	28	5	928.76	0	Regular	3346	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16909	71	1	379.14	0	Regular	3347	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16910	3	8	1508.96	0	Regular	3348	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16912	28	11	2555.58	0	Regular	3349	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16913	289	1	113.44	1	Low Value	3350	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16914	35	1	183.76	0	Regular	3351	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16915	8	6	621.6800000000001	0	Regular	3352	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16916	23	2	562.41	0	Regular	3353	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16917	276	1	391.52	1	Low Value	3354	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16918	49	6	1068.82	0	Regular	3355	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16919	155	11	2592.25	0	Regular	3356	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16921	60	1	154.18	0	Regular	3357	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16923	11	19	7069.08	0	Regular	3358	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16924	20	3	829.89	0	Regular	3359	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16926	370	1	230.25	1	Low Value	3360	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16927	115	3	543.05	0	Regular	3361	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16928	79	17	2814.7	0	Regular	3362	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16929	3	7	1295.39	0	Regular	3363	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16930	25	3	378.89	0	Regular	3364	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16931	4	21	4554.87	0	Regular	3365	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16932	52	1	150.23000000000002	0	Regular	3366	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16933	0	2	563.23	0	Regular	3367	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16934	54	2	931.03	0	Regular	3368	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16936	25	1	261.9	0	Regular	3369	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16938	8	4	2711.6800000000003	0	Regular	3370	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16940	51	3	3049.88	0	Regular	3371	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16942	12	9	1904.99	0	Regular	3372	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16943	211	3	816.73	1	Low Value	3373	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16945	21	19	4345.5	0	Regular	3374	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16947	235	1	406.48	1	Low Value	3375	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16948	138	3	435.02	0	Regular	3376	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16949	3	6	1286.27	0	Regular	3377	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16950	56	3	1178.56	0	Regular	3378	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16951	134	3	1277.75	0	Regular	3379	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16952	108	2	167.61	0	Regular	3380	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16953	29	1	20.8	0	Regular	3381	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16954	0	9	2085.08	0	Regular	3382	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16955	184	4	518.67	1	Low Value	3383	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16956	17	1	308.74	0	Regular	3384	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16957	238	2	416.64	1	Low Value	3385	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16959	86	1	117.35	0	Regular	3386	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16960	38	3	507.05	0	Regular	3387	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16961	115	1	234.17	0	Regular	3388	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16963	186	1	110.55	1	Low Value	3389	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16965	226	1	201.19	1	Low Value	3390	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16966	7	7	2154.97	0	Regular	3391	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16967	188	1	319.02	1	Low Value	3392	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16968	3	2	439.43	0	Regular	3393	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16969	38	3	650.41	0	Regular	3394	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16971	37	1	357.21	0	Regular	3395	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16976	266	1	251.52	1	Low Value	3396	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16978	77	1	344.33	0	Regular	3397	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16979	3	6	1852	0	Regular	3398	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16980	254	2	1028.46	1	Low Value	3399	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16982	60	1	384.06	0	Regular	3400	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16983	12	7	1905.87	0	Regular	3401	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16984	87	2	4459.52	0	Regular	3402	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16985	16	10	5464.12	0	Regular	3403	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16986	29	2	1873.2	0	Regular	3404	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16987	2	7	1616.8	0	Regular	3405	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16988	4	1	126.12	0	Regular	3406	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16989	6	6	1133.25	0	Regular	3407	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16990	218	1	179	1	Low Value	3408	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16992	10	5	1614.31	0	Regular	3409	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16996	29	6	1456.96	0	Regular	3410	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16997	287	3	702	1	Low Value	3411	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16998	149	4	295	1	Low Value	3412	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
16999	22	2	484.82	0	Regular	3413	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17001	0	11	3989.57	0	Regular	3414	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17002	85	3	1493.73	0	Regular	3415	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17004	45	2	1312.14	0	Regular	3416	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17006	4	4	781.78	0	Regular	3417	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17007	50	6	889.9300000000001	0	Regular	3418	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17010	17	1	195.36	0	Regular	3419	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17011	29	1	270.9	0	Regular	3420	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17014	7	3	583.4300000000001	0	Regular	3421	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17015	28	3	1838.61	0	Regular	3422	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17017	2	20	8694.26	0	Regular	3423	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17018	40	2	920.1	0	Regular	3424	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17019	10	4	1258.08	0	Regular	3425	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17022	30	1	71	0	Regular	3426	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17024	44	3	95.85	0	Regular	3427	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17025	60	3	357.77	0	Regular	3428	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17026	184	2	154.82999999999998	1	Low Value	3429	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17027	78	6	877.5600000000001	0	Regular	3430	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17029	110	2	716	0	Regular	3431	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17030	63	1	146.87	0	Regular	3432	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17031	11	2	380.35	0	Regular	3433	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17033	85	3	1030.14	0	Regular	3434	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17034	15	3	745.52	0	Regular	3435	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17035	245	2	433.53	1	Low Value	3436	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17037	87	1	1267.32	0	Regular	3437	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17038	29	1	112.4	0	Regular	3438	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17040	137	1	449.73	1	Low Value	3439	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17041	26	3	1071.49	0	Regular	3440	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17042	2	5	1036.58	0	Regular	3441	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17043	31	4	1735.18	0	Regular	3442	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17044	24	1	948.48	0	Regular	3443	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17045	112	3	339.44	0	Regular	3444	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17046	156	1	642.02	1	Low Value	3445	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17047	84	3	1100.9	0	Regular	3446	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17048	117	3	925.35	0	Regular	3447	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17049	2	9	5655.03	0	Regular	3448	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17050	95	6	3185.64	0	Regular	3449	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17051	193	1	240.89	1	Low Value	3450	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17052	27	1	399.09	0	Regular	3451	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17053	130	1	498.48	0	Regular	3452	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17054	27	5	1356.33	0	Regular	3453	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17058	81	3	1179.89	0	Regular	3454	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17059	29	5	3080.39	0	Regular	3455	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17060	265	1	234.24	1	Low Value	3456	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17061	73	11	5232.2300000000005	0	Regular	3457	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17062	313	4	533.33	1	Low Value	3458	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17063	20	7	1461.14	0	Regular	3459	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17064	58	3	855.45	0	Regular	3460	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17068	11	21	4552.14	0	Regular	3461	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17069	27	9	2709.7000000000003	0	Regular	3462	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17070	113	1	304.24	0	Regular	3463	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17071	27	9	2429.03	0	Regular	3464	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17073	17	4	1446.09	0	Regular	3465	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17075	17	4	834.12	0	Regular	3466	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17076	35	3	841.0799999999999	0	Regular	3467	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17078	35	2	378.2	0	Regular	3468	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17079	77	1	118.8	0	Regular	3469	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17080	21	2	287.62	0	Regular	3470	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17081	24	2	288.91	0	Regular	3471	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17082	32	2	2003.85	0	Regular	3472	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17083	108	3	1405.78	0	Regular	3473	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17084	34	2	2747.99	0	Regular	3474	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17085	122	5	1562.4	0	Regular	3475	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17086	6	6	2050.08	0	Regular	3476	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17088	27	4	1991.01	0	Regular	3477	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17090	3	7	1974.65	0	Regular	3478	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17091	2	9	3827.76	0	Regular	3479	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17092	49	4	1774.03	0	Regular	3480	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17094	321	1	302	1	Low Value	3481	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17095	22	3	1324.16	0	Regular	3482	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17096	14	4	1022.13	0	Regular	3483	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17097	1	8	954.42	0	Regular	3484	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17100	17	2	971.74	0	Regular	3485	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17101	9	4	1621.73	0	Regular	3486	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17102	261	1	25.5	1	Low Value	3487	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17105	158	2	665.78	1	Low Value	3488	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17107	32	6	10797.48	0	Regular	3489	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17109	28	6	881.29	0	Regular	3490	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17110	164	1	163.29999999999998	1	Low Value	3491	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17111	46	1	231.61	0	Regular	3492	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17114	5	8	801.12	0	Regular	3493	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17115	7	3	837.5	0	Regular	3494	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17117	287	1	116.2	1	Low Value	3495	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17118	317	1	157.02	1	Low Value	3496	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17119	2	2	606.91	0	Regular	3497	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17120	232	1	307.46	1	Low Value	3498	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17122	118	1	138.32	0	Regular	3499	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17123	161	1	345.29999999999995	1	Low Value	3500	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17124	184	1	294.24	1	Low Value	3501	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17125	49	1	230.5	0	Regular	3502	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17126	151	5	989.45	1	Low Value	3503	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17128	334	1	157.09	1	Low Value	3504	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17131	4	5	2463.17	0	Regular	3505	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17133	15	7	4892.240000000001	0	Regular	3506	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17134	106	2	413.2	0	Regular	3507	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17135	15	7	1139.73	0	Regular	3508	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17138	275	1	380.5	1	Low Value	3509	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17139	15	12	10650.77	0	Regular	3510	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17140	246	1	454.12	1	Low Value	3511	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17142	238	1	579	1	Low Value	3512	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17144	0	2	984.57	0	Regular	3513	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17146	105	3	749.78	0	Regular	3514	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17147	22	4	1714.59	0	Regular	3515	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17148	51	1	124.88	0	Regular	3516	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17152	194	3	1689.5	1	Low Value	3517	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17153	23	1	213.78	0	Regular	3518	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17154	74	1	329.34	0	Regular	3519	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17155	17	2	251.7	0	Regular	3520	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17157	7	2	319	0	Regular	3521	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17158	31	3	1266.97	0	Regular	3522	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17159	21	3	1538.88	0	Regular	3523	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17160	30	6	3518.03	0	Regular	3524	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17162	28	10	1715.46	0	Regular	3525	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17163	21	2	293.1	0	Regular	3526	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17164	32	7	2467.35	0	Regular	3527	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17165	283	1	158.68	1	Low Value	3528	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17166	38	2	206.34	0	Regular	3529	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17169	57	2	835.78	0	Regular	3530	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17171	288	1	224.91	1	Low Value	3531	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17172	78	1	317.76	0	Regular	3532	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17173	4	8	3766.6	0	Regular	3533	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17174	217	1	59.9	1	Low Value	3534	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17175	43	4	1443.69	0	Regular	3535	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17176	201	1	306.13	1	Low Value	3536	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17179	177	3	711.79	1	Low Value	3537	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17180	55	4	783.97	0	Regular	3538	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17181	56	2	239.92	0	Regular	3539	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17183	7	6	3347.31	0	Regular	3540	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17186	46	2	144	0	Regular	3541	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17187	226	1	203.95	1	Low Value	3542	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17188	10	7	2474.23	0	Regular	3543	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17189	105	2	383.75	0	Regular	3544	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17190	58	2	444.74	0	Regular	3545	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17191	27	7	2093.68	0	Regular	3546	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17193	35	7	1699.3000000000002	0	Regular	3547	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17194	273	2	262.62	1	Low Value	3548	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17197	29	1	1013.01	0	Regular	3549	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17198	23	3	692.22	0	Regular	3550	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17201	53	1	289.78	0	Regular	3551	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17203	35	6	3560.08	0	Regular	3552	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17204	174	4	1564.56	1	Low Value	3553	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17205	53	1	384.08	0	Regular	3554	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17206	52	1	204.24	0	Regular	3555	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17211	26	8	2317.2200000000003	0	Regular	3556	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17212	252	1	226.85	1	Low Value	3557	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17213	39	7	2781.23	0	Regular	3558	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17214	59	6	1059.12	0	Regular	3559	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17217	233	1	113.5	1	Low Value	3560	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17218	3	10	1951.97	0	Regular	3561	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17219	31	1	114.23	0	Regular	3562	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17220	23	14	3187.55	0	Regular	3563	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17221	6	2	334.48	0	Regular	3564	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17222	64	1	328.65	0	Regular	3565	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17223	309	2	416.89	1	Low Value	3566	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17226	308	1	393.49	1	Low Value	3567	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17227	18	6	939.32	0	Regular	3568	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17228	15	8	1906.09	0	Regular	3569	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17229	95	2	318.76	0	Regular	3570	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17230	263	8	3638.41	1	Low Value	3571	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17231	11	10	3124.72	0	Regular	3572	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17232	2	2	417.77	0	Regular	3573	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17233	34	1	190.88	0	Regular	3574	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17234	182	1	149.89	1	Low Value	3575	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17235	24	2	550.06	0	Regular	3576	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17236	12	6	916.13	0	Regular	3577	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17237	10	2	314.69	0	Regular	3578	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17238	2	17	3719.1	0	Regular	3579	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17239	312	1	382.5	1	Low Value	3580	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17242	107	2	1135.04	0	Regular	3581	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17243	0	26	8540.05	0	Regular	3582	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17244	52	1	954.9	0	Regular	3583	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17245	204	1	171.45	1	Low Value	3584	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17247	14	1	280.09000000000003	0	Regular	3585	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17248	119	1	318.65	0	Regular	3586	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17250	3	2	381.97	0	Regular	3587	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17251	362	1	269.83	1	Low Value	3588	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17252	116	2	348.91	0	Regular	3589	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17253	17	1	178.26	0	Regular	3590	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17254	4	2	271.19	0	Regular	3591	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17255	40	2	291.48	0	Regular	3592	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17256	106	2	240	0	Regular	3593	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17259	147	2	581.23	1	Low Value	3594	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17262	51	5	1253.36	0	Regular	3595	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17263	207	1	63.440000000000005	1	Low Value	3596	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17265	138	2	550.01	0	Regular	3597	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17266	1	3	296.58	0	Regular	3598	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17267	126	2	317.2	0	Regular	3599	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17268	107	4	763.64	0	Regular	3600	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17272	41	4	2148.63	0	Regular	3601	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17274	34	1	107.82	0	Regular	3602	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17277	227	2	1065.35	1	Low Value	3603	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17278	240	1	246.04	1	Low Value	3604	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17279	57	1	187.83	0	Regular	3605	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17282	129	3	1685.46	0	Regular	3606	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17284	59	6	1647.48	0	Regular	3607	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17286	21	1	151.37	0	Regular	3608	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17287	25	7	1049.06	0	Regular	3609	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17288	8	7	1417.63	0	Regular	3610	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17289	31	3	931.02	0	Regular	3611	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17290	3	2	513.01	0	Regular	3612	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17291	307	1	550.8000000000001	1	Low Value	3613	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17293	7	9	1854.06	0	Regular	3614	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17295	28	3	547	0	Regular	3615	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17297	16	1	128.18	0	Regular	3616	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17298	100	2	498.42	0	Regular	3617	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17299	11	4	656.61	0	Regular	3618	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17301	20	1	163.24	0	Regular	3619	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17302	14	5	1135.63	0	Regular	3620	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17303	360	1	250.04	1	Low Value	3621	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17306	10	19	8631.31	0	Regular	3622	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17309	94	1	82.75	0	Regular	3623	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17311	77	2	1384.85	0	Regular	3624	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17312	138	3	644.3	0	Regular	3625	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17313	30	1	2328.84	0	Regular	3626	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17314	24	8	2527.92	0	Regular	3627	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17315	1	38	6281.23	0	Regular	3628	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17317	45	3	2600.34	0	Regular	3629	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17320	99	3	1200.62	0	Regular	3630	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17321	7	2	657.16	0	Regular	3631	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17323	14	7	906.52	0	Regular	3632	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17324	17	4	986.48	0	Regular	3633	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17325	279	1	96.8	1	Low Value	3634	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17329	13	2	523.11	0	Regular	3635	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17330	22	2	363.9	0	Regular	3636	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17331	123	1	175.2	0	Regular	3637	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17333	85	1	494.25	0	Regular	3638	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17334	301	2	307.02	1	Low Value	3639	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17337	150	4	1981.06	1	Low Value	3640	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17338	16	8	6493.54	0	Regular	3641	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17339	93	2	243.36	0	Regular	3642	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17340	29	11	12353.29	0	Regular	3643	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17341	156	3	682.29	1	Low Value	3644	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17343	354	1	193.64	1	Low Value	3645	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17344	45	1	157.62	0	Regular	3646	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17345	14	4	519.6899999999999	0	Regular	3647	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17346	3	15	2622.88	0	Regular	3648	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17347	85	1	228.96	0	Regular	3649	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17348	14	5	1156.6	0	Regular	3650	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17349	178	1	98.25	1	Low Value	3651	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17350	7	4	1281.32	0	Regular	3652	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17351	35	3	587.15	0	Regular	3653	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17353	128	2	1740	0	Regular	3654	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17354	50	1	1393.06	0	Regular	3655	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17356	311	1	178.22	1	Low Value	3656	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17357	23	2	384.39	0	Regular	3657	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17358	302	2	360.81	1	Low Value	3658	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17359	10	1	127.86	0	Regular	3659	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17360	16	3	568.24	0	Regular	3660	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17361	48	3	488.2	0	Regular	3661	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17362	238	2	312.23	1	Low Value	3662	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17364	0	11	4462.68	0	Regular	3663	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17365	12	8	4767.36	0	Regular	3664	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17367	237	1	167.55	1	Low Value	3665	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17368	22	8	1878.87	0	Regular	3666	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17370	72	4	446.18	0	Regular	3667	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17371	16	3	418.4	0	Regular	3668	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17372	40	8	1337.18	0	Regular	3669	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17373	39	4	646.92	0	Regular	3670	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17374	218	2	495.77	1	Low Value	3671	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17375	198	3	400.1	1	Low Value	3672	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17376	70	2	203.2	0	Regular	3673	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17377	23	20	4058.32	0	Regular	3674	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17379	10	1	389.72	0	Regular	3675	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17381	8	29	20275.61	0	Regular	3676	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17382	64	1	65.4	0	Regular	3677	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17383	3	1	193.39	0	Regular	3678	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17384	18	2	336.4	0	Regular	3679	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17385	14	1	256.11	0	Regular	3680	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17386	7	6	2686.42	0	Regular	3681	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17387	19	2	746.81	0	Regular	3682	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17388	77	4	1259.56	0	Regular	3683	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17389	0	34	31833.68	0	Regular	3684	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17391	163	2	508.8	1	Low Value	3685	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17392	306	2	417.27	1	Low Value	3686	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17394	218	1	203.87	1	Low Value	3687	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17396	38	8	7330.8	0	Regular	3688	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17397	21	2	681.41	0	Regular	3689	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17398	114	3	653.38	0	Regular	3690	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17400	125	5	2097.84	0	Regular	3691	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17402	4	13	2633.85	0	Regular	3692	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17403	35	1	263.92	0	Regular	3693	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17404	3	15	31906.82	0	Regular	3694	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17405	0	3	1031.41	0	Regular	3695	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17406	332	3	2184.42	1	Low Value	3696	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17408	162	1	32.65	1	Low Value	3697	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17409	184	2	771.85	1	Low Value	3698	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17410	15	5	1214.72	0	Regular	3699	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17411	11	3	778.94	0	Regular	3700	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17412	2	7	1258.06	0	Regular	3701	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17414	43	2	778	0	Regular	3702	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17415	79	1	507.84	0	Regular	3703	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17416	29	7	6893.42	0	Regular	3704	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17418	41	2	463.46	0	Regular	3705	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17419	10	12	4226.57	0	Regular	3706	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17420	49	3	598.83	0	Regular	3707	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17422	15	6	1979.37	0	Regular	3708	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17423	45	2	698.41	0	Regular	3709	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17425	18	2	759.17	0	Regular	3710	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17426	7	6	5037.26	0	Regular	3711	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17427	71	1	100.8	0	Regular	3712	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17428	0	28	17256.85	0	Regular	3713	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17429	127	3	524.9200000000001	0	Regular	3714	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17430	32	2	265.76	0	Regular	3715	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17431	312	1	403.3	1	Low Value	3716	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17432	17	2	365.76	0	Regular	3717	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17433	87	1	303.16	0	Regular	3718	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17434	1	7	2373.82	0	Regular	3719	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17436	1	2	216.3	0	Regular	3720	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17438	253	1	388.4500000000001	1	Low Value	3721	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17440	156	3	186.42	1	Low Value	3722	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17442	36	6	2248.56	0	Regular	3723	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17443	219	1	534.24	1	Low Value	3724	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17444	147	3	2940.04	1	Low Value	3725	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17446	176	2	120.9	1	Low Value	3726	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17447	39	2	541.53	0	Regular	3727	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17449	1	7	2519.21	0	Regular	3728	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17450	7	46	194390.79	2	Premium	3729	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17451	0	7	1721.4	0	Regular	3730	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17453	17	2	486.72	0	Regular	3731	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17454	191	4	517.53	1	Low Value	3732	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17455	203	1	131.7	1	Low Value	3733	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17456	364	1	249.86	1	Low Value	3734	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17457	126	5	1737.7	0	Regular	3735	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17458	14	1	316.5	0	Regular	3736	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17459	42	2	657.3	0	Regular	3737	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17460	93	6	622.4300000000001	0	Regular	3738	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17461	22	3	735.82	0	Regular	3739	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17462	59	2	675.69	0	Regular	3740	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17463	15	5	1875.86	0	Regular	3741	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17464	157	1	289.96000000000004	1	Low Value	3742	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17466	9	2	763.28	0	Regular	3743	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17468	9	2	137	0	Regular	3744	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17469	15	5	1870.97	0	Regular	3745	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17470	44	5	1125.07	0	Regular	3746	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17472	190	3	697.54	1	Low Value	3747	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17475	78	1	194.37	0	Regular	3748	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17480	77	1	511.82	0	Regular	3749	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17481	3	4	1255.59	0	Regular	3750	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17483	64	3	414.04	0	Regular	3751	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17486	260	1	396.87	1	Low Value	3752	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17489	58	2	376.64	0	Regular	3753	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17490	0	7	2092.32	0	Regular	3754	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17491	0	10	3558.87	0	Regular	3755	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17492	247	1	374.57	1	Low Value	3756	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17495	7	2	497.56	0	Regular	3757	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17496	358	1	271.05	1	Low Value	3758	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17498	75	1	272.22	0	Regular	3759	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17499	289	1	622.88	1	Low Value	3760	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17500	16	3	1138	0	Regular	3761	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17501	220	2	288.6	1	Low Value	3762	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17502	8	4	689.1	0	Regular	3763	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17503	2	2	558.96	0	Regular	3764	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17504	205	9	2997.03	1	Low Value	3765	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17505	161	2	1145.84	1	Low Value	3766	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17506	75	1	302.2	0	Regular	3767	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17507	261	2	605.58	1	Low Value	3768	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17508	280	1	387.31	1	Low Value	3769	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17509	57	8	6083.64	0	Regular	3770	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17510	24	1	308.48	0	Regular	3771	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17511	2	31	91062.38	2	Premium	3772	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17512	28	10	2924.99	0	Regular	3773	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17513	71	1	513.2	0	Regular	3774	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17514	127	1	208.65	0	Regular	3775	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17515	30	4	639.02	0	Regular	3776	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17516	14	5	764.88	0	Regular	3777	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17517	308	1	153.94	1	Low Value	3778	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17519	16	6	1844.02	0	Regular	3779	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17520	53	1	546.81	0	Regular	3780	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17521	29	3	723.2099999999999	0	Regular	3781	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17522	1	5	1070.71	0	Regular	3782	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17523	10	4	652.74	0	Regular	3783	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17524	360	1	145	1	Low Value	3784	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17525	359	1	422.7000000000001	1	Low Value	3785	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17526	4	4	1195.9	0	Regular	3786	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17527	53	4	939.37	0	Regular	3787	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17528	0	8	3628.5	0	Regular	3788	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17530	0	10	2367.12	0	Regular	3789	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17531	189	1	296.7	1	Low Value	3790	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17534	53	1	223.36	0	Regular	3791	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17535	279	1	164.4	1	Low Value	3792	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17536	176	1	76.5	1	Low Value	3793	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17537	29	2	887.67	0	Regular	3794	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17538	25	1	98.42	0	Regular	3795	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17540	24	2	578.9	0	Regular	3796	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17542	269	1	170.75	1	Low Value	3797	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17545	42	3	642.32	0	Regular	3798	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17548	233	1	103.3	1	Low Value	3799	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17549	23	2	148.86	0	Regular	3800	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17550	196	3	267.16	1	Low Value	3801	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17551	358	1	290.34	1	Low Value	3802	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17552	59	4	930.41	0	Regular	3803	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17553	129	1	1487.6	0	Regular	3804	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17554	0	5	1952.45	0	Regular	3805	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17555	19	2	480.31	0	Regular	3806	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17556	205	1	157.9	1	Low Value	3807	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17557	13	3	541.46	0	Regular	3808	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17560	94	4	854.95	0	Regular	3809	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17561	18	1	165.12	0	Regular	3810	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17562	13	7	1122.38	0	Regular	3811	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17564	23	3	454.01	0	Regular	3812	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17566	7	2	869.77	0	Regular	3813	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17567	6	8	4331.48	0	Regular	3814	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17569	331	1	344.14	1	Low Value	3815	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17571	49	4	1425.67	0	Regular	3816	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17572	70	4	226.75000000000003	0	Regular	3817	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17573	28	3	380.6	0	Regular	3818	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17574	242	1	185.65	1	Low Value	3819	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17576	7	19	3564.83	0	Regular	3820	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17578	217	1	143.45999999999998	1	Low Value	3821	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17579	4	3	448.9	0	Regular	3822	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17580	252	3	215.72	1	Low Value	3823	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17581	0	25	11025.24	0	Regular	3824	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17582	235	1	175.27	1	Low Value	3825	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17584	6	2	1242.3	0	Regular	3826	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17585	108	4	1116.68	0	Regular	3827	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17588	99	3	1240.2	0	Regular	3828	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17589	59	4	2404.17	0	Regular	3829	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17590	1	3	1468.02	0	Regular	3830	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17591	72	7	2203.67	0	Regular	3831	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17593	3	5	3923.86	0	Regular	3832	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17594	84	2	993.18	0	Regular	3833	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17595	11	2	386.69	0	Regular	3834	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17596	22	7	2806.69	0	Regular	3835	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17597	213	1	2044.37	1	Low Value	3836	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17600	17	1	161.67000000000002	0	Regular	3837	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17601	238	1	116.01	1	Low Value	3838	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17602	1	6	5054.42	0	Regular	3839	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17603	77	1	394.72	0	Regular	3840	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17604	216	2	309.36	1	Low Value	3841	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17608	32	2	191.99	0	Regular	3842	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17609	40	5	1105.78	0	Regular	3843	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17611	6	15	3961.12	0	Regular	3844	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17612	52	6	2048.45	0	Regular	3845	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17613	22	14	4544.55	0	Regular	3846	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17614	56	1	386.32	0	Regular	3847	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17615	129	3	329.6	0	Regular	3848	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17616	173	3	571.1999999999999	1	Low Value	3849	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17618	5	3	930.28	0	Regular	3850	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17619	311	1	214.37	1	Low Value	3851	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17620	59	1	81.44	0	Regular	3852	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17621	20	3	1379.9	0	Regular	3853	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17623	32	1	527.0500000000001	0	Regular	3854	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17624	14	2	843.48	0	Regular	3855	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17625	17	4	2020.4	0	Regular	3856	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17628	80	1	75.75	0	Regular	3857	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17629	5	8	1814.12	0	Regular	3858	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17630	169	2	503.6	1	Low Value	3859	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17631	1	3	528.33	0	Regular	3860	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17633	30	4	1324.84	0	Regular	3861	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17634	35	9	2358.59	0	Regular	3862	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17636	18	1	285.56	0	Regular	3863	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17637	30	2	547.0600000000001	0	Regular	3864	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17639	275	1	108.5	1	Low Value	3865	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17640	86	1	621.66	0	Regular	3866	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17642	119	2	712.29	0	Regular	3867	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17643	372	1	101.55	1	Low Value	3868	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17644	0	11	2895.64	0	Regular	3869	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17646	218	3	1008.39	1	Low Value	3870	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17647	64	1	133.06	0	Regular	3871	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17648	60	4	1797.5	0	Regular	3872	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17649	137	1	868.49	1	Low Value	3873	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17650	20	1	166.08	0	Regular	3874	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17651	11	10	3945	0	Regular	3875	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17652	24	12	4867.72	0	Regular	3876	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17653	36	4	1207.56	0	Regular	3877	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17654	276	1	117.55	1	Low Value	3878	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17655	10	7	2638.94	0	Regular	3879	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17656	72	5	1674.69	0	Regular	3880	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17658	25	2	595.42	0	Regular	3881	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17659	16	12	2999.46	0	Regular	3882	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17660	140	1	178.75	1	Low Value	3883	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17663	25	7	1802.91	0	Regular	3884	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17664	18	2	604.64	0	Regular	3885	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17666	3	2	728.16	0	Regular	3886	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17667	65	5	2055.51	0	Regular	3887	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17668	0	2	347.75	0	Regular	3888	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17669	42	7	3406.7200000000003	0	Regular	3889	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17670	227	1	205.7	1	Low Value	3890	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17671	15	4	1572.71	0	Regular	3891	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17672	49	2	3178.17	0	Regular	3892	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17673	1	6	1594.97	0	Regular	3893	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17674	73	2	551.04	0	Regular	3894	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17675	0	31	20374.28	0	Regular	3895	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17676	3	6	1371.18	0	Regular	3896	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17677	1	30	16345.38	0	Regular	3897	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17678	263	1	298.11	1	Low Value	3898	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17679	52	2	1992.11	0	Regular	3899	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17680	23	1	184.4	0	Regular	3900	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17682	9	6	2474.33	0	Regular	3901	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17684	43	1	239.41	0	Regular	3902	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17685	16	7	3155.83	0	Regular	3903	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17686	6	7	5739.46	0	Regular	3904	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17690	29	15	4726.8	0	Regular	3905	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17691	357	2	290.40000000000003	1	Low Value	3906	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17692	126	4	740.9399999999999	0	Regular	3907	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17693	136	1	200.47	1	Low Value	3908	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17694	141	1	283.12	1	Low Value	3909	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17695	131	2	765.34	0	Regular	3910	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17696	37	8	2285.71	0	Regular	3911	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17697	235	1	338.95	1	Low Value	3912	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17698	260	1	154.95	1	Low Value	3913	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17700	16	4	2534.64	0	Regular	3914	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17701	252	1	417.95	1	Low Value	3915	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17702	29	4	1824.37	0	Regular	3916	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17703	34	3	798.74	0	Regular	3917	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17704	168	2	885.19	1	Low Value	3918	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17705	2	9	1823.52	0	Regular	3919	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17706	3	17	10504.49	0	Regular	3920	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17707	184	2	152.4	1	Low Value	3921	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17708	187	2	263.33	1	Low Value	3922	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17709	169	1	137.45	1	Low Value	3923	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17711	10	2	385.1	0	Regular	3924	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17712	44	1	522.91	0	Regular	3925	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17714	320	1	153	1	Low Value	3926	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17715	200	1	326.4	1	Low Value	3927	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17716	22	11	5655.99	0	Regular	3928	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17718	231	1	139.35	1	Low Value	3929	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17719	37	15	5396.04	0	Regular	3930	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17720	25	4	1195.94	0	Regular	3931	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17722	95	4	2424.04	0	Regular	3932	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17723	126	6	3276.4000000000005	0	Regular	3933	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17724	70	3	1033	0	Regular	3934	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17725	15	11	3439.08	0	Regular	3935	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17727	14	1	1060.25	0	Regular	3936	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17728	3	3	2876.01	0	Regular	3937	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17730	2	13	5298.4800000000005	0	Regular	3938	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17731	78	4	1240.11	0	Regular	3939	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17732	372	1	303.97	1	Low Value	3940	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17733	38	2	692.19	0	Regular	3941	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17734	53	3	700.63	0	Regular	3942	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17735	1	19	13110.02	0	Regular	3943	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17736	8	3	377.44	0	Regular	3944	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17737	8	2	168.24	0	Regular	3945	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17738	18	4	1879.05	0	Regular	3946	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17739	11	7	2791.35	0	Regular	3947	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17742	112	2	355.11	0	Regular	3948	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17744	3	6	2322.4	0	Regular	3949	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17746	239	1	110.25	1	Low Value	3950	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17747	112	1	71.4	0	Regular	3951	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17749	177	2	674.52	1	Low Value	3952	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17750	4	9	1710.45	0	Regular	3953	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17752	358	1	80.64	1	Low Value	3954	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17754	0	5	1664.65	0	Regular	3955	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17757	0	30	5593.39	0	Regular	3956	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17758	18	8	3408.2000000000003	0	Regular	3957	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17759	16	3	819.96	0	Regular	3958	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17760	21	2	287.59	0	Regular	3959	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17761	32	1	712.78	0	Regular	3960	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17763	262	1	15	1	Low Value	3961	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17764	50	2	772.55	0	Regular	3962	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17765	158	3	367.63	1	Low Value	3963	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17767	14	1	271.2	0	Regular	3964	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17768	7	3	2081.9	0	Regular	3965	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17769	12	10	3957.43	0	Regular	3966	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17770	198	5	1143.27	1	Low Value	3967	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17771	56	2	245.81	0	Regular	3968	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17772	10	2	173.45	0	Regular	3969	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17774	96	4	1213.73	0	Regular	3970	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17775	254	1	56.4	1	Low Value	3971	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17777	24	3	647.56	0	Regular	3972	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17779	20	3	650.32	0	Regular	3973	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17781	158	2	188.02	1	Low Value	3974	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17783	71	2	283.47	0	Regular	3975	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17785	52	1	131.94	0	Regular	3976	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17786	84	2	266.85	0	Regular	3977	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17787	152	4	1817.54	1	Low Value	3978	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17788	73	2	1117.9	0	Regular	3979	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17789	280	1	225.9	1	Low Value	3980	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17790	26	14	1964.3	0	Regular	3981	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17791	29	1	106.1	0	Regular	3982	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17793	24	1	300.34	0	Regular	3983	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17795	179	2	342.83	1	Low Value	3984	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17796	39	4	690	0	Regular	3985	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17797	21	3	780.43	0	Regular	3986	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17799	21	10	3039.17	0	Regular	3987	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17800	36	9	1187.21	0	Regular	3988	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17802	81	3	1285.04	0	Regular	3989	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17805	73	1	512.31	0	Regular	3990	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17806	10	1	546.04	0	Regular	3991	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17809	15	12	5411.91	0	Regular	3992	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17811	3	39	7761.82	0	Regular	3993	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17812	12	4	699.81	0	Regular	3994	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17813	13	5	1698.07	0	Regular	3995	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17816	36	4	36.56	0	Regular	3996	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17817	3	3	387.68	0	Regular	3997	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17819	71	7	3704.87	0	Regular	3998	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17824	50	1	298.4	0	Regular	3999	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17827	4	5	1987.33	0	Regular	4000	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17828	22	4	1820.09	0	Regular	4001	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17829	298	1	889.24	1	Low Value	4002	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17830	1	3	398.7	0	Regular	4003	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17831	32	1	35.400000000000006	0	Regular	4004	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17832	49	1	155.37	0	Regular	4005	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17835	2	3	342.24	0	Regular	4006	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17836	46	1	110.21	0	Regular	4007	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17837	41	8	1541.23	0	Regular	4008	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17838	26	5	2720.8	0	Regular	4009	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17839	41	1	318.15	0	Regular	4010	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17841	1	124	40519.84	2	Premium	4011	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17843	302	1	205.48	1	Low Value	4012	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17844	106	1	51.56	0	Regular	4013	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17846	84	1	2033.1	0	Regular	4014	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17848	80	9	901.2	0	Regular	4015	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17849	217	4	605.8000000000001	1	Low Value	4016	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17850	371	34	5391.21	1	Low Value	4017	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17852	11	2	114.34	0	Regular	4018	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17854	184	2	311.26	1	Low Value	4019	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17855	372	1	208.97	1	Low Value	4020	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17856	1	4	1418.03	0	Regular	4021	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17857	3	23	26879.04	0	Regular	4022	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17858	5	12	5140.66	0	Regular	4023	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17859	304	1	141.92000000000002	1	Low Value	4024	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17860	368	1	226.45	1	Low Value	4025	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17861	2	8	2097.88	0	Regular	4026	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17862	323	1	330.9	1	Low Value	4027	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17863	58	6	3160	0	Regular	4028	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17864	12	3	554.85	0	Regular	4029	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17865	30	20	10526.32	0	Regular	4030	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17866	142	1	329.65	1	Low Value	4031	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17867	29	6	1157.87	0	Regular	4032	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17869	106	5	428.18	0	Regular	4033	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17870	1	12	1865.89	0	Regular	4034	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17871	204	1	155.9	1	Low Value	4035	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17873	79	5	1848.96	0	Regular	4036	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17874	184	6	683.46	1	Low Value	4037	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17877	169	1	237.61	1	Low Value	4038	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17878	43	1	379.45	0	Regular	4039	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17879	173	1	178.51999999999998	1	Low Value	4040	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17880	364	1	458.92	1	Low Value	4041	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17881	303	1	133.35000000000002	1	Low Value	4042	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17883	2	4	664.34	0	Regular	4043	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17884	3	4	695.0699999999999	0	Regular	4044	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17885	11	1	156.34	0	Regular	4045	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17886	31	3	869.28	0	Regular	4046	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17887	128	1	111.35	0	Regular	4047	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17888	20	8	716	0	Regular	4048	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17889	211	2	201.37	1	Low Value	4049	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17890	322	2	586.89	1	Low Value	4050	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17891	161	1	203.86	1	Low Value	4051	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17892	55	3	244.1	0	Regular	4052	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17893	224	1	107.21	1	Low Value	4053	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17894	71	8	1118.96	0	Regular	4054	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17895	43	1	95.45	0	Regular	4055	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17896	22	1	256.32	0	Regular	4056	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17897	172	3	541.8100000000001	1	Low Value	4057	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17898	84	2	152.06	0	Regular	4058	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17899	158	1	154.55	1	Low Value	4059	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17900	189	2	112.2	1	Low Value	4060	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17901	28	1	110.38	0	Regular	4061	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17904	20	1	181.07	0	Regular	4062	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17905	70	4	798.99	0	Regular	4063	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17906	246	1	72.9	1	Low Value	4064	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17908	373	1	232.03	1	Low Value	4065	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17911	8	1	366.23	0	Regular	4066	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17912	309	5	310.06	1	Low Value	4067	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17913	58	2	408.65	0	Regular	4068	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17914	3	1	329.36	0	Regular	4069	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17917	44	3	335.03	0	Regular	4070	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17919	87	1	1304.04	0	Regular	4071	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17920	3	17	4119.5	0	Regular	4072	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17921	63	4	820.23	0	Regular	4073	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17923	281	1	207.50000000000003	1	Low Value	4074	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17924	11	7	2962.5	0	Regular	4075	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17925	372	1	244.08	1	Low Value	4076	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17926	132	2	397.29	0	Regular	4077	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17928	44	2	212.54	0	Regular	4078	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17929	10	4	843	0	Regular	4079	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17930	35	5	1740.48	0	Regular	4080	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17931	133	2	408.36	0	Regular	4081	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17932	28	3	1331.57	0	Regular	4082	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17934	51	2	704.25	0	Regular	4083	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17935	137	2	145.79	0	Regular	4084	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17936	4	1	380.13	0	Regular	4085	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17937	8	7	4301.22	0	Regular	4086	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17939	159	1	99.14	1	Low Value	4087	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17940	48	10	4020.04	0	Regular	4088	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17941	130	1	304.56	0	Regular	4089	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17942	7	1	77.50000000000001	0	Regular	4090	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17946	232	2	149.57999999999998	1	Low Value	4091	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17947	36	1	176.68	0	Regular	4092	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17948	146	1	358.56000000000006	1	Low Value	4093	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17949	0	45	58510.48	0	Regular	4094	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17950	71	3	482.2	0	Regular	4095	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17951	39	3	1008.54	0	Regular	4096	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17954	4	12	2314.13	0	Regular	4097	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17955	198	4	557.3	1	Low Value	4098	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17956	248	1	12.75	1	Low Value	4099	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17957	65	1	111.68	0	Regular	4100	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17958	116	1	508.4599999999999	0	Regular	4101	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17960	170	1	73.78	1	Low Value	4102	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17961	20	39	1296.44	0	Regular	4103	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17962	141	1	102.41	1	Low Value	4104	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17964	31	2	463.21	0	Regular	4105	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17965	37	14	2599.19	0	Regular	4106	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17966	37	5	1098.43	0	Regular	4107	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17967	371	1	112.27	1	Low Value	4108	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17968	373	1	265.1	1	Low Value	4109	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17969	165	2	228.2	1	Low Value	4110	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17970	210	1	562.79	1	Low Value	4111	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17972	241	1	135.19	1	Low Value	4112	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17973	51	1	337.04	0	Regular	4113	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17974	24	3	703.99	0	Regular	4114	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17975	14	13	4483.26	0	Regular	4115	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17976	371	1	321.79	1	Low Value	4116	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17977	28	1	288.14	0	Regular	4117	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17978	364	1	300.92	1	Low Value	4118	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17979	35	4	732.41	0	Regular	4119	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17980	165	3	811.45	1	Low Value	4120	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17984	144	1	152.68	1	Low Value	4121	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17985	21	1	631.35	0	Regular	4122	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17986	55	1	20.8	0	Regular	4123	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17987	184	1	198.57	1	Low Value	4124	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17988	11	7	201.12	0	Regular	4125	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17990	236	3	630.84	1	Low Value	4126	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17991	224	2	93.35	1	Low Value	4127	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17994	121	4	674.89	0	Regular	4128	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17995	281	1	76.1	1	Low Value	4129	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17997	73	8	1962.46	0	Regular	4130	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
17999	36	2	380.39	0	Regular	4131	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18001	11	2	415.13	0	Regular	4132	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18004	361	1	157.92	1	Low Value	4133	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18005	3	2	226.47	0	Regular	4134	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18006	22	1	444.68	0	Regular	4135	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18008	69	9	2116.19	0	Regular	4136	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18009	234	1	247.39	1	Low Value	4137	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18010	256	1	174.8	1	Low Value	4138	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18011	372	1	102.79	1	Low Value	4139	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18013	154	2	187.29	1	Low Value	4140	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18014	27	1	162.22	0	Regular	4141	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18015	3	1	120.03	0	Regular	4142	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18016	31	5	1477.66	0	Regular	4143	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18017	80	3	523	0	Regular	4144	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18018	107	2	122.14	0	Regular	4145	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18019	51	1	38.45	0	Regular	4146	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18022	35	1	612.72	0	Regular	4147	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18024	152	2	389.78	1	Low Value	4148	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18027	98	1	115.31	0	Regular	4149	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18030	3	2	230.65	0	Regular	4150	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18032	333	1	73.5	1	Low Value	4151	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18033	64	1	93.82	0	Regular	4152	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18034	21	2	418.68	0	Regular	4153	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18035	35	3	713.89	0	Regular	4154	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18036	31	3	403.12	0	Regular	4155	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18037	153	6	70.02	1	Low Value	4156	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18040	18	2	357.20000000000005	0	Regular	4157	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18041	11	21	4097.37	0	Regular	4158	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18042	53	1	165.04999999999998	0	Regular	4159	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18043	24	3	529.29	0	Regular	4160	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18044	3	10	2088.6	0	Regular	4161	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18045	44	1	178.34	0	Regular	4162	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18048	202	2	172.29000000000002	1	Low Value	4163	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18050	358	1	74.4	1	Low Value	4164	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18053	70	1	300.02	0	Regular	4165	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18055	6	10	6761.34	0	Regular	4166	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18056	287	1	363.65	1	Low Value	4167	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18058	9	1	170.16	0	Regular	4168	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18059	22	3	306.46	0	Regular	4169	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18061	21	10	2119.41	0	Regular	4170	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18062	172	3	720.52	1	Low Value	4171	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18064	132	2	814	0	Regular	4172	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18065	5	14	2392.83	0	Regular	4173	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18066	74	1	318	0	Regular	4174	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18067	39	1	396.33	0	Regular	4175	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18068	288	1	101.7	1	Low Value	4176	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18069	25	5	2009.24	0	Regular	4177	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18071	257	2	453	1	Low Value	4178	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18072	185	1	247.44	1	Low Value	4179	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18073	113	12	3859.82	0	Regular	4180	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18074	373	1	489.6	1	Low Value	4181	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18075	22	10	2611.75	0	Regular	4182	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18077	7	11	2584.41	0	Regular	4183	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18078	216	2	336.13	1	Low Value	4184	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18079	44	4	3613.15	0	Regular	4185	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18080	18	2	1231.5	0	Regular	4186	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18081	35	3	343.45	0	Regular	4187	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18082	25	1	680.84	0	Regular	4188	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18084	15	1	90.48	0	Regular	4189	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18085	329	2	689.95	1	Low Value	4190	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18086	273	1	101.34	1	Low Value	4191	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18087	97	2	4055.7199999999993	0	Regular	4192	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18088	60	1	166.03	0	Regular	4193	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18092	1	11	9068.26	0	Regular	4194	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18093	92	4	2106.52	0	Regular	4195	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18094	81	7	3017.3	0	Regular	4196	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18095	312	2	580.0500000000001	1	Low Value	4197	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18096	11	3	849.06	0	Regular	4198	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18097	7	6	2662.4	0	Regular	4199	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18099	126	1	168.31	0	Regular	4200	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18101	10	2	222.4	0	Regular	4201	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18102	0	60	259657.3	2	Premium	4202	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18104	36	1	754.64	0	Regular	4203	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18105	37	1	113.48000000000002	0	Regular	4204	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18106	329	1	421.9	1	Low Value	4205	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18108	253	1	271	1	Low Value	4206	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18109	1	26	8004.92	0	Regular	4207	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18110	19	1	198.8	0	Regular	4208	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18112	11	2	352.69	0	Regular	4209	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18113	368	1	76.32000000000001	1	Low Value	4210	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18114	289	1	220.1	1	Low Value	4211	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18116	67	8	1403.11	0	Regular	4212	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18117	25	1	315.65	0	Regular	4213	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18118	10	26	5625.08	0	Regular	4214	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18119	367	1	180.7	1	Low Value	4215	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18120	213	1	111.15	1	Low Value	4216	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18121	148	2	653.3	1	Low Value	4217	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18122	7	6	1793.06	0	Regular	4218	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18123	23	2	574.4399999999999	0	Regular	4219	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18125	29	4	1131.75	0	Regular	4220	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18126	60	1	200.92	0	Regular	4221	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18127	18	3	347.08	0	Regular	4222	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18129	242	1	112.55	1	Low Value	4223	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18130	14	3	1059.39	0	Regular	4224	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18133	211	1	931.5	1	Low Value	4225	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18135	28	5	681.9100000000001	0	Regular	4226	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18136	62	3	784.33	0	Regular	4227	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18138	294	1	152.65	1	Low Value	4228	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18139	17	6	8438.34	0	Regular	4229	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18142	156	2	1019.52	1	Low Value	4230	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18143	116	2	1000.16	0	Regular	4231	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18144	7	12	2888.75	0	Regular	4232	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18145	12	4	2861.55	0	Regular	4233	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18146	140	2	160.35000000000002	1	Low Value	4234	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18147	45	2	179.33999999999995	0	Regular	4235	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18149	50	3	612.0799999999999	0	Regular	4236	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18150	31	3	566.58	0	Regular	4237	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18151	134	2	653.35	0	Regular	4238	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18154	2	2	399.19	0	Regular	4239	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18155	74	3	371.62	0	Regular	4240	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18156	12	2	675.64	0	Regular	4241	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18158	8	2	453.4	0	Regular	4242	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18159	300	1	530.15	1	Low Value	4243	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18160	56	2	638.0600000000001	0	Regular	4244	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18161	14	5	1618.69	0	Regular	4245	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18164	36	1	399.65	0	Regular	4246	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18165	176	1	302.46000000000004	1	Low Value	4247	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18167	22	3	1384.86	0	Regular	4248	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18168	175	6	1160.04	1	Low Value	4249	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18169	60	1	202.65	0	Regular	4250	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18170	32	3	980.31	0	Regular	4251	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18171	58	5	1231.31	0	Regular	4252	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18172	14	20	7561.68	0	Regular	4253	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18173	86	4	2106.84	0	Regular	4254	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18174	6	1	104	0	Regular	4255	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18176	357	1	476.35	1	Low Value	4256	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18177	30	6	1340.87	0	Regular	4257	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18178	128	4	1590.81	0	Regular	4258	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18179	8	6	1793.17	0	Regular	4259	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18180	4	6	1843.75	0	Regular	4260	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18181	23	1	366.85	0	Regular	4261	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18183	226	2	632.07	1	Low Value	4262	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18184	14	1	49.8	0	Regular	4263	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18185	248	1	304.25	1	Low Value	4264	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18188	14	3	2001.04	0	Regular	4265	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18189	77	2	1090.24	0	Regular	4266	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18190	191	2	284.46000000000004	1	Low Value	4267	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18191	261	1	207.8	1	Low Value	4268	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18192	71	1	957.97	0	Regular	4269	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18193	164	1	243.76	1	Low Value	4270	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18194	81	1	973.84	0	Regular	4271	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18196	94	2	686.63	0	Regular	4272	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18198	3	17	5425.56	0	Regular	4273	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18200	105	1	150.35	0	Regular	4274	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18202	199	3	1396.99	1	Low Value	4275	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18203	156	1	160.42000000000002	1	Low Value	4276	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18204	70	3	1975.35	0	Regular	4277	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18205	35	2	517.36	0	Regular	4278	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18209	28	1	139.10000000000002	0	Regular	4279	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18210	1	6	2621.38	0	Regular	4280	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18211	25	5	600.07	0	Regular	4281	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18212	325	1	216.07	1	Low Value	4282	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18213	236	1	232.48	1	Low Value	4283	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18215	88	1	299.34000000000003	0	Regular	4284	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18216	30	1	481.75	0	Regular	4285	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18217	28	2	621.75	0	Regular	4286	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18218	210	2	641.92	1	Low Value	4287	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18219	2	10	2069.77	0	Regular	4288	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18220	226	1	305.28000000000003	1	Low Value	4289	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18221	21	5	1041.61	0	Regular	4290	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18222	92	1	443	0	Regular	4291	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18223	4	14	6484.54	0	Regular	4292	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18224	263	1	158.95000000000002	1	Low Value	4293	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18225	2	12	5504.96	0	Regular	4294	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18226	43	11	5228.05	0	Regular	4295	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18227	217	1	93.75	1	Low Value	4296	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18228	56	2	779.9	0	Regular	4297	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18229	11	20	7276.900000000001	0	Regular	4298	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18230	8	7	2810.2000000000003	0	Regular	4299	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18231	191	5	2071.77	1	Low Value	4300	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18232	81	4	592.97	0	Regular	4301	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18233	325	1	440	1	Low Value	4302	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18235	71	3	1796.48	0	Regular	4303	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18236	29	6	882.24	0	Regular	4304	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18237	2	5	987.1	0	Regular	4305	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18239	218	5	1561.61	1	Low Value	4306	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18240	45	1	422.58	0	Regular	4307	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18241	9	17	2073.09	0	Regular	4308	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18242	71	4	2232.49	0	Regular	4309	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18245	6	7	2567.06	0	Regular	4310	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18246	23	2	596.1	0	Regular	4311	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18248	122	2	804.02	0	Regular	4312	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18249	16	1	95.34	0	Regular	4313	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18250	309	1	349.27	1	Low Value	4314	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18251	86	1	4314.72	0	Regular	4315	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18252	50	2	518.27	0	Regular	4316	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18255	88	1	103.3	0	Regular	4317	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18257	38	8	2337.63	0	Regular	4318	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18259	24	3	2338.6000000000004	0	Regular	4319	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18260	172	6	2628.35	1	Low Value	4320	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18261	42	2	324.24	0	Regular	4321	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18262	139	1	149.48	1	Low Value	4322	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18263	25	3	1213.16	0	Regular	4323	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18265	71	2	801.51	0	Regular	4324	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18268	133	1	25.5	0	Regular	4325	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18269	365	1	168.6	1	Low Value	4326	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18270	37	2	283.15	0	Regular	4327	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18272	2	6	3078.58	0	Regular	4328	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18273	1	3	204	0	Regular	4329	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18274	29	1	175.92	0	Regular	4330	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18276	43	1	335.86	0	Regular	4331	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18277	57	1	110.38	0	Regular	4332	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18278	73	1	173.9	0	Regular	4333	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18280	277	1	180.6	1	Low Value	4334	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18281	180	1	80.82	1	Low Value	4335	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18282	7	2	178.05	0	Regular	4336	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18283	3	16	2045.53	0	Regular	4337	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
18287	42	3	1837.28	0	Regular	4338	2026-07-31 22:33:54.249775	2026-07-31 22:33:54.249775
\.


--
-- TOC entry 5268 (class 0 OID 16493)
-- Dependencies: 230
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, email, phone, gender, city, state, country, total_orders, total_spent, average_order_value, customer_status, created_at, updated_at) FROM stdin;
1	Sarah Johnson	sarah@gmail.com	9876543210	Female	New York	NY	USA	12	2350.40	195.87	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
2	Michael Brown	michael@gmail.com	9876543211	Male	Chicago	Illinois	USA	18	1980.75	110.04	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
3	David Lee	david@gmail.com	9876543212	Male	San Francisco	California	USA	14	1725.60	123.25	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
4	Emily Davis	emily@gmail.com	9876543213	Female	Los Angeles	California	USA	11	1540.20	140.01	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
5	James Wilson	james@gmail.com	9876543214	Male	Dallas	Texas	USA	10	1310.45	131.04	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
6	Sophia Taylor	sophia@gmail.com	9876543215	Female	Seattle	Washington	USA	9	1190.80	132.31	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
7	Olivia Martin	olivia@gmail.com	9876543216	Female	Boston	Massachusetts	USA	8	980.60	122.58	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
8	William Harris	william@gmail.com	9876543217	Male	Houston	Texas	USA	7	875.30	125.04	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
9	Emma Thompson	emma@gmail.com	9876543218	Female	Miami	Florida	USA	6	720.50	120.08	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
10	Daniel White	daniel@gmail.com	9876543219	Male	Atlanta	Georgia	USA	5	650.90	130.18	Active	2026-07-31 22:42:02.297637	2026-07-31 22:42:02.297637
12346	Customer 12346	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12347	Customer 12347	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12348	Customer 12348	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12349	Customer 12349	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12350	Customer 12350	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12352	Customer 12352	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12353	Customer 12353	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12354	Customer 12354	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12355	Customer 12355	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12356	Customer 12356	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12357	Customer 12357	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12358	Customer 12358	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12359	Customer 12359	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12360	Customer 12360	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12361	Customer 12361	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12362	Customer 12362	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12363	Customer 12363	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12364	Customer 12364	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12365	Customer 12365	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12367	Customer 12367	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12370	Customer 12370	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12371	Customer 12371	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12372	Customer 12372	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12373	Customer 12373	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12374	Customer 12374	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12375	Customer 12375	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12377	Customer 12377	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12378	Customer 12378	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12379	Customer 12379	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12380	Customer 12380	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12381	Customer 12381	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12383	Customer 12383	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12384	Customer 12384	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12386	Customer 12386	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12388	Customer 12388	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12390	Customer 12390	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12391	Customer 12391	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12393	Customer 12393	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12394	Customer 12394	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12395	Customer 12395	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12397	Customer 12397	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12398	Customer 12398	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12399	Customer 12399	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12401	Customer 12401	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12402	Customer 12402	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12403	Customer 12403	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12405	Customer 12405	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12406	Customer 12406	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12407	Customer 12407	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12408	Customer 12408	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12409	Customer 12409	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12410	Customer 12410	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12412	Customer 12412	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12413	Customer 12413	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12414	Customer 12414	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12415	Customer 12415	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12417	Customer 12417	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12418	Customer 12418	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12420	Customer 12420	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12421	Customer 12421	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12422	Customer 12422	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12423	Customer 12423	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12424	Customer 12424	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12425	Customer 12425	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12426	Customer 12426	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12427	Customer 12427	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12428	Customer 12428	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12429	Customer 12429	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12430	Customer 12430	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12431	Customer 12431	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12432	Customer 12432	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12433	Customer 12433	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12434	Customer 12434	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12435	Customer 12435	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12436	Customer 12436	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12437	Customer 12437	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12438	Customer 12438	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12441	Customer 12441	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12442	Customer 12442	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12444	Customer 12444	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12445	Customer 12445	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12446	Customer 12446	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12447	Customer 12447	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12448	Customer 12448	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12449	Customer 12449	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12450	Customer 12450	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12451	Customer 12451	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12452	Customer 12452	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12453	Customer 12453	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12454	Customer 12454	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12455	Customer 12455	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12456	Customer 12456	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12457	Customer 12457	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12458	Customer 12458	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12461	Customer 12461	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12462	Customer 12462	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12463	Customer 12463	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12464	Customer 12464	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12465	Customer 12465	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12468	Customer 12468	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12471	Customer 12471	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12472	Customer 12472	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12473	Customer 12473	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12474	Customer 12474	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12475	Customer 12475	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12476	Customer 12476	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12477	Customer 12477	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12478	Customer 12478	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12479	Customer 12479	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12480	Customer 12480	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12481	Customer 12481	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12483	Customer 12483	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12484	Customer 12484	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12488	Customer 12488	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12489	Customer 12489	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12490	Customer 12490	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12491	Customer 12491	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12492	Customer 12492	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12493	Customer 12493	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12494	Customer 12494	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12497	Customer 12497	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12498	Customer 12498	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12500	Customer 12500	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12501	Customer 12501	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12502	Customer 12502	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12504	Customer 12504	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12506	Customer 12506	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12507	Customer 12507	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12508	Customer 12508	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12509	Customer 12509	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12510	Customer 12510	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12512	Customer 12512	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12513	Customer 12513	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12514	Customer 12514	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12515	Customer 12515	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12516	Customer 12516	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12517	Customer 12517	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12518	Customer 12518	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12519	Customer 12519	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12520	Customer 12520	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12521	Customer 12521	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12522	Customer 12522	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12523	Customer 12523	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12524	Customer 12524	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12526	Customer 12526	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12527	Customer 12527	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12528	Customer 12528	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12530	Customer 12530	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12531	Customer 12531	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12532	Customer 12532	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12534	Customer 12534	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12535	Customer 12535	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12536	Customer 12536	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12538	Customer 12538	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12539	Customer 12539	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12540	Customer 12540	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12541	Customer 12541	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12544	Customer 12544	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12545	Customer 12545	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12546	Customer 12546	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12547	Customer 12547	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12548	Customer 12548	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12550	Customer 12550	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12551	Customer 12551	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12552	Customer 12552	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12553	Customer 12553	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12556	Customer 12556	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12557	Customer 12557	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12558	Customer 12558	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12559	Customer 12559	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12560	Customer 12560	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12561	Customer 12561	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12562	Customer 12562	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12564	Customer 12564	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12565	Customer 12565	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12566	Customer 12566	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12567	Customer 12567	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12569	Customer 12569	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12571	Customer 12571	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12572	Customer 12572	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12573	Customer 12573	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12574	Customer 12574	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12576	Customer 12576	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12577	Customer 12577	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12578	Customer 12578	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12579	Customer 12579	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12580	Customer 12580	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12581	Customer 12581	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12582	Customer 12582	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12583	Customer 12583	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12584	Customer 12584	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12585	Customer 12585	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12586	Customer 12586	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12587	Customer 12587	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12588	Customer 12588	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12589	Customer 12589	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12590	Customer 12590	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12591	Customer 12591	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12592	Customer 12592	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12593	Customer 12593	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12594	Customer 12594	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12596	Customer 12596	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12597	Customer 12597	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12598	Customer 12598	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12599	Customer 12599	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12600	Customer 12600	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12601	Customer 12601	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12602	Customer 12602	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12603	Customer 12603	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12604	Customer 12604	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12607	Customer 12607	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12609	Customer 12609	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12610	Customer 12610	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12611	Customer 12611	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12612	Customer 12612	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12613	Customer 12613	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12614	Customer 12614	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12615	Customer 12615	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12616	Customer 12616	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12617	Customer 12617	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12618	Customer 12618	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12619	Customer 12619	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12620	Customer 12620	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12621	Customer 12621	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12622	Customer 12622	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12623	Customer 12623	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12624	Customer 12624	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12625	Customer 12625	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12626	Customer 12626	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12627	Customer 12627	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12628	Customer 12628	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12630	Customer 12630	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12631	Customer 12631	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12633	Customer 12633	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12635	Customer 12635	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12637	Customer 12637	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12638	Customer 12638	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12639	Customer 12639	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12640	Customer 12640	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12641	Customer 12641	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12642	Customer 12642	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12643	Customer 12643	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12644	Customer 12644	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12645	Customer 12645	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12646	Customer 12646	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12647	Customer 12647	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12648	Customer 12648	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12649	Customer 12649	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12650	Customer 12650	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12651	Customer 12651	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12652	Customer 12652	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12653	Customer 12653	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12654	Customer 12654	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12656	Customer 12656	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12657	Customer 12657	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12658	Customer 12658	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12659	Customer 12659	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12660	Customer 12660	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12662	Customer 12662	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12664	Customer 12664	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12665	Customer 12665	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12667	Customer 12667	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12668	Customer 12668	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12669	Customer 12669	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12670	Customer 12670	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12672	Customer 12672	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12673	Customer 12673	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12674	Customer 12674	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12676	Customer 12676	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12678	Customer 12678	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12679	Customer 12679	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12680	Customer 12680	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12681	Customer 12681	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12682	Customer 12682	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12683	Customer 12683	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12684	Customer 12684	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12685	Customer 12685	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12686	Customer 12686	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12688	Customer 12688	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12689	Customer 12689	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12690	Customer 12690	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12691	Customer 12691	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12693	Customer 12693	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12694	Customer 12694	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12695	Customer 12695	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12697	Customer 12697	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12700	Customer 12700	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12701	Customer 12701	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12702	Customer 12702	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12703	Customer 12703	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12704	Customer 12704	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12705	Customer 12705	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12707	Customer 12707	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12708	Customer 12708	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12709	Customer 12709	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12710	Customer 12710	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12712	Customer 12712	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12713	Customer 12713	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12714	Customer 12714	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12715	Customer 12715	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12716	Customer 12716	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12717	Customer 12717	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12718	Customer 12718	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12719	Customer 12719	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12720	Customer 12720	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12721	Customer 12721	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12722	Customer 12722	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12723	Customer 12723	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12724	Customer 12724	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12725	Customer 12725	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12726	Customer 12726	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12727	Customer 12727	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12728	Customer 12728	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12729	Customer 12729	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12731	Customer 12731	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12732	Customer 12732	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12733	Customer 12733	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12734	Customer 12734	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12735	Customer 12735	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12736	Customer 12736	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12738	Customer 12738	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12739	Customer 12739	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12740	Customer 12740	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12743	Customer 12743	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12744	Customer 12744	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12747	Customer 12747	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12748	Customer 12748	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12749	Customer 12749	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12750	Customer 12750	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12752	Customer 12752	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12753	Customer 12753	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12754	Customer 12754	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12755	Customer 12755	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12756	Customer 12756	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12757	Customer 12757	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12758	Customer 12758	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12759	Customer 12759	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12762	Customer 12762	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12763	Customer 12763	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12764	Customer 12764	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12766	Customer 12766	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12769	Customer 12769	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12770	Customer 12770	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12772	Customer 12772	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12775	Customer 12775	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12778	Customer 12778	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12779	Customer 12779	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12781	Customer 12781	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12782	Customer 12782	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12783	Customer 12783	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12784	Customer 12784	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12785	Customer 12785	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12787	Customer 12787	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12789	Customer 12789	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12790	Customer 12790	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12791	Customer 12791	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12792	Customer 12792	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12793	Customer 12793	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12794	Customer 12794	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12795	Customer 12795	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12797	Customer 12797	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12798	Customer 12798	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12802	Customer 12802	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12808	Customer 12808	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12809	Customer 12809	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12811	Customer 12811	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12812	Customer 12812	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12814	Customer 12814	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12815	Customer 12815	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12816	Customer 12816	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12817	Customer 12817	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12818	Customer 12818	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12820	Customer 12820	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12821	Customer 12821	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12822	Customer 12822	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12823	Customer 12823	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12824	Customer 12824	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12826	Customer 12826	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12827	Customer 12827	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12828	Customer 12828	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12829	Customer 12829	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12830	Customer 12830	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12831	Customer 12831	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12832	Customer 12832	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12833	Customer 12833	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12834	Customer 12834	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12836	Customer 12836	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12837	Customer 12837	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12838	Customer 12838	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12839	Customer 12839	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12840	Customer 12840	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12841	Customer 12841	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12842	Customer 12842	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12843	Customer 12843	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12844	Customer 12844	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12845	Customer 12845	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12847	Customer 12847	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12849	Customer 12849	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12851	Customer 12851	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12852	Customer 12852	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12853	Customer 12853	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12854	Customer 12854	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12855	Customer 12855	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12856	Customer 12856	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12857	Customer 12857	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12863	Customer 12863	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12864	Customer 12864	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12865	Customer 12865	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12866	Customer 12866	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12867	Customer 12867	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12868	Customer 12868	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12871	Customer 12871	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12872	Customer 12872	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12873	Customer 12873	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12875	Customer 12875	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12876	Customer 12876	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12877	Customer 12877	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12878	Customer 12878	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12879	Customer 12879	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12881	Customer 12881	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12882	Customer 12882	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12883	Customer 12883	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12884	Customer 12884	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12885	Customer 12885	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12886	Customer 12886	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12888	Customer 12888	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12890	Customer 12890	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12891	Customer 12891	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12893	Customer 12893	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12895	Customer 12895	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12897	Customer 12897	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12901	Customer 12901	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12902	Customer 12902	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12904	Customer 12904	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12906	Customer 12906	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12908	Customer 12908	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12909	Customer 12909	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12910	Customer 12910	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12912	Customer 12912	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12913	Customer 12913	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12915	Customer 12915	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12916	Customer 12916	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12917	Customer 12917	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12919	Customer 12919	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12920	Customer 12920	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12921	Customer 12921	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12922	Customer 12922	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12923	Customer 12923	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12924	Customer 12924	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12925	Customer 12925	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12928	Customer 12928	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12929	Customer 12929	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12930	Customer 12930	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12931	Customer 12931	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12933	Customer 12933	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12935	Customer 12935	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12936	Customer 12936	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12937	Customer 12937	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12938	Customer 12938	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12939	Customer 12939	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12940	Customer 12940	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12942	Customer 12942	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12944	Customer 12944	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12945	Customer 12945	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12947	Customer 12947	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12948	Customer 12948	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12949	Customer 12949	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12950	Customer 12950	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12951	Customer 12951	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12952	Customer 12952	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12953	Customer 12953	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12955	Customer 12955	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12956	Customer 12956	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12957	Customer 12957	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12962	Customer 12962	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12963	Customer 12963	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12965	Customer 12965	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12966	Customer 12966	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12967	Customer 12967	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12968	Customer 12968	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12970	Customer 12970	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12971	Customer 12971	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12974	Customer 12974	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12976	Customer 12976	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12977	Customer 12977	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12980	Customer 12980	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12981	Customer 12981	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12982	Customer 12982	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12984	Customer 12984	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12985	Customer 12985	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12987	Customer 12987	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12988	Customer 12988	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12989	Customer 12989	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12990	Customer 12990	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12991	Customer 12991	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12993	Customer 12993	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12994	Customer 12994	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12995	Customer 12995	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12997	Customer 12997	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
12999	Customer 12999	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13000	Customer 13000	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13001	Customer 13001	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13002	Customer 13002	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13003	Customer 13003	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13004	Customer 13004	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13005	Customer 13005	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13006	Customer 13006	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13008	Customer 13008	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13011	Customer 13011	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13012	Customer 13012	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13013	Customer 13013	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13014	Customer 13014	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13015	Customer 13015	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13016	Customer 13016	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13017	Customer 13017	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13018	Customer 13018	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13021	Customer 13021	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13023	Customer 13023	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13026	Customer 13026	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13027	Customer 13027	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13028	Customer 13028	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13029	Customer 13029	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13030	Customer 13030	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13032	Customer 13032	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13033	Customer 13033	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13034	Customer 13034	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13035	Customer 13035	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13037	Customer 13037	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13038	Customer 13038	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13040	Customer 13040	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13043	Customer 13043	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13044	Customer 13044	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13045	Customer 13045	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13046	Customer 13046	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13047	Customer 13047	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13048	Customer 13048	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13049	Customer 13049	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13050	Customer 13050	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13052	Customer 13052	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13055	Customer 13055	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13058	Customer 13058	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13059	Customer 13059	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13060	Customer 13060	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13061	Customer 13061	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13062	Customer 13062	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13064	Customer 13064	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13065	Customer 13065	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13066	Customer 13066	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13067	Customer 13067	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13068	Customer 13068	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13069	Customer 13069	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13070	Customer 13070	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13072	Customer 13072	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13075	Customer 13075	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13077	Customer 13077	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13078	Customer 13078	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13079	Customer 13079	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13080	Customer 13080	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13081	Customer 13081	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13082	Customer 13082	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13083	Customer 13083	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13085	Customer 13085	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13089	Customer 13089	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13090	Customer 13090	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13091	Customer 13091	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13092	Customer 13092	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13093	Customer 13093	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13094	Customer 13094	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13095	Customer 13095	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13097	Customer 13097	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13098	Customer 13098	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13099	Customer 13099	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13101	Customer 13101	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13102	Customer 13102	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13103	Customer 13103	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13104	Customer 13104	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13106	Customer 13106	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13107	Customer 13107	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13108	Customer 13108	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13109	Customer 13109	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13110	Customer 13110	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13113	Customer 13113	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13115	Customer 13115	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13116	Customer 13116	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13117	Customer 13117	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13118	Customer 13118	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13120	Customer 13120	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13121	Customer 13121	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13122	Customer 13122	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13124	Customer 13124	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13126	Customer 13126	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13127	Customer 13127	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13130	Customer 13130	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13131	Customer 13131	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13132	Customer 13132	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13133	Customer 13133	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13134	Customer 13134	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13135	Customer 13135	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13136	Customer 13136	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13137	Customer 13137	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13138	Customer 13138	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13139	Customer 13139	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13140	Customer 13140	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13141	Customer 13141	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13142	Customer 13142	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13144	Customer 13144	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13145	Customer 13145	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13146	Customer 13146	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13147	Customer 13147	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13148	Customer 13148	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13149	Customer 13149	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13151	Customer 13151	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13153	Customer 13153	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13155	Customer 13155	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13157	Customer 13157	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13158	Customer 13158	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13159	Customer 13159	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13160	Customer 13160	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13161	Customer 13161	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13162	Customer 13162	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13165	Customer 13165	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13166	Customer 13166	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13167	Customer 13167	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13168	Customer 13168	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13169	Customer 13169	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13170	Customer 13170	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13171	Customer 13171	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13173	Customer 13173	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13174	Customer 13174	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13176	Customer 13176	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13177	Customer 13177	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13178	Customer 13178	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13182	Customer 13182	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13183	Customer 13183	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13184	Customer 13184	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13185	Customer 13185	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13186	Customer 13186	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13187	Customer 13187	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13188	Customer 13188	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13189	Customer 13189	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13192	Customer 13192	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13193	Customer 13193	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13194	Customer 13194	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13196	Customer 13196	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13198	Customer 13198	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13199	Customer 13199	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13200	Customer 13200	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13203	Customer 13203	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13207	Customer 13207	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13208	Customer 13208	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13209	Customer 13209	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13210	Customer 13210	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13211	Customer 13211	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13212	Customer 13212	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13213	Customer 13213	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13216	Customer 13216	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13217	Customer 13217	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13218	Customer 13218	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13220	Customer 13220	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13221	Customer 13221	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13223	Customer 13223	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13224	Customer 13224	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13225	Customer 13225	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13226	Customer 13226	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13227	Customer 13227	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13228	Customer 13228	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13229	Customer 13229	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13230	Customer 13230	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13232	Customer 13232	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13233	Customer 13233	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13235	Customer 13235	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13236	Customer 13236	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13238	Customer 13238	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13239	Customer 13239	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13240	Customer 13240	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13242	Customer 13242	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13243	Customer 13243	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13244	Customer 13244	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13245	Customer 13245	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13246	Customer 13246	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13247	Customer 13247	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13248	Customer 13248	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13249	Customer 13249	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13253	Customer 13253	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13255	Customer 13255	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13258	Customer 13258	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13259	Customer 13259	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13260	Customer 13260	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13261	Customer 13261	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13262	Customer 13262	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13263	Customer 13263	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13265	Customer 13265	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13266	Customer 13266	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13267	Customer 13267	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13268	Customer 13268	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13269	Customer 13269	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13270	Customer 13270	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13271	Customer 13271	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13272	Customer 13272	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13273	Customer 13273	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13276	Customer 13276	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13277	Customer 13277	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13278	Customer 13278	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13279	Customer 13279	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13280	Customer 13280	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13282	Customer 13282	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13283	Customer 13283	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13284	Customer 13284	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13285	Customer 13285	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13291	Customer 13291	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13292	Customer 13292	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13294	Customer 13294	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13295	Customer 13295	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13296	Customer 13296	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13297	Customer 13297	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13298	Customer 13298	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13299	Customer 13299	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13300	Customer 13300	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13301	Customer 13301	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13302	Customer 13302	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13304	Customer 13304	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13305	Customer 13305	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13307	Customer 13307	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13308	Customer 13308	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13309	Customer 13309	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13310	Customer 13310	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13311	Customer 13311	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13313	Customer 13313	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13314	Customer 13314	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13316	Customer 13316	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13317	Customer 13317	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13318	Customer 13318	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13319	Customer 13319	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13320	Customer 13320	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13321	Customer 13321	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13322	Customer 13322	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13323	Customer 13323	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13324	Customer 13324	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13325	Customer 13325	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13327	Customer 13327	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13328	Customer 13328	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13329	Customer 13329	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13330	Customer 13330	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13332	Customer 13332	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13334	Customer 13334	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13336	Customer 13336	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13338	Customer 13338	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13339	Customer 13339	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13340	Customer 13340	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13341	Customer 13341	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13343	Customer 13343	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13344	Customer 13344	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13345	Customer 13345	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13347	Customer 13347	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13348	Customer 13348	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13349	Customer 13349	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13350	Customer 13350	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13351	Customer 13351	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13352	Customer 13352	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13354	Customer 13354	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13355	Customer 13355	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13356	Customer 13356	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13357	Customer 13357	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13358	Customer 13358	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13359	Customer 13359	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13362	Customer 13362	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13363	Customer 13363	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13364	Customer 13364	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13365	Customer 13365	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13366	Customer 13366	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13368	Customer 13368	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13369	Customer 13369	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13370	Customer 13370	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13372	Customer 13372	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13373	Customer 13373	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13375	Customer 13375	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13376	Customer 13376	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13379	Customer 13379	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13381	Customer 13381	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13382	Customer 13382	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13384	Customer 13384	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13385	Customer 13385	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13388	Customer 13388	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13389	Customer 13389	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13390	Customer 13390	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13391	Customer 13391	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13394	Customer 13394	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13395	Customer 13395	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13396	Customer 13396	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13397	Customer 13397	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13398	Customer 13398	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13402	Customer 13402	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13403	Customer 13403	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13404	Customer 13404	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13405	Customer 13405	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13408	Customer 13408	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13410	Customer 13410	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13411	Customer 13411	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13414	Customer 13414	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13416	Customer 13416	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13417	Customer 13417	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13418	Customer 13418	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13419	Customer 13419	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13420	Customer 13420	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13421	Customer 13421	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13422	Customer 13422	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13425	Customer 13425	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13426	Customer 13426	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13427	Customer 13427	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13428	Customer 13428	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13429	Customer 13429	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13430	Customer 13430	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13431	Customer 13431	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13434	Customer 13434	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13435	Customer 13435	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13436	Customer 13436	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13437	Customer 13437	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13439	Customer 13439	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13441	Customer 13441	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13447	Customer 13447	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13448	Customer 13448	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13449	Customer 13449	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13450	Customer 13450	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13451	Customer 13451	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13452	Customer 13452	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13453	Customer 13453	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13455	Customer 13455	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13456	Customer 13456	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13458	Customer 13458	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13460	Customer 13460	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13461	Customer 13461	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13462	Customer 13462	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13464	Customer 13464	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13466	Customer 13466	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13467	Customer 13467	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13468	Customer 13468	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13470	Customer 13470	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13471	Customer 13471	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13473	Customer 13473	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13474	Customer 13474	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13475	Customer 13475	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13476	Customer 13476	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13477	Customer 13477	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13479	Customer 13479	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13481	Customer 13481	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13482	Customer 13482	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13483	Customer 13483	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13484	Customer 13484	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13485	Customer 13485	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13486	Customer 13486	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13487	Customer 13487	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13488	Customer 13488	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13489	Customer 13489	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13491	Customer 13491	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13492	Customer 13492	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13493	Customer 13493	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13494	Customer 13494	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13495	Customer 13495	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13496	Customer 13496	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13497	Customer 13497	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13499	Customer 13499	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13500	Customer 13500	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13501	Customer 13501	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13502	Customer 13502	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13503	Customer 13503	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13504	Customer 13504	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13505	Customer 13505	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13506	Customer 13506	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13507	Customer 13507	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13508	Customer 13508	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13509	Customer 13509	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13510	Customer 13510	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13512	Customer 13512	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13513	Customer 13513	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13514	Customer 13514	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13515	Customer 13515	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13516	Customer 13516	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13517	Customer 13517	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13518	Customer 13518	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13519	Customer 13519	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13520	Customer 13520	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13521	Customer 13521	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13522	Customer 13522	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13523	Customer 13523	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13524	Customer 13524	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13525	Customer 13525	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13527	Customer 13527	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13529	Customer 13529	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13531	Customer 13531	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13532	Customer 13532	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13533	Customer 13533	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13534	Customer 13534	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13536	Customer 13536	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13538	Customer 13538	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13539	Customer 13539	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13544	Customer 13544	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13546	Customer 13546	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13548	Customer 13548	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13549	Customer 13549	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13551	Customer 13551	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13552	Customer 13552	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13555	Customer 13555	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13557	Customer 13557	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13558	Customer 13558	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13560	Customer 13560	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13561	Customer 13561	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13562	Customer 13562	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13563	Customer 13563	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13564	Customer 13564	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13565	Customer 13565	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13566	Customer 13566	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13568	Customer 13568	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13569	Customer 13569	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13570	Customer 13570	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13571	Customer 13571	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13572	Customer 13572	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13573	Customer 13573	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13575	Customer 13575	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13576	Customer 13576	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13577	Customer 13577	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13579	Customer 13579	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13581	Customer 13581	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13583	Customer 13583	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13584	Customer 13584	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13587	Customer 13587	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13588	Customer 13588	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13589	Customer 13589	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13590	Customer 13590	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13591	Customer 13591	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13592	Customer 13592	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13593	Customer 13593	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13594	Customer 13594	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13596	Customer 13596	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13598	Customer 13598	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13599	Customer 13599	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13600	Customer 13600	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13601	Customer 13601	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13602	Customer 13602	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13603	Customer 13603	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13606	Customer 13606	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13607	Customer 13607	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13610	Customer 13610	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13611	Customer 13611	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13614	Customer 13614	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13615	Customer 13615	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13617	Customer 13617	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13618	Customer 13618	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13621	Customer 13621	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13623	Customer 13623	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13626	Customer 13626	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13627	Customer 13627	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13629	Customer 13629	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13630	Customer 13630	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13631	Customer 13631	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13632	Customer 13632	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13634	Customer 13634	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13635	Customer 13635	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13636	Customer 13636	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13637	Customer 13637	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13638	Customer 13638	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13639	Customer 13639	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13642	Customer 13642	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13643	Customer 13643	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13644	Customer 13644	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13645	Customer 13645	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13647	Customer 13647	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13649	Customer 13649	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13650	Customer 13650	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13651	Customer 13651	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13652	Customer 13652	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13654	Customer 13654	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13655	Customer 13655	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13656	Customer 13656	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13657	Customer 13657	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13658	Customer 13658	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13659	Customer 13659	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13662	Customer 13662	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13663	Customer 13663	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13666	Customer 13666	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13667	Customer 13667	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13668	Customer 13668	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13669	Customer 13669	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13670	Customer 13670	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13672	Customer 13672	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13673	Customer 13673	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13675	Customer 13675	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13678	Customer 13678	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13680	Customer 13680	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13681	Customer 13681	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13682	Customer 13682	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13684	Customer 13684	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13685	Customer 13685	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13686	Customer 13686	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13689	Customer 13689	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13690	Customer 13690	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13692	Customer 13692	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13694	Customer 13694	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13695	Customer 13695	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13697	Customer 13697	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13699	Customer 13699	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13700	Customer 13700	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13703	Customer 13703	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13704	Customer 13704	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13705	Customer 13705	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13706	Customer 13706	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13707	Customer 13707	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13708	Customer 13708	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13709	Customer 13709	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13710	Customer 13710	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13711	Customer 13711	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13712	Customer 13712	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13715	Customer 13715	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13716	Customer 13716	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13717	Customer 13717	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13718	Customer 13718	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13719	Customer 13719	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13720	Customer 13720	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13721	Customer 13721	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13722	Customer 13722	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13723	Customer 13723	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13725	Customer 13725	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13726	Customer 13726	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13727	Customer 13727	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13728	Customer 13728	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13730	Customer 13730	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13731	Customer 13731	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13732	Customer 13732	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13735	Customer 13735	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13736	Customer 13736	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13737	Customer 13737	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13739	Customer 13739	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13740	Customer 13740	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13741	Customer 13741	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13742	Customer 13742	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13743	Customer 13743	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13744	Customer 13744	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13745	Customer 13745	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13747	Customer 13747	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13748	Customer 13748	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13750	Customer 13750	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13751	Customer 13751	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13752	Customer 13752	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13753	Customer 13753	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13754	Customer 13754	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13755	Customer 13755	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13756	Customer 13756	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13758	Customer 13758	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13759	Customer 13759	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13760	Customer 13760	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13761	Customer 13761	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13762	Customer 13762	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13763	Customer 13763	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13764	Customer 13764	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13767	Customer 13767	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13769	Customer 13769	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13771	Customer 13771	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13772	Customer 13772	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13774	Customer 13774	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13777	Customer 13777	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13778	Customer 13778	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13780	Customer 13780	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13781	Customer 13781	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13782	Customer 13782	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13784	Customer 13784	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13786	Customer 13786	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13787	Customer 13787	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13790	Customer 13790	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13791	Customer 13791	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13792	Customer 13792	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13798	Customer 13798	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13799	Customer 13799	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13800	Customer 13800	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13801	Customer 13801	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13802	Customer 13802	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13803	Customer 13803	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13804	Customer 13804	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13805	Customer 13805	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13806	Customer 13806	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13807	Customer 13807	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13808	Customer 13808	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13809	Customer 13809	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13810	Customer 13810	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13811	Customer 13811	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13812	Customer 13812	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13813	Customer 13813	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13814	Customer 13814	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13815	Customer 13815	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13816	Customer 13816	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13817	Customer 13817	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13819	Customer 13819	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13821	Customer 13821	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13822	Customer 13822	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13823	Customer 13823	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13824	Customer 13824	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13826	Customer 13826	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13827	Customer 13827	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13828	Customer 13828	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13831	Customer 13831	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13832	Customer 13832	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13833	Customer 13833	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13835	Customer 13835	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13837	Customer 13837	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13838	Customer 13838	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13841	Customer 13841	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13842	Customer 13842	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13844	Customer 13844	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13845	Customer 13845	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13846	Customer 13846	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13848	Customer 13848	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13849	Customer 13849	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13850	Customer 13850	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13851	Customer 13851	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13853	Customer 13853	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13854	Customer 13854	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13856	Customer 13856	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13858	Customer 13858	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13859	Customer 13859	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13860	Customer 13860	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13862	Customer 13862	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13863	Customer 13863	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13865	Customer 13865	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13866	Customer 13866	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13867	Customer 13867	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13868	Customer 13868	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13869	Customer 13869	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13870	Customer 13870	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13871	Customer 13871	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13873	Customer 13873	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13874	Customer 13874	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13875	Customer 13875	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13876	Customer 13876	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13877	Customer 13877	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13878	Customer 13878	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13880	Customer 13880	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13881	Customer 13881	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13882	Customer 13882	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13883	Customer 13883	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13884	Customer 13884	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13885	Customer 13885	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13886	Customer 13886	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13887	Customer 13887	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13888	Customer 13888	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13889	Customer 13889	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13890	Customer 13890	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13892	Customer 13892	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13893	Customer 13893	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13894	Customer 13894	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13895	Customer 13895	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13897	Customer 13897	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13898	Customer 13898	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13899	Customer 13899	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13900	Customer 13900	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13901	Customer 13901	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13904	Customer 13904	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13908	Customer 13908	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13911	Customer 13911	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13914	Customer 13914	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13917	Customer 13917	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13918	Customer 13918	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13919	Customer 13919	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13922	Customer 13922	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13923	Customer 13923	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13924	Customer 13924	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13925	Customer 13925	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13926	Customer 13926	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13927	Customer 13927	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13928	Customer 13928	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13929	Customer 13929	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13930	Customer 13930	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13931	Customer 13931	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13932	Customer 13932	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13933	Customer 13933	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13934	Customer 13934	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13936	Customer 13936	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13937	Customer 13937	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13938	Customer 13938	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13939	Customer 13939	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13940	Customer 13940	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13941	Customer 13941	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13946	Customer 13946	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13947	Customer 13947	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13948	Customer 13948	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13949	Customer 13949	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13950	Customer 13950	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13951	Customer 13951	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13952	Customer 13952	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13953	Customer 13953	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13954	Customer 13954	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13955	Customer 13955	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13956	Customer 13956	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13959	Customer 13959	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13960	Customer 13960	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13962	Customer 13962	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13963	Customer 13963	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13967	Customer 13967	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13969	Customer 13969	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13971	Customer 13971	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13972	Customer 13972	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13973	Customer 13973	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13974	Customer 13974	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13975	Customer 13975	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13976	Customer 13976	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13978	Customer 13978	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13979	Customer 13979	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13980	Customer 13980	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13982	Customer 13982	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13983	Customer 13983	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13984	Customer 13984	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13985	Customer 13985	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13986	Customer 13986	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13988	Customer 13988	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13989	Customer 13989	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13990	Customer 13990	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13991	Customer 13991	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13992	Customer 13992	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13993	Customer 13993	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13994	Customer 13994	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13995	Customer 13995	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
13999	Customer 13999	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14000	Customer 14000	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14001	Customer 14001	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14002	Customer 14002	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14004	Customer 14004	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14005	Customer 14005	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14006	Customer 14006	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14009	Customer 14009	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14012	Customer 14012	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14013	Customer 14013	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14014	Customer 14014	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14015	Customer 14015	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14016	Customer 14016	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14019	Customer 14019	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14020	Customer 14020	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14021	Customer 14021	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14022	Customer 14022	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14023	Customer 14023	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14024	Customer 14024	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14027	Customer 14027	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14029	Customer 14029	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14030	Customer 14030	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14031	Customer 14031	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14032	Customer 14032	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14034	Customer 14034	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14035	Customer 14035	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14036	Customer 14036	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14037	Customer 14037	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14038	Customer 14038	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14039	Customer 14039	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14040	Customer 14040	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14041	Customer 14041	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14044	Customer 14044	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14045	Customer 14045	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14046	Customer 14046	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14047	Customer 14047	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14048	Customer 14048	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14049	Customer 14049	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14050	Customer 14050	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14051	Customer 14051	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14052	Customer 14052	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14053	Customer 14053	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14054	Customer 14054	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14055	Customer 14055	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14056	Customer 14056	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14057	Customer 14057	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14059	Customer 14059	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14060	Customer 14060	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14062	Customer 14062	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14064	Customer 14064	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14066	Customer 14066	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14067	Customer 14067	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14068	Customer 14068	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14071	Customer 14071	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14073	Customer 14073	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14075	Customer 14075	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14076	Customer 14076	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14077	Customer 14077	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14078	Customer 14078	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14079	Customer 14079	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14080	Customer 14080	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14081	Customer 14081	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14082	Customer 14082	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14083	Customer 14083	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14085	Customer 14085	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14087	Customer 14087	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14088	Customer 14088	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14089	Customer 14089	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14090	Customer 14090	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14092	Customer 14092	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14093	Customer 14093	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14096	Customer 14096	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14098	Customer 14098	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14099	Customer 14099	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14100	Customer 14100	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14101	Customer 14101	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14102	Customer 14102	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14104	Customer 14104	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14105	Customer 14105	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14107	Customer 14107	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14108	Customer 14108	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14109	Customer 14109	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14110	Customer 14110	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14111	Customer 14111	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14112	Customer 14112	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14113	Customer 14113	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14114	Customer 14114	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14116	Customer 14116	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14117	Customer 14117	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14121	Customer 14121	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14124	Customer 14124	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14125	Customer 14125	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14126	Customer 14126	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14127	Customer 14127	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14128	Customer 14128	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14129	Customer 14129	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14130	Customer 14130	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14132	Customer 14132	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14133	Customer 14133	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14135	Customer 14135	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14138	Customer 14138	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14139	Customer 14139	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14140	Customer 14140	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14141	Customer 14141	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14142	Customer 14142	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14143	Customer 14143	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14145	Customer 14145	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14146	Customer 14146	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14147	Customer 14147	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14148	Customer 14148	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14149	Customer 14149	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14150	Customer 14150	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14152	Customer 14152	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14154	Customer 14154	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14155	Customer 14155	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14156	Customer 14156	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14157	Customer 14157	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14158	Customer 14158	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14159	Customer 14159	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14161	Customer 14161	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14162	Customer 14162	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14163	Customer 14163	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14164	Customer 14164	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14165	Customer 14165	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14167	Customer 14167	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14171	Customer 14171	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14173	Customer 14173	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14174	Customer 14174	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14175	Customer 14175	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14176	Customer 14176	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14177	Customer 14177	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14178	Customer 14178	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14179	Customer 14179	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14180	Customer 14180	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14184	Customer 14184	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14185	Customer 14185	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14188	Customer 14188	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14189	Customer 14189	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14191	Customer 14191	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14193	Customer 14193	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14194	Customer 14194	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14195	Customer 14195	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14196	Customer 14196	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14198	Customer 14198	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14199	Customer 14199	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14201	Customer 14201	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14204	Customer 14204	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14205	Customer 14205	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14206	Customer 14206	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14208	Customer 14208	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14209	Customer 14209	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14210	Customer 14210	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14211	Customer 14211	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14212	Customer 14212	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14214	Customer 14214	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14215	Customer 14215	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14216	Customer 14216	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14217	Customer 14217	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14218	Customer 14218	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14219	Customer 14219	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14220	Customer 14220	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14221	Customer 14221	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14222	Customer 14222	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14223	Customer 14223	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14224	Customer 14224	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14226	Customer 14226	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14227	Customer 14227	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14229	Customer 14229	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14231	Customer 14231	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14232	Customer 14232	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14233	Customer 14233	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14234	Customer 14234	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14235	Customer 14235	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14236	Customer 14236	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14237	Customer 14237	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14238	Customer 14238	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14239	Customer 14239	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14240	Customer 14240	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14241	Customer 14241	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14242	Customer 14242	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14243	Customer 14243	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14245	Customer 14245	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14246	Customer 14246	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14247	Customer 14247	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14248	Customer 14248	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14250	Customer 14250	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14251	Customer 14251	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14256	Customer 14256	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14257	Customer 14257	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14258	Customer 14258	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14259	Customer 14259	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14261	Customer 14261	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14262	Customer 14262	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14264	Customer 14264	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14265	Customer 14265	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14267	Customer 14267	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14270	Customer 14270	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14271	Customer 14271	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14272	Customer 14272	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14273	Customer 14273	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14276	Customer 14276	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14277	Customer 14277	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14280	Customer 14280	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14282	Customer 14282	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14284	Customer 14284	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14285	Customer 14285	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14286	Customer 14286	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14287	Customer 14287	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14288	Customer 14288	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14289	Customer 14289	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14290	Customer 14290	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14291	Customer 14291	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14292	Customer 14292	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14293	Customer 14293	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14295	Customer 14295	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14297	Customer 14297	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14298	Customer 14298	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14299	Customer 14299	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14300	Customer 14300	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14301	Customer 14301	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14304	Customer 14304	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14305	Customer 14305	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14306	Customer 14306	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14307	Customer 14307	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14309	Customer 14309	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14311	Customer 14311	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14312	Customer 14312	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14314	Customer 14314	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14315	Customer 14315	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14317	Customer 14317	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14320	Customer 14320	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14321	Customer 14321	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14323	Customer 14323	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14326	Customer 14326	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14327	Customer 14327	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14329	Customer 14329	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14331	Customer 14331	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14332	Customer 14332	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14333	Customer 14333	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14334	Customer 14334	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14335	Customer 14335	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14336	Customer 14336	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14338	Customer 14338	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14339	Customer 14339	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14340	Customer 14340	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14341	Customer 14341	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14342	Customer 14342	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14344	Customer 14344	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14345	Customer 14345	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14346	Customer 14346	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14348	Customer 14348	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14349	Customer 14349	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14350	Customer 14350	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14351	Customer 14351	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14352	Customer 14352	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14353	Customer 14353	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14354	Customer 14354	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14355	Customer 14355	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14356	Customer 14356	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14357	Customer 14357	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14359	Customer 14359	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14360	Customer 14360	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14362	Customer 14362	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14364	Customer 14364	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14367	Customer 14367	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14368	Customer 14368	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14371	Customer 14371	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14373	Customer 14373	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14375	Customer 14375	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14377	Customer 14377	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14379	Customer 14379	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14381	Customer 14381	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14382	Customer 14382	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14383	Customer 14383	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14385	Customer 14385	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14386	Customer 14386	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14387	Customer 14387	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14388	Customer 14388	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14389	Customer 14389	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14390	Customer 14390	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14393	Customer 14393	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14395	Customer 14395	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14396	Customer 14396	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14397	Customer 14397	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14400	Customer 14400	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14401	Customer 14401	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14403	Customer 14403	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14404	Customer 14404	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14406	Customer 14406	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14407	Customer 14407	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14408	Customer 14408	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14409	Customer 14409	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14410	Customer 14410	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14411	Customer 14411	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14412	Customer 14412	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14413	Customer 14413	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14414	Customer 14414	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14415	Customer 14415	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14416	Customer 14416	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14418	Customer 14418	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14419	Customer 14419	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14420	Customer 14420	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14421	Customer 14421	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14422	Customer 14422	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14423	Customer 14423	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14424	Customer 14424	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14426	Customer 14426	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14427	Customer 14427	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14428	Customer 14428	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14431	Customer 14431	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14432	Customer 14432	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14434	Customer 14434	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14436	Customer 14436	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14437	Customer 14437	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14438	Customer 14438	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14439	Customer 14439	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14440	Customer 14440	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14441	Customer 14441	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14442	Customer 14442	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14443	Customer 14443	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14446	Customer 14446	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14447	Customer 14447	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14448	Customer 14448	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14449	Customer 14449	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14450	Customer 14450	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14451	Customer 14451	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14452	Customer 14452	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14453	Customer 14453	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14456	Customer 14456	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14457	Customer 14457	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14459	Customer 14459	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14460	Customer 14460	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14461	Customer 14461	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14462	Customer 14462	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14463	Customer 14463	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14465	Customer 14465	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14466	Customer 14466	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14467	Customer 14467	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14470	Customer 14470	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14472	Customer 14472	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14473	Customer 14473	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14474	Customer 14474	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14475	Customer 14475	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14476	Customer 14476	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14477	Customer 14477	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14479	Customer 14479	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14480	Customer 14480	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14481	Customer 14481	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14482	Customer 14482	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14483	Customer 14483	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14484	Customer 14484	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14485	Customer 14485	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14487	Customer 14487	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14488	Customer 14488	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14489	Customer 14489	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14491	Customer 14491	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14493	Customer 14493	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14494	Customer 14494	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14495	Customer 14495	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14496	Customer 14496	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14497	Customer 14497	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14498	Customer 14498	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14499	Customer 14499	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14500	Customer 14500	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14501	Customer 14501	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14502	Customer 14502	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14503	Customer 14503	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14504	Customer 14504	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14505	Customer 14505	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14506	Customer 14506	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14507	Customer 14507	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14508	Customer 14508	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14511	Customer 14511	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14512	Customer 14512	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14513	Customer 14513	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14514	Customer 14514	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14515	Customer 14515	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14517	Customer 14517	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14518	Customer 14518	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14520	Customer 14520	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14522	Customer 14522	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14523	Customer 14523	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14524	Customer 14524	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14525	Customer 14525	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14527	Customer 14527	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14528	Customer 14528	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14529	Customer 14529	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14530	Customer 14530	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14532	Customer 14532	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14533	Customer 14533	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14534	Customer 14534	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14535	Customer 14535	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14536	Customer 14536	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14537	Customer 14537	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14538	Customer 14538	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14539	Customer 14539	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14540	Customer 14540	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14541	Customer 14541	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14542	Customer 14542	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14543	Customer 14543	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14544	Customer 14544	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14546	Customer 14546	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14547	Customer 14547	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14548	Customer 14548	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14549	Customer 14549	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14550	Customer 14550	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14551	Customer 14551	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14552	Customer 14552	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14553	Customer 14553	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14554	Customer 14554	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14555	Customer 14555	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14557	Customer 14557	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14560	Customer 14560	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14561	Customer 14561	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14562	Customer 14562	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14565	Customer 14565	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14566	Customer 14566	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14567	Customer 14567	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14569	Customer 14569	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14570	Customer 14570	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14572	Customer 14572	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14573	Customer 14573	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14576	Customer 14576	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14577	Customer 14577	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14578	Customer 14578	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14581	Customer 14581	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14582	Customer 14582	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14583	Customer 14583	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14584	Customer 14584	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14585	Customer 14585	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14586	Customer 14586	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14587	Customer 14587	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14589	Customer 14589	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14591	Customer 14591	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14592	Customer 14592	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14593	Customer 14593	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14594	Customer 14594	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14595	Customer 14595	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14597	Customer 14597	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14598	Customer 14598	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14600	Customer 14600	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14601	Customer 14601	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14603	Customer 14603	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14606	Customer 14606	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14607	Customer 14607	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14608	Customer 14608	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14609	Customer 14609	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14616	Customer 14616	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14618	Customer 14618	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14619	Customer 14619	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14620	Customer 14620	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14621	Customer 14621	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14622	Customer 14622	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14623	Customer 14623	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14624	Customer 14624	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14625	Customer 14625	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14626	Customer 14626	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14628	Customer 14628	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14629	Customer 14629	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14631	Customer 14631	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14632	Customer 14632	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14633	Customer 14633	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14636	Customer 14636	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14638	Customer 14638	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14639	Customer 14639	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14640	Customer 14640	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14641	Customer 14641	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14642	Customer 14642	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14643	Customer 14643	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14644	Customer 14644	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14645	Customer 14645	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14646	Customer 14646	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14647	Customer 14647	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14649	Customer 14649	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14651	Customer 14651	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14652	Customer 14652	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14653	Customer 14653	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14655	Customer 14655	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14656	Customer 14656	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14657	Customer 14657	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14658	Customer 14658	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14659	Customer 14659	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14660	Customer 14660	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14661	Customer 14661	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14662	Customer 14662	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14664	Customer 14664	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14665	Customer 14665	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14666	Customer 14666	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14667	Customer 14667	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14669	Customer 14669	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14670	Customer 14670	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14672	Customer 14672	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14673	Customer 14673	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14675	Customer 14675	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14676	Customer 14676	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14680	Customer 14680	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14681	Customer 14681	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14682	Customer 14682	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14684	Customer 14684	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14687	Customer 14687	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14688	Customer 14688	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14689	Customer 14689	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14690	Customer 14690	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14691	Customer 14691	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14692	Customer 14692	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14693	Customer 14693	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14696	Customer 14696	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14697	Customer 14697	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14698	Customer 14698	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14699	Customer 14699	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14700	Customer 14700	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14701	Customer 14701	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14702	Customer 14702	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14703	Customer 14703	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14704	Customer 14704	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14705	Customer 14705	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14708	Customer 14708	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14709	Customer 14709	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14710	Customer 14710	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14711	Customer 14711	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14712	Customer 14712	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14713	Customer 14713	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14714	Customer 14714	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14715	Customer 14715	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14716	Customer 14716	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14719	Customer 14719	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14720	Customer 14720	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14722	Customer 14722	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14723	Customer 14723	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14725	Customer 14725	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14727	Customer 14727	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14729	Customer 14729	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14730	Customer 14730	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14731	Customer 14731	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14732	Customer 14732	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14733	Customer 14733	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14735	Customer 14735	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14737	Customer 14737	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14738	Customer 14738	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14739	Customer 14739	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14740	Customer 14740	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14741	Customer 14741	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14744	Customer 14744	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14745	Customer 14745	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14747	Customer 14747	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14748	Customer 14748	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14752	Customer 14752	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14753	Customer 14753	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14754	Customer 14754	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14755	Customer 14755	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14756	Customer 14756	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14757	Customer 14757	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14758	Customer 14758	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14759	Customer 14759	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14760	Customer 14760	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14761	Customer 14761	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14762	Customer 14762	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14764	Customer 14764	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14765	Customer 14765	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14766	Customer 14766	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14768	Customer 14768	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14769	Customer 14769	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14770	Customer 14770	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14772	Customer 14772	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14775	Customer 14775	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14776	Customer 14776	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14778	Customer 14778	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14779	Customer 14779	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14780	Customer 14780	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14782	Customer 14782	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14784	Customer 14784	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14785	Customer 14785	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14788	Customer 14788	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14789	Customer 14789	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14790	Customer 14790	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14792	Customer 14792	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14793	Customer 14793	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14794	Customer 14794	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14795	Customer 14795	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14796	Customer 14796	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14798	Customer 14798	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14799	Customer 14799	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14800	Customer 14800	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14801	Customer 14801	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14803	Customer 14803	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14804	Customer 14804	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14805	Customer 14805	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14806	Customer 14806	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14808	Customer 14808	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14810	Customer 14810	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14813	Customer 14813	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14815	Customer 14815	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14816	Customer 14816	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14817	Customer 14817	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14818	Customer 14818	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14819	Customer 14819	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14820	Customer 14820	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14821	Customer 14821	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14823	Customer 14823	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14824	Customer 14824	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14825	Customer 14825	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14828	Customer 14828	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14829	Customer 14829	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14830	Customer 14830	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14834	Customer 14834	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14836	Customer 14836	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14837	Customer 14837	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14840	Customer 14840	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14841	Customer 14841	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14842	Customer 14842	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14844	Customer 14844	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14847	Customer 14847	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14849	Customer 14849	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14850	Customer 14850	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14851	Customer 14851	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14852	Customer 14852	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14853	Customer 14853	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14854	Customer 14854	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14855	Customer 14855	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14856	Customer 14856	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14857	Customer 14857	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14859	Customer 14859	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14860	Customer 14860	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14861	Customer 14861	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14862	Customer 14862	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14863	Customer 14863	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14865	Customer 14865	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14866	Customer 14866	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14867	Customer 14867	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14868	Customer 14868	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14869	Customer 14869	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14870	Customer 14870	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14871	Customer 14871	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14873	Customer 14873	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14875	Customer 14875	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14878	Customer 14878	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14880	Customer 14880	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14881	Customer 14881	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14882	Customer 14882	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14883	Customer 14883	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14885	Customer 14885	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14886	Customer 14886	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14887	Customer 14887	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14888	Customer 14888	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14889	Customer 14889	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14890	Customer 14890	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14891	Customer 14891	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14893	Customer 14893	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14894	Customer 14894	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14895	Customer 14895	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14896	Customer 14896	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14897	Customer 14897	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14898	Customer 14898	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14901	Customer 14901	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14902	Customer 14902	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14903	Customer 14903	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14904	Customer 14904	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14905	Customer 14905	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14907	Customer 14907	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14908	Customer 14908	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14910	Customer 14910	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14911	Customer 14911	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14912	Customer 14912	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14913	Customer 14913	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14915	Customer 14915	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14916	Customer 14916	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14918	Customer 14918	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14920	Customer 14920	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14921	Customer 14921	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14923	Customer 14923	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14924	Customer 14924	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14929	Customer 14929	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14930	Customer 14930	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14931	Customer 14931	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14932	Customer 14932	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14934	Customer 14934	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14935	Customer 14935	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14936	Customer 14936	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14937	Customer 14937	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14944	Customer 14944	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14946	Customer 14946	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14947	Customer 14947	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14948	Customer 14948	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14950	Customer 14950	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14951	Customer 14951	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14952	Customer 14952	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14953	Customer 14953	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14954	Customer 14954	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14957	Customer 14957	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14958	Customer 14958	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14959	Customer 14959	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14960	Customer 14960	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14961	Customer 14961	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14962	Customer 14962	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14963	Customer 14963	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14964	Customer 14964	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14965	Customer 14965	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14966	Customer 14966	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14967	Customer 14967	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14968	Customer 14968	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14970	Customer 14970	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14971	Customer 14971	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14972	Customer 14972	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14973	Customer 14973	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14974	Customer 14974	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14975	Customer 14975	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14976	Customer 14976	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14978	Customer 14978	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14981	Customer 14981	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14984	Customer 14984	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14985	Customer 14985	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14987	Customer 14987	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14988	Customer 14988	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14995	Customer 14995	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14997	Customer 14997	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
14998	Customer 14998	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15000	Customer 15000	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15002	Customer 15002	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15004	Customer 15004	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15005	Customer 15005	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15006	Customer 15006	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15007	Customer 15007	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15009	Customer 15009	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15010	Customer 15010	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15012	Customer 15012	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15014	Customer 15014	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15016	Customer 15016	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15017	Customer 15017	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15018	Customer 15018	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15019	Customer 15019	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15021	Customer 15021	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15022	Customer 15022	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15023	Customer 15023	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15024	Customer 15024	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15025	Customer 15025	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15026	Customer 15026	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15027	Customer 15027	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15028	Customer 15028	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15030	Customer 15030	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15031	Customer 15031	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15032	Customer 15032	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15033	Customer 15033	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15034	Customer 15034	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15035	Customer 15035	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15036	Customer 15036	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15038	Customer 15038	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15039	Customer 15039	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15041	Customer 15041	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15042	Customer 15042	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15043	Customer 15043	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15044	Customer 15044	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15045	Customer 15045	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15046	Customer 15046	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15047	Customer 15047	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15048	Customer 15048	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15049	Customer 15049	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15050	Customer 15050	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15051	Customer 15051	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15052	Customer 15052	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15053	Customer 15053	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15054	Customer 15054	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15057	Customer 15057	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15058	Customer 15058	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15059	Customer 15059	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15060	Customer 15060	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15061	Customer 15061	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15062	Customer 15062	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15063	Customer 15063	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15065	Customer 15065	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15066	Customer 15066	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15067	Customer 15067	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15068	Customer 15068	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15069	Customer 15069	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15070	Customer 15070	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15071	Customer 15071	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15073	Customer 15073	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15074	Customer 15074	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15075	Customer 15075	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15076	Customer 15076	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15078	Customer 15078	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15079	Customer 15079	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15081	Customer 15081	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15083	Customer 15083	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15087	Customer 15087	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15088	Customer 15088	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15089	Customer 15089	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15090	Customer 15090	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15091	Customer 15091	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15092	Customer 15092	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15093	Customer 15093	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15095	Customer 15095	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15096	Customer 15096	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15097	Customer 15097	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15098	Customer 15098	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15099	Customer 15099	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15100	Customer 15100	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15101	Customer 15101	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15103	Customer 15103	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15104	Customer 15104	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15105	Customer 15105	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15106	Customer 15106	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15107	Customer 15107	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15108	Customer 15108	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15109	Customer 15109	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15110	Customer 15110	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15111	Customer 15111	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15113	Customer 15113	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15114	Customer 15114	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15115	Customer 15115	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15116	Customer 15116	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15117	Customer 15117	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15118	Customer 15118	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15119	Customer 15119	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15120	Customer 15120	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15121	Customer 15121	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15122	Customer 15122	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15123	Customer 15123	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15124	Customer 15124	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15125	Customer 15125	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15127	Customer 15127	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15128	Customer 15128	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15129	Customer 15129	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15130	Customer 15130	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15132	Customer 15132	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15133	Customer 15133	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15134	Customer 15134	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15135	Customer 15135	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15136	Customer 15136	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15139	Customer 15139	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15140	Customer 15140	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15142	Customer 15142	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15143	Customer 15143	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15144	Customer 15144	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15145	Customer 15145	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15146	Customer 15146	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15147	Customer 15147	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15148	Customer 15148	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15149	Customer 15149	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15150	Customer 15150	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15152	Customer 15152	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15153	Customer 15153	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15154	Customer 15154	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15156	Customer 15156	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15157	Customer 15157	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15158	Customer 15158	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15159	Customer 15159	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15160	Customer 15160	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15163	Customer 15163	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15164	Customer 15164	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15165	Customer 15165	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15167	Customer 15167	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15168	Customer 15168	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15171	Customer 15171	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15172	Customer 15172	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15174	Customer 15174	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15175	Customer 15175	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15178	Customer 15178	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15179	Customer 15179	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15180	Customer 15180	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15181	Customer 15181	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15182	Customer 15182	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15184	Customer 15184	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15185	Customer 15185	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15186	Customer 15186	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15187	Customer 15187	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15189	Customer 15189	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15192	Customer 15192	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15193	Customer 15193	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15194	Customer 15194	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15195	Customer 15195	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15197	Customer 15197	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15198	Customer 15198	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15199	Customer 15199	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15201	Customer 15201	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15203	Customer 15203	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15204	Customer 15204	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15205	Customer 15205	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15206	Customer 15206	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15208	Customer 15208	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15210	Customer 15210	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15211	Customer 15211	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15212	Customer 15212	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15213	Customer 15213	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15214	Customer 15214	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15215	Customer 15215	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15216	Customer 15216	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15218	Customer 15218	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15219	Customer 15219	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15220	Customer 15220	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15221	Customer 15221	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15222	Customer 15222	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15223	Customer 15223	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15224	Customer 15224	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15225	Customer 15225	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15226	Customer 15226	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15227	Customer 15227	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15228	Customer 15228	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15230	Customer 15230	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15232	Customer 15232	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15234	Customer 15234	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15235	Customer 15235	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15236	Customer 15236	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15237	Customer 15237	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15238	Customer 15238	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15239	Customer 15239	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15240	Customer 15240	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15241	Customer 15241	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15243	Customer 15243	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15244	Customer 15244	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15245	Customer 15245	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15246	Customer 15246	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15247	Customer 15247	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15249	Customer 15249	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15251	Customer 15251	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15252	Customer 15252	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15253	Customer 15253	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15254	Customer 15254	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15255	Customer 15255	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15256	Customer 15256	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15257	Customer 15257	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15258	Customer 15258	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15260	Customer 15260	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15261	Customer 15261	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15262	Customer 15262	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15263	Customer 15263	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15264	Customer 15264	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15265	Customer 15265	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15266	Customer 15266	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15267	Customer 15267	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15269	Customer 15269	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15270	Customer 15270	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15271	Customer 15271	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15272	Customer 15272	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15274	Customer 15274	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15275	Customer 15275	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15276	Customer 15276	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15277	Customer 15277	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15279	Customer 15279	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15280	Customer 15280	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15281	Customer 15281	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15286	Customer 15286	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15287	Customer 15287	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15288	Customer 15288	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15289	Customer 15289	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15290	Customer 15290	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15291	Customer 15291	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15292	Customer 15292	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15296	Customer 15296	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15297	Customer 15297	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15298	Customer 15298	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15299	Customer 15299	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15300	Customer 15300	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15301	Customer 15301	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15303	Customer 15303	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15304	Customer 15304	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15306	Customer 15306	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15307	Customer 15307	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15308	Customer 15308	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15311	Customer 15311	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15312	Customer 15312	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15313	Customer 15313	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15314	Customer 15314	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15315	Customer 15315	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15316	Customer 15316	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15318	Customer 15318	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15319	Customer 15319	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15320	Customer 15320	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15321	Customer 15321	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15322	Customer 15322	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15325	Customer 15325	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15326	Customer 15326	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15327	Customer 15327	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15329	Customer 15329	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15330	Customer 15330	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15332	Customer 15332	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15333	Customer 15333	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15334	Customer 15334	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15335	Customer 15335	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15339	Customer 15339	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15341	Customer 15341	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15342	Customer 15342	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15343	Customer 15343	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15344	Customer 15344	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15345	Customer 15345	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15346	Customer 15346	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15347	Customer 15347	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15348	Customer 15348	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15349	Customer 15349	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15350	Customer 15350	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15351	Customer 15351	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15353	Customer 15353	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15355	Customer 15355	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15356	Customer 15356	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15358	Customer 15358	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15360	Customer 15360	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15361	Customer 15361	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15363	Customer 15363	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15364	Customer 15364	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15365	Customer 15365	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15366	Customer 15366	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15367	Customer 15367	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15368	Customer 15368	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15370	Customer 15370	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15372	Customer 15372	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15373	Customer 15373	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15374	Customer 15374	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15376	Customer 15376	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15379	Customer 15379	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15380	Customer 15380	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15381	Customer 15381	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15382	Customer 15382	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15384	Customer 15384	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15385	Customer 15385	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15386	Customer 15386	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15388	Customer 15388	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15389	Customer 15389	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15392	Customer 15392	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15393	Customer 15393	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15394	Customer 15394	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15395	Customer 15395	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15396	Customer 15396	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15397	Customer 15397	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15398	Customer 15398	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15399	Customer 15399	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15400	Customer 15400	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15402	Customer 15402	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15405	Customer 15405	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15406	Customer 15406	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15407	Customer 15407	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15408	Customer 15408	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15410	Customer 15410	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15411	Customer 15411	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15412	Customer 15412	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15414	Customer 15414	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15415	Customer 15415	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15416	Customer 15416	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15417	Customer 15417	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15419	Customer 15419	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15421	Customer 15421	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15422	Customer 15422	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15423	Customer 15423	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15424	Customer 15424	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15426	Customer 15426	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15427	Customer 15427	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15428	Customer 15428	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15429	Customer 15429	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15432	Customer 15432	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15433	Customer 15433	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15434	Customer 15434	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15435	Customer 15435	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15436	Customer 15436	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15437	Customer 15437	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15438	Customer 15438	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15440	Customer 15440	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15442	Customer 15442	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15443	Customer 15443	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15444	Customer 15444	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15445	Customer 15445	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15447	Customer 15447	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15448	Customer 15448	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15449	Customer 15449	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15450	Customer 15450	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15452	Customer 15452	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15453	Customer 15453	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15454	Customer 15454	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15456	Customer 15456	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15457	Customer 15457	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15458	Customer 15458	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15460	Customer 15460	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15462	Customer 15462	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15463	Customer 15463	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15464	Customer 15464	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15465	Customer 15465	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15466	Customer 15466	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15467	Customer 15467	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15468	Customer 15468	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15469	Customer 15469	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15471	Customer 15471	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15472	Customer 15472	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15473	Customer 15473	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15475	Customer 15475	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15478	Customer 15478	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15480	Customer 15480	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15482	Customer 15482	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15483	Customer 15483	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15484	Customer 15484	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15485	Customer 15485	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15488	Customer 15488	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15489	Customer 15489	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15491	Customer 15491	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15492	Customer 15492	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15493	Customer 15493	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15494	Customer 15494	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15497	Customer 15497	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15498	Customer 15498	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15500	Customer 15500	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15502	Customer 15502	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15503	Customer 15503	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15504	Customer 15504	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15505	Customer 15505	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15506	Customer 15506	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15507	Customer 15507	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15508	Customer 15508	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15510	Customer 15510	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15511	Customer 15511	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15512	Customer 15512	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15513	Customer 15513	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15514	Customer 15514	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15516	Customer 15516	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15517	Customer 15517	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15518	Customer 15518	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15520	Customer 15520	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15521	Customer 15521	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15522	Customer 15522	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15523	Customer 15523	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15524	Customer 15524	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15525	Customer 15525	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15526	Customer 15526	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15527	Customer 15527	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15528	Customer 15528	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15529	Customer 15529	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15530	Customer 15530	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15531	Customer 15531	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15532	Customer 15532	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15533	Customer 15533	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15535	Customer 15535	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15537	Customer 15537	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15539	Customer 15539	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15540	Customer 15540	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15541	Customer 15541	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15543	Customer 15543	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15544	Customer 15544	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15545	Customer 15545	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15547	Customer 15547	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15549	Customer 15549	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15550	Customer 15550	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15551	Customer 15551	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15552	Customer 15552	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15553	Customer 15553	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15554	Customer 15554	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15555	Customer 15555	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15556	Customer 15556	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15557	Customer 15557	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15561	Customer 15561	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15562	Customer 15562	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15563	Customer 15563	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15565	Customer 15565	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15567	Customer 15567	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15568	Customer 15568	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15569	Customer 15569	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15570	Customer 15570	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15571	Customer 15571	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15572	Customer 15572	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15573	Customer 15573	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15574	Customer 15574	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15576	Customer 15576	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15577	Customer 15577	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15578	Customer 15578	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15579	Customer 15579	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15581	Customer 15581	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15582	Customer 15582	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15584	Customer 15584	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15585	Customer 15585	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15587	Customer 15587	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15589	Customer 15589	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15592	Customer 15592	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15593	Customer 15593	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15594	Customer 15594	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15596	Customer 15596	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15597	Customer 15597	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15598	Customer 15598	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15599	Customer 15599	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15601	Customer 15601	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15602	Customer 15602	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15603	Customer 15603	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15604	Customer 15604	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15605	Customer 15605	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15606	Customer 15606	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15607	Customer 15607	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15608	Customer 15608	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15609	Customer 15609	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15610	Customer 15610	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15611	Customer 15611	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15612	Customer 15612	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15615	Customer 15615	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15618	Customer 15618	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15619	Customer 15619	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15620	Customer 15620	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15621	Customer 15621	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15622	Customer 15622	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15623	Customer 15623	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15624	Customer 15624	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15625	Customer 15625	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15626	Customer 15626	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15628	Customer 15628	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15630	Customer 15630	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15632	Customer 15632	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15634	Customer 15634	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15636	Customer 15636	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15637	Customer 15637	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15639	Customer 15639	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15640	Customer 15640	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15641	Customer 15641	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15643	Customer 15643	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15644	Customer 15644	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15645	Customer 15645	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15646	Customer 15646	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15648	Customer 15648	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15649	Customer 15649	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15651	Customer 15651	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15652	Customer 15652	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15653	Customer 15653	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15654	Customer 15654	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15655	Customer 15655	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15656	Customer 15656	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15657	Customer 15657	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15658	Customer 15658	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15659	Customer 15659	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15660	Customer 15660	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15661	Customer 15661	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15663	Customer 15663	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15664	Customer 15664	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15665	Customer 15665	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15667	Customer 15667	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15668	Customer 15668	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15669	Customer 15669	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15670	Customer 15670	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15671	Customer 15671	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15673	Customer 15673	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15674	Customer 15674	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15675	Customer 15675	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15676	Customer 15676	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15677	Customer 15677	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15678	Customer 15678	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15679	Customer 15679	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15680	Customer 15680	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15681	Customer 15681	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15683	Customer 15683	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15687	Customer 15687	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15689	Customer 15689	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15690	Customer 15690	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15691	Customer 15691	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15692	Customer 15692	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15694	Customer 15694	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15695	Customer 15695	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15696	Customer 15696	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15699	Customer 15699	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15700	Customer 15700	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15701	Customer 15701	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15703	Customer 15703	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15704	Customer 15704	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15705	Customer 15705	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15706	Customer 15706	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15707	Customer 15707	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15708	Customer 15708	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15709	Customer 15709	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15712	Customer 15712	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15713	Customer 15713	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15714	Customer 15714	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15716	Customer 15716	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15717	Customer 15717	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15719	Customer 15719	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15720	Customer 15720	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15721	Customer 15721	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15722	Customer 15722	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15723	Customer 15723	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15724	Customer 15724	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15725	Customer 15725	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15727	Customer 15727	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15729	Customer 15729	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15730	Customer 15730	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15732	Customer 15732	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15733	Customer 15733	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15734	Customer 15734	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15737	Customer 15737	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15738	Customer 15738	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15739	Customer 15739	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15740	Customer 15740	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15743	Customer 15743	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15744	Customer 15744	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15745	Customer 15745	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15746	Customer 15746	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15747	Customer 15747	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15748	Customer 15748	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15749	Customer 15749	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15750	Customer 15750	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15752	Customer 15752	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15753	Customer 15753	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15754	Customer 15754	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15755	Customer 15755	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15756	Customer 15756	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15757	Customer 15757	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15758	Customer 15758	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15759	Customer 15759	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15762	Customer 15762	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15763	Customer 15763	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15764	Customer 15764	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15766	Customer 15766	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15768	Customer 15768	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15769	Customer 15769	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15773	Customer 15773	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15774	Customer 15774	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15775	Customer 15775	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15776	Customer 15776	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15777	Customer 15777	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15780	Customer 15780	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15781	Customer 15781	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15782	Customer 15782	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15783	Customer 15783	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15785	Customer 15785	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15786	Customer 15786	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15787	Customer 15787	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15789	Customer 15789	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15790	Customer 15790	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15791	Customer 15791	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15793	Customer 15793	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15795	Customer 15795	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15796	Customer 15796	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15797	Customer 15797	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15799	Customer 15799	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15800	Customer 15800	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15801	Customer 15801	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15802	Customer 15802	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15803	Customer 15803	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15804	Customer 15804	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15805	Customer 15805	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15806	Customer 15806	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15807	Customer 15807	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15808	Customer 15808	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15809	Customer 15809	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15810	Customer 15810	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15811	Customer 15811	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15812	Customer 15812	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15813	Customer 15813	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15814	Customer 15814	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15815	Customer 15815	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15819	Customer 15819	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15820	Customer 15820	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15821	Customer 15821	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15822	Customer 15822	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15823	Customer 15823	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15825	Customer 15825	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15826	Customer 15826	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15827	Customer 15827	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15829	Customer 15829	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15830	Customer 15830	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15831	Customer 15831	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15832	Customer 15832	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15834	Customer 15834	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15835	Customer 15835	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15836	Customer 15836	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15837	Customer 15837	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15838	Customer 15838	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15839	Customer 15839	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15840	Customer 15840	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15841	Customer 15841	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15843	Customer 15843	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15844	Customer 15844	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15845	Customer 15845	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15847	Customer 15847	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15850	Customer 15850	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15852	Customer 15852	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15853	Customer 15853	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15854	Customer 15854	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15855	Customer 15855	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15856	Customer 15856	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15857	Customer 15857	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15858	Customer 15858	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15860	Customer 15860	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15861	Customer 15861	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15862	Customer 15862	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15863	Customer 15863	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15864	Customer 15864	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15865	Customer 15865	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15866	Customer 15866	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15867	Customer 15867	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15869	Customer 15869	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15870	Customer 15870	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15872	Customer 15872	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15874	Customer 15874	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15877	Customer 15877	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15880	Customer 15880	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15881	Customer 15881	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15882	Customer 15882	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15883	Customer 15883	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15885	Customer 15885	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15886	Customer 15886	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15888	Customer 15888	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15889	Customer 15889	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15891	Customer 15891	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15894	Customer 15894	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15895	Customer 15895	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15897	Customer 15897	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15898	Customer 15898	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15899	Customer 15899	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15900	Customer 15900	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15901	Customer 15901	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15903	Customer 15903	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15904	Customer 15904	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15906	Customer 15906	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15907	Customer 15907	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15909	Customer 15909	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15910	Customer 15910	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15912	Customer 15912	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15916	Customer 15916	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15917	Customer 15917	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15918	Customer 15918	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15919	Customer 15919	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15920	Customer 15920	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15921	Customer 15921	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15922	Customer 15922	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15923	Customer 15923	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15925	Customer 15925	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15930	Customer 15930	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15932	Customer 15932	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15933	Customer 15933	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15935	Customer 15935	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15937	Customer 15937	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15938	Customer 15938	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15939	Customer 15939	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15940	Customer 15940	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15942	Customer 15942	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15944	Customer 15944	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15945	Customer 15945	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15947	Customer 15947	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15948	Customer 15948	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15949	Customer 15949	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15950	Customer 15950	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15951	Customer 15951	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15952	Customer 15952	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15953	Customer 15953	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15955	Customer 15955	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15957	Customer 15957	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15958	Customer 15958	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15963	Customer 15963	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15965	Customer 15965	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15967	Customer 15967	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15969	Customer 15969	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15970	Customer 15970	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15971	Customer 15971	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15973	Customer 15973	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15974	Customer 15974	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15975	Customer 15975	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15976	Customer 15976	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15977	Customer 15977	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15978	Customer 15978	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15980	Customer 15980	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15981	Customer 15981	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15983	Customer 15983	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15984	Customer 15984	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15985	Customer 15985	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15986	Customer 15986	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15987	Customer 15987	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15988	Customer 15988	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15990	Customer 15990	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15992	Customer 15992	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15993	Customer 15993	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15994	Customer 15994	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15996	Customer 15996	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
15998	Customer 15998	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16000	Customer 16000	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16003	Customer 16003	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16005	Customer 16005	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16006	Customer 16006	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16007	Customer 16007	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16008	Customer 16008	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16009	Customer 16009	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16010	Customer 16010	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16011	Customer 16011	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16012	Customer 16012	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16013	Customer 16013	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16014	Customer 16014	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16015	Customer 16015	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16016	Customer 16016	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16017	Customer 16017	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16018	Customer 16018	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16019	Customer 16019	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16020	Customer 16020	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16022	Customer 16022	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16023	Customer 16023	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16024	Customer 16024	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16025	Customer 16025	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16026	Customer 16026	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16027	Customer 16027	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16029	Customer 16029	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16030	Customer 16030	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16031	Customer 16031	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16033	Customer 16033	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16034	Customer 16034	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16036	Customer 16036	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16037	Customer 16037	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16038	Customer 16038	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16040	Customer 16040	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16041	Customer 16041	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16042	Customer 16042	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16043	Customer 16043	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16045	Customer 16045	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16048	Customer 16048	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16049	Customer 16049	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16050	Customer 16050	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16052	Customer 16052	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16053	Customer 16053	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16054	Customer 16054	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16055	Customer 16055	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16056	Customer 16056	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16057	Customer 16057	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16059	Customer 16059	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16062	Customer 16062	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16063	Customer 16063	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16065	Customer 16065	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16066	Customer 16066	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16070	Customer 16070	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16071	Customer 16071	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16072	Customer 16072	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16073	Customer 16073	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16076	Customer 16076	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16078	Customer 16078	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16079	Customer 16079	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16080	Customer 16080	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16081	Customer 16081	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16083	Customer 16083	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16084	Customer 16084	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16085	Customer 16085	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16086	Customer 16086	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16091	Customer 16091	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16092	Customer 16092	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16093	Customer 16093	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16094	Customer 16094	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16096	Customer 16096	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16097	Customer 16097	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16098	Customer 16098	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16099	Customer 16099	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16101	Customer 16101	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16102	Customer 16102	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16103	Customer 16103	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16104	Customer 16104	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16105	Customer 16105	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16106	Customer 16106	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16107	Customer 16107	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16108	Customer 16108	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16109	Customer 16109	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16110	Customer 16110	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16112	Customer 16112	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16113	Customer 16113	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16114	Customer 16114	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16115	Customer 16115	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16116	Customer 16116	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16117	Customer 16117	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16119	Customer 16119	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16120	Customer 16120	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16121	Customer 16121	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16122	Customer 16122	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16123	Customer 16123	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16124	Customer 16124	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16125	Customer 16125	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16126	Customer 16126	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16127	Customer 16127	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16128	Customer 16128	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16131	Customer 16131	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16133	Customer 16133	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16134	Customer 16134	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16135	Customer 16135	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16136	Customer 16136	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16139	Customer 16139	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16140	Customer 16140	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16141	Customer 16141	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16142	Customer 16142	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16143	Customer 16143	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16144	Customer 16144	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16145	Customer 16145	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16146	Customer 16146	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16147	Customer 16147	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16148	Customer 16148	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16149	Customer 16149	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16150	Customer 16150	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16152	Customer 16152	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16153	Customer 16153	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16156	Customer 16156	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16157	Customer 16157	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16159	Customer 16159	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16160	Customer 16160	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16161	Customer 16161	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16162	Customer 16162	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16163	Customer 16163	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16164	Customer 16164	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16168	Customer 16168	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16169	Customer 16169	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16170	Customer 16170	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16171	Customer 16171	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16172	Customer 16172	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16173	Customer 16173	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16174	Customer 16174	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16175	Customer 16175	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16177	Customer 16177	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16178	Customer 16178	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16179	Customer 16179	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16180	Customer 16180	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16181	Customer 16181	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16182	Customer 16182	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16183	Customer 16183	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16184	Customer 16184	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16185	Customer 16185	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16186	Customer 16186	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16187	Customer 16187	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16188	Customer 16188	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16189	Customer 16189	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16190	Customer 16190	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16191	Customer 16191	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16193	Customer 16193	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16198	Customer 16198	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16200	Customer 16200	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16201	Customer 16201	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16202	Customer 16202	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16203	Customer 16203	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16204	Customer 16204	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16205	Customer 16205	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16206	Customer 16206	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16207	Customer 16207	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16208	Customer 16208	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16209	Customer 16209	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16210	Customer 16210	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16211	Customer 16211	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16212	Customer 16212	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16213	Customer 16213	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16214	Customer 16214	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16215	Customer 16215	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16216	Customer 16216	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16217	Customer 16217	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16218	Customer 16218	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16221	Customer 16221	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16222	Customer 16222	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16224	Customer 16224	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16225	Customer 16225	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16226	Customer 16226	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16227	Customer 16227	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16229	Customer 16229	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16230	Customer 16230	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16232	Customer 16232	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16233	Customer 16233	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16235	Customer 16235	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16236	Customer 16236	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16239	Customer 16239	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16240	Customer 16240	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16241	Customer 16241	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16242	Customer 16242	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16243	Customer 16243	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16244	Customer 16244	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16245	Customer 16245	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16247	Customer 16247	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16248	Customer 16248	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16249	Customer 16249	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16250	Customer 16250	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16253	Customer 16253	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16255	Customer 16255	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16256	Customer 16256	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16257	Customer 16257	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16258	Customer 16258	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16260	Customer 16260	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16261	Customer 16261	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16265	Customer 16265	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16266	Customer 16266	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16268	Customer 16268	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16270	Customer 16270	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16271	Customer 16271	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16272	Customer 16272	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16274	Customer 16274	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16275	Customer 16275	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16276	Customer 16276	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16278	Customer 16278	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16279	Customer 16279	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16281	Customer 16281	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16282	Customer 16282	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16283	Customer 16283	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16284	Customer 16284	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16287	Customer 16287	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16292	Customer 16292	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16293	Customer 16293	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16295	Customer 16295	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16297	Customer 16297	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16298	Customer 16298	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16302	Customer 16302	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16303	Customer 16303	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16305	Customer 16305	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16306	Customer 16306	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16308	Customer 16308	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16309	Customer 16309	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16311	Customer 16311	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16313	Customer 16313	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16315	Customer 16315	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16316	Customer 16316	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16317	Customer 16317	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16318	Customer 16318	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16319	Customer 16319	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16320	Customer 16320	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16321	Customer 16321	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16322	Customer 16322	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16323	Customer 16323	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16324	Customer 16324	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16325	Customer 16325	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16326	Customer 16326	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16327	Customer 16327	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16330	Customer 16330	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16332	Customer 16332	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16333	Customer 16333	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16337	Customer 16337	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16338	Customer 16338	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16339	Customer 16339	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16340	Customer 16340	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16341	Customer 16341	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16342	Customer 16342	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16343	Customer 16343	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16344	Customer 16344	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16345	Customer 16345	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16347	Customer 16347	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16348	Customer 16348	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16349	Customer 16349	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16350	Customer 16350	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16351	Customer 16351	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16352	Customer 16352	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16353	Customer 16353	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16354	Customer 16354	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16356	Customer 16356	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16357	Customer 16357	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16358	Customer 16358	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16359	Customer 16359	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16360	Customer 16360	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16361	Customer 16361	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16362	Customer 16362	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16363	Customer 16363	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16364	Customer 16364	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16365	Customer 16365	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16366	Customer 16366	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16367	Customer 16367	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16368	Customer 16368	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16369	Customer 16369	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16370	Customer 16370	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16372	Customer 16372	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16374	Customer 16374	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16376	Customer 16376	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16377	Customer 16377	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16378	Customer 16378	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16379	Customer 16379	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16380	Customer 16380	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16383	Customer 16383	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16384	Customer 16384	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16385	Customer 16385	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16386	Customer 16386	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16387	Customer 16387	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16389	Customer 16389	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16392	Customer 16392	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16393	Customer 16393	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16394	Customer 16394	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16395	Customer 16395	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16398	Customer 16398	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16399	Customer 16399	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16400	Customer 16400	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16401	Customer 16401	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16402	Customer 16402	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16403	Customer 16403	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16404	Customer 16404	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16405	Customer 16405	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16406	Customer 16406	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16407	Customer 16407	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16409	Customer 16409	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16411	Customer 16411	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16412	Customer 16412	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16413	Customer 16413	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16414	Customer 16414	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16415	Customer 16415	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16416	Customer 16416	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16418	Customer 16418	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16419	Customer 16419	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16422	Customer 16422	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16423	Customer 16423	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16424	Customer 16424	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16425	Customer 16425	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16426	Customer 16426	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16427	Customer 16427	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16429	Customer 16429	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16430	Customer 16430	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16431	Customer 16431	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16432	Customer 16432	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16433	Customer 16433	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16434	Customer 16434	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16438	Customer 16438	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16440	Customer 16440	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16441	Customer 16441	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16442	Customer 16442	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16444	Customer 16444	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16445	Customer 16445	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16446	Customer 16446	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16447	Customer 16447	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16448	Customer 16448	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16449	Customer 16449	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16450	Customer 16450	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16451	Customer 16451	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16454	Customer 16454	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16455	Customer 16455	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16456	Customer 16456	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16457	Customer 16457	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16458	Customer 16458	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16460	Customer 16460	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16461	Customer 16461	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16462	Customer 16462	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16463	Customer 16463	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16464	Customer 16464	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16466	Customer 16466	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16468	Customer 16468	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16469	Customer 16469	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16470	Customer 16470	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16471	Customer 16471	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16473	Customer 16473	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16474	Customer 16474	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16475	Customer 16475	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16477	Customer 16477	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16478	Customer 16478	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16479	Customer 16479	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16480	Customer 16480	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16482	Customer 16482	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16483	Customer 16483	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16484	Customer 16484	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16485	Customer 16485	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16488	Customer 16488	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16491	Customer 16491	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16493	Customer 16493	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16494	Customer 16494	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16495	Customer 16495	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16496	Customer 16496	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16497	Customer 16497	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16498	Customer 16498	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16499	Customer 16499	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16500	Customer 16500	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16503	Customer 16503	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16504	Customer 16504	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16505	Customer 16505	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16506	Customer 16506	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16509	Customer 16509	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16510	Customer 16510	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16511	Customer 16511	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16513	Customer 16513	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16515	Customer 16515	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16516	Customer 16516	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16517	Customer 16517	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16518	Customer 16518	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16519	Customer 16519	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16520	Customer 16520	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16523	Customer 16523	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16525	Customer 16525	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16526	Customer 16526	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16527	Customer 16527	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16528	Customer 16528	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16529	Customer 16529	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16531	Customer 16531	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16532	Customer 16532	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16533	Customer 16533	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16535	Customer 16535	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16536	Customer 16536	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16539	Customer 16539	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16542	Customer 16542	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16545	Customer 16545	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16546	Customer 16546	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16549	Customer 16549	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16550	Customer 16550	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16551	Customer 16551	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16552	Customer 16552	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16553	Customer 16553	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16554	Customer 16554	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16555	Customer 16555	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16556	Customer 16556	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16557	Customer 16557	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16558	Customer 16558	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16560	Customer 16560	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16561	Customer 16561	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16563	Customer 16563	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16565	Customer 16565	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16566	Customer 16566	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16567	Customer 16567	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16569	Customer 16569	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16570	Customer 16570	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16571	Customer 16571	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16572	Customer 16572	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16573	Customer 16573	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16574	Customer 16574	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16581	Customer 16581	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16582	Customer 16582	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16583	Customer 16583	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16584	Customer 16584	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16586	Customer 16586	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16587	Customer 16587	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16589	Customer 16589	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16591	Customer 16591	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16592	Customer 16592	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16593	Customer 16593	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16594	Customer 16594	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16595	Customer 16595	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16596	Customer 16596	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16597	Customer 16597	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16598	Customer 16598	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16600	Customer 16600	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16601	Customer 16601	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16602	Customer 16602	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16603	Customer 16603	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16607	Customer 16607	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16609	Customer 16609	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16610	Customer 16610	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16611	Customer 16611	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16612	Customer 16612	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16613	Customer 16613	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16614	Customer 16614	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16616	Customer 16616	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16617	Customer 16617	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16618	Customer 16618	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16619	Customer 16619	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16620	Customer 16620	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16621	Customer 16621	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16623	Customer 16623	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16624	Customer 16624	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16625	Customer 16625	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16626	Customer 16626	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16627	Customer 16627	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16628	Customer 16628	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16629	Customer 16629	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16633	Customer 16633	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16634	Customer 16634	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16637	Customer 16637	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16638	Customer 16638	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16639	Customer 16639	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16641	Customer 16641	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16642	Customer 16642	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16643	Customer 16643	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16644	Customer 16644	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16647	Customer 16647	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16648	Customer 16648	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16650	Customer 16650	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16652	Customer 16652	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16653	Customer 16653	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16654	Customer 16654	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16655	Customer 16655	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16656	Customer 16656	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16657	Customer 16657	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16658	Customer 16658	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16659	Customer 16659	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16660	Customer 16660	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16665	Customer 16665	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16666	Customer 16666	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16667	Customer 16667	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16668	Customer 16668	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16669	Customer 16669	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16670	Customer 16670	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16671	Customer 16671	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16672	Customer 16672	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16674	Customer 16674	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16676	Customer 16676	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16678	Customer 16678	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16679	Customer 16679	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16680	Customer 16680	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16681	Customer 16681	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16682	Customer 16682	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16684	Customer 16684	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16685	Customer 16685	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16686	Customer 16686	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16688	Customer 16688	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16689	Customer 16689	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16690	Customer 16690	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16692	Customer 16692	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16693	Customer 16693	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16696	Customer 16696	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16697	Customer 16697	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16698	Customer 16698	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16700	Customer 16700	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16701	Customer 16701	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16705	Customer 16705	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16706	Customer 16706	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16708	Customer 16708	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16709	Customer 16709	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16710	Customer 16710	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16711	Customer 16711	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16712	Customer 16712	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16713	Customer 16713	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16714	Customer 16714	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16715	Customer 16715	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16716	Customer 16716	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16717	Customer 16717	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16718	Customer 16718	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16719	Customer 16719	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16720	Customer 16720	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16721	Customer 16721	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16722	Customer 16722	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16723	Customer 16723	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16725	Customer 16725	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16726	Customer 16726	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16727	Customer 16727	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16728	Customer 16728	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16729	Customer 16729	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16730	Customer 16730	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16732	Customer 16732	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16734	Customer 16734	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16735	Customer 16735	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16737	Customer 16737	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16738	Customer 16738	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16739	Customer 16739	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16742	Customer 16742	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16743	Customer 16743	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16744	Customer 16744	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16745	Customer 16745	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16746	Customer 16746	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16747	Customer 16747	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16748	Customer 16748	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16750	Customer 16750	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16751	Customer 16751	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16752	Customer 16752	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16753	Customer 16753	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16754	Customer 16754	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16755	Customer 16755	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16756	Customer 16756	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16757	Customer 16757	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16758	Customer 16758	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16759	Customer 16759	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16761	Customer 16761	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16762	Customer 16762	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16763	Customer 16763	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16764	Customer 16764	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16765	Customer 16765	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16766	Customer 16766	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16767	Customer 16767	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16768	Customer 16768	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16769	Customer 16769	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16770	Customer 16770	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16771	Customer 16771	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16773	Customer 16773	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16774	Customer 16774	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16775	Customer 16775	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16776	Customer 16776	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16777	Customer 16777	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16778	Customer 16778	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16779	Customer 16779	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16780	Customer 16780	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16781	Customer 16781	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16782	Customer 16782	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16784	Customer 16784	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16788	Customer 16788	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16789	Customer 16789	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16790	Customer 16790	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16791	Customer 16791	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16792	Customer 16792	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16793	Customer 16793	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16794	Customer 16794	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16795	Customer 16795	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16796	Customer 16796	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16800	Customer 16800	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16801	Customer 16801	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16803	Customer 16803	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16804	Customer 16804	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16805	Customer 16805	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16806	Customer 16806	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16807	Customer 16807	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16808	Customer 16808	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16809	Customer 16809	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16810	Customer 16810	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16811	Customer 16811	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16812	Customer 16812	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16813	Customer 16813	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16814	Customer 16814	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16816	Customer 16816	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16817	Customer 16817	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16818	Customer 16818	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16820	Customer 16820	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16823	Customer 16823	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16824	Customer 16824	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16825	Customer 16825	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16826	Customer 16826	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16828	Customer 16828	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16829	Customer 16829	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16830	Customer 16830	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16832	Customer 16832	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16833	Customer 16833	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16834	Customer 16834	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16835	Customer 16835	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16836	Customer 16836	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16837	Customer 16837	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16838	Customer 16838	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16839	Customer 16839	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16841	Customer 16841	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16842	Customer 16842	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16843	Customer 16843	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16846	Customer 16846	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16847	Customer 16847	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16848	Customer 16848	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16849	Customer 16849	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16850	Customer 16850	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16851	Customer 16851	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16852	Customer 16852	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16855	Customer 16855	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16856	Customer 16856	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16858	Customer 16858	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16859	Customer 16859	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16861	Customer 16861	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16863	Customer 16863	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16866	Customer 16866	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16869	Customer 16869	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16871	Customer 16871	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16872	Customer 16872	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16873	Customer 16873	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16875	Customer 16875	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16877	Customer 16877	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16878	Customer 16878	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16880	Customer 16880	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16881	Customer 16881	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16882	Customer 16882	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16883	Customer 16883	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16884	Customer 16884	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16885	Customer 16885	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16887	Customer 16887	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16889	Customer 16889	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16891	Customer 16891	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16892	Customer 16892	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16893	Customer 16893	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16895	Customer 16895	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16897	Customer 16897	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16898	Customer 16898	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16899	Customer 16899	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16900	Customer 16900	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16902	Customer 16902	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16903	Customer 16903	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16904	Customer 16904	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16905	Customer 16905	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16906	Customer 16906	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16907	Customer 16907	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16909	Customer 16909	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16910	Customer 16910	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16912	Customer 16912	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16913	Customer 16913	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16914	Customer 16914	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16915	Customer 16915	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16916	Customer 16916	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16917	Customer 16917	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16918	Customer 16918	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16919	Customer 16919	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16921	Customer 16921	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16923	Customer 16923	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16924	Customer 16924	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16926	Customer 16926	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16927	Customer 16927	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16928	Customer 16928	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16929	Customer 16929	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16930	Customer 16930	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16931	Customer 16931	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16932	Customer 16932	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16933	Customer 16933	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16934	Customer 16934	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16936	Customer 16936	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16938	Customer 16938	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16940	Customer 16940	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16942	Customer 16942	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16943	Customer 16943	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16945	Customer 16945	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16947	Customer 16947	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16948	Customer 16948	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16949	Customer 16949	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16950	Customer 16950	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16951	Customer 16951	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16952	Customer 16952	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16953	Customer 16953	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16954	Customer 16954	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16955	Customer 16955	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16956	Customer 16956	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16957	Customer 16957	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16959	Customer 16959	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16960	Customer 16960	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16961	Customer 16961	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16963	Customer 16963	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16965	Customer 16965	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16966	Customer 16966	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16967	Customer 16967	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16968	Customer 16968	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16969	Customer 16969	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16971	Customer 16971	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16976	Customer 16976	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16978	Customer 16978	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16979	Customer 16979	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16980	Customer 16980	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16982	Customer 16982	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16983	Customer 16983	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16984	Customer 16984	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16985	Customer 16985	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16986	Customer 16986	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16987	Customer 16987	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16988	Customer 16988	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16989	Customer 16989	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16990	Customer 16990	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16992	Customer 16992	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16996	Customer 16996	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16997	Customer 16997	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16998	Customer 16998	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
16999	Customer 16999	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17001	Customer 17001	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17002	Customer 17002	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17004	Customer 17004	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17006	Customer 17006	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17007	Customer 17007	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17010	Customer 17010	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17011	Customer 17011	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17014	Customer 17014	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17015	Customer 17015	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17017	Customer 17017	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17018	Customer 17018	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17019	Customer 17019	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17022	Customer 17022	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17024	Customer 17024	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17025	Customer 17025	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17026	Customer 17026	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17027	Customer 17027	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17029	Customer 17029	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17030	Customer 17030	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17031	Customer 17031	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17033	Customer 17033	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17034	Customer 17034	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17035	Customer 17035	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17037	Customer 17037	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17038	Customer 17038	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17040	Customer 17040	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17041	Customer 17041	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17042	Customer 17042	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17043	Customer 17043	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17044	Customer 17044	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17045	Customer 17045	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17046	Customer 17046	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17047	Customer 17047	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17048	Customer 17048	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17049	Customer 17049	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17050	Customer 17050	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17051	Customer 17051	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17052	Customer 17052	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17053	Customer 17053	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17054	Customer 17054	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17058	Customer 17058	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17059	Customer 17059	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17060	Customer 17060	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17061	Customer 17061	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17062	Customer 17062	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17063	Customer 17063	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17064	Customer 17064	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17068	Customer 17068	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17069	Customer 17069	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17070	Customer 17070	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17071	Customer 17071	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17073	Customer 17073	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17075	Customer 17075	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17076	Customer 17076	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17078	Customer 17078	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17079	Customer 17079	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17080	Customer 17080	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17081	Customer 17081	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17082	Customer 17082	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17083	Customer 17083	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17084	Customer 17084	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17085	Customer 17085	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17086	Customer 17086	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17088	Customer 17088	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17090	Customer 17090	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17091	Customer 17091	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17092	Customer 17092	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17094	Customer 17094	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17095	Customer 17095	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17096	Customer 17096	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17097	Customer 17097	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17100	Customer 17100	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17101	Customer 17101	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17102	Customer 17102	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17105	Customer 17105	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17107	Customer 17107	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17109	Customer 17109	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17110	Customer 17110	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17111	Customer 17111	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17114	Customer 17114	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17115	Customer 17115	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17117	Customer 17117	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17118	Customer 17118	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17119	Customer 17119	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17120	Customer 17120	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17122	Customer 17122	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17123	Customer 17123	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17124	Customer 17124	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17125	Customer 17125	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17126	Customer 17126	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17128	Customer 17128	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17131	Customer 17131	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17133	Customer 17133	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17134	Customer 17134	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17135	Customer 17135	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17138	Customer 17138	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17139	Customer 17139	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17140	Customer 17140	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17142	Customer 17142	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17144	Customer 17144	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17146	Customer 17146	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17147	Customer 17147	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17148	Customer 17148	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17152	Customer 17152	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17153	Customer 17153	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17154	Customer 17154	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17155	Customer 17155	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17157	Customer 17157	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17158	Customer 17158	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17159	Customer 17159	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17160	Customer 17160	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17162	Customer 17162	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17163	Customer 17163	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17164	Customer 17164	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17165	Customer 17165	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17166	Customer 17166	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17169	Customer 17169	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17171	Customer 17171	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17172	Customer 17172	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17173	Customer 17173	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17174	Customer 17174	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17175	Customer 17175	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17176	Customer 17176	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17179	Customer 17179	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17180	Customer 17180	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17181	Customer 17181	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17183	Customer 17183	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17186	Customer 17186	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17187	Customer 17187	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17188	Customer 17188	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17189	Customer 17189	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17190	Customer 17190	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17191	Customer 17191	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17193	Customer 17193	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17194	Customer 17194	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17197	Customer 17197	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17198	Customer 17198	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17201	Customer 17201	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17203	Customer 17203	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17204	Customer 17204	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17205	Customer 17205	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17206	Customer 17206	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17211	Customer 17211	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17212	Customer 17212	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17213	Customer 17213	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17214	Customer 17214	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17217	Customer 17217	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17218	Customer 17218	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17219	Customer 17219	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17220	Customer 17220	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17221	Customer 17221	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17222	Customer 17222	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17223	Customer 17223	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17226	Customer 17226	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17227	Customer 17227	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17228	Customer 17228	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17229	Customer 17229	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17230	Customer 17230	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17231	Customer 17231	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17232	Customer 17232	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17233	Customer 17233	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17234	Customer 17234	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17235	Customer 17235	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17236	Customer 17236	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17237	Customer 17237	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17238	Customer 17238	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17239	Customer 17239	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17242	Customer 17242	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17243	Customer 17243	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17244	Customer 17244	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17245	Customer 17245	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17247	Customer 17247	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17248	Customer 17248	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17250	Customer 17250	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17251	Customer 17251	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17252	Customer 17252	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17253	Customer 17253	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17254	Customer 17254	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17255	Customer 17255	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17256	Customer 17256	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17259	Customer 17259	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17262	Customer 17262	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17263	Customer 17263	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17265	Customer 17265	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17266	Customer 17266	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17267	Customer 17267	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17268	Customer 17268	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17272	Customer 17272	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17274	Customer 17274	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17277	Customer 17277	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17278	Customer 17278	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17279	Customer 17279	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17282	Customer 17282	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17284	Customer 17284	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17286	Customer 17286	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17287	Customer 17287	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17288	Customer 17288	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17289	Customer 17289	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17290	Customer 17290	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17291	Customer 17291	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17293	Customer 17293	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17295	Customer 17295	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17297	Customer 17297	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17298	Customer 17298	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17299	Customer 17299	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17301	Customer 17301	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17302	Customer 17302	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17303	Customer 17303	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17306	Customer 17306	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17309	Customer 17309	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17311	Customer 17311	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17312	Customer 17312	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17313	Customer 17313	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17314	Customer 17314	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17315	Customer 17315	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17317	Customer 17317	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17320	Customer 17320	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17321	Customer 17321	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17323	Customer 17323	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17324	Customer 17324	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17325	Customer 17325	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17329	Customer 17329	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17330	Customer 17330	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17331	Customer 17331	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17333	Customer 17333	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17334	Customer 17334	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17337	Customer 17337	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17338	Customer 17338	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17339	Customer 17339	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17340	Customer 17340	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17341	Customer 17341	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17343	Customer 17343	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17344	Customer 17344	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17345	Customer 17345	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17346	Customer 17346	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17347	Customer 17347	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17348	Customer 17348	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17349	Customer 17349	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17350	Customer 17350	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17351	Customer 17351	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17353	Customer 17353	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17354	Customer 17354	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17356	Customer 17356	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17357	Customer 17357	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17358	Customer 17358	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17359	Customer 17359	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17360	Customer 17360	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17361	Customer 17361	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17362	Customer 17362	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17364	Customer 17364	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17365	Customer 17365	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17367	Customer 17367	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17368	Customer 17368	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17370	Customer 17370	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17371	Customer 17371	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17372	Customer 17372	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17373	Customer 17373	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17374	Customer 17374	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17375	Customer 17375	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17376	Customer 17376	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17377	Customer 17377	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17379	Customer 17379	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17381	Customer 17381	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17382	Customer 17382	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17383	Customer 17383	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17384	Customer 17384	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17385	Customer 17385	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17386	Customer 17386	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17387	Customer 17387	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17388	Customer 17388	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17389	Customer 17389	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17391	Customer 17391	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17392	Customer 17392	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17394	Customer 17394	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17396	Customer 17396	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17397	Customer 17397	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17398	Customer 17398	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17400	Customer 17400	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17402	Customer 17402	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17403	Customer 17403	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17404	Customer 17404	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17405	Customer 17405	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17406	Customer 17406	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17408	Customer 17408	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17409	Customer 17409	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17410	Customer 17410	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17411	Customer 17411	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17412	Customer 17412	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17414	Customer 17414	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17415	Customer 17415	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17416	Customer 17416	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17418	Customer 17418	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17419	Customer 17419	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17420	Customer 17420	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17422	Customer 17422	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17423	Customer 17423	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17425	Customer 17425	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17426	Customer 17426	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17427	Customer 17427	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17428	Customer 17428	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17429	Customer 17429	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17430	Customer 17430	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17431	Customer 17431	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17432	Customer 17432	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17433	Customer 17433	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17434	Customer 17434	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17436	Customer 17436	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17438	Customer 17438	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17440	Customer 17440	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17442	Customer 17442	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17443	Customer 17443	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17444	Customer 17444	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17446	Customer 17446	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17447	Customer 17447	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17449	Customer 17449	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17450	Customer 17450	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17451	Customer 17451	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17453	Customer 17453	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17454	Customer 17454	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17455	Customer 17455	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17456	Customer 17456	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17457	Customer 17457	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17458	Customer 17458	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17459	Customer 17459	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17460	Customer 17460	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17461	Customer 17461	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17462	Customer 17462	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17463	Customer 17463	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17464	Customer 17464	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17466	Customer 17466	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17468	Customer 17468	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17469	Customer 17469	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17470	Customer 17470	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17472	Customer 17472	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17475	Customer 17475	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17480	Customer 17480	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17481	Customer 17481	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17483	Customer 17483	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17486	Customer 17486	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17489	Customer 17489	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17490	Customer 17490	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17491	Customer 17491	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17492	Customer 17492	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17495	Customer 17495	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17496	Customer 17496	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17498	Customer 17498	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17499	Customer 17499	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17500	Customer 17500	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17501	Customer 17501	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17502	Customer 17502	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17503	Customer 17503	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17504	Customer 17504	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17505	Customer 17505	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17506	Customer 17506	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17507	Customer 17507	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17508	Customer 17508	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17509	Customer 17509	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17510	Customer 17510	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17511	Customer 17511	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17512	Customer 17512	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17513	Customer 17513	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17514	Customer 17514	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17515	Customer 17515	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17516	Customer 17516	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17517	Customer 17517	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17519	Customer 17519	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17520	Customer 17520	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17521	Customer 17521	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17522	Customer 17522	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17523	Customer 17523	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17524	Customer 17524	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17525	Customer 17525	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17526	Customer 17526	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17527	Customer 17527	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17528	Customer 17528	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17530	Customer 17530	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17531	Customer 17531	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17534	Customer 17534	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17535	Customer 17535	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17536	Customer 17536	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17537	Customer 17537	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17538	Customer 17538	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17540	Customer 17540	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17542	Customer 17542	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17545	Customer 17545	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17548	Customer 17548	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17549	Customer 17549	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17550	Customer 17550	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17551	Customer 17551	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17552	Customer 17552	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17553	Customer 17553	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17554	Customer 17554	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17555	Customer 17555	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17556	Customer 17556	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17557	Customer 17557	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17560	Customer 17560	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17561	Customer 17561	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17562	Customer 17562	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17564	Customer 17564	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17566	Customer 17566	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17567	Customer 17567	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17569	Customer 17569	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17571	Customer 17571	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17572	Customer 17572	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17573	Customer 17573	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17574	Customer 17574	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17576	Customer 17576	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17578	Customer 17578	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17579	Customer 17579	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17580	Customer 17580	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17581	Customer 17581	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17582	Customer 17582	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17584	Customer 17584	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17585	Customer 17585	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17588	Customer 17588	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17589	Customer 17589	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17590	Customer 17590	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17591	Customer 17591	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17593	Customer 17593	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17594	Customer 17594	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17595	Customer 17595	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17596	Customer 17596	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17597	Customer 17597	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17600	Customer 17600	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17601	Customer 17601	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17602	Customer 17602	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17603	Customer 17603	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17604	Customer 17604	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17608	Customer 17608	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17609	Customer 17609	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17611	Customer 17611	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17612	Customer 17612	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17613	Customer 17613	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17614	Customer 17614	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17615	Customer 17615	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17616	Customer 17616	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17618	Customer 17618	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17619	Customer 17619	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17620	Customer 17620	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17621	Customer 17621	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17623	Customer 17623	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17624	Customer 17624	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17625	Customer 17625	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17628	Customer 17628	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17629	Customer 17629	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17630	Customer 17630	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17631	Customer 17631	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17633	Customer 17633	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17634	Customer 17634	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17636	Customer 17636	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17637	Customer 17637	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17639	Customer 17639	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17640	Customer 17640	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17642	Customer 17642	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17643	Customer 17643	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17644	Customer 17644	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17646	Customer 17646	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17647	Customer 17647	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17648	Customer 17648	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17649	Customer 17649	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17650	Customer 17650	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17651	Customer 17651	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17652	Customer 17652	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17653	Customer 17653	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17654	Customer 17654	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17655	Customer 17655	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17656	Customer 17656	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17658	Customer 17658	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17659	Customer 17659	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17660	Customer 17660	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17663	Customer 17663	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17664	Customer 17664	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17666	Customer 17666	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17667	Customer 17667	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17668	Customer 17668	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17669	Customer 17669	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17670	Customer 17670	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17671	Customer 17671	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17672	Customer 17672	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17673	Customer 17673	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17674	Customer 17674	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17675	Customer 17675	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17676	Customer 17676	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17677	Customer 17677	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17678	Customer 17678	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17679	Customer 17679	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17680	Customer 17680	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17682	Customer 17682	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17684	Customer 17684	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17685	Customer 17685	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17686	Customer 17686	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17690	Customer 17690	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17691	Customer 17691	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17692	Customer 17692	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17693	Customer 17693	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17694	Customer 17694	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17695	Customer 17695	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17696	Customer 17696	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17697	Customer 17697	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17698	Customer 17698	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17700	Customer 17700	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17701	Customer 17701	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17702	Customer 17702	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17703	Customer 17703	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17704	Customer 17704	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17705	Customer 17705	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17706	Customer 17706	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17707	Customer 17707	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17708	Customer 17708	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17709	Customer 17709	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17711	Customer 17711	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17712	Customer 17712	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17714	Customer 17714	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17715	Customer 17715	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17716	Customer 17716	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17718	Customer 17718	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17719	Customer 17719	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17720	Customer 17720	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17722	Customer 17722	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17723	Customer 17723	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17724	Customer 17724	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17725	Customer 17725	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17727	Customer 17727	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17728	Customer 17728	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17730	Customer 17730	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17731	Customer 17731	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17732	Customer 17732	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17733	Customer 17733	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17734	Customer 17734	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17735	Customer 17735	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17736	Customer 17736	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17737	Customer 17737	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17738	Customer 17738	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17739	Customer 17739	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17742	Customer 17742	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17744	Customer 17744	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17746	Customer 17746	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17747	Customer 17747	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17749	Customer 17749	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17750	Customer 17750	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17752	Customer 17752	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17754	Customer 17754	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17757	Customer 17757	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17758	Customer 17758	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17759	Customer 17759	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17760	Customer 17760	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17761	Customer 17761	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17763	Customer 17763	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17764	Customer 17764	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17765	Customer 17765	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17767	Customer 17767	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17768	Customer 17768	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17769	Customer 17769	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17770	Customer 17770	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17771	Customer 17771	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17772	Customer 17772	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17774	Customer 17774	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17775	Customer 17775	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17777	Customer 17777	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17779	Customer 17779	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17781	Customer 17781	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17783	Customer 17783	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17785	Customer 17785	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17786	Customer 17786	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17787	Customer 17787	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17788	Customer 17788	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17789	Customer 17789	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17790	Customer 17790	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17791	Customer 17791	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17793	Customer 17793	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17795	Customer 17795	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17796	Customer 17796	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17797	Customer 17797	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17799	Customer 17799	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17800	Customer 17800	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17802	Customer 17802	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17805	Customer 17805	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17806	Customer 17806	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17809	Customer 17809	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17811	Customer 17811	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17812	Customer 17812	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17813	Customer 17813	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17816	Customer 17816	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17817	Customer 17817	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17819	Customer 17819	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17824	Customer 17824	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17827	Customer 17827	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17828	Customer 17828	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17829	Customer 17829	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17830	Customer 17830	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17831	Customer 17831	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17832	Customer 17832	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17835	Customer 17835	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17836	Customer 17836	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17837	Customer 17837	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17838	Customer 17838	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17839	Customer 17839	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17841	Customer 17841	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17843	Customer 17843	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17844	Customer 17844	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17846	Customer 17846	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17848	Customer 17848	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17849	Customer 17849	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17850	Customer 17850	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17852	Customer 17852	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17854	Customer 17854	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17855	Customer 17855	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17856	Customer 17856	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17857	Customer 17857	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17858	Customer 17858	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17859	Customer 17859	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17860	Customer 17860	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17861	Customer 17861	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17862	Customer 17862	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17863	Customer 17863	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17864	Customer 17864	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17865	Customer 17865	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17866	Customer 17866	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17867	Customer 17867	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17869	Customer 17869	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17870	Customer 17870	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17871	Customer 17871	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17873	Customer 17873	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17874	Customer 17874	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17877	Customer 17877	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17878	Customer 17878	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17879	Customer 17879	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17880	Customer 17880	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17881	Customer 17881	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17883	Customer 17883	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17884	Customer 17884	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17885	Customer 17885	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17886	Customer 17886	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17887	Customer 17887	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17888	Customer 17888	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17889	Customer 17889	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17890	Customer 17890	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17891	Customer 17891	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17892	Customer 17892	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17893	Customer 17893	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17894	Customer 17894	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17895	Customer 17895	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17896	Customer 17896	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17897	Customer 17897	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17898	Customer 17898	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17899	Customer 17899	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17900	Customer 17900	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17901	Customer 17901	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17904	Customer 17904	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17905	Customer 17905	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17906	Customer 17906	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17908	Customer 17908	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17911	Customer 17911	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17912	Customer 17912	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17913	Customer 17913	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17914	Customer 17914	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17917	Customer 17917	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17919	Customer 17919	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17920	Customer 17920	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17921	Customer 17921	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17923	Customer 17923	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17924	Customer 17924	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17925	Customer 17925	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17926	Customer 17926	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17928	Customer 17928	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17929	Customer 17929	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17930	Customer 17930	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17931	Customer 17931	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17932	Customer 17932	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17934	Customer 17934	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17935	Customer 17935	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17936	Customer 17936	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17937	Customer 17937	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17939	Customer 17939	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17940	Customer 17940	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17941	Customer 17941	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17942	Customer 17942	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17946	Customer 17946	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17947	Customer 17947	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17948	Customer 17948	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17949	Customer 17949	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17950	Customer 17950	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17951	Customer 17951	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17954	Customer 17954	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17955	Customer 17955	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17956	Customer 17956	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17957	Customer 17957	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17958	Customer 17958	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17960	Customer 17960	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17961	Customer 17961	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17962	Customer 17962	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17964	Customer 17964	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17965	Customer 17965	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17966	Customer 17966	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17967	Customer 17967	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17968	Customer 17968	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17969	Customer 17969	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17970	Customer 17970	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17972	Customer 17972	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17973	Customer 17973	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17974	Customer 17974	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17975	Customer 17975	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17976	Customer 17976	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17977	Customer 17977	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17978	Customer 17978	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17979	Customer 17979	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17980	Customer 17980	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17984	Customer 17984	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17985	Customer 17985	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17986	Customer 17986	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17987	Customer 17987	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17988	Customer 17988	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17990	Customer 17990	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17991	Customer 17991	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17994	Customer 17994	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17995	Customer 17995	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17997	Customer 17997	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
17999	Customer 17999	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18001	Customer 18001	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18004	Customer 18004	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18005	Customer 18005	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18006	Customer 18006	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18008	Customer 18008	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18009	Customer 18009	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18010	Customer 18010	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18011	Customer 18011	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18013	Customer 18013	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18014	Customer 18014	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18015	Customer 18015	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18016	Customer 18016	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18017	Customer 18017	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18018	Customer 18018	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18019	Customer 18019	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18022	Customer 18022	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18024	Customer 18024	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18027	Customer 18027	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18030	Customer 18030	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18032	Customer 18032	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18033	Customer 18033	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18034	Customer 18034	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18035	Customer 18035	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18036	Customer 18036	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18037	Customer 18037	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18040	Customer 18040	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18041	Customer 18041	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18042	Customer 18042	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18043	Customer 18043	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18044	Customer 18044	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18045	Customer 18045	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18048	Customer 18048	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18050	Customer 18050	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18053	Customer 18053	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18055	Customer 18055	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18056	Customer 18056	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18058	Customer 18058	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18059	Customer 18059	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18061	Customer 18061	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18062	Customer 18062	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18064	Customer 18064	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18065	Customer 18065	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18066	Customer 18066	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18067	Customer 18067	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18068	Customer 18068	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18069	Customer 18069	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18071	Customer 18071	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18072	Customer 18072	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18073	Customer 18073	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18074	Customer 18074	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18075	Customer 18075	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18077	Customer 18077	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18078	Customer 18078	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18079	Customer 18079	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18080	Customer 18080	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18081	Customer 18081	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18082	Customer 18082	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18084	Customer 18084	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18085	Customer 18085	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18086	Customer 18086	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18087	Customer 18087	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18088	Customer 18088	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18092	Customer 18092	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18093	Customer 18093	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18094	Customer 18094	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18095	Customer 18095	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18096	Customer 18096	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18097	Customer 18097	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18099	Customer 18099	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18101	Customer 18101	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18102	Customer 18102	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18104	Customer 18104	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18105	Customer 18105	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18106	Customer 18106	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18108	Customer 18108	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18109	Customer 18109	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18110	Customer 18110	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18112	Customer 18112	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18113	Customer 18113	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18114	Customer 18114	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18116	Customer 18116	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18117	Customer 18117	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18118	Customer 18118	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18119	Customer 18119	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18120	Customer 18120	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18121	Customer 18121	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18122	Customer 18122	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18123	Customer 18123	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18125	Customer 18125	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18126	Customer 18126	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18127	Customer 18127	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18129	Customer 18129	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18130	Customer 18130	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18133	Customer 18133	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18135	Customer 18135	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18136	Customer 18136	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18138	Customer 18138	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18139	Customer 18139	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18142	Customer 18142	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18143	Customer 18143	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18144	Customer 18144	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18145	Customer 18145	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18146	Customer 18146	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18147	Customer 18147	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18149	Customer 18149	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18150	Customer 18150	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18151	Customer 18151	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18154	Customer 18154	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18155	Customer 18155	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18156	Customer 18156	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18158	Customer 18158	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18159	Customer 18159	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18160	Customer 18160	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18161	Customer 18161	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18164	Customer 18164	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18165	Customer 18165	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18167	Customer 18167	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18168	Customer 18168	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18169	Customer 18169	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18170	Customer 18170	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18171	Customer 18171	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18172	Customer 18172	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18173	Customer 18173	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18174	Customer 18174	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18176	Customer 18176	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18177	Customer 18177	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18178	Customer 18178	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18179	Customer 18179	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18180	Customer 18180	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18181	Customer 18181	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18183	Customer 18183	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18184	Customer 18184	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18185	Customer 18185	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18188	Customer 18188	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18189	Customer 18189	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18190	Customer 18190	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18191	Customer 18191	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18192	Customer 18192	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18193	Customer 18193	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18194	Customer 18194	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18196	Customer 18196	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18198	Customer 18198	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18200	Customer 18200	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18202	Customer 18202	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18203	Customer 18203	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18204	Customer 18204	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18205	Customer 18205	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18209	Customer 18209	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18210	Customer 18210	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18211	Customer 18211	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18212	Customer 18212	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18213	Customer 18213	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18215	Customer 18215	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18216	Customer 18216	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18217	Customer 18217	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18218	Customer 18218	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18219	Customer 18219	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18220	Customer 18220	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18221	Customer 18221	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18222	Customer 18222	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18223	Customer 18223	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18224	Customer 18224	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18225	Customer 18225	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18226	Customer 18226	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18227	Customer 18227	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18228	Customer 18228	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18229	Customer 18229	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18230	Customer 18230	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18231	Customer 18231	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18232	Customer 18232	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18233	Customer 18233	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18235	Customer 18235	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18236	Customer 18236	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18237	Customer 18237	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18239	Customer 18239	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18240	Customer 18240	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18241	Customer 18241	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18242	Customer 18242	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18245	Customer 18245	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18246	Customer 18246	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18248	Customer 18248	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18249	Customer 18249	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18250	Customer 18250	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18251	Customer 18251	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18252	Customer 18252	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18255	Customer 18255	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18257	Customer 18257	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18259	Customer 18259	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18260	Customer 18260	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18261	Customer 18261	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18262	Customer 18262	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18263	Customer 18263	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18265	Customer 18265	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18268	Customer 18268	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18269	Customer 18269	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18270	Customer 18270	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18272	Customer 18272	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18273	Customer 18273	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18274	Customer 18274	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18276	Customer 18276	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18277	Customer 18277	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18278	Customer 18278	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18280	Customer 18280	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18281	Customer 18281	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18282	Customer 18282	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18283	Customer 18283	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
18287	Customer 18287	\N	\N	\N	\N	\N	\N	0	0.00	0.00	Active	2026-08-02 11:27:30.821064	2026-08-02 11:27:30.821064
\.


--
-- TOC entry 5294 (class 0 OID 16760)
-- Dependencies: 256
-- Data for Name: forecast_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forecast_models (model_id, model_name, model_version, model_type, training_data_days, training_start_date, training_end_date, mape, mae, rmse, accuracy_percentage, status, is_active, trained_at, created_at, updated_at) FROM stdin;
1	Prophet	1.0	Revenue Forecast	90	2026-05-04	2026-08-02	8.8	1250.5	1850.75	91.2	Active	t	2026-08-02 11:00:26.781723	2026-08-02 11:00:26.781723	2026-08-02 11:00:26.781723
\.


--
-- TOC entry 5296 (class 0 OID 16798)
-- Dependencies: 258
-- Data for Name: forecast_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forecast_results (forecast_id, model_id, category_id, forecast_date, forecast_type, frequency, historical_value, forecasted_value, lower_bound, upper_bound, confidence_percentage, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5274 (class 0 OID 16551)
-- Dependencies: 236
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (inventory_id, product_id, available_stock, reserved_stock, damaged_stock, reorder_level, warehouse_location, last_restock_date, supplier_name, updated_at) FROM stdin;
1	1	120	5	1	25	Warehouse A	2026-07-28	Coca Cola India	2026-07-31 22:39:37.624107
2	2	95	3	0	25	Warehouse A	2026-07-28	PepsiCo	2026-07-31 22:39:37.624107
3	3	150	8	2	30	Warehouse B	2026-07-29	PepsiCo	2026-07-31 22:39:37.624107
4	4	85	5	1	20	Warehouse C	2026-07-29	Amul	2026-07-31 22:39:37.624107
5	5	70	2	0	20	Warehouse C	2026-07-30	Britannia	2026-07-31 22:39:37.624107
6	6	45	2	0	10	Warehouse A	2026-07-30	Nestle	2026-07-31 22:39:37.624107
7	7	40	1	0	10	Warehouse C	2026-07-31	Amul	2026-07-31 22:39:37.624107
8	8	55	2	1	15	Warehouse C	2026-07-31	Amul	2026-07-31 22:39:37.624107
9	9	90	3	0	20	Warehouse D	2026-07-31	Local Farm	2026-07-31 22:39:37.624107
10	10	60	2	0	15	Warehouse B	2026-07-31	Kellogg	2026-07-31 22:39:37.624107
\.


--
-- TOC entry 5284 (class 0 OID 16669)
-- Dependencies: 246
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (notification_id, admin_id, title, message, notification_type, priority, is_read, action_url, created_at) FROM stdin;
1	1	Low Stock Alert	15 products are running low in inventory.	Inventory	High	f	/inventory	2026-07-31 22:54:35.363163
2	1	Sales Forecast Updated	Forecast model generated a new prediction.	Forecast	Medium	f	/sales-forecast	2026-07-31 22:54:35.363163
3	1	New Customer Segment	Premium customer segment increased by 12%.	Customer	Medium	f	/customer-segmentation	2026-07-31 22:54:35.363163
4	1	AI Insight Generated	Coffee + Sugar bundle has highest lift this week.	AI	High	f	/ai-assistant	2026-07-31 22:54:35.363163
5	1	Report Ready	Weekly executive report is ready for download.	Report	Low	f	/reports	2026-07-31 22:54:35.363163
\.


--
-- TOC entry 5278 (class 0 OID 16589)
-- Dependencies: 240
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_item_id, order_id, product_id, quantity, unit_price, discount, total_price, created_at) FROM stdin;
16	21	1	2	40.00	0.00	80.00	2026-07-31 22:46:52.591568
17	21	4	3	62.00	6.00	186.00	2026-07-31 22:46:52.591568
18	22	3	5	20.00	5.00	100.00	2026-07-31 22:46:52.591568
19	22	6	2	310.00	20.00	620.00	2026-07-31 22:46:52.591568
20	23	5	4	35.00	0.00	140.00	2026-07-31 22:46:52.591568
21	23	2	3	38.00	4.00	114.00	2026-07-31 22:46:52.591568
22	24	7	2	240.00	10.00	480.00	2026-07-31 22:46:52.591568
23	24	8	1	130.00	0.00	130.00	2026-07-31 22:46:52.591568
24	25	9	3	78.00	5.00	234.00	2026-07-31 22:46:52.591568
25	25	10	2	190.00	10.00	380.00	2026-07-31 22:46:52.591568
26	26	4	5	62.00	10.00	310.00	2026-07-31 22:46:52.591568
27	27	3	4	20.00	0.00	80.00	2026-07-31 22:46:52.591568
28	28	1	6	40.00	15.00	240.00	2026-07-31 22:46:52.591568
29	29	6	1	310.00	0.00	310.00	2026-07-31 22:46:52.591568
30	30	2	8	38.00	10.00	304.00	2026-07-31 22:46:52.591568
\.


--
-- TOC entry 5276 (class 0 OID 16570)
-- Dependencies: 238
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, order_date, order_status, payment_method, payment_status, subtotal, tax, discount, total_amount, created_at, updated_at) FROM stdin;
21	1	2026-07-20 00:00:00	Completed	UPI	Paid	820.00	40.00	20.00	266.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
22	2	2026-07-21 00:00:00	Completed	Card	Paid	1250.00	60.00	50.00	720.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
23	3	2026-07-22 00:00:00	Completed	Cash	Paid	540.00	25.00	10.00	254.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
24	4	2026-07-23 00:00:00	Completed	UPI	Paid	980.00	48.00	30.00	610.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
25	5	2026-07-24 00:00:00	Completed	Card	Paid	1540.00	75.00	40.00	614.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
26	6	2026-07-25 00:00:00	Completed	Cash	Paid	430.00	20.00	5.00	310.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
27	7	2026-07-26 00:00:00	Completed	UPI	Paid	890.00	45.00	20.00	80.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
28	8	2026-07-27 00:00:00	Completed	Card	Paid	1120.00	55.00	30.00	240.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
29	9	2026-07-28 00:00:00	Completed	Cash	Paid	610.00	30.00	10.00	310.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
30	10	2026-07-29 00:00:00	Completed	UPI	Paid	1330.00	65.00	40.00	304.00	2026-07-31 22:42:35.523601	2026-07-31 22:42:35.523601
\.


--
-- TOC entry 5272 (class 0 OID 16528)
-- Dependencies: 234
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, sku, category_id, unit_price, cost_price, stock_quantity, reorder_level, supplier_name, status, created_at, updated_at) FROM stdin;
1	Coca Cola 500ml	BEV001	1	40.00	28.00	120	25	Coca Cola India	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
2	Pepsi 500ml	BEV002	1	38.00	27.00	95	25	PepsiCo	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
3	Lay's Classic 100g	SNK001	2	20.00	12.00	150	30	PepsiCo	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
4	Amul Milk 1L	DAR001	3	62.00	48.00	85	20	Amul	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
5	Britannia Bread	BAK001	4	35.00	24.00	70	20	Britannia	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
6	Nescafe Classic 100g	BEV003	1	310.00	250.00	45	10	Nestle	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
7	Butter 500g	DAR002	3	240.00	185.00	40	10	Amul	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
8	Cheese Cube	DAR003	3	130.00	95.00	55	15	Amul	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
9	Eggs Pack	OTH001	10	78.00	60.00	90	20	Local Farm	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
10	Corn Flakes	GRC001	9	190.00	145.00	60	15	Kellogg	Active	2026-07-31 22:38:20.327848	2026-07-31 22:38:20.327848
\.


--
-- TOC entry 5282 (class 0 OID 16647)
-- Dependencies: 244
-- Data for Name: report_downloads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_downloads (download_id, report_id, downloaded_by, download_format, download_time, ip_address, device) FROM stdin;
1	1	1	PDF	2026-07-31 22:53:41.518877	192.168.1.10	Windows Laptop
2	2	1	PDF	2026-07-31 22:53:41.518877	192.168.1.10	Windows Laptop
3	3	1	Excel	2026-07-31 22:53:41.518877	192.168.1.10	Windows Laptop
4	4	1	PDF	2026-07-31 22:53:41.518877	192.168.1.10	Windows Laptop
5	5	1	CSV	2026-07-31 22:53:41.518877	192.168.1.10	Windows Laptop
\.


--
-- TOC entry 5280 (class 0 OID 16628)
-- Dependencies: 242
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (report_id, report_name, report_type, description, generated_by, format, status, file_path, created_at, updated_at) FROM stdin;
1	Executive Overview Report	Executive	Weekly Executive Dashboard Report	1	PDF	Completed	/reports/executive_overview.pdf	2026-07-31 22:52:41.531586	2026-07-31 22:52:41.531586
2	Market Basket Analysis Report	Market Basket	FP-Growth and Association Rules Report	1	PDF	Completed	/reports/market_basket.pdf	2026-07-31 22:52:41.531586	2026-07-31 22:52:41.531586
3	Customer Segmentation Report	Customer	Customer Intelligence Report	1	Excel	Completed	/reports/customer_segmentation.xlsx	2026-07-31 22:52:41.531586	2026-07-31 22:52:41.531586
4	Sales Forecast Report	Forecast	Next 7 Days Sales Forecast	1	PDF	Completed	/reports/sales_forecast.pdf	2026-07-31 22:52:41.531586	2026-07-31 22:52:41.531586
5	Product Analytics Report	Product	Product Performance Report	1	CSV	Completed	/reports/product_analytics.csv	2026-07-31 22:52:41.531586	2026-07-31 22:52:41.531586
\.


--
-- TOC entry 5257 (class 0 OID 16388)
-- Dependencies: 219
-- Data for Name: sales_forecasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_forecasts (forecast_month, forecast_value, time_index, forecast_id, forecast_type, model_name, accuracy, confidence_score, status, created_at, updated_at) FROM stdin;
2010-12	570422.73	0	1	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-01	568101.31	1	2	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-02	446084.92	2	3	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-03	594081.76	3	4	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-04	468374.331	4	5	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-05	677355.15	5	6	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-06	660046.05	6	7	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-07	598962.901	7	8	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-08	644051.04	8	9	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-09	950690.202	9	10	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-10	1035642.45	10	11	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-11	1156205.61	11	12	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
2011-12	517190.44	12	13	Revenue	Prophet	\N	\N	Active	2026-07-31 22:35:20.685608	2026-07-31 22:35:20.685608
\.


--
-- TOC entry 5292 (class 0 OID 16740)
-- Dependencies: 254
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (setting_id, setting_key, setting_value, category, description, updated_by, created_at, updated_at) FROM stdin;
1	theme	Dark	General	Application Theme	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
2	currency	USD	General	Default Currency	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
3	language	English	General	Application Language	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
4	timezone	Asia/Kolkata	General	Application Timezone	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
5	session_timeout	30	Security	Session Timeout (Minutes)	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
6	openai_api_key		API	OpenAI API Key	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
7	gemini_api_key		API	Gemini API Key	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
8	default_forecast_model	Prophet	Forecast	Default Forecast Model	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
9	notification_email	Enabled	Notifications	Email Notifications	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
10	database_backup	Daily	System	Automatic Database Backup	1	2026-07-31 22:59:08.489599	2026-07-31 22:59:08.489599
\.


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 247
-- Name: activity_logs_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_logs_activity_id_seq', 5, true);


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 222
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 249
-- Name: ai_conversations_conversation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ai_conversations_conversation_id_seq', 5, true);


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 251
-- Name: ai_messages_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ai_messages_message_id_seq', 6, true);


--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 226
-- Name: association_rules_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.association_rules_rule_id_seq', 76, true);


--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 224
-- Name: business_insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_insights_id_seq', 4, true);


--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 231
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 10, true);


--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 227
-- Name: customer_segments_segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_segments_segment_id_seq', 4338, true);


--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 229
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 18287, true);


--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 255
-- Name: forecast_models_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forecast_models_model_id_seq', 1, true);


--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 257
-- Name: forecast_results_forecast_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forecast_results_forecast_id_seq', 1, false);


--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 235
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 10, true);


--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 245
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 5, true);


--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 239
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 45, true);


--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 237
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 30, true);


--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 233
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 10, true);


--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 243
-- Name: report_downloads_download_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_downloads_download_id_seq', 5, true);


--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 241
-- Name: reports_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_report_id_seq', 5, true);


--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 228
-- Name: sales_forecasts_forecast_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_forecasts_forecast_id_seq', 13, true);


--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 253
-- Name: settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_setting_id_seq', 10, true);


--
-- TOC entry 5077 (class 2606 OID 16697)
-- Name: activity_logs activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_pkey PRIMARY KEY (activity_id);


--
-- TOC entry 5047 (class 2606 OID 16427)
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- TOC entry 5049 (class 2606 OID 16425)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- TOC entry 5079 (class 2606 OID 16714)
-- Name: ai_conversations ai_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_conversations
    ADD CONSTRAINT ai_conversations_pkey PRIMARY KEY (conversation_id);


--
-- TOC entry 5081 (class 2606 OID 16733)
-- Name: ai_messages ai_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_messages
    ADD CONSTRAINT ai_messages_pkey PRIMARY KEY (message_id);


--
-- TOC entry 5043 (class 2606 OID 16454)
-- Name: association_rules association_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.association_rules
    ADD CONSTRAINT association_rules_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 5051 (class 2606 OID 16443)
-- Name: business_insights business_insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_insights
    ADD CONSTRAINT business_insights_pkey PRIMARY KEY (id);


--
-- TOC entry 5057 (class 2606 OID 16526)
-- Name: categories categories_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_name_key UNIQUE (category_name);


--
-- TOC entry 5059 (class 2606 OID 16524)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 5045 (class 2606 OID 16468)
-- Name: customer_segments customer_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_segments
    ADD CONSTRAINT customer_segments_pkey PRIMARY KEY (segment_id);


--
-- TOC entry 5053 (class 2606 OID 16510)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 5055 (class 2606 OID 16508)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 5087 (class 2606 OID 16773)
-- Name: forecast_models forecast_models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecast_models
    ADD CONSTRAINT forecast_models_pkey PRIMARY KEY (model_id);


--
-- TOC entry 5089 (class 2606 OID 16814)
-- Name: forecast_results forecast_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecast_results
    ADD CONSTRAINT forecast_results_pkey PRIMARY KEY (forecast_id);


--
-- TOC entry 5065 (class 2606 OID 16563)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 5075 (class 2606 OID 16681)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- TOC entry 5069 (class 2606 OID 16602)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 5067 (class 2606 OID 16582)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 5061 (class 2606 OID 16542)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 5063 (class 2606 OID 16544)
-- Name: products products_sku_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_sku_key UNIQUE (sku);


--
-- TOC entry 5073 (class 2606 OID 16657)
-- Name: report_downloads report_downloads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_downloads
    ADD CONSTRAINT report_downloads_pkey PRIMARY KEY (download_id);


--
-- TOC entry 5071 (class 2606 OID 16640)
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (report_id);


--
-- TOC entry 5041 (class 2606 OID 16485)
-- Name: sales_forecasts sales_forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_forecasts
    ADD CONSTRAINT sales_forecasts_pkey PRIMARY KEY (forecast_id);


--
-- TOC entry 5083 (class 2606 OID 16751)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (setting_id);


--
-- TOC entry 5085 (class 2606 OID 16753)
-- Name: settings settings_setting_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_setting_key_key UNIQUE (setting_key);


--
-- TOC entry 5090 (class 1259 OID 16827)
-- Name: idx_forecast_results_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_forecast_results_category ON public.forecast_results USING btree (category_id);


--
-- TOC entry 5091 (class 1259 OID 16825)
-- Name: idx_forecast_results_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_forecast_results_date ON public.forecast_results USING btree (forecast_date);


--
-- TOC entry 5092 (class 1259 OID 16826)
-- Name: idx_forecast_results_model; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_forecast_results_model ON public.forecast_results USING btree (model_id);


--
-- TOC entry 5093 (class 1259 OID 16828)
-- Name: idx_forecast_results_type_frequency; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_forecast_results_type_frequency ON public.forecast_results USING btree (forecast_type, frequency);


--
-- TOC entry 5104 (class 2606 OID 16698)
-- Name: activity_logs fk_activity_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT fk_activity_admin FOREIGN KEY (admin_id) REFERENCES public.admins(id) ON DELETE SET NULL;


--
-- TOC entry 5105 (class 2606 OID 16715)
-- Name: ai_conversations fk_ai_conversation_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_conversations
    ADD CONSTRAINT fk_ai_conversation_admin FOREIGN KEY (admin_id) REFERENCES public.admins(id) ON DELETE SET NULL;


--
-- TOC entry 5106 (class 2606 OID 16734)
-- Name: ai_messages fk_ai_messages_conversation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_messages
    ADD CONSTRAINT fk_ai_messages_conversation FOREIGN KEY (conversation_id) REFERENCES public.ai_conversations(conversation_id) ON DELETE CASCADE;


--
-- TOC entry 5094 (class 2606 OID 16840)
-- Name: customer_segments fk_customer_segments_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_segments
    ADD CONSTRAINT fk_customer_segments_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE CASCADE;


--
-- TOC entry 5101 (class 2606 OID 16663)
-- Name: report_downloads fk_download_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_downloads
    ADD CONSTRAINT fk_download_admin FOREIGN KEY (downloaded_by) REFERENCES public.admins(id);


--
-- TOC entry 5102 (class 2606 OID 16658)
-- Name: report_downloads fk_download_report; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_downloads
    ADD CONSTRAINT fk_download_report FOREIGN KEY (report_id) REFERENCES public.reports(report_id) ON DELETE CASCADE;


--
-- TOC entry 5108 (class 2606 OID 16820)
-- Name: forecast_results fk_forecast_results_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecast_results
    ADD CONSTRAINT fk_forecast_results_category FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE SET NULL;


--
-- TOC entry 5109 (class 2606 OID 16815)
-- Name: forecast_results fk_forecast_results_model; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecast_results
    ADD CONSTRAINT fk_forecast_results_model FOREIGN KEY (model_id) REFERENCES public.forecast_models(model_id) ON DELETE CASCADE;


--
-- TOC entry 5096 (class 2606 OID 16564)
-- Name: inventory fk_inventory_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk_inventory_product FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5103 (class 2606 OID 16682)
-- Name: notifications fk_notification_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notification_admin FOREIGN KEY (admin_id) REFERENCES public.admins(id) ON DELETE SET NULL;


--
-- TOC entry 5098 (class 2606 OID 16603)
-- Name: order_items fk_order_items_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5099 (class 2606 OID 16608)
-- Name: order_items fk_order_items_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5097 (class 2606 OID 16583)
-- Name: orders fk_orders_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5095 (class 2606 OID 16545)
-- Name: products fk_products_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5100 (class 2606 OID 16641)
-- Name: reports fk_reports_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fk_reports_admin FOREIGN KEY (generated_by) REFERENCES public.admins(id);


--
-- TOC entry 5107 (class 2606 OID 16754)
-- Name: settings fk_settings_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT fk_settings_admin FOREIGN KEY (updated_by) REFERENCES public.admins(id) ON DELETE SET NULL;


-- Completed on 2026-08-03 21:33:26

--
-- PostgreSQL database dump complete
--

\unrestrict qSPR1KY8FIocLPdnOCJf6ohghgBb4oIfxChdGLuDoWv6Lmb1uOkgAPbnbRGJE87

