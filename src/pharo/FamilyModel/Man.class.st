Class {
	#name : #Man,
	#superclass : #Person,
	#category : #FamilyModel
}

{ #category : #accessing }
Man >> asElement [
	^ super asElement
		background: Color blue muchLighter;
		yourself
]

{ #category : #accessing }
Man >> bang: aWoman [
	| aChild |
	aChild := {Man.
	Woman} atRandom new.
	aChild
		father: self;
		mother: aWoman.
	self children add: aChild.
	aWoman children add: aChild.
	^ aChild
]
