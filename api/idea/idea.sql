/*
place=group
group={groupname}
search={search}
page=0

{
    "type":"group",
    "data":[
        {
            "groupname":"",
            "description":"",
            
            "user":[
                "href",
                "href"
            ]
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
CREATE TABLE idea_group(
    group_p_id INT NOT NULL,
    group_name VARCHAR(32), /*unique*/
    group_description VARCHAR(1024),
    
    last_access_user VARCHAR(32) NOT NULL,
    last_access_date DATETIME NOT NULL,
    
    CONSTRAINT uc_group_name UNIQUE (group_name),
    CONSTRAINT pk_group_p_id PRIMARY KEY (group_p_id)
);

/* 
place=group
group={groupname}
search={search}
page=0
{
    "type":"user",
    "data":[
        {
            "username":"",
            
            "name":"",
            "phone":"number",
            "mobile":"number",
            "fax":"number",
            "address":"",
            "zip":"",
            "city":"",
            "country":"",
            "email":"",
            "about":"",
            
            "group":[
                "href",
                "href"
            ]
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

/*
    implement interface too
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
CREATE TABLE idea_user(
    user_p_id INT NOT NULL,
    user_name VARCHAR(32), /*unique*/
    user_description VARCHAR(1024),
    
    user_password VARCHAR(256), /*hash*/
    
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
    
    CONSTRAINT uc_user_name UNIQUE (user_name),
    CONSTRAINT pk_user_p_id PRIMARY KEY (user_p_id)
);

CREATE TABLE idea_user_group(
    group_fk_id INT NOT NULL,
    user_fk_id INT NOT NULL,
    
    last_access_user VARCHAR(32) NOT NULL,
    last_access_date DATETIME NOT NULL,
    
    CONSTRAINT fk_group_p_id FOREIGN KEY (group_fk_id) REFERENCES idea_group(group_p_id),
    CONSTRAINT fk_user_p_id FOREIGN KEY (user_fk_id) REFERENCES idea_user(user_p_id)
);

CREATE VIEW idea_user_group_view AS 
SELECT  user_p_id,
        user_name,
        user_description,
        user_password,
        contact_name,
        contact_phone,
        contact_mobile,
        contact_fax,
        contact_address,
        contact_zip,
        contact_city,
        contact_country,
        contact_email,
        contact_about,
        group_p_id,
        group_name,
        group_description
FROM idea_user_group 
INNER JOIN idea_user ON user_fk_id=user_p_id 
INNER JOIN idea_group ON group_fk_id=group_p_id;

CREATE VIEW idea_group_search AS
SELECT group_p_id, group_name AS value FROM idea_group 
UNION
SELECT group_p_id, group_description AS value FROM idea_group;

CREATE VIEW idea_user_search AS
SELECT user_p_id, user_name AS value FROM idea_user 
UNION
SELECT user_p_id, user_description AS value FROM idea_user 
UNION 
SELECT user_p_id, contact_name AS value FROM idea_user
UNION
SELECT user_p_id, contact_phone AS value FROM idea_user
UNION
SELECT user_p_id, contact_mobile AS value FROM idea_user
UNION
SELECT user_p_id, contact_fax AS value FROM idea_user
UNION
SELECT user_p_id, contact_address AS value FROM idea_user
UNION
SELECT user_p_id, contact_zip AS value FROM idea_user
UNION
SELECT user_p_id, contact_city FROM idea_user
UNION
SELECT user_p_id, contact_country FROM idea_user
UNION
SELECT user_p_id, contact_email AS value FROM idea_user
UNION
SELECT user_p_id, contact_about AS value FROM idea_user;

CREATE VIEW idea_user_group_search AS 
SELECT group_p_id, user_p_id, group_name AS value FROM idea_user_group_view 
UNION
SELECT group_p_id, user_p_id, group_description AS value FROM idea_user_group_view 
UNION
SELECT group_p_id, user_p_id, user_name AS value FROM idea_user_group_view 
UNION
SELECT group_p_id, user_p_id, user_description AS value FROM idea_user_group_view 
UNION 
SELECT group_p_id, user_p_id, contact_name AS value FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_phone AS value FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_mobile AS value FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_fax AS value FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_address AS value FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_zip AS value FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_city FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_country FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_email AS value FROM idea_user_group_view
UNION
SELECT group_p_id, user_p_id, contact_about AS value FROM idea_user_group_view;