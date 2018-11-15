-- 查看定时任务
select * from dba_jobs;

-- 创建定时任务
declare
  job number;
begin
  dbms_job.SUBMIT(JOB => job,
                  what => 'SERVER_OVERTIME_HANDLE;',-- 具体任务操作
                  next_date => sysdate, -- 下一个执行时间
                  interval => 'TRUNC(sysdate) + 1 +1/(24)');-- 每日凌晨1点运行
  commit;
end;

-- 删除定时任务
begin
  dbms_job.remove(24);  /*删除自动执行的job,参数是 job的id*/
  commit;
end;
