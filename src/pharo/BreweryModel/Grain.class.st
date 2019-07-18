Class {
	#name : #Grain,
	#superclass : #BrewingIngredient,
	#instVars : [
		'color'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Grain >> color [
^ color
]

{ #category : #accessing }
Grain >> color: aColor [
color := aColor
]
