## Test back Advitam.fr

---
###  Afin de garantir une prestation de service de qualité, nous souhaitons sélectionner nos partenaires sans intervention humaine.

Pour ce faire nous avons à disposition:

- La note d'Advitam sur 5 points. `advitam_grade`
- Les prestations qu'il couvre.`works`
- Les tarifs qu'il applique pour chaque prestations. 

Nous souhaitons réaliser une classe `SelectSupplier` qui contiendra la logique de sélection de fournisseur.

Cette classe exposera les méthodes suivantes : 

- .work(work_type) -> retourne le fournisseur ayant la meilleure `global_grade` pour un `work_type`

- .work_all(work_type) -> retourne tous les fournisseurs réalisant le `work_type` trié par `global_grade`.

- .suppliers -> retourne tous les fournisseurs classés par meilleur `advitam_grade`.

- .supplier_grade(supplier_name, work_type) -> retourne la `global_grade` d'un fournisseur pour un `work_type` spécifique.

- .grade_weight -> return le grade_weight

- .grade_weight=(value) -> update la valeur de weight

La note globale est calculée de la sorte :

```
	(grade_weight * advitam_grade) + work_type_price (le price du work)
```

--- 
```ruby

suppliers = [
    { name: "FunePlus", advitam_grade: 3, works: [ { type: "embalming", price: 350 }, {type: "transport_before_casketing", price: 450} ]},
    { name: "FuneTop", advitam_grade: 1, works: [ { type: "graving", price: 10 } ]},
    { name: "FuneTruc", advitam_grade: 5,works: [ { type: "embalming", price: 750 }]},
    { name: "FuneCorp", advitam_grade: 2, works: [ { type: "digging", price: 350 }]}
]

```

La classe s'instenciera de la sorte select = SelectSupplier.new(suppliers)

--- 

Techno : 

-> Ruby/Rails

Rendu :

    -> Pouvoir importer la class en rails afin de l'utiliser
    -> Sur un repos GIT 
    -> README.md 
    -> Les tests sont appréciés (Rspec ou minitest). 
