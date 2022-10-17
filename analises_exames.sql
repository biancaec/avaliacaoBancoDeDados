create table analises_exames (
	id int primary key auto_increment,
    id_pet_exame int,
    status_analise varchar(20),
    constraint fk_pet_exame foreign key (id_pet_exame) references pet_exame_veterinario(id)
);

delimiter $$
create procedure atualizarAnalise(in id_analise int)
begin
	update analises_exames
    set status_analise = "Analizado"
    where id = id_analise;
end
$$ delimiter ;

select * from analises_exames;



