Class {
	#name : #Brewery,
	#superclass : #Object,
	#instVars : [
		'equipments',
		'brewMaster',
		'inventory'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Brewery >> asElement [
	| m |
	m := GtMondrian new.
	m nodes
		stencil: [ :e | e asElement ];
		with: equipments;
		with: inventory.
	m layout tree.
	^ m
]

{ #category : #accessing }
Brewery >> brewMaster [
	^ brewMaster
]

{ #category : #accessing }
Brewery >> brewMaster: master [
	brewMaster := master
]

{ #category : #accessing }
Brewery >> breweryCreationExample [
	<gtExample>
	| brewery |
	brewery := Brewery new.
	^ brewery
]

{ #category : #accessing }
Brewery >> createABreweryAndBrewMaster [
	| brewery master |
	brewery := Brewery new.
	master := BrewMaster new.
	brewery brewMaster: master.
	^ {brewery.
	master}
]

{ #category : #accessing }
Brewery >> equipments [
	^ equipments
]

{ #category : #accessing }
Brewery >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: 'Equipments';
		stencil: [ self asElement ]
]

{ #category : #accessing }
Brewery >> initialize [
	| malt1 malt2 hops1 hops2 |
	super initialize.
	equipments := OrderedCollection new.
	inventory := OrderedCollection new.
	malt1 := MunichMalt new quantity: 2.
	malt2 := ViennaMalt new quantity: 1.
	hops1 := MagnumHop new quantity: 2.
	hops2 := ChinookHop new quantity: 1.
	inventory
		addAll:
			{malt1.
			malt2.
			hops1.
			hops2}
]

{ #category : #accessing }
Brewery >> inventory [
	^ inventory
]

{ #category : #accessing }
Brewery >> setUpEquipments [
	<gtExample>
	| brewery master mashTun kettle fermenter |
	brewery := self createABreweryAndBrewMaster at: 1.
	master := self createABreweryAndBrewMaster at: 2.
	mashTun := master setupEquipments at: 1.
	kettle := master setupEquipments at: 2.
	fermenter := master setupEquipments at: 3.
	brewery equipments
		addAll:
			{mashTun.
			kettle.
			fermenter}.
	^ brewery
]
