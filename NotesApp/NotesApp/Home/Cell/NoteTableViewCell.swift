//
//  NoteTableViewCell.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 14/04/23.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let identifier: String = "NoteTableViewCell"
    
    lazy var screen: NoteTableViewCellScreen = {
        let screen = NoteTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addElements()
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    public func setupCell(note: String) {
        self.screen.noteLabel.text = note
    }
    
    private func addElements() {
        self.contentView.addSubview(screen)
    }
    
    private func setupContraints() {
        
        self.screen.pin(to: self)
    }
}
