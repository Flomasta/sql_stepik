SET @num_pr := 0;
SET @row_num := 1;

UPDATE applicant_order
SET str_id = if(@num_pr = program_id, @row_num := @row_num + 1, @row_num := 1 AND @num_pr := program_id);

select *
from applicant_order;
