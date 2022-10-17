create table pet_exame_veterinario (
	id int primary key auto_increment,
    id_pet int,
    id_exame int,
    status_exame varchar(20),
    id_veterinario int,
    constraint fk_id_pet foreign key (id_pet) references pets(id),
    constraint fk_id_exame foreign key (id_exame) references exames(id),
    constraint fk_id_vet foreign key (id_veterinario) references veterinarios(id)
);

delimiter $$
create procedure cadastroPetExame(in pet_id int, in exame_id int, in veterinario_id int)
begin
	insert into pet_exame_veterinario (id_pet, id_exame, status_exame, id_veterinario)
		values (pet_id, exame_id, "Indisponível", veterinario_id);
end
$$ delimiter ;

call cadastroPetExame(13, 7, 4);
call cadastroPetExame(1, 1, 5);
call cadastroPetExame(3, 4, 7);
call cadastroPetExame(2, 6, 6);
call cadastroPetExame(5, 2, 2);
call cadastroPetExame(7, 9, 2);
call cadastroPetExame(8, 10, 2);
call cadastroPetExame(6, 1, 5);
call cadastroPetExame(4, 2, 8);
call cadastroPetExame(4, 1, 8);
call cadastroPetExame(10, 2, 9);
call cadastroPetExame(11, 8, 1);
call cadastroPetExame(12, 5, 1);
call cadastroPetExame(5, 1, 1);
call cadastroPetExame(7,3, 4);
call cadastroPetExame(6, 6, 2);
call cadastroPetExame(2, 2, 5);
call cadastroPetExame(2, 9, 7);

delimiter $$ 
create procedure alterarStatusExame(in pet_exame_id int)
begin
	update pet_exame_veterinario 
    set status_exame = "Disponível"
    where id = pet_exame_id;
end    
$$ delimiter ;

delimiter $$ 
create trigger pet_exame_atualizar
after update
on pet_exame_veterinario
for each row
begin
	insert into analises_exames (id_pet_exame, status_analise)
		values (old.id, "Não analizado");
end
$$ delimiter ;

call alterarStatusExame(1);
call alterarStatusExame(4);
call alterarStatusExame(5);
call alterarStatusExame(6);
call alterarStatusExame(8);
call alterarStatusExame(10);
call alterarStatusExame(13);
call alterarStatusExame(14);
call alterarStatusExame(3);
call alterarStatusExame(18);

select * from pet_exame_veterinario;


