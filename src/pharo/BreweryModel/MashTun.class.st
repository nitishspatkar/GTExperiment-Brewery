Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	^ super asElement
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1) ;
		when: BlClickEvent do: [ self changeColor];
		yourself
]

{ #category : #accessing }
MashTun >> changeColor [
	super asElement background: Color blue;
	border: (BlBorder paint: Color blue width: 1);
	yourself
]
