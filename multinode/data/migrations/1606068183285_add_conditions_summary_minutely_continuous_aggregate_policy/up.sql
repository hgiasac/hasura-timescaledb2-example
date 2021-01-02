CREATE OR REPLACE FUNCTION search_conditions(location text) 
    RETURNS SETOF conditions 
    LANGUAGE sql STABLE
AS $$
    SELECT * FROM conditions 
        WHERE conditions.location = location;
$$
