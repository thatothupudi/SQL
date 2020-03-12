--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

--
-- Name: umuzischema; Type: SCHEMA; Schema: -; Owner: user
--

CREATE SCHEMA umuzischema;


ALTER SCHEMA umuzischema OWNER TO "user";

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.customers (
    customerid bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    gender character varying NOT NULL,
    address character varying(200) NOT NULL,
    phone character varying NOT NULL,
    email character varying(100) NOT NULL,
    city character varying(20),
    country character varying(50)
);


ALTER TABLE public.customers OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.customers_customerid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customerid_seq OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.employees (
    employeeid bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100),
    jobtitle character varying(20) NOT NULL
);


ALTER TABLE public.employees OWNER TO "user";

--
-- Name: employees_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.employees_employeeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employeeid_seq OWNER TO "user";

--
-- Name: employees_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.employees_employeeid_seq OWNED BY public.employees.employeeid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    productid integer,
    paymentid integer,
    employeeid integer,
    daterequired date NOT NULL,
    dateshipped date,
    status character varying(20) NOT NULL
);


ALTER TABLE public.orders OWNER TO "user";

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO "user";

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    customerid integer,
    paymentdate date NOT NULL,
    amount numeric NOT NULL
);


ALTER TABLE public.payments OWNER TO "user";

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO "user";

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    productname character varying(100),
    description character varying(300),
    buyprice numeric
);


ALTER TABLE public.products OWNER TO "user";

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO "user";

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: customers; Type: TABLE; Schema: umuzischema; Owner: user
--

CREATE TABLE umuzischema.customers (
    customerid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50),
    gender character varying(10),
    address character varying(200),
    phone integer,
    email character varying(100),
    city character varying(20),
    country character varying(50)
);


ALTER TABLE umuzischema.customers OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE; Schema: umuzischema; Owner: user
--

CREATE SEQUENCE umuzischema.customers_customerid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE umuzischema.customers_customerid_seq OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE OWNED BY; Schema: umuzischema; Owner: user
--

ALTER SEQUENCE umuzischema.customers_customerid_seq OWNED BY umuzischema.customers.customerid;


--
-- Name: customers customerid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);


--
-- Name: employees employeeid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employees ALTER COLUMN employeeid SET DEFAULT nextval('public.employees_employeeid_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: customers customerid; Type: DEFAULT; Schema: umuzischema; Owner: user
--

ALTER TABLE ONLY umuzischema.customers ALTER COLUMN customerid SET DEFAULT nextval('umuzischema.customers_customerid_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.customers (customerid, firstname, lastname, gender, address, phone, email, city, country) FROM stdin;
3	Leon	Glen	Male	81 Everton Rd, Gillits	0820832830	Leon@gmail.com	Durban	South Africa
4	Charl	Muller	Male	290A Dorset Ecke	+44856872553	Charl.muller@yahoo.com	Berlin	Germany
5	Julia	Steln	Female	2 Wernerring	+448072445058	Js234@yahoo.com	Frankfurt	Germany
1	Lerato	Mabitso	Male	284 Chaucer st	084789657	john@gmail.com	Johannesburg	South Africa
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.employees (employeeid, firstname, lastname, email, jobtitle) FROM stdin;
1	Kani	Matthew	mat@gmail.com	Manager
2	Lesly	Cronje	LesC@gmail.com	Clerk
3	Gideon	Maduku	m@gmail.com	Accountant
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.orders (id, productid, paymentid, employeeid, daterequired, dateshipped, status) FROM stdin;
2	1	1	2	2018-05-09	\N	Not shipped
3	1	2	2	2018-04-09	\N	Shipped
4	3	3	3	2018-06-09	\N	Not shipped
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.payments (id, customerid, paymentdate, amount) FROM stdin;
1	1	2018-01-09	150.75
2	5	2018-03-09	150.75
3	4	2018-03-09	700.60
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.products (id, productname, description, buyprice) FROM stdin;
1	Harley Davidson Chopper	This replica featuures working kickstand, front suspension, gear-shift lever	150.75
2	Classic Car	Turnable front wheels, steering function	550.75
3	Sports Car	Turnable front wheels, steering function	700.60
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: umuzischema; Owner: user
--

COPY umuzischema.customers (customerid, firstname, lastname, gender, address, phone, email, city, country) FROM stdin;
\.


--
-- Name: customers_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.customers_customerid_seq', 5, true);


--
-- Name: employees_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.employees_employeeid_seq', 3, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.payments_id_seq', 3, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- Name: customers_customerid_seq; Type: SEQUENCE SET; Schema: umuzischema; Owner: user
--

SELECT pg_catalog.setval('umuzischema.customers_customerid_seq', 1, false);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: umuzischema; Owner: user
--

ALTER TABLE ONLY umuzischema.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: orders orders_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);


--
-- Name: orders orders_paymentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_paymentid_fkey FOREIGN KEY (paymentid) REFERENCES public.payments(id);


--
-- Name: orders orders_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(id);


--
-- Name: payments payments_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);


--
-- PostgreSQL database dump complete
--

