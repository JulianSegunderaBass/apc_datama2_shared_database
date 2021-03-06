--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10

-- Started on 2019-12-05 08:59:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 16746)
-- Name: jsbass; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA jsbass;


ALTER SCHEMA jsbass OWNER TO datama2mi181;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 340 (class 1259 OID 18517)
-- Name: member; Type: TABLE; Schema: jsbass; Owner: datama2mi181
--

CREATE TABLE jsbass.member (
    id integer NOT NULL,
    mem_fname character varying(15) NOT NULL,
    mem_lname character varying(15) NOT NULL,
    mem_mi character varying(2) NOT NULL,
    mem_address character varying(45) NOT NULL,
    mem_sex character varying(15) NOT NULL
);


ALTER TABLE jsbass.member OWNER TO datama2mi181;

--
-- TOC entry 341 (class 1259 OID 18520)
-- Name: memberpayment; Type: TABLE; Schema: jsbass; Owner: datama2mi181
--

CREATE TABLE jsbass.memberpayment (
    id integer NOT NULL,
    pay_amount money NOT NULL,
    pay_date date NOT NULL,
    pay_type character varying(10) NOT NULL,
    member_id integer NOT NULL
);


ALTER TABLE jsbass.memberpayment OWNER TO datama2mi181;

--
-- TOC entry 342 (class 1259 OID 18523)
-- Name: memberpayments; Type: VIEW; Schema: jsbass; Owner: datama2mi181
--

CREATE VIEW jsbass.memberpayments AS
 SELECT member.id,
    member.mem_fname,
    member.mem_lname,
    member.mem_sex,
    memberpayment.pay_amount,
    memberpayment.pay_type,
    memberpayment.pay_date
   FROM (jsbass.member
     JOIN jsbass.memberpayment ON ((member.id = memberpayment.member_id)));


ALTER TABLE jsbass.memberpayments OWNER TO datama2mi181;

--
-- TOC entry 3441 (class 0 OID 18517)
-- Dependencies: 340
-- Data for Name: member; Type: TABLE DATA; Schema: jsbass; Owner: datama2mi181
--

INSERT INTO jsbass.member VALUES (1, 'Michael', 'Chase', 'H.', 'Moonwalk Village', 'Male');
INSERT INTO jsbass.member VALUES (2, 'Emma', 'Griffon', 'J.', 'BGC', 'Female');
INSERT INTO jsbass.member VALUES (3, 'Jodie', 'Siegvard', 'L.', 'Magallanes Village', 'Female');


--
-- TOC entry 3442 (class 0 OID 18520)
-- Dependencies: 341
-- Data for Name: memberpayment; Type: TABLE DATA; Schema: jsbass; Owner: datama2mi181
--

INSERT INTO jsbass.memberpayment VALUES (1, '$2,500.50', '2018-06-12', 'Cash', 1);
INSERT INTO jsbass.memberpayment VALUES (2, '$25,750.50', '2018-09-24', 'Credit', 2);
INSERT INTO jsbass.memberpayment VALUES (3, '$2,500.50', '2019-01-19', 'Cash', 3);


--
-- TOC entry 3294 (class 2606 OID 18530)
-- Name: member member_pkey; Type: CONSTRAINT; Schema: jsbass; Owner: datama2mi181
--

ALTER TABLE ONLY jsbass.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 18532)
-- Name: memberpayment memberpayment_pkey; Type: CONSTRAINT; Schema: jsbass; Owner: datama2mi181
--

ALTER TABLE ONLY jsbass.memberpayment
    ADD CONSTRAINT memberpayment_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 25175)
-- Name: memberpayment member_payment; Type: FK CONSTRAINT; Schema: jsbass; Owner: datama2mi181
--

ALTER TABLE ONLY jsbass.memberpayment
    ADD CONSTRAINT member_payment FOREIGN KEY (member_id) REFERENCES jsbass.member(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2019-12-05 08:59:37

--
-- PostgreSQL database dump complete
--

