create table pets (
	id int primary key auto_increment,
    nome varchar(20),
    nascimento date,
    especie varchar(20),
    id_tutor int,
    constraint fk_id_tutor foreign key (id_tutor) references tutores(id)
);

delimiter $$
create procedure cadastrarPet(in nome_pet varchar(20), 
							in nascimento_pet date, 
                            in especie_pet varchar(20), 
                            in telefone_tutor varchar(12))
begin
	declare tutor_id int;
    set tutor_id = (select tutores.id from tutores where tutores.telefone = telefone_tutor);
    
    insert into pets (nome, nascimento, especie, id_tutor)
		values (nome_pet, nascimento_pet, especie_pet, tutor_id);
end
$$ delimiter ;

call cadastrarPet("Zuri", "2022-03-01", "Canina", "525452545");
call cadastrarPet("Jujuba", "2014-06-01", "Canina", "584697852");
call cadastrarPet("Donatello", "2019-12-01", "Felina", "584697852");
call cadastrarPet("Treta", "2017-05-01", "Canina", "686751322");
call cadastrarPet("Sibério", "2018-11-01", "Felina", "78798986565");
call cadastrarPet("Gertrudes", "2019-10-01", "Felina", "78798986565");
call cadastrarPet("Bichola", "2014-11-01", "Felina", "787878787");
call cadastrarPet("Izidoro", "2015-04-01", "Felina", "525452545");
call cadastrarPet("Mike", "2014-05-01", "Canina", "68696222");
call cadastrarPet("Simba", "2015-12-01", "Canina", "5858594949");
call cadastrarPet("Lolla", "2021-07-01", "Canina", "787484696");
call cadastrarPet("Deanna", "2012-03-01", "Felina", "5686941122");
call cadastrarPet("Theo", "2016-09-01", "Canina", "4848797955");

delimiter $$
create procedure atualizarNascimentoPet (in pet_id int, in novoNascimento date)
begin
	update pets 
    set nascimento = novoNascimento
    where id = pet_id;
end
$$ delimiter ;

create view idadesPets as
	select pets.nome, truncate(datediff(curdate(), pets.nascimento)/365,0) as idade
    from pets;	

delimiter $$
create procedure petMaisExperiente()
begin
	declare maiorIdade float;
    set maiorIdade = (select truncate(max(datediff(curdate(), pets.nascimento)/365),0) from pets);
	
    select nome
    from idadesPets
    where idade = maiorIdade;
    
end
$$ delimiter ;

call petMaisExperiente();

