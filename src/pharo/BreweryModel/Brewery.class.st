Class {
	#name : #Brewery,
	#superclass : #Object,
	#instVars : [
		'equipments'
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
Brewery >> breweryCreationExample [
	<gtExample>
	| brewery |
	brewery := Brewery new.
	^ brewery
]

{ #category : #accessing }
Brewery >> createABrewery [
	^ Brewery new
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
Brewery >> setUpEquipments [ <gtExample>
	| brewery mashTun kettle |
	brewery := self createABrewery.
	mashTun := MashTun new.
	kettle := Kettle new.
	brewery equipments
		addAll:
			{mashTun.
			kettle}.
	^ brewery
]
