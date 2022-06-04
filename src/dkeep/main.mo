import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeep {
  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {
    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };

  public func removeNote(ind: Nat) {
    let listFront = List.take(notes, ind);
    let listBack = List.drop(notes, ind+1);
    notes := List.append(listFront, listBack);
  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

}