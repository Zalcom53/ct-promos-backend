--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Ubuntu 17.5-1.pgdg22.04+1)
-- Dumped by pg_dump version 17.5 (Ubuntu 17.5-1.pgdg22.04+1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    producto character varying(50) NOT NULL,
    importe money NOT NULL,
    moneda integer NOT NULL,
    fecha_inicio timestamp without time zone NOT NULL,
    fecha_fin timestamp without time zone,
    estatus integer NOT NULL,
    comentario character varying(255),
    CONSTRAINT producto_moneda_check CHECK ((moneda = ANY (ARRAY[0, 1])))
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_seq OWNER TO postgres;

--
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, producto, importe, moneda, fecha_inicio, fecha_fin, estatus, comentario) FROM stdin;
5	adaptador TPLINK	$ 392.05	0	2025-07-10 00:00:00	2025-07-31 00:00:00	1	comentario tplink
6	isopropilico silimex	$ 169.92	0	2025-07-10 00:00:00	2025-07-31 00:00:00	1	comentario isopropiico
7	Thinkpad E15	$ 255.22	1	2025-07-10 00:00:00	2025-07-31 00:00:00	2	comentario thinkpad
11	monitor dell	$ 52.28	1	2025-07-10 00:00:00	2025-07-31 00:00:00	3	comentario monitor dell
10	Pasta termica manhhantan	$ 241.00	0	2025-10-10 00:00:00	2026-03-27 00:00:00	4	cometario pasta termica
12	impresora termica ec line	$ 45.15	0	2025-07-10 00:00:00	2026-10-31 00:00:00	4	comentario ecline
2	RAM DDR4 8GB 2333 Mhz	$ 111.11	1	2025-07-10 00:00:00	2025-07-31 00:00:00	2	otro comentario
1	SSD Kingstone 480 GB	$ 993.31	0	2025-11-07 07:00:00	2026-04-21 07:00:00	4	n/a
13	mouse perfect choise	$ 98.20	0	2025-07-09 07:00:00	2025-07-10 07:00:00	2	comentario mouse
3	memoria ram 8GB adata	$ 839.28	0	2025-07-10 07:00:00	2025-07-31 07:00:00	4	sin stock
14	Memoria ram adata xpg	$ 353.22	0	2025-07-10 07:00:00	2025-07-25 07:00:00	4	descontinuado
4	teclado naceb	$ 112.00	1	2025-07-10 07:00:00	2025-07-31 07:00:00	4	dañados
8	monitr AOC	$ 894.35	0	2025-07-10 07:00:00	2025-07-31 07:00:00	2	comentatio
15	Tinta HP 664 xl negro	$ 586.24	0	2025-07-10 07:00:00	2025-07-25 07:00:00	3	comentario HP
16	Bateria CR2032	$ 30.52	0	2025-07-11 07:00:00	2025-07-31 07:00:00	4	back order
17	Memoria ram adata xpg 16 GB	$ 592.93	0	2025-07-30 07:00:00	2025-07-31 07:00:00	4	daño de fabbrica
18	impresora epsoon ñ283	$ 83.98	1	2025-07-10 07:00:00	2025-07-31 07:00:00	2	impresroa epson
9	KIT Teclado logitech MK120	$ 92.00	0	2025-07-10 07:00:00	2025-07-29 07:00:00	3	otro comentario
22	teclado techzone	$ 992.10	0	2025-07-16 00:00:00	2025-07-31 00:00:00	4	comentario techzone/sin stock
21	Smart TV samsung	$ 931.00	1	2025-07-01 00:00:00	2025-07-31 00:00:00	4	sacar de stock/dañadas
19	Bocina Link Bits	$ 398.19	0	2025-10-17 00:00:00	2026-04-30 00:00:00	1	sobre stock
20	thinphone E15	$ 93.10	0	2025-07-17 00:00:00	2025-08-29 00:00:00	4	test e15
\.


--
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 22, true);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

