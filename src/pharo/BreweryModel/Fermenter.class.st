Class {
	#name : #Fermenter,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
Fermenter >> add: yeast to: theBoil andWaitFor: duration [
	| rawBeer |
	rawBeer := RawBeer new.
	^ rawBeer
]
