--
-- PostgreSQL database dump - Parcial II
-- Database: parcial2-db
--
CREATE TABLE IF NOT EXISTS public."user" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO public."user" (name, email) VALUES ('Estudiante Parcial', 'estudiante@correounivalle.edu.co') ON CONFLICT DO NOTHING;
