

/*
place=contact
id={id}
search={}
page=0
{
    "type":"contact",
    "data":[
        {
            "name":"",
            "phone":"number",
            "mobile":"number",
            "fax":"number",
            "address":"",
            "zip":"",
            "city":"",
            "country":"",
            "email":"",
            "about":""
        }
    ]
}
with search
{
    "type":"contact",
    "link":[
        "href"
}
*/
CREATE TABLE contact(
    contact_p_id INT NOT NULL,
    contact_name VARCHAR(128) NOT NULL,
    contact_phone VARCHAR(16),
    contact_mobile VARCHAR(16),
    contact_fax VARCHAR(16),
    contact_address VARCHAR(512),
    contact_zip VARCHAR(8),
    contact_city VARCHAR(128),
    contact_country VARCHAR(128),
    contact_email VARCHAR(256),
    contact_about VARCHAR(1024),
    
    last_access_user VARCHAR(32) NOT NULL,
    last_access_date DATETIME NOT NULL,
    
    CONSTRAINT pk_contact_p_id PRIMARY KEY (contact_p_id)
);

CREATE VIEW contact_search AS
SELECT contact_p_id, contact_name AS value FROM contact
UNION
SELECT contact_p_id, contact_phone AS value FROM contact
UNION
SELECT contact_p_id, contact_mobile AS value FROM contact
UNION
SELECT contact_p_id, contact_fax AS value FROM contact
UNION
SELECT contact_p_id, contact_address AS value FROM contact
UNION
SELECT contact_p_id, contact_zip AS value FROM contact
UNION
SELECT contact_p_id, contact_city FROM contact
UNION
SELECT contact_p_id, contact_country FROM contact
UNION
SELECT contact_p_id, contact_email AS value FROM contact
UNION
SELECT contact_p_id, contact_about AS value FROM contact