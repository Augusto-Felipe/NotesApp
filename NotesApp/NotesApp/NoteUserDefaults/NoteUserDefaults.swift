//
//  NoteUserDefaults.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 14/04/23.
//

import Foundation

class NoteUserDefaults {
    
    var noteList: [String] = []
    
    var key: String = "myNotes"
    
    public func saveNote(note: String) {
        
        // retornar lista de notas
        noteList = listNotes()
        
        // salvar nota
        noteList.append(note)
        
        // salvar lista de notas
        UserDefaults.standard.set(noteList, forKey: key)
    }
    
    public func listNotes() -> [String] {
        
        // retornar lista de notas
        if let notes = UserDefaults.standard.object(forKey: key) {
            return notes as! [String]
        } else {
            return []
        }
    }
    
    public func removeNote(index: Int) {
        
        //retorna lista
        noteList = listNotes()
        
        //remove item
        noteList.remove(at: index)
        
        //salva lista
        UserDefaults.standard.set(noteList, forKey: key)
    }
}
