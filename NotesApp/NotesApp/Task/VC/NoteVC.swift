//
//  TaskVC.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit

class NoteVC: UIViewController {
    
    var noteScreen: NoteScreen?
    
    var noteUserDefaults: NoteUserDefaults?
    
    var alert: Alert?
    
    override func loadView() {
        self.noteScreen = NoteScreen()
        self.view = noteScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = Alert(controller: self)
        self.noteUserDefaults = NoteUserDefaults()
        self.noteScreen?.delegate(delegate: self)
    }
    
}

extension NoteVC: NoteScreenProtocol {
    
    func actionSaveTaskButtonPressed() {
        
        guard let note = self.noteScreen?.addNoteTextField.text else { return }
        
        if !note.isEmpty {
            noteUserDefaults?.saveNote(note: note)
            dismiss(animated: true)
        } else {
            alert?.createAlert(title: "Nota vazia!", message: "Não é possível salvar uma nota vazia.")
        }
    }
    
    func actionBackButtonPressed() {
        dismiss(animated: true)
    }
}
