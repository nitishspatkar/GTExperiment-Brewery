Class {
	#name : #Recipe,
	#superclass : #Object,
	#instVars : [
		'ingredients'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Recipe >> ingredients [
	^ ingredients
]

{ #category : #accessing }
Recipe >> initialize [
	| recipe |
	super initialize.
	recipe := Recipe new.
	ingredients := OrderedCollection new.
	^ recipe
]
