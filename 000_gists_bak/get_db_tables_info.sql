select
    table_schema AS 数据库名,
    table_name   AS 表名,
    round((data_length/1024/1024/1024), 2) as `数据大小 G`,
    round((index_length/1024/1024/1024), 2) as `索引大小 G`,
    round(((data_length+index_length)/1024/1024/1024), 2) as `所有数据大小 G`,
    table_rows AS 数据行数
from
    information_schema.TABLES
where
    round(((data_length+index_length)/1024/1024/1024), 2) > 1 and table_schema in
    ("db_name_1",
     "db_name_2"
     )
    and table_name not like "%2021%"
ORDER BY
    (data_length + index_length)
    DESC
LIMIT 1000;
