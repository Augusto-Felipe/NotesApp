//
//  NoteTableViewCellScreen.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 14/04/23.
//

import UIKit

class NoteTableViewCellScreen: UIView {
    
    lazy var noteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Teste"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(noteLabel)
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
        
            self.noteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.noteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
    ])
    }
}
