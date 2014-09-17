SELECT @rowid:=@rowid+1 AS id,
supplier_name NAME
FROM crm_supplier_information, (SELECT @rowid:=0) AS init;

SELECT @rowid:=@rowid+1 AS id,
product_display_id AS CODE,
product_name_th AS NAME,
est_weight AS estWeight,
machine AS machine,
speed AS speed,
NOW() AS created_at
FROM prd_product_detail, (SELECT @rowid:=0) AS init
WHERE in_production = 'Y';