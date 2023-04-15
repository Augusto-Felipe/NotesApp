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
        self.configBackButtonConstraints()
        self.configAddNoteTextFieldConstraints()
        self.configSaveNoteButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(addNoteTextField)
        addSubview(saveNoteButton)
        addSubview(backButton)
    }
    
    private func configBackButtonConstraints() {
        self.backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
    
    private func configAddNoteTextFieldConstraints() {
        self.addNoteTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(80)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
    }
    
    private func configSaveNoteButtonConstraints() {
        self.saveNoteButton.snp.makeConstraints { make in
            make.top.equalTo(addNoteTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(40)
        }
    }
    
}
