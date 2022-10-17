create table tutores (
	id int primary key auto_increment,
    nome varchar(30),
    telefone varchar(12)
);

delimiter $$
create procedure cadastrarTutor(in nome_tutor varchar(30), in telefone_tutor varchar(12))
begin
	insert into tutores (nome, telefone)
		values (nome_tutor, telefone_tutor);
end
$$ delimiter ;

call cadastrarTutor("Antonezio", "525452545");
call cadastrarTutor("Adriana", "584697852");
call cadastrarTutor("Bianca", "686751322");
call cadastrarTutor("Bruna", "78798986565");
call cadastrarTutor("Daniela", "787878787");
call cadastrarTutor("Diogo", "68696222");
call cadastrarTutor("Bruno", "5858594949");
call cadastrarTutor("Francine", "787484696");
call cadastrarTutor("Gisele", "5686941122");
call cadastrarTutor("Daniela", "4848797955");

delimiter $$
create procedure atualizarTelefoneTutor(in telefone_tutor varchar(12), in novoTelefone varchar(12))
begin
	declare tutor_id int;
    set tutor_id = (select tutores.id from tutores where tutores.telefone = telefone_tutor);
    
    update tutores
    set telefone = novoTelefone
    where id = tutor_id;
end
$$ delimiter ;

delimiter $$
create procedure removerTutor(in tutor_id int)
begin
	delete from analises_exames
    where id_pet_exame in (select pet_exame_veterinario.id from pet_exame_veterinario
							inner join pets on pet_exame_veterinario.id_pet = pets.id
                            where pets.id_tutor = tutor_id);
	delete from pet_exame_veterinario
    where id_pet in (select pets.id from pets where pets.id_tutor = tutor_id);
    delete from pets
    where pets.id_tutor = tutor_id;
    delete from tutores
    where tutores.id = tutor_id;
end
$$ delimiter ;


call removerTutor(2);