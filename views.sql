create view petsTutores as
	select pets.nome as nomePet, tutores.nome as nomeTutor
    from pets
    inner join tutores on pets.id_tutor = tutores.id
    order by tutores.id;
    
select * from petsTutores;

create view petsVeterinarios as
	select pets.nome as nomePet, veterinarios.nome as nomeVet
    from pets 
    inner join pet_exame_veterinario on pets.id = pet_exame_veterinario.id_pet
    inner join veterinarios on pet_exame_veterinario.id_veterinario = veterinarios.id
    order by veterinarios.nome;
    
select * from petsVeterinarios;

create view examesNaoAnalizados as
	select exames.descricao, veterinarios.nome as vet, pets.nome as pet
    from exames
    inner join pet_exame_veterinario on exames.id = pet_exame_veterinario.id_exame
    inner join veterinarios on pet_exame_veterinario.id_veterinario = veterinarios.id
    inner join pets on pet_exame_veterinario.id_pet = pets.id
    inner join analises_exames on pet_exame_veterinario.id = analises_exames.id_pet_exame
    where analises_exames.status_analise = "Não analizado";
    
select * from examesNaoAnalizados;

create view totalPetsPorVet as
	select veterinarios.nome, count(distinct pet_exame_veterinario.id_pet) as totalPacientes
    from veterinarios
    left join pet_exame_veterinario on veterinarios.id = pet_exame_veterinario.id_veterinario
    group by veterinarios.nome;
    
select * from totalPetsPorVet;

create view totalExamesPorPet as
	select pets.nome, count(pet_exame_veterinario.id_pet) as totalExames
    from pet_exame_veterinario
    right join pets on pet_exame_veterinario.id_pet = pets.id
    group by pets.nome;
    
select * from totalExamesPorPet;
    
create view tutorEFelino as
	select tutores.nome as tutor, pets.nome as felino
    from tutores
    inner join pets on pets.id_tutor = tutores.id
    where pets.especie like "Felina";
    
select * from tutorEFelino;
