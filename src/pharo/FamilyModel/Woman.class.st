Class {
	#name : #Woman,
	#superclass : #Person,
	#category : #FamilyModel
}

{ #category : #accessing }
Woman >> asElement [
	^ super asElement
		background: Color red muchLighter;
		yourself
]
