Class {
	#name : #BrewMaster,
	#superclass : #Object,
	#instVars : [
		'currentProject'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
BrewMaster >> add: ingredients to: equipments [

]

{ #category : #accessing }
BrewMaster >> addWater: water [
	| mashTun |
	mashTun := currentProject equipments at: 1.
	self assert: [ mashTun wort isNil ].
	mashTun wort addWater: water
]

{ #category : #accessing }
BrewMaster >> currentProject [
	^ currentProject
]

{ #category : #accessing }
BrewMaster >> currentProject: aProject [
	currentProject := aProject
]

{ #category : #accessing }
BrewMaster >> getBrewery [
	^ Brewery new
]

{ #category : #accessing }
BrewMaster >> selectIngredients [
	<gtExample>
	| brewery water |
	brewery := self setUpEquipments.
	self assert: [ brewery inventory isNotEmpty ].
	water := Water new.
	brewery ingredients
		addAll:
			{(brewery inventory at: 1).
			(brewery inventory at: 3).
			(brewery inventory at: 4).
			(brewery inventory at: 5).
			water}.
	brewery inventory removeAt: 1.
	brewery inventory removeAt: 3.
	brewery inventory removeAt: 4.
	brewery inventory removeAt: 5.
	^ brewery
]

{ #category : #accessing }
BrewMaster >> setUpEquipments [
	<gtExample>
	| brewery mashTun kettle fermenter |
	brewery := self getBrewery.
	currentProject := brewery.
	mashTun := brewery inventory at: 7.
	kettle := brewery inventory at: 9.
	fermenter := brewery inventory at: 11.
	brewery equipments
		addAll:
			{mashTun.
			kettle.
			fermenter}.
	^ brewery
]
