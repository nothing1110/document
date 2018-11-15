-- 根据祖先节点查询子孙节点
select c.*,(select lmmc from T_TAG_OBJ_CATEGORY where id = c.sjid) sjmc 
	from T_TAG_OBJ_CATEGORY c 
	where sjid != 'root'
start with id = 'a84402175e0d4269aef9544a5d8a85b8' connect by prior id=SJID

-- 根据子孙节点查询祖先节点
SELECT DISTINCT(c.id) as "id",c.LMBH as "lmbh",c.LMMC as "lmmc",c.CJ as "cj" from T_TAG_OBJ_CATEGORY c 
start with id in (SELECT DISTINCT(sjid) from T_TAG_INFO WHERE st_id = 'a84402175e0d4269aef9544a5d8a85b8' and bqmc LIKE '%性别%')  connect by id = prior SJID;