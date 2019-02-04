set transaction isolation level read uncommitted
select trx_date as Fecha, substring(trx_time,1,2) as Hora,
Transacciones=count(*),
Aprobadas=sum(case (t.ms_respcode) when '00' then 1 else 0 end),
Rechazadas=sum(case (t.ms_respcode) when '00' then 0 else 1 end),
Porc_Rechazo=convert(decimal (9,2),(sum(case (t.ms_respcode) when '00' then 0.00 else 1.00 end )) * 100/COUNT(*),2)
from merchant1..timer_tracking t where t.trx_date='2019-02-04' --and t.trx_time>='00' ---AJUSTAR FECHAS Y HORAS
and t.transcode in (541,545,547,549,141,145,147,149,196,596,598,172,173,194,198,594,573)
group by trx_date ,substring(trx_time,1,2) 
order by trx_date ,substring(trx_time,1,2) desc

set transaction isolation level read uncommitted
select trx_date as Fecha, substring(trx_time,1,5) as Minuto,
Transacciones=count(*),
Aprobadas=sum(case (t.ms_respcode) when '00' then 1 else 0 end),
Rechazadas=sum(case (t.ms_respcode) when '00' then 0 else 1 end),
Porc_Rechazo=convert(decimal (9,2),(sum(case (t.ms_respcode) when '00' then 0.00 else 1.00 end )) * 100/COUNT(*),2)
from merchant1..timer_tracking t where t.trx_date='2019-02-04' --and t.trx_time>='00' ---AJUSTAR FECHAS Y HORAS
and t.transcode in (541,545,547,549,141,145,147,149,196,596,598,172,173,194,198,594,573) 
--and paymentid in ('14','15')
group by trx_date ,substring(trx_time,1,5) 
order by trx_date ,substring(trx_time,1,5) desc