-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE candidates (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    skills TEXT NOT NULL,
    profile TEXT NOT NULL,
    education TEXT NOT NULL,
    city TEXT NOT NULL,
    country TEXT NOT NULL,
    linkedin TEXT NOT NULL,
    gitHub TEXT NOT NULL,
    english_level TEXT NOT NULL,
    comments TEXT NOT NULL,
    status TEXT NOT NULL
);
CREATE TABLE status (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);
