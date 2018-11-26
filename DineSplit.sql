--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

-- Started on 2018-11-23 13:31:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 207 (class 1259 OID 16550)
-- Name: alimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimento (
    id_alimento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(260) NOT NULL,
    precio numeric(5,2) NOT NULL,
    tipo_comida integer NOT NULL
);


ALTER TABLE public.alimento OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16548)
-- Name: alimento_id_alimento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alimento_id_alimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alimento_id_alimento_seq OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 206
-- Name: alimento_id_alimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alimento_id_alimento_seq OWNED BY public.alimento.id_alimento;


--
-- TOC entry 197 (class 1259 OID 16482)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id_marca integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo_restaurante integer NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16563)
-- Name: orden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden (
    id_orden integer NOT NULL,
    alimento integer NOT NULL,
    reservacion integer NOT NULL
);


ALTER TABLE public.orden OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16561)
-- Name: orden_id_orden_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_id_orden_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_id_orden_seq OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 208
-- Name: orden_id_orden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_id_orden_seq OWNED BY public.orden.id_orden;


--
-- TOC entry 203 (class 1259 OID 16524)
-- Name: reservacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservacion (
    id_reservacion integer NOT NULL,
    sucursal integer NOT NULL,
    usuario_principal integer NOT NULL,
    num_personas integer NOT NULL,
    hora_llegada time without time zone NOT NULL,
    hora_salida time without time zone
);


ALTER TABLE public.reservacion OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16522)
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservacion_id_reservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservacion_id_reservacion_seq OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 202
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservacion_id_reservacion_seq OWNED BY public.reservacion.id_reservacion;


--
-- TOC entry 199 (class 1259 OID 16496)
-- Name: sucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursal (
    id_sucursal integer NOT NULL,
    marca integer NOT NULL,
    direccion character varying(100) NOT NULL,
    numero_mesas integer NOT NULL,
    url_imagen character varying(150) NOT NULL,
    hora_apertura time without time zone NOT NULL,
    hora_clausura time without time zone NOT NULL
);


ALTER TABLE public.sucursal OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16494)
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursal_id_sucursal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursal_id_sucursal_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 198
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursal_id_sucursal_seq OWNED BY public.sucursal.id_sucursal;


--
-- TOC entry 205 (class 1259 OID 16542)
-- Name: tipo_comida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_comida (
    id_tipo integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipo_comida OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16540)
-- Name: tipo_comida_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_comida_id_tipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_comida_id_tipo_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_comida_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_comida_id_tipo_seq OWNED BY public.tipo_comida.id_tipo;


--
-- TOC entry 196 (class 1259 OID 16458)
-- Name: tipo_restaurante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_restaurante (
    tipo_id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipo_restaurante OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16511)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    sucursal integer,
    nombre character varying(40) NOT NULL,
    contrasena character varying(40) NOT NULL,
    nivel_cuenta integer NOT NULL,
    email character varying(150)[] NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16509)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 200
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 2728 (class 2604 OID 16553)
-- Name: alimento id_alimento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento ALTER COLUMN id_alimento SET DEFAULT nextval('public.alimento_id_alimento_seq'::regclass);


--
-- TOC entry 2729 (class 2604 OID 16566)
-- Name: orden id_orden; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden ALTER COLUMN id_orden SET DEFAULT nextval('public.orden_id_orden_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 16527)
-- Name: reservacion id_reservacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion ALTER COLUMN id_reservacion SET DEFAULT nextval('public.reservacion_id_reservacion_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 16499)
-- Name: sucursal id_sucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal ALTER COLUMN id_sucursal SET DEFAULT nextval('public.sucursal_id_sucursal_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 16545)
-- Name: tipo_comida id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_comida ALTER COLUMN id_tipo SET DEFAULT nextval('public.tipo_comida_id_tipo_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 16514)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2749 (class 2606 OID 16555)
-- Name: alimento alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (id_alimento);


--
-- TOC entry 2735 (class 2606 OID 16488)
-- Name: marca marca_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_nombre_key UNIQUE (nombre);


--
-- TOC entry 2737 (class 2606 OID 16486)
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id_marca);


--
-- TOC entry 2751 (class 2606 OID 16568)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id_orden);


--
-- TOC entry 2745 (class 2606 OID 16529)
-- Name: reservacion reservacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_pkey PRIMARY KEY (id_reservacion);


--
-- TOC entry 2739 (class 2606 OID 16503)
-- Name: sucursal sucursal_direccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_direccion_key UNIQUE (direccion);


--
-- TOC entry 2741 (class 2606 OID 16501)
-- Name: sucursal sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id_sucursal);


--
-- TOC entry 2747 (class 2606 OID 16547)
-- Name: tipo_comida tipo_comida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_comida
    ADD CONSTRAINT tipo_comida_pkey PRIMARY KEY (id_tipo);


--
-- TOC entry 2731 (class 2606 OID 16464)
-- Name: tipo_restaurante tiporestaurante_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_restaurante
    ADD CONSTRAINT tiporestaurante_nombre_key UNIQUE (nombre);


--
-- TOC entry 2733 (class 2606 OID 16462)
-- Name: tipo_restaurante tiporestaurante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_restaurante
    ADD CONSTRAINT tiporestaurante_pkey PRIMARY KEY (tipo_id);


--
-- TOC entry 2743 (class 2606 OID 16516)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2757 (class 2606 OID 16556)
-- Name: alimento alimento_tipo_comida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento
    ADD CONSTRAINT alimento_tipo_comida_fkey FOREIGN KEY (tipo_comida) REFERENCES public.tipo_comida(id_tipo);


--
-- TOC entry 2752 (class 2606 OID 16489)
-- Name: marca marca_tipo_restaurante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_tipo_restaurante_fkey FOREIGN KEY (tipo_restaurante) REFERENCES public.tipo_restaurante(tipo_id);


--
-- TOC entry 2758 (class 2606 OID 16569)
-- Name: orden orden_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_alimento_fkey FOREIGN KEY (alimento) REFERENCES public.alimento(id_alimento);


--
-- TOC entry 2759 (class 2606 OID 16574)
-- Name: orden orden_reservacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_reservacion_fkey FOREIGN KEY (reservacion) REFERENCES public.reservacion(id_reservacion);


--
-- TOC entry 2755 (class 2606 OID 16530)
-- Name: reservacion reservacion_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_sucursal_fkey FOREIGN KEY (sucursal) REFERENCES public.sucursal(id_sucursal);


--
-- TOC entry 2756 (class 2606 OID 16535)
-- Name: reservacion reservacion_usuario_principal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_usuario_principal_fkey FOREIGN KEY (usuario_principal) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 2753 (class 2606 OID 16504)
-- Name: sucursal sucursal_marca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_marca_fkey FOREIGN KEY (marca) REFERENCES public.marca(id_marca);


--
-- TOC entry 2754 (class 2606 OID 16517)
-- Name: usuario usuario_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_sucursal_fkey FOREIGN KEY (sucursal) REFERENCES public.sucursal(id_sucursal);


-- Completed on 2018-11-23 13:31:36

--
-- PostgreSQL database dump complete
--

