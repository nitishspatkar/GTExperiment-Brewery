Class {
	#name : #Brewery,
	#superclass : #Object,
	#instVars : [
		'equipments'
	],
	#category : #BreweryModel
}

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
Brewery >> initialize [ super initialize.
equipments := OrderedCollection new.
]

{ #category : #accessing }
Brewery >> setUpEquipments [
	| brewery mashTun kettle |
	brewery := self createABrewery.
	kettle := Kettle new.
	mashTun := MashTun new.
	brewery equipments
		addAll:
			{kettle.
			mashTun}.
	^ brewery
]
