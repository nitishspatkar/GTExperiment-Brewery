Class {
	#name : #Kettle,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
Kettle >> asElement [
	<gtExample>
	^ super asElement
		background: Color brown veryMuchLighter;
		border: (BlBorder paint: Color brown muchLighter width: 1) ;
		yourself
]
