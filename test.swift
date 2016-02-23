#if os(Linux)
    import Glibc
    import SwiftShims
#else
    import Darwin
#endif


struct noteInfo {

	var midiNoteNumber: Int;
	var noteNumber: Int;
	var octave: Int;
	var noteName: String;

}

struct scale {

	var name: String;
	var intervals: [Int];

}

struct MyGlobals {
	static var rootNote: Int = 0;
	static var scale: Int = 0;
}


var noteNames: [String] = [
	"C",
	"C#",
	"D",
	"D#",
	"E",
	"F",
	"F#",
	"G",
	"G#",
	"A",
	"A#",
	"B"
];





var scales:[scale] = [

		scale(
			name: "Chromatic",
			intervals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
		),

		scale(
			name: "Major",
			intervals: [0, 2, 4, 5, 7, 9, 11]
		),

		scale(
			name: "Minor",
			intervals: [0, 2, 3, 5, 7, 8, 10]
		),

		scale(
			name: "Major Pentatonic",
			intervals: [0, 2, 4, 7, 9]
		),

		scale(
			name: "Dorian",
			intervals: [0, 2, 3, 5, 7, 9, 10]
		)

];


var notes = [noteInfo](

	count: 132,

	repeatedValue: noteInfo(
		midiNoteNumber: 0,
		noteNumber: 0,
		octave: 0,
		noteName: "C0"
	)

);

func createNoteInfo (index: Int) -> noteInfo {

	var myNote = noteInfo (
		midiNoteNumber: 0,
		noteNumber: 0,
		octave: 0,
		noteName: "C0"
	);

	myNote.midiNoteNumber = (index <= 127 ? index: 127);
	myNote.noteNumber = getNoteNumberFromMidiValue(myNote.midiNoteNumber);
	myNote.octave = getOctaveFromNoteAndMidiNote(myNote.midiNoteNumber, noteNumber: myNote.noteNumber);
	myNote.noteName = getNoteNameFromNoteAndOctave(myNote.noteNumber, octave: myNote.octave);

	return myNote;
}

func getNoteNumberFromMidiValue (midiValue: Int) -> Int {
	return midiValue % 12;
}

func getOctaveFromNoteAndMidiNote (midiValue: Int, noteNumber: Int) -> Int {
	return (midiValue - noteNumber) / 12;
}

func getNoteNameFromNoteAndOctave (noteNumber: Int, octave: Int) -> String {
	return noteNames[noteNumber] + String (octave)
}



func getScaleFromName (theName: String) -> scale {


		//MODO Swift 2.1

	if let i = scales.indexOf({$0.name == theName}) {
		return scales[i];
	}

	return scale (
		name: "Chromatic",
		intervals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
	);



/*

 MODO Swift 1
	if let found = find(scales.map({ $0.name }), theName) {
		let obj = scales[found];
		return obj;
	}
		return scale (
		name: "Chromatic",
		intervals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
	);
*/
}

func getScaleNumberFromName (theName: String) -> Int {
	if let found = scales.indexOf({$0.name == theName}) {
		return found;
	}
	/*
		MODO Swift 1
	 if let found = find(scales.map({ $0.name }), theName) {
		return found;
	}
	*/
		return 0;
}

func setRootNote (rNote: Int) {
	MyGlobals.rootNote = rNote;
}

func setScale (scaleN: Int) {
	MyGlobals.scale = scaleN;
}


























for index in 0..<notes.count {

	//print("vou no indice:  \(index)");

	notes[index] = createNoteInfo(index);

	/*
	print(notes[index].noteName);
	print(notes[index].midiNoteNumber);
	*/
}




/*
for aScale in scales {
	print(aScale.name);
	print(aScale.intervals);
}
*/


/*
print(getScaleFromName("Major").name);



print(getScaleNumberFromName("Major"));
print(getScaleNumberFromName("Major Pentatonic"));
*/


exit(EXIT_SUCCESS);
