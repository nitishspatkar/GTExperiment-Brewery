Class {
	#name : #BrewingProcess,
	#superclass : #Object,
	#instVars : [
		'equipments',
		'ingredients',
		'duration',
		'outcomes'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
BrewingProcess >> duration [
^ duration
]

{ #category : #accessing }
BrewingProcess >> duration: customTime [
duration := customTime
]

{ #category : #accessing }
BrewingProcess >> equipments [
^ equipments
]

{ #category : #accessing }
BrewingProcess >> ingredients [
^ ingredients
]

{ #category : #accessing }
BrewingProcess >> initialize [ super initialize.
equipments:= OrderedCollection new.
ingredients:= OrderedCollection new.
]

{ #category : #accessing }
BrewingProcess >> outcomes [
^ outcomes
]
