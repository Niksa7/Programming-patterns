create table students (
                          id          INTEGER PRIMARY KEY AUTOINCREMENT,
                          surname   varchar(32) not null,
                          name  varchar(32) not null,
                          lastname varchar(32) not null,
                          phone       varchar(32) null,
                          telegram    varchar(32) null,
                          email       varchar(32) null,
                          git         varchar(32) null
);
