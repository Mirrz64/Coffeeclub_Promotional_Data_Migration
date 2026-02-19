-- Feature Engineering and Integrity
-- Identify Invalid Age

UPDATE customers
SET age = NULL
WHERE age >= 118;

-- Altering Time Feature
ALTER TABLE public.events
ADD COLUMN time2 INTERVAL;

UPDATE public.events
SET time2 =( (time / 24) ||  ' days '  || (time % 24) || ' hours ' ) :: INTERVAL;

ALTER TABLE events
DROP COLUMN time;

ALTER TABLE events
RENAME COLUMN time2 TO time;