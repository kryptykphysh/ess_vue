SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: machine_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE machine_statuses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    machine_id uuid NOT NULL,
    status_id uuid NOT NULL,
    first_logged_at timestamp without time zone NOT NULL,
    last_logged_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: machines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE machines (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    location character varying,
    api_key uuid DEFAULT gen_random_uuid() NOT NULL,
    config jsonb DEFAULT '"{}"'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE statuses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying,
    display_colour integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    text_colour integer DEFAULT 0 NOT NULL
);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: machine_statuses machine_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machine_statuses
    ADD CONSTRAINT machine_statuses_pkey PRIMARY KEY (id);


--
-- Name: machines machines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: index_machine_statuses_on_first_logged_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machine_statuses_on_first_logged_at ON machine_statuses USING btree (first_logged_at);


--
-- Name: index_machine_statuses_on_last_logged_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machine_statuses_on_last_logged_at ON machine_statuses USING btree (last_logged_at);


--
-- Name: index_machine_statuses_on_machine_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machine_statuses_on_machine_id ON machine_statuses USING btree (machine_id);


--
-- Name: index_machine_statuses_on_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machine_statuses_on_status_id ON machine_statuses USING btree (status_id);


--
-- Name: index_machines_on_api_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_machines_on_api_key ON machines USING btree (api_key);


--
-- Name: index_machines_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machines_on_name ON machines USING btree (name);


--
-- Name: index_statuses_on_display_colour; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_statuses_on_display_colour ON statuses USING btree (display_colour);


--
-- Name: index_statuses_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_statuses_on_name ON statuses USING btree (name);


--
-- Name: machine_statuses fk_rails_6343a6cd49; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machine_statuses
    ADD CONSTRAINT fk_rails_6343a6cd49 FOREIGN KEY (status_id) REFERENCES statuses(id);


--
-- Name: machine_statuses fk_rails_b413d97f19; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machine_statuses
    ADD CONSTRAINT fk_rails_b413d97f19 FOREIGN KEY (machine_id) REFERENCES machines(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180206195015'),
('20180207085859'),
('20180212141353'),
('20180212142415'),
('20180212180302');


