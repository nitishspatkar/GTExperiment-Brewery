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
		with: equipments.
	m layout tree.
	^ m
]

{ #category : #accessing }
Brewery >> asInventory [
| m |
	m := GtMondrian new.
	m nodes
		stencil: [ :e | e asElement ];
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
Brewery >> createBrewery [
	| brewery |
	brewery := Brewery new.
	^ brewery
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
		title: 'Brewery';
		stencil: [ self asElement ]
]

{ #category : #accessing }
Brewery >> gtLiveForInventory: aView [
	<gtView>
	^ aView explicit
		priority: 2;
		title: 'Inventory';
		stencil: [ self asInventory ]
]

{ #category : #accessing }
Brewery >> initialize [
	| malt1 malt2 hops1 hops2 yeast1 yeast2 mashTun1 mashTun2 kettle1 kettle2 fermenter1 fermenter2 |
	super initialize.
	equipments := OrderedCollection new.
	inventory := OrderedCollection new.
	
	malt1 := MunichMalt new quantity: 2.
	malt2 := ViennaMalt new quantity: 1.
	hops1 := MagnumHop new quantity: 2.
	hops2 := ChinookHop new quantity: 1.
	yeast1 := CoopersYeast new quantity: 2.
	yeast2 := FermentisYeast new quantity: 1.
	mashTun1 := MashTun new capacity: 20.
	mashTun2 := MashTun new capacity: 50.
	kettle1 := Kettle new capacity: 20.
	kettle2 := Kettle new capacity: 20.
	fermenter1 := Fermenter new capacity: 20.
	fermenter2 := Fermenter new capacity: 50.
	
	inventory
		addAll:
			{malt1.
			malt2.
			hops1.
			hops2.
			yeast1.
			yeast2.
			mashTun1.
			mashTun2.
			kettle1.
			kettle2.
			fermenter1.
			fermenter2}
]

{ #category : #accessing }
Brewery >> inventory [
	^ inventory
]

{ #category : #accessing }
Brewery >> setUpEquipments [
	<gtExample>
	| brewery mashTun kettle |
	brewery := self createBrewery.
	mashTun := inventory at: 7.
	kettle := inventory at: 9.
	
	brewery equipments
		addAll:
			{mashTun.
			kettle}.
	^ brewery
]
