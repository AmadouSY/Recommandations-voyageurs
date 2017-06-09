SET  foreign_key_checks=0;

 DELETE FROM Utilisateur  WHERE id_uti =7;
 
SET  foreign_key_checks=1;

 select e.id_eta,e.adresse,e.ville,e.taille,r.nb_etoiles,avg(avis_etoile),type_cuisine from Restaurant r natural join  Etablissement e natural join Avis a group by id_eta order by avg(avis_etoile)desc; 

select *from Magasin natural join Etablissement where id_eta in (select id_eta from Avis group by id_eta having avg(avis_etoile)>3)and sqrt(POW(( latcoo_gps-87.24),2)+POW((longcoo_gps+73.64),2))*111<5 ;

 select *from Restaurant natural join Etablissement where type_cuisine like"indien%" and ville="Paris" and id_eta not in(select id_eta from Avis where avis_etoile<4);
 
 select *from Hotel  natural join Etablissement where nb_etoiles>2 and id_eta not in(select id_eta from Avis where avis_etoile<3); 
insert into Avis values(213,"233.145.123.455",2014-5-15,4,"c est un etablissement respectable",8,10,12);

select*from Etablissement where   id_eta in(select id_eta from Avis where id_uti=0 and  extract(year from date_avis)=2012);

 select *from Utilisateur where id_uti in(select distinct a1.id_uti from Avis a1,Avis a2 where (a1.id_uti=a2.id_uti and a1.id_eta=a2.id_eta and extract(year from a1.date_avis)=extract(year from a2.date_avis) and a1.id_avis<>a2.id_avis));

create view v as(select id_uti,count(id_avis)as nb_avis, extract(month from date_avis)as mois,extract(year from date_avis)as annee from Avis group by extract(year from date_avis),extract(month from date_avis),id_uti having count(id_avis)>=10);
select distinct id_uti from v group by annee having count(mois)=12;
 drop view v;

select id_eta,avg(avis_etoile),avg(eval_prix)from Avis group by id_eta;

select *from Avis where id_eta in(select id_eta from Etablissement where id_proprietaire=41);

select *from Restaurant natural join Etablissement where ville="Paris";

 select *from Avis where id_eta in(select id_eta from Etablissement where id_proprietaire=41) and avis_etoile>=3;

select *from Avis a1   having    id_eta in(select id_eta from Etablissement where id_proprietaire=41)and avis_etoile=(select max(avis_etoile) from Avis a2 where id_eta=a1.id_eta  ) ;

select id_eta from Avis  where avis_etoile >=4 group by id_eta     having count(id_avis)>=2    ;

update  Voyageur set statut="or" where id_uti=50;
SET  foreign_key_checks=0;
delete from Avis where id_avis in(select id_avis from Reponse where avis_insultant=0);
SET  foreign_key_checks=1;

select *from Voyageur natural join Utilisateur where id_uti in(select id_uti from Avis where id_avis in (select id_avis from Notecom group by id_avis having avg(note)>=3)) ;

select *from Voyageur natural join Utilisateur where id_uti in(select a1.id_uti from Avis a1,Avis a2 where a1.adresse_ip=a2.adresse_ip and a1.id_uti<>a2.id_uti) ;

select *from Utilisateur Natural join Voyageur where id_uti not in (select distinct id_uti from Avis where id_eta in(select id_eta from Etablissement natural join Hotel  where nb_etoiles<5)OR id_eta in(select id_eta from Restaurant natural join Etablissement where nb_etoiles<5)) and id_uti in (select id_uti from Avis) ;

