Class {
	#name : #Brewery,
	#superclass : #Object,
	#instVars : [
		'equipments',
		'brewMaster'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Brewery >> asElement [
	| m |
	m := GtMondrian new.
	m nodes
		stencil: [ :e | e asElement ];
		with: equipments.
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
Brewery >> initialize [ super initialize.
equipments := OrderedCollection new.
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
