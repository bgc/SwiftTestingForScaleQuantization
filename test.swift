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
	myNote.octave = getOctaveFromNoteAndMidiNote(myNote.midiNoteNumber, myNote.noteNumber);
	myNote.noteName = getNoteNameFromNoteAndOctave(myNote.noteNumber, myNote.octave);

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

	/*
		MODO Swift 2.1

	if let i = scales.indexOf({$0.name == theName}) {
		return scales[i];
	}

	return scale (
		name: "Chromatic",
		intervals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
	);

	*/


	if let found = find(scales.map({ $0.name }), theName) {
		let obj = scales[found];
		return obj;
	}
		return scale (
		name: "Chromatic",
		intervals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
	);
}

func getScaleNumberFromName (theName: String) -> Int {
	if let found = find(scales.map({ $0.name }), theName) {
		return found;
	}
		return 0;
}

func setRootNote (rNote: Int) {
	MyGlobals.rootNote = rNote;
}

func setScale (scaleN: Int) {
	MyGlobals.scale = scaleN;
}


























for index in 0..<notes.count {

	//println("vou no indice:  \(index)");

	notes[index] = createNoteInfo(index);

	/*
	println(notes[index].noteName);
	println(notes[index].midiNoteNumber);
	*/
}




/*
for aScale in scales {
	println(aScale.name);
	println(aScale.intervals);
}
*/


/*
println(getScaleFromName("Major").name);



println(getScaleNumberFromName("Major"));
println(getScaleNumberFromName("Major Pentatonic"));
*/


/*

C		C#	D		D#	E		F		F#	G		G#	A		A#	B
0		1		2		3		4		5		6		7		8		9		10	11
12	13	14	15	16	17	18	19	20	21	22	23
24	25	26	27	28	29	30	31	32	33	34	35
36	37	38	39	40	41	42	43	44	45	46	47
48	49	50	51	52	53	54	55	56	57	58	59
60	61	62	63	64	65	66	67	68	69	70	71
72	73	74	75	76	77	78	79	80	81	82	83
84	85	86	87	88	89	90	91	92	93	94	95
96	97	98	99	100	101	102	103	104	105	106	107
108	109	110	111	112	113	114	115	116	117	118	119
120	121	122	123	124	125	126	127 127 127 127 127

*/


/*



Supercollider Scale Listing

chromatic: Chromatic //DONE
major: Major //DONE
minor: Natural Minor //DONE
majorPentatonic: Major Pentatonic //DONE
dorian: Dorian // DONE

 aeolian: Aeolian
 ahirbhairav: Ahirbhairav
 ajam: Ajam
 atharKurd: Athar Kurd
 augmented: Augmented
 augmented2: Augmented 2
 bartok: Bartok
 bastanikar: Bastanikar
 bayati: Bayati
 bhairav: Bhairav
 chinese: Chinese
 chromatic24: Chromatic 24
 diminished: Diminished
 diminished2: Diminished 2
 dorian: Dorian
 egyptian: Egyptian
 enigmatic: Enigmatic
 farahfaza: Farahfaza
 gong: Gong
 harmonicMajor: Harmonic Major
 harmonicMinor: Harmonic Minor
 hexAeolian: Hex Aeolian
 hexDorian: Hex Dorian
 hexMajor6: Hex Major 6
 hexMajor7: Hex Major 7
 hexPhrygian: Hex Phrygian
 hexSus: Hex Sus
 hijaz: Hijaz
 hijazDesc: Hijaz Descending
 hijazKar: hijazKar
 hindu: Hindu
 hirajoshi: Hirajoshi
 hungarianMinor: Hungarian Minor
 husseini: Husseini
 huzam: Huzam
 indian: Indian
 ionian: Ionian
 iraq: Iraq
 iwato: Iwato
 jiao: Jiao
 jiharkah: Jiharkah
 karjighar: Karjighar
 kijazKarKurd: Kijaz Kar Kurd
 kumoi: Kumai
 kurd: Kurd
 leadingWhole: Leading Whole Tone
 locrian: Locrian
 locrianMajor: Locrian Major
 lydian: Lydian
 lydianMinor: Lydian Minor
 mahur: Mahur
 marva: Marva
 melodicMajor: Melodic Major
 melodicMinor: Melodic Minor
 melodicMinorDesc: Melodic Minor Descending
 minorPentatonic: Minor Pentatonic
 mixolydian: Mixolydian
 murassah: Murassah
 mustar: Mustar
 nahawand: Nahawand
 nahawandDesc: Nahawand Descending
 nairuz: Nairuz
 nawaAthar: Nawa Athar
 neapolitanMajor: Neapolitan Major
 neapolitanMinor: Neapolitan Minor
 nikriz: Nikriz
 partch_o1: Partch Otonality 1
 partch_o2: Partch Otonality 2
 partch_o3: Partch Otonality 3
 partch_o4: Partch Otonality 4
 partch_o5: Partch Otonality 5
 partch_o6: Partch Otonality 6
 partch_u1: Partch Utonality 1
 partch_u2: Partch Utonality 2
 partch_u3: Partch Utonality 3
 partch_u4: Partch Utonality 4
 partch_u5: Partch Utonality 5
 partch_u6: Partch Utonality 6
 pelog: Pelog
 phrygian: Phrygian
 prometheus: Prometheus
 purvi: Purvi
 rast: Rast
 rastDesc: Rast Descending
 ritusen: Ritusen
 romanianMinor: Romanian Minor
 saba: Saba
 scriabin: Scriabin
 shang: Shang
 shawqAfza: Shawq Afza
 sikah: Sikah
 sikahDesc: Sikah Descending
 spanish: Spanish
 superLocrian: Super Locrian
 suznak: Suznak
 todi: Todi
 ushaqMashri: Ushaq Mashri
 whole: Whole Tone
 yakah: Yakah
 yakahDesc: Yakah Descending
 yu: Yu
 zamzam: Zamzam
 zanjaran: Zanjaran
 zhi: Zhi
*/


/*

To run a Swift file, all you need to do is run

swift /path/to/file.swift
It will compile and run automatically. You can also simply just run

swift
which will bring up an interactive shell with which you can run Swift code line by line.

Finally, you can also make executables from your Swift code. All you need to do is the following:

Create a project folder with any name you like, then inside there create a folder with the name “sources”.
Place all of your code files inside the source folder.
Create a text file named “Package.swift” in the project folder (but outside the sources folder) and put at least the following in it:
import PackageDescription

let package = Package(
    name: "package_name_here_and_keep_quote_marks"
)
Finally, run

swift build
while the project folder is the working directory. You will find the executable under

.build/debug/package_name

 */
