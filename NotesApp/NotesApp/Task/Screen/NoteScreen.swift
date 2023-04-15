//
//  TaskScreen.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit

protocol NoteScreenProtocol: AnyObject {
    func actionSaveTaskButtonPressed()
    func actionBackButtonPressed()
}

class NoteScreen: UIView {
    
    var delegate: NoteScreenProtocol?
    
    public func delegate(delegate: NoteScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var addNoteTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua anotação aqui"
        tf.textColor = .darkGray
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 20
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var saveNoteButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Salvar", for: .normal)
        btn.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 96/255, green: 153/255, blue: 102/255, alpha: 1.0)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 16
        btn.addTarget(self, action: #selector(saveNoteButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    @objc private func backButtonPressed() {
        self.delegate?.actionBackButtonPressed()
    }
    
    @objc private func saveNoteButtonPressed() {
        self.delegate?.actionSaveTaskButtonPressed()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appGreenColor
        self.addElements()
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(addNoteTextField)
        addSubview(saveNoteButton)
        addSubview(backButton)
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.backButton.heightAnchor.constraint(equalToConstant: 40),
            self.backButton.widthAnchor.constraint(equalToConstant: 40),
        
            self.addNoteTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            self.addNoteTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.addNoteTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.addNoteTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.saveNoteButton.topAnchor.constraint(equalTo: self.addNoteTextField.bottomAnchor, constant: 20),
            self.saveNoteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.saveNoteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.saveNoteButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
