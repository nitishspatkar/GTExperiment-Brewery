Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> mash: graings with: water [
	| wort |
	wort := Wort new.
	^ wort
]
