public struct noteInfo {

	var midiNoteNumber: Int
	var noteNumber: Int
	var octave: Int
	var noteName: String

	init( midiNoteNumber: Int, noteNumber: Int, octave: Int, noteName: String)
    {
        self.midiNoteNumber = midiNoteNumber
        self.noteNumber = noteNumber
        self.octave = octave
        self.noteName = noteName
    }

}
