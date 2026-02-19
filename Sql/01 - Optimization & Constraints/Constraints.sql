-- Task 1 - Optimization and Constraints

-- Adding Primary Keys
ALTER TABLE public.customers
ADD CONSTRAINT customers_pk PRIMARY KEY (customer_id);

ALTER TABLE public.events
ADD COLUMN event_id BIGSERIAL PRIMARY KEY;

ALTER TABLE public.offers
ADD CONSTRAINT offers_pk PRIMARY KEY (offer_id);

ALTER TABLE public.offer_channels
ADD CONSTRAINT offer_channels_pk
PRIMARY KEY (offer_id, channels); -- using a composite key

-- Adding Foreign Keys
ALTER TABLE public.events
ADD CONSTRAINT fk_events_customers
FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);

ALTER TABLE public.events
ADD CONSTRAINT fk_events_offers
FOREIGN KEY (offer_id) REFERENCES public.offers(offer_id);

ALTER TABLE public.offer_channels
ADD CONSTRAINT fk_offer_channels
FOREIGN KEY (offer_id) REFERENCES public.offers(offer_id);

-- Indexing High Traffic Columns
CREATE INDEX idx_events_customer_id
ON events(customer_id);

CREATE INDEX idx_events_offer_id
ON events(offer_id);

CREATE INDEX idx_events_event
ON events(event);

CREATE INDEX idx_events_time
ON events(time);

CREATE INDEX idx_offers_offer_type
ON offers(offer_type);